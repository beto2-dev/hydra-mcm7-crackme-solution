#!/usr/bin/env python3
"""
HYDRA (MCM 7) — exact check() argument capture, v2.

The masquerade may spawn several AppData\...\CLR processes (incl. decoys).
This version:
  1. spawns under ConPTY, waits for the prompt
  2. enumerates ALL masqueraded processes (repeatedly, catching late spawns)
  3. for each: full region dump (to find the unpacked original image via a
     .text signature), PEB, all thread stacks
  4. locates main's rbp in the stack via the module path at [rbp+0x690]
  5. extracts arg5=[rbp+0x78], ecall mix [rbp+0xB0], tamper [rbp+0xA8/0x80]
"""
import json
import os
import sys
import time
import struct
import threading

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

BIN = os.path.abspath(sys.argv[1]) if len(sys.argv) > 1 else "binaries/CrackMe_packed.exe"
OUT = os.path.abspath(sys.argv[2]) if len(sys.argv) > 2 else "evidence/args_capture.json"
DUMPDIR = os.path.abspath(sys.argv[3]) if len(sys.argv) > 3 else "evidence/capture"
os.makedirs(os.path.dirname(OUT), exist_ok=True)
os.makedirs(DUMPDIR, exist_ok=True)

import subprocess
subprocess.check_call([sys.executable, "-m", "pip", "install", "-q", "pywinpty", "psutil"])
from winpty import PtyProcess
import psutil

import ctypes
from ctypes import wintypes

k32 = ctypes.windll.kernel32
ntdll = ctypes.windll.ntdll

PROCESS_VM_READ = 0x0010
PROCESS_QUERY_INFORMATION = 0x0400
THREAD_GET_CONTEXT = 0x0008
THREAD_QUERY_INFORMATION = 0x0040
THREAD_SUSPEND_RESUME = 0x0002

TEXT_SIG = None  # set later from the reconstructed image (for identifying the real child)


class MBI64(ctypes.Structure):
    _fields_ = [("BaseAddress", ctypes.c_ulonglong), ("AllocationBase", ctypes.c_ulonglong),
                ("AllocationProtect", ctypes.c_ulong), ("__a1", ctypes.c_ulong),
                ("RegionSize", ctypes.c_ulonglong), ("State", ctypes.c_ulong),
                ("Protect", ctypes.c_ulong), ("Type", ctypes.c_ulong), ("__a2", ctypes.c_ulong)]

class PBI(ctypes.Structure):
    _fields_ = [("Reserved1", ctypes.c_void_p), ("PebBaseAddress", ctypes.c_void_p),
                ("Reserved2", ctypes.c_void_p * 2), ("UniqueProcessId", ctypes.c_void_p),
                ("Reserved3", ctypes.c_void_p)]

class TE32(ctypes.Structure):
    _fields_ = [("dwSize", wintypes.DWORD), ("cntUsage", wintypes.DWORD),
                ("th32ThreadID", wintypes.DWORD), ("th32OwnerProcessID", wintypes.DWORD),
                ("tpBasePri", ctypes.c_long), ("tpDeltaPri", ctypes.c_long), ("dwFlags", wintypes.DWORD)]

class FSA(ctypes.Structure):
    _fields_ = [("ControlWord", wintypes.DWORD), ("StatusWord", wintypes.DWORD),
                ("TagWord", wintypes.DWORD), ("ErrorOffset", wintypes.DWORD),
                ("ErrorSelector", wintypes.DWORD), ("DataOffset", wintypes.DWORD),
                ("DataSelector", wintypes.DWORD), ("RegisterArea", ctypes.c_ubyte * 80),
                ("Cr0NpxState", wintypes.DWORD)]

