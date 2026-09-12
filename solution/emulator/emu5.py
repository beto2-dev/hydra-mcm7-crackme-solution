#!/usr/bin/env python3
"""HYDRA MCM7 - identity-mapped emulation of the ORIGINAL process state.

Maps every region from the CI prompt-phase dump at its ORIGINAL address, so all
runtime pointers (CRT-initialized globals, heap objects) remain valid.
Execution starts right at the `cin >> password` sequence (0x2CF06) - the CRT
static init already happened in the dumped state.

The XOR-wrapped check function region is decrypted in-place at start
(the packer's rest state), mirroring the runtime decrypt->run->re-encrypt cycle.
"""
import glob
import os
import struct
import sys
from unicorn import *
import unicorn.x86_const as xc

DUMPS = os.path.join(os.path.dirname(__file__), "../../evidence/dumps/")
IMG = open(os.path.join(os.path.dirname(__file__), "../../evidence/original_image.bin"), "rb").read()
XORKEY = bytes.fromhex("54286d44")
ORIG_BASE = 0x25359B71000          # RVA 0 of the original image

EMU_STACK = 0x700000000            # fresh stack for emulation
EMU_STACK_SZ = 0x800000
EMU_HEAP = 0x600000000             # fresh allocations
EMU_HEAP_SZ = 0x8000000
FAKE = 0x400000000
FAKE_SZ = 0x200000

UC = Uc(UC_ARCH_X86, UC_MODE_64)

# decrypt check region in the image copy
img = bytearray(IMG)
dec = bytearray(img[0x5E000:0x61000])
for i in range(len(dec)):
    dec[i] ^= XORKEY[i % 4]
img[0x5E000:0x61000] = dec
img = bytes(img)

# ---- map all prompt-phase regions identity
def map_region(base, size, data):
    # round up to page
    psz = (size + 0xFFF) & ~0xFFF
    try:
        UC.mem_map(base & ~0xFFF, psz)
    except UcError:
        pass
    UC.mem_write(base, data[:size])

# the original image (text + data regions)
map_region(0x25359B70000, 0x1000, img[0:0])          # header region (wiped)
map_region(ORIG_BASE, 0x61000, img[0:0x61000])       # .text (with decrypted check fn)
map_region(0x25359BD2000, 0x3000, img[0x61000:0x64000])
map_region(0x25359BD5000, 0x6000, img[0x64000:0x6a000])
map_region(0x25359BE0000, 0x10000, img[0x6f000:0x7f000])
map_region(0x25359BF0000, 0x1000, img[0x80000:0x81000])
map_region(0x25359C00000, 0x265000, img[0x8f000:0x2f4000])

# all heap regions from the prompt dumps
for fn in glob.glob(DUMPS + "pid8140_prompt_*.bin"):
    name = os.path.basename(fn)
    parts = name.split("_")
    base = int(parts[2], 16)
    size = int(parts[3].split(".")[0], 16)
    if base == 0x7FFE0000 or base == 0x7FFED000:
        continue
    if base >= 0x7FF400000000:
        continue    # skip system DLL + packed image regions (not needed yet)
    data = open(fn, "rb").read()
    map_region(base, size, data)

UC.mem_map(EMU_STACK, EMU_STACK_SZ)
UC.mem_map(EMU_HEAP, EMU_HEAP_SZ)
UC.mem_map(FAKE, FAKE_SZ)

# the raw .text dump re-mapped above restored the check() region to its
# XOR-wrapped rest state; decrypt it again (runtime decrypt->run->re-encrypt)
_dec = bytearray(UC.mem_read(ORIG_BASE + 0x5E000, 0x3000))
for i in range(len(_dec)):
    _dec[i] ^= XORKEY[i % 4]
UC.mem_write(ORIG_BASE + 0x5E000, bytes(_dec))

_heap_ptr = [EMU_HEAP + 0x100000]

def alloc(size, align=0x20):
    p = (_heap_ptr[0] + align - 1) & ~(align - 1)
    _heap_ptr[0] = p + max(size, 8) + 0x40
    return p

