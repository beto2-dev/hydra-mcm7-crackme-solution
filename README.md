# HYDRA (MCM 7) — Full Reverse Engineering Solution

> Solved-in-progress by **beto2-dev**

Complete static + dynamic reverse engineering writeup and solution for
**CrackNotMe's /\ Hydra \/ (MCM 7)** crackme hosted on
[crackmes.one](https://crackmes.one/crackme/69cfbdb6110488a320542667).

Challenge details:

| Property | Value |
|---|---|
| Author | CrackNotMe |
| Language | C/C++ |
| Platform | Windows x86-64 |
| Difficulty | 4.3 / 6.0 |
| Goal | Find the original valid password (keygen strongly encouraged, patching forbidden) |
| SHA-256 | `7fe04b2c7edda31b41ea0a444e456503926aef20b6387ee8393ed48d866a3294` |

## Repository layout

```
binaries/   Original crackme (password-protected zip from crackmes.one + extracted PE)
tools/      Analysis tooling executed on native Windows via GitHub Actions
            (pty_harness, run_recon, verify_password = the password oracle)
solution/   WRITEUP.md (full technical deep-dive), emulator suite, analysis scripts
evidence/   Reconstructed unpacked program, memory dumps, disassemblies,
            CI reports
```

## Progress

| Phase | Status |
|---|---|
| Recon (behavior on native Windows) | done |
| Unpacking (original image reconstructed from runtime dumps) | done |
| Static analysis (full pipeline disassembly) | done |
| Dynamic analysis (memory dumps, identity-mapped emulation) | done |
| Key-table builder + custom VM bit-exact emulation | done (validated) |
| Deterministic seed recovery (`0x45523F21` on clean bare metal) | done |
| Trap/decoy map (dead lengths 8/12/27/29, table sabotage) | done |
| Ecall (parent↔child UD2) protocol | mapped, emulation pending |
| Password recovery | in progress — see `solution/WRITEUP.md §12` |
| CI verification oracle (`NICE!` = correct password) | ready (`verify.yml`) |

## Quick start

```bash
# 1. reconstruct the original unpacked program from the memory dumps
python3 solution/analysis/rebuild_image.py

# 2. run the bit-exact emulators (needs: pip install unicorn capstone)
python3 solution/emulator/vm_test.py        # VM(blob2, 0) -> 0x32CD000005A5
python3 solution/emulator/emu_keytable.py   # key_table builder

# 3. password oracle on a real Windows box (or the verify workflow)
python tools/verify_password.py "<candidate>" binaries/CrackMe_packed.exe
```

The full technical story — packer, masquerade, parent-child debug protocol,
anti-tamper, the custom VM, the crypto pipeline and the recovered seed — is in
**[solution/WRITEUP.md](solution/WRITEUP.md)**.

## License / Credits

- Original crackme by **CrackNotMe** (crackmes.one), used for educational
  reverse-engineering practice.
- Solution, tooling and writeup by **beto2-dev**.
