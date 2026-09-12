#!/usr/bin/env python3
"""Dump ONLY the DRBG for the real seed (fresh process to avoid state issues)."""
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import emu_keytable as E
from unicorn import *
from unicorn.x86_const import *

UC = E.UC
alloc = E.alloc
call_fn = E.call_fn

seed = int(sys.argv[1], 16) if len(sys.argv) > 1 else 0xC401C9B0
name = sys.argv[2] if len(sys.argv) > 2 else "drbg_real.bin"

# fresh stack area for determinism (zero it)
UC.mem_write(E.STACK + E.STACK_SZ - 0x40000, b"\x00" * 0x40000)

scratch = alloc(0x100000 + 0x100)
UC.mem_write(scratch, b"\x00" * 0x100000)
print(f"[*] running DRBG(seed={seed:#x}) ...", flush=True)
r = call_fn(0x21490, [scratch, seed], timeout=3600)
data = bytes(UC.mem_read(scratch, 0x100000))
out = os.path.join(os.path.dirname(__file__), "probes", name)
with open(out, "wb") as f:
    f.write(data)
print(f"[+] {out}: {len(data)} bytes, rax={r:#x}")
print(f"    head={data[:16].hex()} tail={data[-16:].hex()}")
