#!/usr/bin/env python3
"""
Behavior reconnaissance for CrackNotMe's HYDRA (MCM 7) crackme.

Runs the target with controlled inputs on native Windows, captures:
  - stdout / stderr / exit code
  - child process creation events (name, pid, ppid, exe path, cmdline)
  - timing

Writes a JSON report used as CI evidence.
"""
import json
import os
import subprocess
import sys
import threading
import time
import io

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
sys.stderr.reconfigure(encoding="utf-8", errors="replace")

BIN = os.path.abspath(sys.argv[1]) if len(sys.argv) > 1 else "binaries/CrackMe_packed.exe"
OUT = os.path.abspath(sys.argv[2]) if len(sys.argv) > 2 else "evidence/recon_report.json"
os.makedirs(os.path.dirname(OUT), exist_ok=True)

try:
    import psutil
except ImportError:
    subprocess.check_call([sys.executable, "-m", "pip", "install", "-q", "psutil"])
    import psutil

report = {"binary": BIN, "binary_sha256": None, "tests": [], "env": {}}

import hashlib
with open(BIN, "rb") as f:
    report["binary_sha256"] = hashlib.sha256(f.read()).hexdigest()

report["env"]["os"] = f"{sys.platform}"
report["env"]["cwd"] = os.getcwd()
report["env"]["computername"] = os.environ.get("COMPUTERNAME", "?")
report["env"]["username"] = os.environ.get("USERNAME", "?")


class ProcWatcher(threading.Thread):
    """Poll the process table and record new processes while a test runs."""

    def __init__(self):
        super().__init__(daemon=True)
        self.events = []
        self.known = {p.pid for p in psutil.process_iter()}
        self._stop = threading.Event()

    def run(self):
        while not self._stop.is_set():
            try:
                for p in psutil.process_iter(attrs=["pid", "ppid", "name", "exe", "cmdline", "create_time"]):
                    if p.pid in self.known:
                        continue
                    self.known.add(p.pid)
                    try:
                        info = p.info
                        self.events.append({
                            "pid": info["pid"],
                            "ppid": info["ppid"],
                            "name": info["name"],
                            "exe": info["exe"],
                            "cmdline": (info["cmdline"] or [])[:8],
                            "create_time": info["create_time"],
                        })
                    except (psutil.NoSuchProcess, psutil.AccessDenied):
                        pass
            except Exception:
                pass
            time.sleep(0.15)

    def stop(self):
        self._stop.set()
        self.join(timeout=2)


def run_case(name, feed, timeout=45):
    print(f"\n=== TEST: {name} (input={feed!r}) ===", flush=True)
    watcher = ProcWatcher()
    watcher.start()
    t0 = time.time()
    proc = subprocess.Popen(
        [BIN],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        cwd=os.path.dirname(BIN),
    )
    out, err = b"", b""
    try:
        try:
            out, err = proc.communicate(input=feed, timeout=timeout)
        except subprocess.TimeoutExpired:
            proc.kill()
            out, err = proc.communicate()
            print(f"[!] TIMEOUT after {timeout}s (process kept running)")
    finally:
        watcher.stop()
    elapsed = round(time.time() - t0, 2)
    rec = {
        "name": name,
        "input": feed.decode("latin1") if isinstance(feed, bytes) else feed,
        "exit_code": proc.returncode,
        "elapsed_s": elapsed,
        "stdout": out.decode("latin1"),
        "stderr": err.decode("latin1"),
        "new_processes": watcher.events,
    }
    report["tests"].append(rec)
    print(f"--- exit={proc.returncode} in {elapsed}s ---")
    print(f"--- stdout ---\n{out.decode('latin1')[:4000]}")
    print(f"--- stderr ---\n{err.decode('latin1')[:4000]}")
    interesting = [e for e in watcher.events if e["name"] and e["name"].lower() != "conhost.exe"]
    if interesting:
        print("--- new processes (non-conhost) ---")
        for e in interesting:
            print(f"  pid={e['pid']} ppid={e['ppid']} name={e['name']} exe={e['exe']} cmd={' '.join(e['cmdline'][:4])}")
    return rec


# ---- cases ----
run_case("no_input_eof", b"")
run_case("empty_line", b"\r\n")
run_case("short_wrong", b"AAAA\r\n")
run_case("long_wrong", b"A" * 64 + b"\r\n")

with open(OUT, "w", encoding="utf-8") as f:
    json.dump(report, f, indent=2)
print(f"\n[+] report written to {OUT}")