class CTX64(ctypes.Structure):
    _pack_ = 16
    _fields_ = [("P1Home", ctypes.c_ulonglong), ("P2Home", ctypes.c_ulonglong),
                ("P3Home", ctypes.c_ulonglong), ("P4Home", ctypes.c_ulonglong),
                ("P5Home", ctypes.c_ulonglong), ("P6Home", ctypes.c_ulonglong),
                ("ContextFlags", wintypes.DWORD), ("MxCsr", wintypes.DWORD),
                ("SegCs", wintypes.WORD), ("SegSs", wintypes.WORD),
                ("SegDs", wintypes.WORD), ("SegEs", wintypes.WORD),
                ("SegFs", wintypes.WORD), ("SegGs", wintypes.WORD),
                ("EFlags", wintypes.DWORD),
                ("Dr0", ctypes.c_ulonglong), ("Dr1", ctypes.c_ulonglong),
                ("Dr2", ctypes.c_ulonglong), ("Dr3", ctypes.c_ulonglong),
                ("Dr6", ctypes.c_ulonglong), ("Dr7", ctypes.c_ulonglong),
                ("Rax", ctypes.c_ulonglong), ("Rcx", ctypes.c_ulonglong),
                ("Rdx", ctypes.c_ulonglong), ("Rbx", ctypes.c_ulonglong),
                ("Rsp", ctypes.c_ulonglong), ("Rbp", ctypes.c_ulonglong),
                ("Rsi", ctypes.c_ulonglong), ("Rdi", ctypes.c_ulonglong),
                ("R8", ctypes.c_ulonglong), ("R9", ctypes.c_ulonglong),
                ("R10", ctypes.c_ulonglong), ("R11", ctypes.c_ulonglong),
                ("R12", ctypes.c_ulonglong), ("R13", ctypes.c_ulonglong),
                ("R14", ctypes.c_ulonglong), ("R15", ctypes.c_ulonglong),
                ("Rip", ctypes.c_ulonglong), ("FltSave", FSA),
                ("VectorRegister", ctypes.c_ubyte * 16 * 26), ("VectorControl", ctypes.c_ulonglong),
                ("DebugControl", ctypes.c_ulonglong), ("LastBranchToRip", ctypes.c_ulonglong),
                ("LastBranchFromRip", ctypes.c_ulonglong), ("LastExceptionToRip", ctypes.c_ulonglong),
                ("LastExceptionFromRip", ctypes.c_ulonglong)]

k32.OpenProcess.restype = wintypes.HANDLE
k32.OpenProcess.argtypes = [wintypes.DWORD, wintypes.BOOL, wintypes.DWORD]
k32.ReadProcessMemory.argtypes = [wintypes.HANDLE, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_size_t, ctypes.POINTER(ctypes.c_size_t)]
k32.VirtualQueryEx.argtypes = [wintypes.HANDLE, ctypes.c_void_p, ctypes.POINTER(MBI64), ctypes.c_size_t]
k32.CreateToolhelp32Snapshot.restype = wintypes.HANDLE
k32.OpenThread.restype = wintypes.HANDLE
k32.OpenThread.argtypes = [wintypes.DWORD, wintypes.BOOL, wintypes.DWORD]
k32.GetThreadContext.argtypes = [wintypes.HANDLE, ctypes.POINTER(CTX64)]
k32.SuspendThread.argtypes = [wintypes.HANDLE]
k32.ResumeThread.argtypes = [wintypes.HANDLE]


def rpm(h, addr, size):
    buf = ctypes.create_string_buffer(int(size))
    got = ctypes.c_size_t(0)
    if k32.ReadProcessMemory(h, ctypes.c_void_p(addr), buf, size, ctypes.byref(got)):
        return buf.raw[:got.value]
    return None


def masqueraded_pids():
    out = {}
    for p in psutil.process_iter(attrs=["pid", "ppid", "name", "exe", "cmdline", "create_time"]):
        try:
            i = p.info
            exe = i.get("exe") or ""
            if "Microsoft\\CLR" in exe:
                out[i["pid"]] = i
        except Exception:
            pass
    return out


