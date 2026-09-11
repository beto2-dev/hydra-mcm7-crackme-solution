#!/usr/bin/env python3
"""Disassembly helper for HYDRA MCM7 - RVA-annotated capstone disassembler."""
import struct
import sys
from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_OPT_SYNTAX_INTEL

PATH = os.path.join(os.path.dirname(__file__), "../../binaries/CrackMe_packed.exe")
data = open(PATH, "rb").read()

e_lfanew, = struct.unpack_from("<I", data, 0x3C)
opt_off = e_lfanew + 24
num_sections, = struct.unpack_from("<H", data, e_lfanew + 6)
opt_size, = struct.unpack_from("<H", data, e_lfanew + 20)
sec_off = opt_off + opt_size
SECS = []
for i in range(num_sections):
    off = sec_off + i * 40
    name = data[off:off+8].rstrip(b"\x00").decode("latin1")
    vsize, vaddr, rsize, rptr = struct.unpack_from("<IIII", data, off + 8)
    SECS.append((name, vaddr, max(vsize, rsize), rptr, rsize))

def rva2off(rva):
    for name, vaddr, vsize, rptr, rsize in SECS:
        if vaddr <= rva < vaddr + vsize:
            return rptr + (rva - vaddr)
    return None

def secname(rva):
    for name, vaddr, vsize, rptr, rsize in SECS:
        if vaddr <= rva < vaddr + vsize:
            return name
    return "?"

def read(rva, n):
    o = rva2off(rva)
    return data[o:o+n] if o is not None else b"\x00"*n

md = Cs(CS_ARCH_X86, CS_MODE_64)
md.syntax = CS_OPT_SYNTAX_INTEL

def disasm(rva, n, base=0):
    """Disassemble n bytes at rva; annotate rip-relative and call/jmp targets."""
    code = read(rva, n)
    out = []
    for ins in md.disasm(code, rva):
        line = f"{ins.address:08X}  {ins.bytes.hex():<24} {ins.mnemonic} {ins.op_str}"
        # annotate rip-relative
        if "rip" in ins.op_str:
            # compute target: rip = ins.address + ins.size
            import re
            m = re.search(r"\[rip \+ (0x[0-9a-f]+)\]|\[rip - (0x[0-9a-f]+)\]", ins.op_str)
            if m:
                disp = int(m.group(1), 16) if m.group(1) else -int(m.group(2), 16)
                target = ins.address + ins.size + disp
                line += f"   ; -> RVA {target:08X} ({secname(target)})"
                # preview data at target
                d = read(target, 16)
                line += f" data={d.hex()}"
        elif ins.mnemonic in ("call", "jmp", "loop") and ins.op_str.startswith("0x"):
            t = int(ins.op_str, 16)
            line += f"   ; -> RVA {t:08X} ({secname(t)})"
        out.append(line)
    return "\n".join(out)

if __name__ == "__main__":
    rva = int(sys.argv[1], 16)
    n = int(sys.argv[2], 16) if len(sys.argv) > 2 else 0x100
    # optional XOR key for encrypted regions
    if len(sys.argv) > 3:
        key = bytes.fromhex(sys.argv[3])
        raw = bytearray(read(rva, n))
        for i in range(len(raw)):
            raw[i] ^= key[i % len(key)]
        code = bytes(raw)
        print(f"; XOR-decrypted with key {key.hex()} (period {len(key)})")
        for ins in md.disasm(code, rva):
            line = f"{ins.address:08X}  {ins.bytes.hex():<24} {ins.mnemonic} {ins.op_str}"
            if "rip" in ins.op_str:
                import re
                m = re.search(r"\[rip \+ (0x[0-9a-f]+)\]|\[rip - (0x[0-9a-f]+)\]", ins.op_str)
                if m:
                    disp = int(m.group(1), 16) if m.group(1) else -int(m.group(2), 16)
                    target = ins.address + ins.size + disp
                    line += f"   ; -> RVA {target:08X} ({secname(target)})"
                    d = read(target, 16)
                    line += f" data={d.hex()}"
            out.append(line) if False else None
            print(line)
    else:
        print(disasm(rva, n))