# ---- fake PEB / TEB / Ldr / kernel32
def w64(addr, val):
    UC.mem_write(addr, struct.pack("<Q", val))

def wstr(addr, s):
    UC.mem_write(addr, s.encode("utf-16-le") + b"\x00\x00")

EXEIMG = FAKE + 0x10000
exeimg = bytearray(0x1000)
exeimg[0:2] = b"MZ"
struct.pack_into("<I", exeimg, 0x28, 0x5ACEB6A1)
struct.pack_into("<I", exeimg, 0x2C, 0x5ACEB6A1 ^ 0x31415926)
UC.mem_write(EXEIMG, bytes(exeimg))

PEB = FAKE + 0x1000
TEB = FAKE + 0x5000
LDR = FAKE + 0x8000
UC.mem_write(PEB + 0x10, struct.pack("<Q", EXEIMG))
UC.mem_write(PEB + 0x18, struct.pack("<Q", LDR))

K32 = FAKE + 0x20000
API_NAMES = ["GetProcAddress", "SetConsoleTitleA", "SetConsoleTitleW", "GetModuleFileNameA",
    "VirtualAlloc", "CreateThread", "GetCurrentThread", "SetThreadContext", "Beep",
    "QueryPerformanceCounter", "VirtualProtect", "Thread32First", "SetConsoleTextAttribute",
    "Sleep", "OpenProcess", "GetFileSize", "CreateFileMappingA", "MapViewOfFile", "GetStdHandle",
    "ResetWriteWatch", "GetSystemDirectoryA", "ContinueDebugEvent", "GetThreadContext",
    "CreateToolhelp32Snapshot", "GetModuleHandleA", "ExitProcess", "GetTickCount64", "ReadFile",
    "GetCurrentProcessId", "GetCurrentProcess", "CopyFileA", "QueryPerformanceFrequency",
    "Thread32Next", "VirtualQuery", "CreateProcessA", "CreateFileA", "WaitForDebugEvent",
    "GetEnvironmentVariableA", "CloseHandle", "GetWriteWatch", "WriteFile", "WriteConsoleA"]
API_ADDR = {n: K32 + 0x1000 + i * 0x20 for i, n in enumerate(API_NAMES)}

def build_k32():
    names = API_NAMES
    hdr = bytearray(0x1000)
    hdr[0:2] = b"MZ"
    struct.pack_into("<I", hdr, 0x3C, 0x80)
    struct.pack_into("<I", hdr, 0x80, 0x4550)
    opt = 0x80 + 0x18
    struct.pack_into("<H", hdr, opt, 0x20B)
    export_rva = 0x2000
    struct.pack_into("<I", hdr, opt + 112, export_rva)
    struct.pack_into("<I", hdr, opt + 116, 0x2000)
    struct.pack_into("<H", hdr, 0x80 + 6, 1)
    struct.pack_into("<H", hdr, 0x80 + 20, 240)
    sec = opt + 240
    hdr[sec:sec+8] = b".edata\x00\x00"
    struct.pack_into("<IIII", hdr, sec + 8, 0x1000, export_rva, 0x2000, 0x2000)
    UC.mem_write(K32, bytes(hdr))
    expdir = bytearray(0x2000)
    struct.pack_into("<IIII", expdir, 0x0C, 0x2000 + 0x900, 1, len(names), len(names))
    struct.pack_into("<III", expdir, 0x1C, 0x2000 + 0x100, 0x2000 + 0x300, 0x2000 + 0x500)
    off = 0x600
    for i, n in enumerate(names):
        nb = n.encode() + b"\x00"
        expdir[off:off + len(nb)] = nb
        struct.pack_into("<I", expdir, 0x300 + i * 4, 0x2000 + off)
        struct.pack_into("<I", expdir, 0x100 + i * 4, API_ADDR[n] - K32)
        struct.pack_into("<H", expdir, 0x500 + i * 2, i)
        off += len(nb)
    UC.mem_write(K32 + export_rva, bytes(expdir))

build_k32()

