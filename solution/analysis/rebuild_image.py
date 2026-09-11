#!/usr/bin/env python3
"""Reconstruct the ORIGINAL unpacked program image from prompt-phase memory dumps.

Region map of pid 8140 (dump offset == RVA):
  0x25359B71000 (0x61000) -> RVA 0x00000  .text
  0x25359BD2000 (0x3000)  -> RVA 0x61000  .rdata (tables, sihost)
  0x25359BD5000 (0x6000)  -> RVA 0x64000
  0x25359BE0000 (0x10000) -> RVA 0x6F000
  0x25359BF0000 (0x1000)  -> RVA 0x80000
  0x25359C00000 (0x265000)-> RVA 0x8F000  (data/heap)
"""
import struct

DUMPS = os.path.join(os.path.dirname(__file__), "../../evidence/dumps/")
MAP = [
    (0x25359B71000, 0x00000, 0x61000),
    (0x25359BD2000, 0x61000, 0x3000),
    (0x25359BD5000, 0x64000, 0x6000),
    (0x25359BE0000, 0x6F000, 0x10000),
    (0x25359BF0000, 0x80000, 0x1000),
    (0x25359C00000, 0x8F000, 0x265000),
]

IMAGE_SIZE = 0x2F4000
img = bytearray(IMAGE_SIZE)

for base, rva, size in MAP:
    fn = DUMPS + f"pid8140_prompt_0x{base:X}_0x{size:X}.bin"
    with open(fn, "rb") as f:
        d = f.read()
    img[rva:rva+size] = d
    print(f"mapped {fn} -> RVA {hex(rva)}..{hex(rva+size)} ({len(d)} bytes)")

with open(os.path.join(os.path.dirname(__file__), "../../evidence/original_image.bin"), "wb") as f:
    f.write(img)
print(f"\n[+] saved original image: {len(img)} bytes (0x{len(img):X})")

# XOR-decrypt the output/check function at 0x5E000 (key aligned there)
KEY = bytes.fromhex("54286d44")
start = 0x5E000
dec = bytearray(img[start:0x61000])
for i in range(len(dec)):
    dec[i] ^= KEY[i % 4]
with open("/home/z/my-project/artifacts/output_fn_decrypted.bin", "wb") as f:
    f.write(bytes(dec))
print(f"[+] saved XOR-decrypted function region 0x5E000..0x61000")

# quick sanity: dump bytes at key tables
print("\n=== data @ 0x61CA0 (four 64-byte tables) ===")
print(img[0x61CA0:0x61DA0].hex())
print("\n=== data @ 0x61DA0 (2KiB const table, first 128) ===")
print(img[0x61DA0:0x61E20].hex())
print("\n=== byte @ 0x63DA8 (opclass) ===")
print(hex(img[0x63DA8]))
print("\n=== around 0x5E030 (xor key region) ===")
print(img[0x5E020:0x5E050].hex())