def threads_of(pid):
    snap = k32.CreateToolhelp32Snapshot(4, 0)  # TH32CS_THREAD
    if not snap or snap == wintypes.HANDLE(-1):
        return []
    te = TE32()
    te.dwSize = ctypes.sizeof(TE32)
    out = []
    if k32.Thread32First(snap, ctypes.byref(te)):
        while True:
            if te.th32OwnerProcessID == pid:
                out.append(te.th32ThreadID)
            if not k32.Thread32Next(snap, ctypes.byref(te)):
                break
    k32.CloseHandle(snap)
    return out


report = {"binary": BIN, "console": "", "children": [], "values": {}}

# signature: bytes of the original image at RVA 0x30738 (arg2 build, unique)
sig = None
imgp = os.path.join(os.path.dirname(BIN), "..", "evidence", "original_image.bin")
if os.path.exists(imgp):
    img = open(imgp, "rb").read()
    sig = img[0x30738:0x30778]

# ---------------------------------------------------------------- capture fn
def capture_phase(phase, children_map):
    """Capture PEB/stacks/globals of every masqueraded child. Returns per-pid data."""
    out = {}
    for pid, info in children_map.items():
        tag = f"pid{pid}_{phase}"
        h = k32.OpenProcess(PROCESS_VM_READ | PROCESS_QUERY_INFORMATION, False, pid)
        if not h:
            continue
        try:
            cdat = {"pid": pid, "exe": info.get("exe")}
            pbi = PBI()
            if ntdll.NtQueryInformationProcess(h, 0, ctypes.byref(pbi), ctypes.sizeof(pbi), None) == 0:
                pe = rpm(h, pbi.PebBaseAddress, 0x400)
                if pe:
                    cdat["BeingDebugged"] = pe[2]
                    cdat["NtGlobalFlag"] = hex(struct.unpack_from("<I", pe, 0xBC)[0])
                    cdat["peb_image_base"] = hex(struct.unpack_from("<Q", pe, 0x10)[0])
            image_base = cdat.get("_image_base")  # reuse if known
            if not image_base:
                addr = 0
                mbi = MBI64()
                regions = []
                while addr < 0x7FFFFFFF0000:
                    if k32.VirtualQueryEx(h, ctypes.c_void_p(addr), ctypes.byref(mbi), ctypes.sizeof(mbi)) == 0:
                        break
                    if mbi.State == 0x1000 and mbi.Protect not in (0x01,) and not (mbi.Protect & 0x100):
                        regions.append((mbi.BaseAddress, mbi.RegionSize))
                    addr = mbi.BaseAddress + mbi.RegionSize
                cdat["regions"] = len(regions)
                image_base = None
                for base, size in regions:
                    if size < 0x61000:
                        continue
                    d = rpm(h, base + 0x30738, 0x40)
                    if d and sig and d == sig:
                        image_base = base
                        break
                    if size >= 0x100000 and sig:
                        d = rpm(h, base, min(size, 0x3000000))
                        if d:
                            i = d.find(sig)
                            if i >= 0:
                                image_base = base + i - 0x30738
                                break
                cdat["image_base"] = hex(image_base) if image_base else None
                cdat["_image_base"] = image_base
            if image_base:
                g = rpm(h, image_base + 0x63DC0, 0x100)
                if g:
                    vals = {}
                    names = ["g63DC0", "blob1_ptr", "blob1_end", "g63DD8", "blob2_ptr", "blob2_end",
                             "g63DF0", "g63DF8", "g63E00", "g63E08", "g63E10", "g63E18",
                             "g63E20", "g63E28", "g63E30", "g63E38", "g63E40", "g63E48", "g63E50"]
                    for i, name in enumerate(names):
                        vals[name] = hex(struct.unpack_from("<Q", g, i * 8)[0])
                    v = rpm(h, image_base + 0x625B4, 4)
                    if v:
                        vals["g625B4"] = hex(struct.unpack("<I", v)[0])
                    cdat["globals"] = vals
                    # dump blobs
                    for key, name in [("blob1_ptr", "blob1"), ("blob2_ptr", "blob2")]:
                        try:
                            p = int(vals[key], 16)
                            e = int(vals.get(key.replace("_ptr", "_end"), "0"), 16)
                            if e > p and e - p <= 0x10000:
                                d = rpm(h, p, e - p)
                                if d:
                                    fn = os.path.join(DUMPDIR, f"{tag}_{name}.bin")
                                    open(fn, "wb").write(d)
                                    cdat[name + "_size"] = e - p
                        except Exception:
                            pass
                    # write-watch page
                    try:
                        wwp = int(vals["g63E08"], 16)
                        if wwp:
                            d = rpm(h, wwp, 0x1000)
                            if d:
                                fn = os.path.join(DUMPDIR, f"{tag}_wwpage.bin")
                                open(fn, "wb").write(d)
                    except Exception:
                        pass
                    for rva, name, size in [(0x61CA0, "T64", 0x100), (0x61DA0, "const2048", 0x800)]:
                        d = rpm(h, image_base + rva, size)
                        if d:
                            fn = os.path.join(DUMPDIR, f"{tag}_{name}.bin")
                            open(fn, "wb").write(d)
                            if size == 0x800:
                                import zlib
                                cdat["const_crc"] = hex(zlib.crc32(d))
            # thread stacks
            stack_hits = []
            for tid in threads_of(pid):
                th = k32.OpenThread(THREAD_GET_CONTEXT | THREAD_QUERY_INFORMATION | THREAD_SUSPEND_RESUME, False, tid)
                if not th:
                    continue
                ctx = CTX64()
                ctx.ContextFlags = 0x10003F
                k32.SuspendThread(th)
                ok = k32.GetThreadContext(th, ctypes.byref(ctx))
                k32.ResumeThread(th)
                k32.CloseHandle(th)
                if not ok:
                    continue
                rsp = ctx.Rsp
                if not (0x10000 < rsp < 0x7FFFFFFFFFFF):
                    continue
                stack = rpm(h, (rsp - 0x100) & ~0xF, 0x20000)
                if not stack:
                    continue
                sbase = (rsp - 0x100) & ~0xF
                fn = os.path.join(DUMPDIR, f"{tag}_stack_tid{tid}.bin")
                open(fn, "wb").write(stack)
                pos = 0
                while True:
                    i = stack.find(b":\\Users\\", pos)
                    if i < 0:
                        break
                    j = i - 1  # ':' is at i, drive letter at i-1
                    if j >= 0 and stack[j:j + 2] in (b"C:", b"c:"):
                        str_addr = sbase + j
                        rbp_c = str_addr - 0x690
                        off = rbp_c - sbase
                        if 0 <= off and off + 0x800 < len(stack):
                            def q(o):
                                return struct.unpack_from("<Q", stack, o)[0]
                            hit = {"tid": tid, "rbp_main": hex(rbp_c),
                                   "arg5": hex(q(off + 0x78) & 0xFFFFFFFF),
                                   "arg5_full": hex(q(off + 0x78)),
                                   "rbpB0": hex(q(off + 0xB0)),
                                   "rbpA8": hex(q(off + 0xA8)),
                                   "rbp80": hex(q(off + 0x80)),
                                   "arg2_rbp7F8": hex(q(off + 0x7F8) & 0xFFFFFFFF),
                                   "dr2": hex(ctx.Dr2), "dr3": hex(ctx.Dr3),
                                   "path": stack[j:j + 120].split(b"\x00")[0].decode(errors="replace")}
                            stack_hits.append(hit)
                    pos = i + 1
            cdat["stack_hits"] = stack_hits
            out[str(pid)] = cdat
            print(f"[*] [{phase}] child {pid}: ib={cdat.get('image_base')} BD={cdat.get('BeingDebugged')} hits={len(stack_hits)}")
            for hit in stack_hits:
                print(f"    {hit}")
        finally:
            k32.CloseHandle(h)
    return out