def add_module(dllname, base):
    entry = alloc(0x100)
    nb = alloc(0x100)
    wstr(nb, dllname)
    us = bytearray(0x10)
    struct.pack_into("<HHIQ", us, 0, len(dllname) * 2, len(dllname) * 2 + 2, 0, nb)
    UC.mem_write(entry + 0x48, bytes(us))
    w64(entry + 0x20, base)
    return entry

entries = [
    add_module("ntdll.dll", FAKE + 0x30000),
    add_module("KERNEL32.DLL", K32),
    add_module("kernelbase.dll", FAKE + 0x31000),
    add_module("ucrtbase.dll", FAKE + 0x32000),
]
head = LDR + 0x20
prev = head
for e in entries:
    w64(prev, e)
    w64(e + 8, prev)
    prev = e
w64(prev, head)
w64(head + 8, entries[-1])
UC.mem_write(TEB + 0x60, struct.pack("<Q", PEB))
UC.reg_write(xc.UC_X86_REG_GS_BASE, TEB)

# ---- emulation control
RET_MAGIC = 0x710000000
UC.mem_map(RET_MAGIC, 0x1000)
STOP_MAGIC = 0x710001000
UC.mem_map(STOP_MAGIC, 0x1000)

OUTPUT_LOG = []
TEST_PASSWORD = [b"TestPassword123!\r\n"]
CHECK_CALLS = []
TSC = [0x7CBC1770003]

def stub_ret(uc, rax=0):
    rsp = uc.reg_read(xc.UC_X86_REG_RSP)
    rip, = struct.unpack("<Q", uc.mem_read(rsp, 8))
    uc.reg_write(xc.UC_X86_REG_RSP, rsp + 8)
    uc.reg_write(xc.UC_X86_REG_RAX, rax & 0xFFFFFFFFFFFFFFFF)
    uc.reg_write(xc.UC_X86_REG_RIP, rip)

API_STUB_NAME = {API_ADDR[n]: n for n in API_NAMES}
API_HANDLERS = {}

def handler(name):
    def deco(fn):
        API_HANDLERS[name] = fn
        return fn
    return deco

@handler("GetModuleFileNameA")
def h(uc):
    buf = uc.reg_read(xc.UC_X86_REG_RDX)
    path = b"C:\\Users\\runneradmin\\AppData\\Local\\Microsoft\\CLR\\sihost.exe"
    UC.mem_write(buf, path + b"\x00")
    stub_ret(uc, len(path))

@handler("GetModuleHandleA")
def h(uc):
    stub_ret(uc, K32)

@handler("GetStdHandle")
def h(uc):
    n = uc.reg_read(xc.UC_X86_REG_RCX)
    stub_ret(uc, FAKE + 0x50000 + (n & 0xF) * 0x100)

@handler("ReadFile")
def h(uc):
    buf = uc.reg_read(xc.UC_X86_REG_RDX)
    n = uc.reg_read(xc.UC_X86_REG_R8)
    written = uc.reg_read(xc.UC_X86_REG_R9)
    data = TEST_PASSWORD[0][:n]
    TEST_PASSWORD[0] = TEST_PASSWORD[0][len(data):]
    UC.mem_write(buf, data)
    if written:
        UC.mem_write(written, struct.pack("<Q", len(data)))
    stub_ret(uc, 1)

@handler("WriteFile")
@handler("WriteConsoleA")
def h(uc):
    buf = uc.reg_read(xc.UC_X86_REG_RDX)
    n = uc.reg_read(xc.UC_X86_REG_R8)
    written = uc.reg_read(xc.UC_X86_REG_R9)
    try:
        data = bytes(uc.mem_read(buf, n))
    except Exception:
        data = b""
    OUTPUT_LOG.append(data)
    if written:
        UC.mem_write(written, struct.pack("<Q", n))
    stub_ret(uc, 1)

@handler("Sleep")
def h(uc):
    stub_ret(uc, 0)

@handler("GetCurrentProcess")
def h(uc):
    stub_ret(uc, 0)

@handler("GetCurrentProcessId")
def h(uc):
    stub_ret(uc, 8140)

@handler("GetCurrentThread")
def h(uc):
    stub_ret(uc, 0xFFFF1234)

