#!/usr/bin/env python3
"""Full emulation of HYDRA MCM7 check() (0x5E000) + build_key_table (0x22BC0) + VM (0x1FDB0).

Environment:
  - original image at BASE (RVA == offset), XOR-decrypted check region
  - runtime globals seeded from CI dumps
  - fake PEB + kernel32 module with exports (GetStdHandle, GetWriteWatch, ...)
  - libc stubs: malloc(0x3895C), free(0x3886C), chkstk(0x39090)
  - deterministic rdtsc/cpuid
"""
import os
import struct
import sys
from unicorn import *
from unicorn.x86_const import *

DUMPS = os.path.join(os.path.dirname(__file__), "../../evidence/dumps/")
IMG = open(os.path.join(os.path.dirname(__file__), "../../evidence/original_image.bin"), "rb").read()
XORKEY = bytes.fromhex("54286d44")
BASE = 0x140000000
STACK = 0x200000000
STACK_SZ = 0x400000
HEAP = 0x300000000
HEAP_SZ = 0x2000000
FAKE = 0x400000000          # fake PEB / kernel32 structures
FAKE_SZ = 0x100000

UC = Uc(UC_ARCH_X86, UC_MODE_64)
from unicorn.x86_const import UC_CPU_X86_HASWELL
UC.ctl_set_cpu_model(UC_CPU_X86_HASWELL)  # enable AVX2 for CRT memcpy/memset
UC.mem_map(BASE, 0x400000)
UC.mem_write(BASE, IMG[:0x61000])
UC.mem_write(BASE + 0x61000, IMG[0x61000:0x64000])
UC.mem_write(BASE + 0x64000, IMG[0x64000:0x6a000])
UC.mem_write(BASE + 0x6f000, IMG[0x6f000:0x7f000])
UC.mem_write(BASE + 0x80000, IMG[0x80000:0x81000])
UC.mem_write(BASE + 0x8f000, IMG[0x8f000:0x2f4000])
dec = bytearray(IMG[0x5E000:0x61000])
for i in range(len(dec)):
    dec[i] ^= XORKEY[i % 4]
UC.mem_write(BASE + 0x5E000, bytes(dec))
UC.mem_map(STACK, STACK_SZ)
UC.mem_map(HEAP, HEAP_SZ)
UC.mem_map(FAKE, FAKE_SZ)

# -------------------------------------------------- bump allocator
_heap_ptr = [HEAP + 0x10000]

def alloc(size, align=0x20):
    p = (_heap_ptr[0] + align - 1) & ~(align - 1)
    _heap_ptr[0] = p + max(size, 1) + 0x40
    return p

# -------------------------------------------------- blobs & globals
def g(rva):
    return BASE + rva

blob1 = bytes.fromhex("0a262379e09b70bba4848fa5d5c447ef0780f9170cd8276a887106fd397e81f6")
BLOB1 = alloc(0x40)
UC.mem_write(BLOB1, blob1)
UC.mem_write(g(0x63DC8), struct.pack("<Q", BLOB1))
UC.mem_write(g(0x63DD0), struct.pack("<Q", BLOB1 + 0x20))

_blob2src = open(os.path.join(DUMPS, "pid8140_prompt_0x2535A128000_0x4000.bin"), "rb").read()  # noqa
blob2 = _blob2src[0xFC0:0xFC0 + 0x200]
BLOB2 = alloc(0x400)
UC.mem_write(BLOB2, blob2)
UC.mem_write(g(0x63DE0), struct.pack("<Q", BLOB2))
UC.mem_write(g(0x63DE8), struct.pack("<Q", BLOB2 + len(blob2)))

