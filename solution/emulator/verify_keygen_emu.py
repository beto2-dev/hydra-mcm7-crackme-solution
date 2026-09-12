#!/usr/bin/env python3
"""Verify the keygen password against the REAL check() in the emulator."""
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
g = E.g

pwd = open(sys.argv[1], "rb").read()
print(f"[*] password: {len(pwd)} bytes")

# set the runtime globals as main would at the check call:
UC.mem_write(g(0x63E00), struct.pack("<Q", 0xF264101F9F7E56A0))
UC.mem_write(g(0x63E08), struct.pack("<Q", 0))          # module-walk flag
UC.mem_write(g(0x63E10), struct.pack("<Q", 0xE7D00E18CCD577BF))
UC.mem_write(g(0x63E18), struct.pack("<Q", 0))
UC.mem_write(g(0x63E20), struct.pack("<Q", 3))
UC.mem_write(g(0x63E28), struct.pack("<Q", 0))
UC.mem_write(g(0x63E30), struct.pack("<Q", 0x5DC84))
UC.mem_write(g(0x63E38), struct.pack("<Q", 0x8D43042D))
UC.mem_write(g(0x63E40), struct.pack("<Q", 0x7CBC1676F6))
UC.mem_write(g(0x63DA8), b"\x91")                       # arg5 low byte (VM opcode key)

pw = mk_string(pwd)
out = alloc(0x20)

ARG2, ARG3, ARG4, ARG5 = 0x45523F21, 0x748EEAA66AF7BDA9, 0x029DF32308AA1DF6, 0x8153F691
r = call_fn(0x5E000, [pw, ARG2, ARG3, ARG4, ARG5], timeout=1800)
print(f"[*] check() returned {r:#x}")

# capture what check computed: hook the final compare via reading the check_buf
# simplest: look at [0x63E48] VM flag & re-run pieces — instead, re-derive via our model
import subprocess
print("[*] verdict rax (1 = passed):", r == 1, r)