@handler("CreateThread")
def h(uc):
    stub_ret(uc, 0)

@handler("QueryPerformanceCounter")
def h(uc):
    buf = uc.reg_read(xc.UC_X86_REG_RCX)
    UC.mem_write(buf, struct.pack("<Q", 0x123456))
    stub_ret(uc, 1)

@handler("QueryPerformanceFrequency")
def h(uc):
    buf = uc.reg_read(xc.UC_X86_REG_RCX)
    UC.mem_write(buf, struct.pack("<Q", 10_000_000))
    stub_ret(uc, 1)

@handler("GetTickCount64")
def h(uc):
    stub_ret(uc, 0x1000)

@handler("MapViewOfFile")
def h(uc):
    view = FAKE + 0x40000
    UC.mem_write(view, struct.pack("<QQ", TSC[0], 0))
    stub_ret(uc, view)

@handler("CreateFileMappingA")
def h(uc):
    stub_ret(uc, FAKE + 0x41000)

@handler("OpenProcess")
def h(uc):
    stub_ret(uc, FAKE + 0x43000)

@handler("CreateFileA")
def h(uc):
    stub_ret(uc, FAKE + 0x44000)

@handler("GetFileSize")
def h(uc):
    stub_ret(uc, 0)

@handler("CopyFileA")
def h(uc):
    stub_ret(uc, 1)

@handler("CreateProcessA")
def h(uc):
    stub_ret(uc, 1)

@handler("GetEnvironmentVariableA")
def h(uc):
    buf = uc.reg_read(xc.UC_X86_REG_RDX)
    UC.mem_write(buf, b"C:\\Users\\runneradmin\\AppData\\Local\x00")
    stub_ret(uc, 34)

@handler("GetSystemDirectoryA")
def h(uc):
    buf = uc.reg_read(xc.UC_X86_REG_RCX)
    UC.mem_write(buf, b"C:\\Windows\\System32\x00")
    stub_ret(uc, 20)

@handler("VirtualAlloc")
def h(uc):
    size = uc.reg_read(xc.UC_X86_REG_R8)
    stub_ret(uc, alloc(size + 0x1000))

@handler("VirtualProtect")
@handler("VirtualQuery")
def h(uc):
    stub_ret(uc, 1)

@handler("GetThreadContext")
@handler("SetThreadContext")
def h(uc):
    stub_ret(uc, 0)

@handler("CreateToolhelp32Snapshot")
@handler("Thread32First")
@handler("Thread32Next")
@handler("WaitForDebugEvent")
@handler("ContinueDebugEvent")
def h(uc):
    stub_ret(uc, 0)

@handler("ResetWriteWatch")
@handler("SetConsoleTextAttribute")
@handler("SetConsoleTitleA")
@handler("SetConsoleTitleW")
@handler("CloseHandle")
@handler("Beep")
def h(uc):
    stub_ret(uc, 1)

@handler("GetProcAddress")
def h(uc):
    stub_ret(uc, 0)

@handler("ExitProcess")
def h(uc):
    uc.reg_write(xc.UC_X86_REG_RIP, STOP_MAGIC)
    uc.emu_stop()

def hook_api(uc, address, size, ud):
    name = API_STUB_NAME.get(address)
    if name:
        API_HANDLERS.get(name, lambda u: stub_ret(u, 0))(uc)

for addr in API_STUB_NAME:
    UC.hook_add(UC_HOOK_CODE, hook_api, begin=addr, end=addr + 1)

# ---- libc stubs (at ORIGINAL image addresses now)
OB = ORIG_BASE

def hook_malloc(uc, address, size, ud):
    sz = uc.reg_read(xc.UC_X86_REG_RCX)
    stub_ret(uc, alloc(sz + 0x40))

def hook_free(uc, address, size, ud):
    stub_ret(uc, 0)

def hook_chkstk(uc, address, size, ud):
    rsp = uc.reg_read(xc.UC_X86_REG_RSP)
    rip, = struct.unpack("<Q", uc.mem_read(rsp, 8))
    uc.reg_write(xc.UC_X86_REG_RSP, rsp + 8)
    uc.reg_write(xc.UC_X86_REG_RIP, rip)