def run_once(instance):
    """One full spawn->prompt->(optional input)->post capture. Returns report data."""
    r = {"console": "", "prompt": {}, "post": {}}
    proc = PtyProcess.spawn(BIN)
    readbuf = []

    def _reader():
        while proc.isalive():
            try:
                chunk = proc.read()
                if chunk:
                    readbuf.append(chunk)
            except Exception:
                break
    threading.Thread(target=_reader, daemon=True).start()

    deadline = time.time() + 30
    prompt_seen = False
    while time.time() < deadline:
        out = "".join(readbuf)
        if "Password" in out:
            prompt_seen = True
            break
        if not proc.isalive():
            break
        time.sleep(0.2)
    r["console"] = "".join(readbuf)
    print(r["console"][-150:], flush=True)
    if not prompt_seen:
        return r

    children = {}
    for _ in range(16):
        for pid, info in masqueraded_pids().items():
            if pid not in children:
                children[pid] = info
        time.sleep(0.25)
    r["prompt_children"] = [i.get("exe") for i in children.values()]
    r["prompt"] = capture_phase(f"i{instance}_prompt", children)

    # send a test password and RACE-capture the arg2 neighborhood [rbp+0x7C0..rbp+0x810]
    race_vals = []
    rbp_mains = []
    for pid, c in r["prompt"].items():
        for hit in c.get("stack_hits", []):
            rbp_mains.append((pid, int(hit["rbp_main"], 16)))
    race_stop = threading.Event()

    def racer():
        if not rbp_mains:
            return
        pid, rbp_main = rbp_mains[0]
        pid = int(pid)
        h = k32.OpenProcess(PROCESS_VM_READ | PROCESS_QUERY_INFORMATION, False, pid)
        if not h:
            return
        # watch TWO windows: check()'s arg-save slots below rbp, and arg2 above rbp
        buf = ctypes.create_string_buffer(0x100)
        got = ctypes.c_size_t(0)
        last1 = last2 = None
        snaps = []
        t0 = time.time()
        w1 = rbp_main - 0x78   # arg4@-0x68, retaddr@-0x48, arg3@-0x40, arg5@-0x20
        w2 = rbp_main + 0x7C0   # arg2@+0x7F8
        while not race_stop.is_set() and time.time() - t0 < 12.0:
            if k32.ReadProcessMemory(h, ctypes.c_void_p(w1), buf, 0x60, ctypes.byref(got)):
                v = bytes(buf.raw[:0x60])
                if v != last1:
                    snaps.append((round(time.time() - t0, 4), 1, v.hex()))
                    last1 = v
            if k32.ReadProcessMemory(h, ctypes.c_void_p(w2), buf, 0x50, ctypes.byref(got)):
                v = bytes(buf.raw[:0x50])
                if v != last2:
                    snaps.append((round(time.time() - t0, 4), 2, v.hex()))
                    last2 = v
            if len(snaps) > 100:
                break
        k32.CloseHandle(h)
        race_vals.extend(snaps)

    rt = threading.Thread(target=racer, daemon=True)
    rt.start()
    time.sleep(0.05)
    try:
        proc.write("CaptureProbe99\r")
    except Exception:
        pass
    deadline = time.time() + 20
    while time.time() < deadline:
        out = "".join(readbuf)
        if "DENIED" in out or "NICE" in out or not proc.isalive():
            break
        time.sleep(0.1)
    race_stop.set()
    rt.join(timeout=2)
    r["arg2_race"] = [(t, v) for t, v in race_vals]
    print(f"[*] arg2 race snapshots: {len(race_vals)}")
    for t, v in race_vals[:20]:
        print(f"    {t:8.4f} {v}")
    time.sleep(1.0)
    r["console_full"] = "".join(readbuf)
    # refresh child map (same pids)
    children2 = {p: children[p] for p in children if psutil.pid_exists(p)}
    r["post"] = capture_phase(f"i{instance}_post", children2)

    for pid in children:
        try:
            psutil.Process(pid).kill()
        except Exception:
            pass
    try:
        if proc.isalive():
            proc.terminate(force=True)
    except Exception:
        pass
    return r


report["instances"] = []
for inst in range(2):
    print(f"\n===== INSTANCE {inst} =====")
    report["instances"].append(run_once(inst))

with open(OUT, "w", encoding="utf-8") as f:
    json.dump(report, f, indent=2)
print(f"\n[+] report: {OUT}")
