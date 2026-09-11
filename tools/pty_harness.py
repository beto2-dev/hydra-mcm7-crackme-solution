#!/usr/bin/env python3
"""
Interactive ConPTY harness + live memory dumper for HYDRA (MCM 7).

The crackme refuses to read input from a plain pipe (it only reacts to a real
console). This harness:
  1. Spawns it under a Windows pseudo console (ConPTY via pywinpty)
  2. Watches for masqueraded child processes (copies under %LOCALAPPDATA%\\Microsoft\\CLR)
  3. Dumps the child's memory while it waits at the password prompt
  4. Feeds a password and captures the program's response
  5. Writes a JSON evidence report
"""
import json
import os
import sys
import time
import hashlib
import threading

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

BIN = os.path.abspath(sys.argv[1]) if len(sys.argv) > 1 else "binaries/CrackMe_packed.exe"
PWD_INPUT = sys.argv[2] if len(sys.argv) > 2 else "AAAA"
OUT = os.path.abspath(sys.argv[3]) if len(sys.argv) > 3 else "evidence/pty_report.json"
DUMPDIR = os.path.abspath(sys.argv[4]) if len(sys.argv) > 4 else "evidence/dumps"
os.makedirs(os.path.dirname(OUT), exist_ok=True)
os.makedirs(DUMPDIR, exist_ok=True)

subprocess_check = None
import subprocess
subprocess.check_call([sys.executable, "-m", "pip", "install", "-q", "pywinpty", "psutil"])
from winpty import PtyProcess
import psutil

report = {"binary": BIN, "input": PWD_INPUT, "console_output": "", "dumps": [], "children": []}

# ------------------------------------------------------------------- watcher
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
            time.sleep(0.1)

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


# ------------------------------------------------------------------- dumper
import ctypes
from ctypes import wintypes

k32 = ctypes.windll.kernel32
psapi = ctypes.windll.psapi
ntdll = ctypes.windll.ntdll

PROCESS_VM_READ = 0x0010
PROCESS_QUERY_INFORMATION = 0x0400
PROCESS_DUP_HANDLE = 0x0040

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

MEM_COMMIT = 0x1000
PAGE_NOACCESS = 0x01
PAGE_GUARD = 0x100

k32.OpenProcess.restype = wintypes.HANDLE
k32.OpenProcess.argtypes = [wintypes.DWORD, wintypes.BOOL, wintypes.DWORD]
k32.ReadProcessMemory.argtypes = [wintypes.HANDLE, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_size_t, ctypes.POINTER(ctypes.c_size_t)]
k32.VirtualQueryEx.argtypes = [wintypes.HANDLE, ctypes.c_void_p, ctypes.POINTER(MEMORY_BASIC_INFORMATION64), ctypes.c_size_t]


def dump_process(pid, tag):
    """Dump readable committed memory of pid; returns list of dumped regions."""
    h = k32.OpenProcess(PROCESS_VM_READ | PROCESS_QUERY_INFORMATION, False, pid)
    if not h:
        print(f"[!] OpenProcess({pid}) failed: {ctypes.GetLastError()}")
        return []
    regions = []
    addr = 0
    mbi = MEMORY_BASIC_INFORMATION64()
    total = 0
    while addr < 0x7FFFFFFF0000:
        if k32.VirtualQueryEx(h, ctypes.c_void_p(addr), ctypes.byref(mbi), ctypes.sizeof(mbi)) == 0:
            addr = (addr + 0x1000) if addr < 0x7FFFFFFFFFFF else 0x7FFFFFFF0000
            if addr >= 0x7FFFFFFF0000:
                break
            continue
        if (mbi.State == MEM_COMMIT and mbi.Protect not in (PAGE_NOACCESS,)
                and not (mbi.Protect & PAGE_GUARD)):
            size = min(mbi.RegionSize, 64 * 1024 * 1024)
            buf = ctypes.create_string_buffer(int(size))
            got = ctypes.c_size_t(0)
            if k32.ReadProcessMemory(h, ctypes.c_void_p(mbi.BaseAddress), buf, size, ctypes.byref(got)):
                if got.value:
                    fn = os.path.join(DUMPDIR, f"pid{pid}_{tag}_0x{mbi.BaseAddress:X}_0x{got.value:X}.bin")
                    with open(fn, "wb") as f:
                        f.write(buf.raw[: got.value])
                    regions.append({"base": hex(mbi.BaseAddress), "size": got.value,
                                    "protect": hex(mbi.Protect), "type": mbi.Type, "file": fn})
                    total += got.value
        addr = mbi.BaseAddress + mbi.RegionSize
    k32.CloseHandle(h)
    print(f"[+] dumped pid {pid} ({tag}): {len(regions)} regions, {total/1024:.0f} KiB")
    return regions


# ------------------------------------------------------------------- main flow
watcher = ProcWatcher()
watcher.start()

print(f"[*] spawning under ConPTY: {BIN}")
proc = PtyProcess.spawn(BIN)

output = ""
prompt_seen = False
readbuf = []

def _reader():
    while proc.isalive():
        try:
            chunk = proc.read()
            if chunk:
                readbuf.append(chunk)
        except Exception:
            break

reader_thread = threading.Thread(target=_reader, daemon=True)
reader_thread.start()

deadline = time.time() + 20
while time.time() < deadline:
    output = "".join(readbuf)
    if "Password" in output:
        prompt_seen = True
        break
    if not proc.isalive():
        break
    time.sleep(0.3)
    print(".", end="", flush=True)
print()
print(output, end="", flush=True)

report["console_output_pre_input"] = output

# give masqueraded child a moment to appear, then dump every masqueraded process
time.sleep(2.0)
dumped = {}
for _ in range(3):
    for e in watcher.masqueraded():
        pid = e["pid"]
        if pid not in dumped:
            try:
                regs = dump_process(pid, "prompt")
                dumped[pid] = regs
                report["dumps"].append({"pid": pid, "exe": e["exe"], "regions": len(regs)})
            except Exception as ex:
                print(f"[!] dump failed for {pid}: {ex}")
    time.sleep(1.0)

report["children"] = watcher.masqueraded()

# feed the password
if prompt_seen:
    print(f"\n[*] feeding password: {PWD_INPUT!r}")
    try:
        proc.write(PWD_INPUT + "\r")
    except Exception as ex:
        print(f"[!] write failed: {ex}")
    # wait for the verdict to appear in output
    deadline = time.time() + 30
    while time.time() < deadline:
        output = "".join(readbuf)
        if proc.isalive() is False:
            break
        if "DENIED" in output or "NICE" in output or "Flag" in output or "flag" in output:
            break
        time.sleep(0.5)
    # extra drain
    time.sleep(2.0)
    output = "".join(readbuf)
    print(output, end="", flush=True)

report["console_output_full"] = output

# post-input dump (pipeline state may differ)
for e in watcher.masqueraded():
    pid = e["pid"]
    try:
        regs = dump_process(pid, "after_input")
        report["dumps"].append({"pid": pid, "phase": "after_input", "regions": len(regs)})
    except Exception as ex:
        print(f"[!] post dump failed: {pid} {ex}")

watcher.stop()

# terminate leftovers
for e in watcher.masqueraded():
    try:
        p = psutil.Process(e["pid"])
        p.kill()
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
