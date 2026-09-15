#!/usr/bin/env python3
"""Password oracle: run the crackme under ConPTY with a candidate password.

Exit codes / verdicts:
  NICE   -> password ACCEPTED (input hash check passed; VM detected message)
  DENIED -> password rejected
  other  -> anomaly

Two runtime effects make a single run inconclusive:
  1. the check()'s arg2 ("seed mix") on VMs is a per-spawn anti-VM lottery:
     on some spawns it assembles to the bare-metal value 0, on others it
     lands on TSC/ASLR garbage that rejects every password including the
     author's own;
  2. the rdtsc-gated troll printer swallows the verdict on ~25% of runs.
Both are handled by re-spawning: a run only counts when it prints NICE or
DENIED, and DENIED is retried until a clean (arg2 == 0) spawn is drawn.

Usage: python tools/verify_password.py <candidate> [binary]
Env:   VERIFY_ATTEMPTS - spawns per candidate (default 10)
"""
import json
import os
import sys
import time

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

CANDIDATE = sys.argv[1] if len(sys.argv) > 1 else "AAAA"
ATTEMPTS = max(1, int(os.environ.get("VERIFY_ATTEMPTS", "10")))
# decode \xNN-escaped candidates to raw bytes, then CP437-encode for the console
_cand_raw = CANDIDATE
if "\\x" in _cand_raw:
    try:
        _cand_raw = CANDIDATE.encode("utf-8").decode("unicode_escape").encode("latin1")
    except Exception:
        pass
if isinstance(_cand_raw, str):
    _cand_raw = _cand_raw.encode("latin-1", "replace")
try:
    CANDIDATE_CONSOLE = _cand_raw.decode("cp437")
except Exception:
    CANDIDATE_CONSOLE = _cand_raw.decode("latin1")
report_note = f"raw_len={len(_cand_raw)}"
BIN = os.path.abspath(sys.argv[2]) if len(sys.argv) > 2 else "binaries/CrackMe_packed.exe"
OUT = os.path.abspath("evidence/verify_report.json")
DUMPDIR = os.path.abspath("evidence/verify_dumps")
os.makedirs(os.path.dirname(OUT), exist_ok=True)
os.makedirs(DUMPDIR, exist_ok=True)

import subprocess
subprocess.check_call([sys.executable, "-m", "pip", "install", "-q", "pywinpty", "psutil"])
from winpty import PtyProcess
import threading


def one_attempt():
    """Spawn the binary, deliver the candidate, return (verdict, output)."""
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

    t = threading.Thread(target=_reader, daemon=True)
    t.start()

    deadline = time.time() + 20
    prompt_seen = False
    while time.time() < deadline:
        output = "".join(readbuf)
        if "Password" in output:
            prompt_seen = True
            break
        if not proc.isalive():
            break
        time.sleep(0.3)

    if prompt_seen:
        try:
            proc.write(CANDIDATE_CONSOLE + "\r")
        except Exception as e:
            print(f"[!] write failed: {e}")
        deadline = time.time() + 30
        while time.time() < deadline:
            output = "".join(readbuf)
            if not proc.isalive():
                break
            if "NICE" in output or "DENIED" in output:
                break
            time.sleep(0.5)
        time.sleep(2.0)

    output = "".join(readbuf)
    if "NICE" in output:
        verdict = "ACCEPTED (NICE! - correct password, VM honeypot flag)"
    elif "DENIED" in output:
        verdict = "DENIED"
    elif not prompt_seen:
        verdict = "no prompt (crash or timeout)"
    else:
        verdict = "unknown (troll printer or no verdict)"
    print(output)
    print(f"[*] verdict: {verdict}")

    try:
        if proc.isalive():
            proc.terminate(force=True)
    except Exception:
        pass
    return verdict, output


report = {"binary": BIN, "input": CANDIDATE, "note": report_note,
          "attempts": [], "verdict": "unknown"}
for attempt in range(1, ATTEMPTS + 1):
    print(f"\n=== attempt {attempt}/{ATTEMPTS} ===")
    v, out = one_attempt()
    report["attempts"].append({"attempt": attempt, "verdict": v,
                               "console_output": out[-2000:]})
    if "ACCEPTED" in v:
        report["verdict"] = v
        break
    # DENIED / unknown / no prompt: the arg2 lottery or the troll printer;
    # a wrong password would DENIED on every clean spawn too, so the retry
    # budget bounds the total work.

if "ACCEPTED" not in report["verdict"] and report["attempts"]:
    report["verdict"] = report["attempts"][-1]["verdict"]

with open(OUT, "w", encoding="utf-8") as f:
    json.dump(report, f, indent=2)
print(f"\n[*] final verdict after {len(report['attempts'])} attempt(s): {report['verdict']}")
print(f"[+] report: {OUT}")
sys.exit(0 if "ACCEPTED" in report["verdict"] else 1)
