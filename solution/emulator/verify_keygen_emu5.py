#!/usr/bin/env python3
"""Verify the keygen password against the REAL check() using the identity-mapped emulator."""
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
print(f"[*] password: {len(pwd)} bytes, head={pwd[:16].hex()}")

# keep the runtime globals from the dump (already mapped identity) but make sure
# the ones main sets before check() hold the real values
def g(rva):
    return OB + rva
UC.mem_write(g(0x63DA8), b"\x91")   # arg5 low byte -> VM opcode key

# std::string for the password (SSO for <=15, heap otherwise)
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
UC.mem_write(sp + 0x20, struct.pack("<I", ARG5))
UC.mem_write(sp, struct.pack("<Q", emu5.RET_MAGIC))
UC.reg_write(xc.UC_X86_REG_RSP, sp)
UC.reg_write(xc.UC_X86_REG_RBP, sp + 0x100)
try:
    UC.emu_start(OB + 0x5E000, emu5.RET_MAGIC, timeout=3600 * 1_000_000, count=4_000_000_000)
except UcError as e:
    rip = UC.reg_read(xc.UC_X86_REG_RIP)
    print(f"[!] emu error: {e} at {hex(rip)} rva={hex(rip-OB)}")
    sys.exit(1)

rax = UC.reg_read(xc.UC_X86_REG_RAX)
print(f"[*] check() -> rax = {rax:#x} ({rax})")
print(f"[*] verdict: {'ACCEPTED (FNV match)' if rax == 1 else 'DENIED'}")

# also read back the check_buf via the model for display
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "keygen"))
