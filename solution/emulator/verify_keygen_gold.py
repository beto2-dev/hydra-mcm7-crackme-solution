#!/usr/bin/env python3
"""Gold verification: run the REAL check() (0x5E000) on the keygen password.

The 1MiB DRBG generation is the slow part under Unicorn (~10 min), so we
hook the call site at 0x22C4A and splice in the already-dumped DRBG output
for the real seed (bit-exact — the dump WAS produced by emulating 0x21490).
"""
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import emu5
from unicorn import *
import unicorn.x86_const as xc

UC = emu5.UC
OB = emu5.ORIG_BASE
alloc = emu5.alloc

pwd = open(sys.argv[1], "rb").read()
print(f"[*] password: {len(pwd)} bytes", flush=True)

drbg = open(os.path.join(os.path.dirname(os.path.abspath(__file__)),
                         "probes", "drbg_real.bin"), "rb").read()
assert len(drbg) == 0x100000

# splice hook: at 0x22C47 we are about to `call 0x21490` (0x22C4A) with
# rcx=scratch, edx=seed. Replace the call: write the dump, skip to 0x22C4F.
def hook_splice(uc, address, size, ud):
    rcx = uc.reg_read(xc.UC_X86_REG_RCX)
    edx = uc.reg_read(xc.UC_X86_REG_EDX)
    assert edx == 0xC401C9B0, f"unexpected seed {edx:#x}"
    uc.mem_write(rcx, drbg)
    uc.reg_write(xc.UC_X86_REG_RIP, OB + 0x22C4F)   # skip the call

UC.hook_add(UC_HOOK_CODE, hook_splice, begin=OB + 0x22C47, end=OB + 0x22C48)

def g(rva):
    return OB + rva
UC.mem_write(g(0x63DA8), b"\x91")   # arg5 low byte (VM opcode key)

def mk_string(s: bytes):
    p = alloc(0x40)
    st = bytearray(0x20)
    if len(s) <= 15:
        st[0:len(s)] = s
        struct.pack_into("<Q", st, 0x10, len(s))
        struct.pack_into("<Q", st, 0x18, 15)
    else:
        buf = alloc(len(s) + 1)
        UC.mem_write(buf, s + b"\x00")
        struct.pack_into("<Q", st, 0, buf)
        struct.pack_into("<Q", st, 0x10, len(s))
        struct.pack_into("<Q", st, 0x18, len(s) | 15)
    UC.mem_write(p, bytes(st))
    return p

pw = mk_string(pwd)
ARG2, ARG3, ARG4, ARG5 = 0x45523F21, 0x748EEAA66AF7BDA9, 0x029DF32308AA1DF6, 0x8153F691

sp = (emu5.EMU_STACK + emu5.EMU_STACK_SZ - 0x300000) & ~0xF
for reg, val in zip((xc.UC_X86_REG_RCX, xc.UC_X86_REG_RDX, xc.UC_X86_REG_R8, xc.UC_X86_REG_R9),
                    (pw, ARG2, ARG3, ARG4)):
    UC.reg_write(reg, val)
UC.mem_write(sp + 0x28, struct.pack("<I", ARG5))   # 5th-arg home = entry_rsp+0x28 (no call push)
UC.mem_write(sp, struct.pack("<Q", emu5.RET_MAGIC))
UC.reg_write(xc.UC_X86_REG_RSP, sp)
UC.reg_write(xc.UC_X86_REG_RBP, sp + 0x100)

# verdict hook: 0x5ECB3 sits right after the FNV comparison
#   xor eax, 0x8eda89a9 ; ... ; shr ecx, 0x1f ; mov [rbp], ecx
VERDICT = {}
def hook_verdict(uc, address, size, ud):
    ecx = uc.reg_read(xc.UC_X86_REG_ECX)
    rbp = uc.reg_read(xc.UC_X86_REG_RBP)
    VERDICT["pass"] = ecx
    VERDICT["check_buf"] = bytes(uc.mem_read(rbp - 0x60, 64))
    uc.emu_stop()
UC.hook_add(UC_HOOK_CODE, hook_verdict, begin=OB + 0x5ECB3, end=OB + 0x5ECB4)

print("[*] running check() ...", flush=True)
try:
    UC.emu_start(OB + 0x5E000, emu5.RET_MAGIC, timeout=3000 * 1_000_000, count=4_000_000_000)
except UcError as e:
    rip = UC.reg_read(xc.UC_X86_REG_RIP)
    print(f"[!] emu error: {e} at {hex(rip)} rva={hex(rip-OB)}")
    sys.exit(1)

if "pass" in VERDICT:
    ok = VERDICT["pass"] == 1
    print(f"[*] verdict flag = {VERDICT['pass']}")
    print(f"[{'+' if ok else '!'}] VERDICT: {'ACCEPTED' if ok else 'DENIED'}")
    print(f"[*] check_buf (the flag the binary would print):")
    cb = VERDICT["check_buf"]
    print("    hex:", cb.hex())
    print("    raw:", repr(cb))
    sys.exit(0 if ok else 1)
print("[!] verdict hook never fired")
sys.exit(2)