def hook_memcpy(uc, address, size, ud):
    dst = uc.reg_read(xc.UC_X86_REG_RCX)
    src = uc.reg_read(xc.UC_X86_REG_RDX)
    n = uc.reg_read(xc.UC_X86_REG_R8)
    if n:
        UC.mem_write(dst, bytes(uc.mem_read(src, n)))
    stub_ret(uc, dst)

def hook_memset(uc, address, size, ud):
    dst = uc.reg_read(xc.UC_X86_REG_RCX)
    val = uc.reg_read(xc.UC_X86_REG_RDX) & 0xFF
    n = uc.reg_read(xc.UC_X86_REG_R8)
    if n:
        UC.mem_write(dst, bytes([val]) * n)
    stub_ret(uc, dst)

def hook_out_348c0(uc, address, size, ud):
    rcx = uc.reg_read(xc.UC_X86_REG_RCX)
    rdx = uc.reg_read(xc.UC_X86_REG_RDX)
    r8 = uc.reg_read(xc.UC_X86_REG_R8)
    try:
        s = bytes(uc.mem_read(rcx, min(r8, 0x400)))
    except Exception:
        s = b""
    OUTPUT_LOG.append(s)
    stub_ret(uc, r8)

def hook_out_34c10(uc, address, size, ud):
    rcx = uc.reg_read(xc.UC_X86_REG_RCX)
    rdx = uc.reg_read(xc.UC_X86_REG_RDX)
    r8 = uc.reg_read(xc.UC_X86_REG_R8)
    try:
        s = bytes(uc.mem_read(rcx, min(r8, 0x400)))
    except Exception:
        s = b""
    OUTPUT_LOG.append(s)
    stub_ret(uc, r8)

UC.hook_add(UC_HOOK_CODE, hook_malloc, begin=OB + 0x3895C, end=OB + 0x3895C + 1)
UC.hook_add(UC_HOOK_CODE, hook_free, begin=OB + 0x3886C, end=OB + 0x3886C + 1)
UC.hook_add(UC_HOOK_CODE, hook_chkstk, begin=OB + 0x39090, end=OB + 0x39090 + 1)
UC.hook_add(UC_HOOK_CODE, hook_memcpy, begin=OB + 0x57BE0, end=OB + 0x57BE0 + 1)
UC.hook_add(UC_HOOK_CODE, hook_memset, begin=OB + 0x58290, end=OB + 0x58290 + 1)
UC.hook_add(UC_HOOK_CODE, hook_out_348c0, begin=OB + 0x348C0, end=OB + 0x348C0 + 1)
UC.hook_add(UC_HOOK_CODE, hook_out_34c10, begin=OB + 0x34C10, end=OB + 0x34C10 + 1)

def hook_check(uc, address, size, ud):
    rsp = uc.reg_read(xc.UC_X86_REG_RSP)
    arg5, = struct.unpack("<Q", uc.mem_read(rsp + 0x20, 8))
    CHECK_CALLS.append({
        "rcx": uc.reg_read(xc.UC_X86_REG_RCX),
        "rdx": uc.reg_read(xc.UC_X86_REG_RDX),
        "r8": uc.reg_read(xc.UC_X86_REG_R8),
        "r9": uc.reg_read(xc.UC_X86_REG_R9),
        "arg5": arg5,
    })
UC.hook_add(UC_HOOK_CODE, hook_check, begin=OB + 0x5E000, end=OB + 0x5E000 + 1)

# ---- rdtsc
def hook_rdtsc(uc, address, size, ud):
    t = TSC[0]
    UC.reg_write(xc.UC_X86_REG_RAX, t & 0xFFFFFFFFFFFFFFFF)
    UC.reg_write(xc.UC_X86_REG_RDX, (t >> 64) & 0xFFFFFFFF)
    TSC[0] += 0x100
    uc.reg_write(xc.UC_X86_REG_RIP, address + size)