# runtime globals from dump
UC.mem_write(g(0x63E00), struct.pack("<Q", 0xF264101F9F7E56A0))
UC.mem_write(g(0x63E08), struct.pack("<Q", 0))          # VM/analysis flag -> 0 (skip module walk #1)
UC.mem_write(g(0x63E10), struct.pack("<Q", 0xE7D00E18CCD577BF))
UC.mem_write(g(0x63E18), struct.pack("<Q", 0))
UC.mem_write(g(0x63E20), struct.pack("<Q", 3))
UC.mem_write(g(0x63E28), struct.pack("<Q", 0))
UC.mem_write(g(0x63E30), struct.pack("<Q", 0x5DC84))
UC.mem_write(g(0x63E38), struct.pack("<Q", 0x8D43042D))
UC.mem_write(g(0x63E40), struct.pack("<Q", 0x7CBC1676F6))

# -------------------------------------------------- fake PEB / kernel32
def w64(addr, val):
    UC.mem_write(addr, struct.pack("<Q", val))

def wstr(addr, s):  # utf-16z
    UC.mem_write(addr, s.encode("utf-16-le") + b"\x00\x00")

PEB = FAKE + 0x1000
LDR = FAKE + 0x2000
K32 = FAKE + 0x10000        # fake kernel32 image
K32_EXPORTS = FAKE + 0x16000

# build fake kernel32 PE: headers + export dir
def build_kernel32():
    img = bytearray(0x1000)
    img[0:2] = b"MZ"
    struct.pack_into("<I", img, 0x3C, 0x80)          # e_lfanew
    struct.pack_into("<I", img, 0x80, 0x4550)        # PE sig
    struct.pack_into("<H", img, 0x84 + 0, 0x20B)     # PE32+ magic at e_lfanew+0x18? no—
    # careful: optional header starts at e_lfanew+0x18
    opt = 0x80 + 0x18
    struct.pack_into("<H", img, opt, 0x20B)          # magic PE32+
    # data dir 0 (export) at opt+112: RVA + size
    export_rva = 0x2000
    struct.pack_into("<I", img, opt + 112, export_rva)
    struct.pack_into("<I", img, opt + 116, 0x200)
    # sections at opt + 240 (sizeof optional PE32+ = 240)
    # number of sections at e_lfanew+6
    struct.pack_into("<H", img, 0x80 + 6, 1)
    struct.pack_into("<H", img, 0x80 + 20, 240)      # size of optional header
    sec = opt + 240
    img[sec:sec+8] = b".edata\x00\x00"
    struct.pack_into("<IIII", img, sec + 8, 0x400, export_rva, 0x400, 0x400)
    UC.mem_write(K32, bytes(img))

    # export directory at K32 + export_rva
    names = [b"GetStdHandle", b"GetWriteWatch", b"Sleep", b"GetModuleFileNameA"]
    expdir = bytearray(0x400)
    ER = export_rva
    struct.pack_into("<IIII", expdir, 0x0C, ER + 0x300, 1, len(names), len(names))
    struct.pack_into("<III", expdir, 0x1C, ER + 0x100, ER + 0x180, ER + 0x200)
    for i, n in enumerate(names):
        struct.pack_into("<I", expdir, 0x180 + i * 4, ER + 0x100 + 0x80 + sum(len(x) + 1 for x in names[:i]))
        expdir[0x80 + sum(len(x) + 1 for x in names[:i]):][:len(n) + 1] = n + b"\x00"
        struct.pack_into("<I", expdir, 0x100 + i * 4, ER + 0x250 + i * 0x10)  # function RVAs
        struct.pack_into("<H", expdir, 0x200 + i * 2, i)
    UC.mem_write(K32 + export_rva, bytes(expdir))

build_kernel32()

# PEB: +0x18 = Ldr
w64(PEB + 0x18, LDR)
# Ldr: +0x10 InLoadOrderModuleList, +0x20 InMemoryOrderModuleList
# one module: kernel32 (InMemoryOrderLinks entry)
ENTRY = FAKE + 0x3000
# self-linked list head at LDR+0x20 -> ENTRY; ENTRY->Flink = head (list of 1)
w64(LDR + 0x20, ENTRY)
w64(ENTRY + 0x00, LDR + 0x20)        # Flink -> head
w64(ENTRY + 0x08, LDR + 0x20)        # Blink -> head
w64(LDR + 0x20 + 0x00, ENTRY)
w64(LDR + 0x20 + 0x08, ENTRY)
# DllBase at ENTRY+0x20 (relative to InMemoryOrderLinks)
w64(ENTRY + 0x20, K32)
# BaseDllName.Buffer at ENTRY+0x50 (relative); UNICODE_STRING at ENTRY+0x48
name = "KERNEL32.DLL"
NAMEBUF = FAKE + 0x3800
wstr(NAMEBUF, name)
struct.pack_into("<HHIQ", img := bytearray(0x20), 0, len(name) * 2, len(name) * 2 + 2, 0, NAMEBUF)
UC.mem_write(ENTRY + 0x48, bytes(img))

