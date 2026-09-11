# Emulator suite — HYDRA (MCM 7)

Bit-exact Unicorn emulation of the original (unpacked) program, reconstructed
from CI memory dumps.

## Requirements

```bash
pip install unicorn capstone
```

The dump files (`pid8140_prompt_*.bin`) must be present under
`../../evidence/dumps/` (fetch the `dynamic-evidence` artifact from the
"Dynamic Analysis" workflow) and the reconstructed image at
`../../evidence/original_image.bin` (or regenerate with
`../analysis/rebuild_image.py`).

## Files

| File | Purpose |
|---|---|
| `emu5.py` | Identity-mapped full-program emulator: maps every dumped region at its original VA, provides a synthetic PEB/kernel32 (FNV-hash export resolution), deterministic rdtsc, libc stubs. Entry: the `cin >> password` sequence at RVA 0x2CF06. |
| `emu_keytable.py` | Standalone harness for the key_table builder (0x22BC0) and the check function. |
| `vm_test.py` | Harness for the custom VM (0x1DBF0) — validated: `VM(blob2, 0) = 0x32CD000005A5`. |

## Validated results

```bash
python3 emu_keytable.py
# build_key_table("AAAA", 0, 0x12345678) -> 512-byte key_table

python3 vm_test.py
# VM(blob2, seed=0) -> rax = 0x32CD000005A5
```

## Extending toward the password

1. Hook the UD2 raisers (`0x3619C` family) and emulate the parent-side
   ecall handler (derivation at 0x1238E..0x1255A) to complete `arg3`.
2. Feed the candidate password via `run_from_input()`.
3. `CHECK_CALLS` captures the exact `check()` arguments; `OUTPUT_LOG`
   captures the program's console output (verdict).
