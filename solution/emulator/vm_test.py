#!/usr/bin/env python3
"""Emulate the HYDRA VM (0x1FDB0) with Unicorn - bit exact."""
import struct
import sys
sys.path.insert(0, os.path.dirname(__file__))
from emu5 import UC, ORIG_BASE, RET_MAGIC, alloc
import struct, unicorn.x86_const as xc
from unicorn import *
from unicorn.x86_const import *

TSC = [0x1122334455667788]

def hook_insn(uc, ud):
    # placeholder (insn-level hooks registered separately)
    return 0

# rdtsc/cpuid deterministic stub via UC_HOOK_INSN
def hook_rdtsc(uc, ud):
    t = TSC[0]
    uc.reg_write(UC_X86_REG_RAX, t & 0xFFFFFFFF)
    uc.reg_write(UC_X86_REG_RDX, (t >> 32) & 0xFFFFFFFF)
    TSC[0] += 0x100  # small deterministic increment
    return True

def hook_cpuid(uc, ud):
    uc.reg_write(UC_X86_REG_RAX, 0)
    uc.reg_write(UC_X86_REG_RBX, 0)
    uc.reg_write(UC_X86_REG_RCX, 0)
    uc.reg_write(UC_X86_REG_RDX, 0)
    return True

h1 = EMU.hook_add(UC_HOOK_INSN, hook_rdtsc, None, 1, 0, UC_X86_INS_RDTSC)
h2 = EMU.hook_add(UC_HOOK_INSN, hook_cpuid, None, 1, 0, UC_X86_INS_CPUID)

def run_vm(data, seed):
    """VM(&struct{ptr,ptr+?}, ctx, seed) - returns (rax, ctx_bytes)"""
    d = bump(len(data) + 0x20)
    EMU.mem_write(d, data)
    st = bump(0x20)
    EMU.mem_write(st, struct.pack("<QQ", d, d + len(data)))
    ctx = bump(0x100)
    EMU.mem_write(ctx, b"\x00" * 0x100)
    sp = STACK + 0x180000
    EMU.reg_write(UC_X86_REG_RCX, st)
    EMU.reg_write(UC_X86_REG_RDX, ctx)
    EMU.reg_write(UC_X86_REG_R8, seed)
    EMU.mem_write(sp, struct.pack("<Q", RET_MAGIC))
    EMU.reg_write(UC_X86_REG_RSP, sp)
    EMU.reg_write(UC_X86_REG_RBP, sp + 0x100)
    try:
        EMU.emu_start(BASE + 0x1FDB0, RET_MAGIC, timeout=120_000_000, count=500_000_000)
    except UcError as e:
        rip = EMU.reg_read(UC_X86_REG_RIP)
        return None, f"ERROR {e} at {hex(rip)} rva={hex(rip - BASE)}"
    rax = EMU.reg_read(UC_X86_REG_RAX)
    out = EMU.mem_read(ctx, 0x100)
    # also check if the data buffer was modified
    mod = bytes(EMU.mem_read(d, len(data)))
    return rax, (bytes(out), mod)

if __name__ == "__main__":
    print("[*] VM emulation test on blob2 (seed=0)")
    r = run_vm(blob2, 0)
    print("rax =", hex(r[0]) if isinstance(r[0], int) else r[0])
    if isinstance(r[1], str):
        print(r[1])
    else:
        ctx, mod = r[1]
        print("ctx[0:64]:", ctx[:64].hex())
        print("ctx[64:128]:", ctx[64:128].hex())
        print("data modified:", mod != blob2)
        if mod != blob2:
            print("data after:", mod.hex())
