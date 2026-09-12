#!/usr/bin/env python3
"""Fuzz the C VM against the Unicorn emulator with VALID random programs."""
import os
import struct
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import emu_keytable as E
from unicorn import *
from unicorn.x86_const import *

UC = E.UC
BASE = E.BASE
alloc = E.alloc

# main stores arg5's low byte (0x91) at 0x63DA8 right before check() --
# set it so the VM decodes with the REAL opcode key
UC.mem_write(BASE + 0x63DA8, b"\x91")

VALID_OPS = [0x3A, 0x4B, 0x6D, 0xA3, 0x5C, 0x6E, 0xC8, 0x7F,
             0xD7, 0x8D, 0x2E, 0x92, 0xA1, 0x51, 0x73]

def run_vm_emu(data, seed):
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
        UC.emu_start(BASE + 0x1FDB0, E.RET_MAGIC, timeout=60 * 1_000_000, count=50_000_000)
    except UcError as e:
        return None, str(e)
    return (UC.reg_read(UC_X86_REG_RAX), bytes(UC.mem_read(ctx, 0x100))), None

def gen_program(rng, n=8):
    """Random program of n VALID instructions (fields random)."""
    prog = bytearray()
    for _ in range(n):
        op = rng.choice(VALID_OPS)
        insn = op
        insn |= rng.randrange(32) << 7
        insn |= rng.randrange(8) << 12
        insn |= rng.randrange(32) << 15
        insn |= rng.randrange(4096) << 20
        prog += struct.pack("<I", insn)
    return bytes(prog)

def main():
    import random
    rng = random.Random(int(sys.argv[1]) if len(sys.argv) > 1 else 1234)
    N = int(sys.argv[2]) if len(sys.argv) > 2 else 400

    # write the test vectors for the C side
    vectors = []
    fails = 0
    for t in range(N):
        prog = gen_program(rng, rng.choice([1, 2, 4, 8, 16]))
        seed = rng.choice([0, 0x504F4C59, 0xDEADBEEF, rng.randrange(1 << 32)])
        (rax, ctx), err = run_vm_emu(prog, seed)
        if err:
            continue
        vectors.append((prog, seed, rax, ctx))
        if len(vectors) >= 300:
            break

    out = os.path.join(os.path.dirname(os.path.abspath(__file__)), "probes", "vm_fuzz.bin")
    with open(out, "wb") as f:
        f.write(struct.pack("<I", len(vectors)))
        for prog, seed, rax, ctx in vectors:
            f.write(struct.pack("<I", len(prog)))
            f.write(prog)
            f.write(struct.pack("<QI", seed, 0))
            f.write(struct.pack("<Q", rax))
            f.write(ctx[:0x100])
    print(f"[+] wrote {len(vectors)} vectors -> {out}")

if __name__ == "__main__":
    main()
