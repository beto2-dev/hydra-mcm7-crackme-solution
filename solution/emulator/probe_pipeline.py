#!/usr/bin/env python3
"""Probe harness: extract fixed pipeline components from the validated emulator.

Dumps:
  - DRBG 1MiB scratch for seeds 0x12345678 and 0xC401C9B0 (arg2^arg5)
  - S-box + W permutation from the RC4-KSA internals
  - state32 output of the KSA for probe passwords
  - bitslice transform (0x218C0) GF(2) matrix probes
  - VM (0x1FDB0) runs for validation
"""
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import emu_keytable as E   # side effects: full emulator env built

from unicorn import *
from unicorn.x86_const import *

UC = E.UC
BASE = E.BASE
alloc = E.alloc
mk_string = E.mk_string
call_fn = E.call_fn
g = E.g

OUT = os.path.join(os.path.dirname(__file__), "probes")
os.makedirs(OUT, exist_ok=True)

def w(name, data):
    with open(os.path.join(OUT, name), "wb") as f:
        f.write(data)
    print(f"[+] {name}: {len(data)} bytes")

# ---------------------------------------------------------------- DRBG dumps
# 0x21490(rcx=scratch, edx=seed) fills 1 MiB
for seed, name in ((0x12345678, "drbg_12345678.bin"), (0xC401C9B0, "drbg_c401c9b0.bin")):
    scratch = alloc(0x100000 + 0x100)
    UC.mem_write(scratch, b"\xCC" * 0x100000)
    r = call_fn(0x21490, [scratch, seed], timeout=1200)
    data = bytes(UC.mem_read(scratch, 0x100000))
    w(name, data)
    print(f"    rax={r:#x} head={data[:16].hex()} tail={data[-16:].hex()}")

# ---------------------------------------------------------------- S and W dump
# Hook 0x22873 (after S/W built, before the 48-round loop starts at 0x22884)
SANDW = {}
def hook_sw(uc, address, size, ud):
    rsp = uc.reg_read(UC_X86_REG_RSP)
    rbp = rsp + 0x1020 + 0x28   # frame: push x5 (0x28) + lea rbp,[rsp-0x1020] => rbp = rsp+0x1048?
    # 0x22490 prologue: push rbp,rbx,rsi,rdi,r14 (5 pushes = 0x28); lea rbp,[rsp-0x1020]
    # => at hook time rsp_0 = entry_rsp - 0x28; rbp = rsp_0 - 0x1020
    # wait: hook is INSIDE the fn after chkstk+sub rsp,0x1120. Recompute:
    # entry rsp R0. pushes: R0-0x28. rbp = R0-0x28-0x1020. call chkstk; sub rsp,0x1120 -> rsp = R0-0x28-0x1120
    # so R0 = rsp + 0x1148; rbp = R0 - 0x1048 = rsp + 0x100
    rbp_v = rsp + 0x100
    SANDW["S"] = bytes(uc.mem_read(rsp + 0x20, 256))          # S at [rsp+0x20]
    SANDW["W"] = bytes(uc.mem_read(rbp_v + 0x420, 2048))      # W at [rbp+0x420]
    SANDW["K0"] = bytes(uc.mem_read(rbp_v + 0x20, 1024))      # K at [rbp+0x20]
h = UC.hook_add(UC_HOOK_CODE, hook_sw, begin=BASE + 0x22873, end=BASE + 0x22874)

# run the KSA on a probe password: 0x22490(rcx=pwd, rdx=state_out)
st = alloc(0x800)
pw = mk_string(b"AAAA")
r = call_fn(0x22490, [pw, st], timeout=600)
UC.hook_del(h)
state = bytes(UC.mem_read(st, 0x800))
w("state_AAAA.bin", state)
w("S_box.bin", SANDW.get("S", b""))
w("W_perm.bin", SANDW.get("W", b""))
w("K_AAAA.bin", SANDW.get("K0", b""))
print(f"    KSA rax={r:#x}; state[:32]={state[:32].hex()}")