# set GS base to a TEB that points to PEB
TEB = FAKE + 0x5000
UC.mem_write(TEB, struct.pack("<Q", 0x30) + struct.pack("<Q", PEB))  # NtTib.Self? minimal
UC.mem_write(TEB + 0x60, struct.pack("<Q", PEB))  # PEB ptr at TEB+0x60
UC.reg_write(UC_X86_REG_GS_BASE, TEB)  # gs base -> TEB

# -------------------------------------------------- stubs & hooks
RET_MAGIC = 0x600000000
UC.mem_map(RET_MAGIC & ~0xFFF, 0x1000)

TSC = [0x1122334455667788]

def stub_ret(uc, rax=0):
    rsp = uc.reg_read(UC_X86_REG_RSP)
    rip, = struct.unpack("<Q", uc.mem_read(rsp, 8))
    uc.reg_write(UC_X86_REG_RSP, rsp + 8)
    uc.reg_write(UC_X86_REG_RAX, rax)
    uc.reg_write(UC_X86_REG_RIP, rip)

def hook_memcpy(uc, address, size, ud):
    dst = uc.reg_read(UC_X86_REG_RCX)
    src = uc.reg_read(UC_X86_REG_RDX)
    n = uc.reg_read(UC_X86_REG_R8)
    if n:
        UC.mem_write(dst, bytes(uc.mem_read(src, n)))
    stub_ret(uc, dst)

def hook_memset(uc, address, size, ud):
    dst = uc.reg_read(UC_X86_REG_RCX)
    val = uc.reg_read(UC_X86_REG_RDX) & 0xFF
    n = uc.reg_read(UC_X86_REG_R8)
    if n:
        UC.mem_write(dst, bytes([val]) * n)
    stub_ret(uc, dst)

def hook_malloc(uc, address, size, ud):
    sz = uc.reg_read(UC_X86_REG_RCX)
    stub_ret(uc, alloc(sz + 0x40))

def hook_free(uc, address, size, ud):
    stub_ret(uc, 0)

def hook_chkstk(uc, address, size, ud):
    # rax = requested size; just return (memory pre-mapped)
    rsp = uc.reg_read(UC_X86_REG_RSP)
    rip, = struct.unpack("<Q", uc.mem_read(rsp, 8))
    uc.reg_write(UC_X86_REG_RSP, rsp + 8)
    uc.reg_write(UC_X86_REG_RIP, rip)

def hook_rdtsc(uc, address, size, ud):
    t = TSC[0]
    uc.reg_write(UC_X86_REG_RAX, t & 0xFFFFFFFFFFFFFFFF)
    uc.reg_write(UC_X86_REG_RDX, (t >> 64) & 0xFFFFFFFF)
    TSC[0] += 0x100
    uc.reg_write(UC_X86_REG_RIP, address + size)

UC.hook_add(UC_HOOK_CODE, hook_malloc, begin=BASE + 0x3895C, end=BASE + 0x3895C + 1)
UC.hook_add(UC_HOOK_CODE, hook_free, begin=BASE + 0x3886C, end=BASE + 0x3886C + 1)
UC.hook_add(UC_HOOK_CODE, hook_chkstk, begin=BASE + 0x39090, end=BASE + 0x39090 + 1)
UC.hook_add(UC_HOOK_CODE, hook_memcpy, begin=BASE + 0x57BE0, end=BASE + 0x57BE0 + 1)
UC.hook_add(UC_HOOK_CODE, hook_memset, begin=BASE + 0x58290, end=BASE + 0x58290 + 1)

