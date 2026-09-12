#!/usr/bin/env python3
"""
HYDRA (MCM 7) — exact check() argument capture.

At the password prompt (before any input), main's frame already holds:
  [rbp+0x78]  = arg5 (FNV1a-0 of an API's code bytes on this machine)
  [rbp+0xB0]  = ecall mix used for arg3
  [rbp+0x690] = the masqueraded module path (marker to locate rbp)
The PEB still holds BeingDebugged (decides arg2 between 0x45523F21 / 0xFFFFFFFF).

This tool spawns the crackme under ConPTY, waits for the prompt, locates the
masqueraded child, reads its PEB + every thread stack, extracts the values and
writes a JSON report + raw dumps for offline analysis.
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
PROCESS_QUERY_LIMITED_INFORMATION = 0x1000
THREAD_QUERY_INFORMATION = 0x0040
THREAD_GET_CONTEXT = 0x0008
THREAD_SUSPEND_RESUME = 0x0002

# ---------------------------------------------------------------- structures
class MEMORY_BASIC_INFORMATION64(ctypes.Structure):
    _fields_ = [("BaseAddress", ctypes.c_ulonglong),
                ("AllocationBase", ctypes.c_ulonglong),
                ("AllocationProtect", ctypes.c_ulong),
                ("__alignment1", ctypes.c_ulong),
                ("RegionSize", ctypes.c_ulonglong),
                ("State", ctypes.c_ulong),
                ("Protect", ctypes.c_ulong),
                ("Type", ctypes.c_ulong),
                ("__alignment2", ctypes.c_ulong)]

class PROCESS_BASIC_INFORMATION(ctypes.Structure):
    _fields_ = [("Reserved1", ctypes.c_void_p),
                ("PebBaseAddress", ctypes.c_void_p),
                ("Reserved2", ctypes.c_void_p * 2),
                ("UniqueProcessId", ctypes.c_void_p),
                ("Reserved3", ctypes.c_void_p)]

class THREADENTRY32(ctypes.Structure):
    _fields_ = [("dwSize", wintypes.DWORD),
                ("cntUsage", wintypes.DWORD),
                ("th32ThreadID", wintypes.DWORD),
                ("th32OwnerProcessID", wintypes.DWORD),
                ("tpBasePri", ctypes.c_long),
                ("tpDeltaPri", ctypes.c_long),
                ("dwFlags", wintypes.DWORD)]

class FLOATING_SAVE_AREA(ctypes.Structure):
    _fields_ = [("ControlWord", wintypes.DWORD), ("StatusWord", wintypes.DWORD),
                ("TagWord", wintypes.DWORD), ("ErrorOffset", wintypes.DWORD),
                ("ErrorSelector", wintypes.DWORD), ("DataOffset", wintypes.DWORD),
                ("DataSelector", wintypes.DWORD), ("RegisterArea", ctypes.c_ubyte * 80),
                ("Cr0NpxState", wintypes.DWORD)]

class CONTEXT64(ctypes.Structure):
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
                ("Rip", ctypes.c_ulonglong),
                ("FltSave", FLOATING_SAVE_AREA),
                ("VectorRegister", ctypes.c_ubyte * 16 * 26),
                ("VectorControl", ctypes.c_ulonglong),
                ("DebugControl", ctypes.c_ulonglong),
                ("LastBranchToRip", ctypes.c_ulonglong),
                ("LastBranchFromRip", ctypes.c_ulonglong),
                ("LastExceptionToRip", ctypes.c_ulonglong),
                ("LastExceptionFromRip", ctypes.c_ulonglong)]

k32.OpenProcess.restype = wintypes.HANDLE
k32.OpenProcess.argtypes = [wintypes.DWORD, wintypes.BOOL, wintypes.DWORD]
k32.ReadProcessMemory.argtypes = [wintypes.HANDLE, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_size_t, ctypes.POINTER(ctypes.c_size_t)]
k32.VirtualQueryEx.argtypes = [wintypes.HANDLE, ctypes.c_void_p, ctypes.POINTER(MEMORY_BASIC_INFORMATION64), ctypes.c_size_t]
k32.CreateToolhelp32Snapshot.restype = wintypes.HANDLE
k32.OpenThread.restype = wintypes.HANDLE
k32.OpenThread.argtypes = [wintypes.DWORD, wintypes.BOOL, wintypes.DWORD]
k32.GetThreadContext.argtypes = [wintypes.HANDLE, ctypes.POINTER(CONTEXT64)]
k32.SuspendThread.argtypes = [wintypes.HANDLE]
k32.ResumeThread.argtypes = [wintypes.HANDLE]
TH32CS_THREAD = 0x00000004


def rpm(h, addr, size):
    buf = ctypes.create_string_buffer(int(size))
    got = ctypes.c_size_t(0)
    if k32.ReadProcessMemory(h, ctypes.c_void_p(addr), buf, size, ctypes.byref(got)):
        return buf.raw[:got.value]
    return None


def dump_region(h, base, size, name):
    data = rpm(h, base, size)
    if data is None:
        return None
    fn = os.path.join(DUMPDIR, name)
    with open(fn, "wb") as f:
        f.write(data)
    return fn


def get_peb(h):
    pbi = PROCESS_BASIC_INFORMATION()
    r = ntdll.NtQueryInformationProcess(h, 0, ctypes.byref(pbi), ctypes.sizeof(pbi), None)
    if r:
        return None
    return pbi.PebBaseAddress


def threads_of(pid):
    snap = k32.CreateToolhelp32Snapshot(TH32CS_THREAD, 0)
    if snap == wintypes.HANDLE(-1) or not snap:
        return []
    te = THREADENTRY32()
    te.dwSize = ctypes.sizeof(THREADENTRY32)
    out = []
    if k32.Thread32First(snap, ctypes.byref(te)):
        while True:
            if te.th32OwnerProcessID == pid:
                out.append(te.th32ThreadID)
            if not k32.Thread32Next(snap, ctypes.byref(te)):
                break
    k32.CloseHandle(snap)
    return out


# ---------------------------------------------------------------- proc watcher
class ProcWatcher(threading.Thread):
    def __init__(self):
        super().__init__(daemon=True)
        self.events = []
        self.known = {p.pid for p in psutil.process_iter()}
        self._halt = threading.Event()

    def run(self):
        while not self._halt.is_set():
            try:
                for p in psutil.process_iter(attrs=["pid", "ppid", "name", "exe", "cmdline"]):
                    if p.pid in self.known:
                        continue
                    self.known.add(p.pid)
                    try:
                        i = p.info
                        self.events.append({k: i[k] for k in ("pid", "ppid", "name", "exe", "cmdline")})
                    except Exception:
                        pass
            except Exception:
                pass
            time.sleep(0.05)

    def stop(self):
        self._halt.set()
        try:
            self.join(timeout=2)
        except Exception:
            pass

    def masqueraded(self):
        out = []
        for e in self.events:
            exe = e.get("exe") or ""
            if "Microsoft\\CLR" in exe or ("AppData" in exe and e["pid"] != os.getpid()):
                out.append(e)
        return out


# ---------------------------------------------------------------- main
report = {"binary": BIN, "console": "", "child": None, "values": {}, "dumps": []}

watcher = ProcWatcher()
watcher.start()

print(f"[*] spawning under ConPTY: {BIN}")
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
print("".join(readbuf), end="", flush=True)
report["console"] = "".join(readbuf)

if not prompt_seen:
    print("[!] no prompt seen; aborting")
    watcher.stop()
    sys.exit(1)

time.sleep(1.0)  # let the child settle (background thread + ecalls done)
children = watcher.masqueraded()
if not children:
    print("[!] no masqueraded child found")
    watcher.stop()
    sys.exit(1)

child = children[0]
report["child"] = child
cpid = child["pid"]
print(f"[*] child: pid={cpid} exe={child.get('exe')}")

h = k32.OpenProcess(PROCESS_VM_READ | PROCESS_QUERY_INFORMATION, False, cpid)
if not h:
    print(f"[!] OpenProcess failed {ctypes.GetLastError()}")
    sys.exit(1)

# --- PEB
peb = get_peb(h)
report["values"]["peb"] = hex(peb) if peb else None
if peb:
    pebdata = rpm(h, peb, 0x400)
    if pebdata:
        being_debugged = pebdata[2]
        ntglobal = struct.unpack_from("<I", pebdata, 0xBC)[0]
        image_base = struct.unpack_from("<Q", pebdata, 0x10)[0]
        report["values"]["BeingDebugged"] = being_debugged
        report["values"]["NtGlobalFlag"] = hex(ntglobal)
        report["values"]["child_image_base"] = hex(image_base)
        # Ldr walk to list modules (kernel32 base etc.)
        ldr = struct.unpack_from("<Q", pebdata, 0x18)[0]
        ldrdata = rpm(h, ldr, 0x60)
        if ldrdata:
            head = struct.unpack_from("<Q", ldrdata, 0x20)[0]  # InMemoryOrderModuleList
            cur = head
            modules = []
            for _ in range(30):
                entry = rpm(h, cur, 0x60)  # InMemoryOrderLinks-based entry
                if not entry:
                    break
                flink = struct.unpack_from("<Q", entry, 0)[0]
                dllbase = struct.unpack_from("<Q", entry, 0x20)[0]
                namebuf_ptr = struct.unpack_from("<Q", entry, 0x50)[0]
                name_len = struct.unpack_from("<H", entry, 0x48)[0]
                name = ""
                if namebuf_ptr and name_len:
                    nb = rpm(h, namebuf_ptr, name_len)
                    if nb:
                        try:
                            name = nb.decode("utf-16-le", errors="replace")
                        except Exception:
                            pass
                modules.append({"base": hex(dllbase), "name": name})
                cur = flink
                if cur == head:
                    break
            report["values"]["modules"] = modules

# --- globals page (RVA 0x61000-0x64000 of the child image)
ib = report["values"].get("child_image_base")
ib = int(ib, 16) if ib else None

def child_rva(rva, size):
    return rpm(h, ib + rva, size) if ib else None

if ib:
    g = child_rva(0x63DC0, 0xA0)
    if g:
        vals = {}
        for i, name in enumerate(["g63DC0", "blob1_ptr", "blob1_end", "blob2_ptr", "blob2_end",
                                  "g63E00", "g63E08", "g63E10", "g63E14", "g63E18",
                                  "g63E20", "g63E28", "g63E30", "g63E38", "g63E40",
                                  "g63E48", "g63E50"]):
            vals[name] = hex(struct.unpack_from("<Q", g, i * 8)[0])
        vals["g625B4"] = hex(struct.unpack("<I", child_rva(0x625B4, 4))[0]) if child_rva(0x625B4, 4) else None
        report["values"]["globals"] = vals
        # constants for the solver
        for rva, name, size in [(0x61CA0, "T64", 0x100), (0x61DA0, "const2048", 0x800)]:
            d = child_rva(rva, size)
            if d:
                fn = dump_region(h, ib + rva, size, f"{name}.bin")
                report["dumps"].append({"name": name, "rva": hex(rva), "file": fn})
        # blobs via pointers
        vals2 = report["values"]["globals"]
        b1p, b1e = int(vals2["blob1_ptr"], 16), int(vals2["blob1_end"], 16)
        b2p, b2e = int(vals2["blob2_ptr"], 16), int(vals2["blob2_end"], 16)
        for p, e, name in [(b1p, b1e, "blob1"), (b2p, b2e, "blob2")]:
            if e > p and e - p <= 0x1000:
                d = rpm(h, p, e - p)
                if d:
                    fn = dump_region(h, p, e - p, f"{name}.bin")
                    report["dumps"].append({"name": name, "ptr": hex(p), "size": e - p, "file": fn})
        # write-watch page
        wwp = int(vals2["g63E08"], 16)
        d = rpm(h, wwp, 0x1000)
        if d:
            fn = dump_region(h, wwp, 0x1000, "writewatch_page.bin")
            report["dumps"].append({"name": "writewatch_page", "ptr": hex(wwp), "file": fn})

# --- stacks of all threads
stack_hits = []
for tid in threads_of(cpid):
    th = k32.OpenThread(THREAD_GET_CONTEXT | THREAD_QUERY_INFORMATION | THREAD_SUSPEND_RESUME, False, tid)
    if not th:
        continue
    ctx = CONTEXT64()
    ctx.ContextFlags = 0x100010  # CONTEXT_DEBUG_REGISTERS|CONTEXT_AMD64 -- full needed
    ctx.ContextFlags = 0x10003B  # CONTEXT_FULL|CONTEXT_AMD64 (float+ctrl+int)
    k32.SuspendThread(th)
    ok = k32.GetThreadContext(th, ctypes.byref(ctx))
    k32.ResumeThread(th)
    k32.CloseHandle(th)
    if not ok:
        continue
    rsp, rbp = ctx.Rsp, ctx.Rbp
    print(f"[*] thread {tid}: rsp={hex(rsp)} rbp={hex(rbp)} rip={hex(ctx.Rip)} dr2={hex(ctx.Dr2)} dr3={hex(ctx.Dr3)}")
    stack = rpm(h, rsp & ~0xF, 0x18000)  # 96 KiB above rsp
    if not stack:
        continue
    base = rsp & ~0xF
    # marker: the masqueraded path string lives at [rbp+0x690]
    marker = b"sihost.exe"
    pos = 0
    while True:
        i = stack.find(marker, pos)
        if i < 0:
            break
        # candidate rbp: string addr - 0x690
        str_addr = base + i
        rbp_c = str_addr - 0x690
        off = rbp_c - base
        if off >= 0 and off + 0x800 < len(stack):
            # validate: [rbp_c+0x7F0] should be small, [rbp_c+0xB0] arbitrary qword
            arg5 = struct.unpack_from("<Q", stack, off + 0x78)[0]
            b0 = struct.unpack_from("<Q", stack, off + 0xB0)[0]
            # [rbp+0x690] string must START at rbp+0x690: path begins with 'C:'
            s = stack[i - 2:i + 10]
            if s[:2] in (b"C:", b"c:"):
                stack_hits.append({"tid": tid, "rbp_main": hex(rbp_c),
                                   "arg5": hex(arg5), "rbpB0": hex(b0)})
        pos = i + 1
    fn = dump_region(h, base, len(stack), f"stack_tid{tid}.bin")
    report["dumps"].append({"name": f"stack_tid{tid}", "base": hex(base), "size": len(stack), "file": fn})

report["values"]["stack_hits"] = stack_hits

# also record this machine's pid for the Dr2/Dr3 chain verification
report["values"]["child_pid"] = cpid

k32.CloseHandle(h)
watcher.stop()

# terminate
try:
    psutil.Process(cpid).kill()
except Exception:
    pass
try:
    if proc.isalive():
        proc.terminate(force=True)
except Exception:
    pass

with open(OUT, "w", encoding="utf-8") as f:
    json.dump(report, f, indent=2)
print(f"\n[+] report: {OUT}")
print(json.dumps(report["values"], indent=2)[:3000])