# validate K for 'AAAA' against the formula
k_formula = bytes((((i & 0xFF) * 0x37 - 0x55) ^ b"AAAA"[i % 4]) & 0xFF for i in range(1024))
print("    K formula match:", k_formula == SANDW.get("K0"))

# ---------------------------------------------------------------- bitslice probes
# 0x218C0(rcx=buf) transforms 1024 bytes in place. Linear over GF(2)?
# Probe with single bits: input 1024 zero bytes with one bit set.
# (the function may work on 4-byte groups; probe bytes 0..3 of first group)
BS = {}
def probe_bs(bits):
    buf = alloc(0x400)
    UC.mem_write(buf, b"\x00" * 0x400)
    if isinstance(bits, int):
        UC.mem_write(buf + bits // 8, bytes([1 << (bits % 8)]))
    else:
        UC.mem_write(buf, bits)
    call_fn(0x218C0, [buf], timeout=300)
    return bytes(UC.mem_read(buf, 0x400))

# first: identity check (zero in -> zero out?)
out0 = probe_bs(0)
print("    bitslice(0) == 0:", out0 == b"\x00" * 0x400)
# probe each bit of the first 8 bytes
for bitpos in range(64):
    o = probe_bs(bitpos)
    BS[bitpos] = o
    if any(o):
        nz = [i for i, b in enumerate(o) if b]
        print(f"    bit {bitpos} -> nonzero at {len(nz)} positions, first: {nz[:8]}")
w("bitslice_probes.bin", b"".join(struct.pack("<Q", len(BS[b])) + BS[b] for b in sorted(BS)))

# ---------------------------------------------------------------- VM probes
# VM at 0x1FDB0(rcx=&{begin,end}, rdx=ctx, r8=seed) -> rax
def run_vm(data, seed):
    d = alloc(len(data) + 0x20)
    UC.mem_write(d, data)
    stv = alloc(0x20)
    UC.mem_write(stv, struct.pack("<QQ", d, d + len(data)))
    ctx = alloc(0x100)
    UC.mem_write(ctx, b"\x00" * 0x100)
    sp = (E.STACK + E.STACK_SZ - 0x20000) & ~0xF
    UC.reg_write(UC_X86_REG_RCX, stv)
    UC.reg_write(UC_X86_REG_RDX, ctx)
    UC.reg_write(UC_X86_REG_R8, seed)
    UC.mem_write(sp, struct.pack("<Q", E.RET_MAGIC))
    UC.reg_write(UC_X86_REG_RSP, sp)
    UC.reg_write(UC_X86_REG_RBP, sp + 0x100)
    try:
        UC.emu_start(BASE + 0x1FDB0, E.RET_MAGIC, timeout=300 * 1_000_000, count=100_000_000)
    except UcError as e:
        rip = UC.reg_read(UC_X86_REG_RIP)
        return None, f"ERR {e} rip={rip:#x} rva={rip-BASE:#x}"
    return UC.reg_read(UC_X86_REG_RAX), bytes(UC.mem_read(ctx, 0x100))

blob2 = E.blob2
rax, ctx = run_vm(blob2, 0)
print(f"    VM(blob2, 0) = {rax:#x}" if rax is not None else f"    VM err: {ctx}")
assert rax == 0x32CD000005A5, "VM regression!"

# blob1 for the real args
blob1 = E.blob1
arg3, arg4 = 0x748EEAA66AF7BDA9, 0x029DF32308AA1DF6
b3 = struct.pack("<Q", arg3)
b4 = struct.pack("<Q", arg4)
prog = bytes(blob1[i] ^ b3[i % 8] ^ b4[i % 8] for i in range(32))
print("    decrypted blob1 (args applied):", prog.hex())
w("blob1.bin", blob1)
w("blob1_dec.bin", prog)

print("[*] all probes done ->", OUT)