# find rdtsc sites (0F 31) in image .text and hook each
rdtsc_sites = []
i = IMG.find(b"\x0f\x31", 0, 0x61000)
while i >= 0:
    rdtsc_sites.append(i)
    i = IMG.find(b"\x0f\x31", i + 1, 0x61000)
for a in rdtsc_sites:
    UC.hook_add(UC_HOOK_CODE, hook_rdtsc, begin=BASE + a, end=BASE + a + 2)

# output function captures
OUTPUTS = []

def hook_out_348c0(uc, address, size, ud):
    rcx = uc.reg_read(UC_X86_REG_RCX)
    rdx = uc.reg_read(UC_X86_REG_RDX)
    r8 = uc.reg_read(UC_X86_REG_R8)
    s = bytes(uc.mem_read(rcx, min(r8, 0x1000)) if r8 < 0x1000 else b"")
    OUTPUTS.append(("0x348c0", rcx, rdx, r8, s[:80]))
    stub_ret(uc, r8)

def hook_out_34c10(uc, address, size, ud):
    rcx = uc.reg_read(UC_X86_REG_RCX)
    rdx = uc.reg_read(UC_X86_REG_RDX)
    r8 = uc.reg_read(UC_X86_REG_R8)
    OUTPUTS.append(("0x34c10", rcx, rdx, r8))
    stub_ret(uc, r8)

UC.hook_add(UC_HOOK_CODE, hook_out_348c0, begin=BASE + 0x348C0, end=BASE + 0x348C0 + 1)
UC.hook_add(UC_HOOK_CODE, hook_out_34c10, begin=BASE + 0x34C10, end=BASE + 0x34C10 + 1)

# invalid-memory / unhandled fetch debugging
def hook_mem_invalid(uc, access, address, size, value, ud):
    rip = uc.reg_read(UC_X86_REG_RIP)
    print(f"[!] INVALID MEM access={access} addr={hex(address)} size={size} rip={hex(rip)} rva={hex(rip-BASE) if BASE <= rip < BASE+0x400000 else '?'}")
    return False

UC.hook_add(UC_HOOK_MEM_INVALID, hook_mem_invalid)

# -------------------------------------------------- run helper
def call_fn(entry_rva, args, stack_top=None, count=2_000_000_000, timeout=600):
    sp = (stack_top or STACK + STACK_SZ - 0x10000) & ~0xF
    for reg, val in zip((UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_R9), args[:4]):
        UC.reg_write(reg, val)
    for i, a in enumerate(args[4:6]):
        UC.mem_write(sp + 0x20 + i * 8, struct.pack("<Q", a))
    UC.mem_write(sp, struct.pack("<Q", RET_MAGIC))
    UC.reg_write(UC_X86_REG_RSP, sp)
    UC.reg_write(UC_X86_REG_RBP, sp + 0x100)
    try:
        UC.emu_start(BASE + entry_rva, RET_MAGIC, timeout=timeout * 1_000_000, count=count)
    except UcError as e:
        rip = UC.reg_read(UC_X86_REG_RIP)
        raise RuntimeError(f"emu error: {e} at {hex(rip)} (rva {hex(rip - BASE) if BASE <= rip < BASE + 0x400000 else hex(rip)})")
    return UC.reg_read(UC_X86_REG_RAX)

# make a std::string struct {buf[16], size, cap} in emu memory; returns ptr
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

if __name__ == "__main__":
    print(f"[*] rdtsc sites hooked: {len(rdtsc_sites)}")
    print("[*] testing build_key_table with password 'AAAA'")
    pw = mk_string(b"AAAA")
    out = alloc(0x20)
    UC.mem_write(out, b"\x00" * 0x18)
    r = call_fn(0x22BC0, [out, pw, 0, 0x12345678])
    begin, end, cap = struct.unpack("<QQQ", UC.mem_read(out, 24))
    print("rax:", hex(r))
    print("kt:", bytes(UC.mem_read(begin, min(end - begin, 0x200))).hex())
    print("kt len:", end - begin)
