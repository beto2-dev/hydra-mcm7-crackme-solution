#!/usr/bin/env python3
"""Fast probes: bitslice matrix, S/W, KSA state, VM — everything except DRBG."""
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import emu_keytable as E

from unicorn import *
from unicorn.x86_const import *

UC = E.UC
BASE = E.BASE
alloc = E.alloc
mk_string = E.mk_string
call_fn = E.call_fn

OUT = os.path.join(os.path.dirname(__file__), "probes")
os.makedirs(OUT, exist_ok=True)

def w(name, data):
    with open(os.path.join(OUT, name), "wb") as f:
        f.write(data)
    print(f"[+] {name}: {len(data)} bytes", flush=True)

# ---------------------------------------------------------------- S and W dump
SANDW = {}
def hook_sw(uc, address, size, ud):
    rsp = uc.reg_read(UC_X86_REG_RSP)
    rbp_v = rsp + 0x100
    SANDW["S"] = bytes(uc.mem_read(rsp + 0x20, 256))
    SANDW["W"] = bytes(uc.mem_read(rbp_v + 0x420, 2048))
    SANDW["K0"] = bytes(uc.mem_read(rbp_v + 0x20, 1024))
h = UC.hook_add(UC_HOOK_CODE, hook_sw, begin=BASE + 0x22873, end=BASE + 0x22874)

st = alloc(0x800)
pw = mk_string(b"AAAA")
r = call_fn(0x22490, [pw, st], timeout=600)
UC.hook_del(h)
state = bytes(UC.mem_read(st, 0x800))
w("state_AAAA.bin", state)
w("S_box.bin", SANDW.get("S", b""))
w("W_perm.bin", SANDW.get("W", b""))
w("K_AAAA.bin", SANDW.get("K0", b""))

k_formula = bytes((((i & 0xFF) * 0x37 - 0x55) ^ b"AAAA"[i % 4]) & 0xFF for i in range(1024))
print("K formula match:", k_formula == SANDW.get("K0"))

# my python model of S and W
def ms_lcg(s):
    return (s * 0x41C64E6D + 0x3039) & 0xFFFFFFFF

# S: identity FY shuffle, seed 0x62fddc14, i from 255 downto 0: j = ((s>>16)&0x7fff) % (i+1); swap
S = list(range(256))
s = 0x62FDDC14
for i in range(255, 0, -1):
    s = ms_lcg(s)
    j = ((s >> 16) & 0x7FFF) % (i + 1)
    S[i], S[j] = S[j], S[i]
print("S model match:", bytes(S) == SANDW.get("S"))

# W: 1024 words identity, FY stride-3 with seed 0x8a888684
W = list(range(1024))
s = 0x8A888684
# from asm: r9d=0x3ff, r10=0x3ff; loop: edi=W[r10]; r9 -= 3 each iteration... reconstruct from dump instead
Wd = struct.unpack('<1024H', SANDW.get("W", b'\x00'*2048))
print("W first 16 from dump:", Wd[:16])
print("W is permutation:", sorted(Wd) == list(range(1024)))
w("W_words.bin", struct.pack('<1024H', *Wd))

# ---------------------------------------------------------------- bitslice probes
BS_results = {}
def probe_bs(bitpos):
    buf = alloc(0x400)
    UC.mem_write(buf, b"\x00" * 0x400)
    UC.mem_write(buf + bitpos // 8, bytes([1 << (bitpos % 8)]))
    call_fn(0x218C0, [buf], timeout=300)
    return bytes(UC.mem_read(buf, 0x400))

out0 = probe_bs(-1) if False else probe_bs(0)  # bit0 of byte0
# NOTE: bit 0 always sets byte0 bit0 -> nonzero; do a true zero test
buf = alloc(0x400)
UC.mem_write(buf, b"\x00" * 0x400)
call_fn(0x218C0, [buf], timeout=300)
print("bitslice(0) == 0:", bytes(UC.mem_read(buf, 0x400)) == b"\x00" * 0x400)

for bitpos in range(32):
    BS_results[bitpos] = probe_bs(bitpos)
    nz = [i for i, b in enumerate(BS_results[bitpos]) if b]
    if nz:
        print(f"  in-bit {bitpos} (byte {bitpos//8}.{bitpos%8}) -> out bytes {nz[:10]}")
w("bitslice_first32.bin", b"".join(BS_results[i] for i in range(32)))

# linearity check: probe with two bits set = xor of single-bit probes?
buf = alloc(0x400)
UC.mem_write(buf, b"\x00" * 0x400)
UC.mem_write(buf, bytes([0b00000101]))   # bits 0 and 2 of byte 0
call_fn(0x218C0, [buf], timeout=300)
both = bytes(UC.mem_read(buf, 0x400))
expect = bytes((BS_results[0][i] ^ BS_results[2][i]) & 0xFF for i in range(0x400))
print("linearity (bit0^bit2):", both == expect)

# ---------------------------------------------------------------- VM probes
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
        UC.emu_start(BASE + 0x1FDB0, E.RET_MAGIC, timeout=300 * 1_000_000, count=200_000_000)
    except UcError as e:
        rip = UC.reg_read(UC_X86_REG_RIP)
        return None, f"ERR {e} rip={rip:#x} rva={rip-BASE:#x}"
    return UC.reg_read(UC_X86_REG_RAX), None

rax, err = run_vm(E.blob2, 0)
print(f"VM(blob2, 0) = {rax:#x}" if rax is not None else f"VM err: {err}")
assert rax == 0x32CD000005A5, "VM regression failed!"

# random program probes with seed 0 (collect for C validation later)
import random
random.seed(42)
progs = []
for t in range(24):
    prog = bytes(random.randrange(256) for _ in range(32))
    seed = random.choice([0, 0x504F4C59, 0xDEADBEEF & 0xFFFFFFFF, random.randrange(1 << 32)])
    rax, err = run_vm(prog, seed)
    if err:
        print(f"  VM probe {t}: {err}")
        continue
    progs.append((prog, seed, rax))
    print(f"  VM probe {t}: seed={seed:#x} -> {rax:#x}")
with open(os.path.join(OUT, "vm_probes.bin"), "wb") as f:
    for prog, seed, rax in progs:
        f.write(prog + struct.pack("<IQ", seed, rax))

# ---------------------------------------------------------------- blob dumps
w("blob1.bin", E.blob1)
w("blob2.bin", E.blob2)
print("[*] fast probes done")
