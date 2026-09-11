#!/usr/bin/env python3
"""Disassemble the XOR-decrypted check pipeline function of HYDRA MCM7."""
import struct
import sys
from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_OPT_SYNTAX_INTEL

img = open(os.path.join(os.path.dirname(__file__), "../../evidence/original_image.bin"), "rb").read()

def read(rva, n):
    return img[rva:rva+n]

md = Cs(CS_ARCH_X86, CS_MODE_64)
md.syntax = CS_OPT_SYNTAX_INTEL
md.detail = True

def disasm(rva, n, note="(decrypted region)"):
    code = read(rva, n)
    out = [f"; ==== {note} RVA {hex(rva)}..{hex(rva+n)} ===="]
    for ins in md.disasm(code, rva):
        line = f"{ins.address:08X}  {ins.bytes.hex():<24} {ins.mnemonic} {ins.op_str}"
        if "rip" in ins.op_str:
            import re
            m = re.search(r"\[rip ([+-]) (0x[0-9a-f]+)\]", ins.op_str)
            if m:
                disp = int(m.group(2), 16)
                if m.group(1) == "-":
                    disp = -disp
                target = ins.address + ins.size + disp
                d = read(target, 16)
                line += f"   ; -> {hex(target)} data={d.hex()}"
        out.append(line)
    return "\n".join(out)

if __name__ == "__main__":
    rva = int(sys.argv[1], 16)
    n = int(sys.argv[2], 16)
    print(disasm(rva, n, sys.argv[3] if len(sys.argv) > 3 else ""))