rdtsc_sites = []
i = IMG.find(b"\x0f\x31", 0, 0x61000)
while i >= 0:
    rdtsc_sites.append(i)
    i = IMG.find(b"\x0f\x31", i + 1, 0x61000)
for a in rdtsc_sites:
    UC.hook_add(UC_HOOK_CODE, hook_rdtsc, begin=OB + a, end=OB + a + 2)

def hook_mem_invalid(uc, access, address, size, value, ud):
    rip = uc.reg_read(xc.UC_X86_REG_RIP)
    print(f"[!] INVALID MEM access={access} addr={hex(address)} size={size} rip={hex(rip)} rva={hex(rip-OB) if OB <= rip < OB+0x61000 else '?'}")
    return False

UC.hook_add(UC_HOOK_MEM_INVALID, hook_mem_invalid)

TRACE = []
MILESTONES = {0x2CF2A: "cin>> returned", 0x2CF28: "cin>> call", 0x2CF0B: "string ctor",
              0x3033C: "decoy checks (input len loaded)", 0x3094B: "CHECK CALL",
              0x3041F: "timing loop", 0x304B2: "CRC32 loop", 0x30738: "seed mix",
              0x30813: "rbx build", 0x2F26A: "VM on blob2", 0x2E7D8: "dispatcher",
              0x2D8E4: "r9=[rbp+0x78] zone", 0x2CE8D: "PEB magic check"}

def hook_trace(uc, address, size, ud):
    TRACE.append(address)
    if len(TRACE) > 6000:
        del TRACE[:3000]
    m = MILESTONES.get(address - OB if address >= OB else -1)
    if m:
        print(f"    [milestone] {m}")

UC.hook_add(UC_HOOK_CODE, hook_trace)

# ---- run from the cin>> sequence
def run_from_input(password, start_rva=0x2CF06, verbose=True):
    TEST_PASSWORD[0] = password + b"\r\n"
    OUTPUT_LOG.clear()
    CHECK_CALLS.clear()
    TRACE.clear()
    sp = (EMU_STACK + EMU_STACK_SZ - 0x100000) & ~0xF
    rbp = sp + 0x2000            # main's rbp region (frame is 0x7E8 + locals up to 0x7F8+)
    rsp = rbp - 0x40             # rbp = rsp + 0x40 per main's frame setup
    UC.mem_write(rsp, struct.pack("<Q", RET_MAGIC))
    UC.reg_write(xc.UC_X86_REG_RSP, rsp)
    UC.reg_write(xc.UC_X86_REG_RBP, rbp)
    # pre-init frame state as main would have at this point
    UC.mem_write(rbp + 0x7F0, struct.pack("<I", 0))
    UC.mem_write(rbp + 0x690, b"C:\\Users\\runneradmin\\AppData\\Local\\Microsoft\\CLR\\sihost.exe\x00")
    try:
        UC.emu_start(OB + start_rva, RET_MAGIC, timeout=1800 * 1_000_000, count=8_000_000_000)
    except UcError as e:
        rip = UC.reg_read(xc.UC_X86_REG_RIP)
        if verbose:
            print(f"[!] emu error: {e} at {hex(rip)} (rva {hex(rip - OB) if OB <= rip < OB + 0x61000 else hex(rip)})")
            # save full trace
            with open("/home/z/my-project/artifacts/trace.log", "w") as f:
                for a in TRACE:
                    f.write(f"{a:x} {a-OB if OB <= a < OB+0x61000 else -1:x}\n")
            for a in TRACE[-20:]:
                print(f"    {hex(a)} rva={hex(a-OB) if OB <= a < OB+0x61000 else '?'}")
        return False
    return True

if __name__ == "__main__":
    print(f"[*] identity-mapped emulation ready; {len(rdtsc_sites)} rdtsc hooks")
    ok = run_from_input(b"TestPassword123!")
    print("[*] finished:", ok)
    print("\n=== OUTPUT ===")
    for o in OUTPUT_LOG:
        print(repr(o[:300]))
    print("\n=== CHECK CALLS ===")
    for c in CHECK_CALLS:
        print({k: hex(v) if isinstance(v, int) else v for k, v in c.items()})
