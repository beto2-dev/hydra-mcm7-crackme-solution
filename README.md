# HYDRA (MCM 7) — Full Reverse Engineering Solution

> **SOLVED 100%** by **beto2-dev** — typable passwords found that the real
> binary accepts (it prints its flag). See the [final answer](#final-answer).

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
| Ecall (parent↔child UD2) protocol | mapped (values are deterministic constants) |
| Exact check() arguments (arg2..arg5, all machine-independent) | done (§14) |
| **Algebraic keygen (password preimage for a chosen flag)** | **done — accepted by the emulated binary** |
| Pure-C pipeline (kt + VM + verdict) bit-exact with the emulator | done (fuzz + selftest) |
| Console-typable password search (AVX2, 32-bit FNV condition) | done — 2^32 counters swept, 2 hits |
| Gold verification (Unicorn, real check() code) | done — both hits verdict=1 |
| **Real-binary oracle (Windows runner)** | **done — flag printed, 30/30 spawns** |

## Final answer

The real binary **accepts** these typable passwords (16 chars, delivered as
the console token; the reader NUL-pads them to the 64-byte string the KSA
consumes) and prints its flag instead of `ACCESS DENIED`:

```
HydraKey13c5228a   -> flag bytes (hex): 5419a9edc46a7f9881c7b6ac05b5043786f10cd30d1271769cc449fa
HydraKey4397e1f5   -> flag bytes (hex): cbdc87ce859428444707ab1bdf4901699d0c98bb8eb3229fbb49ec1e
```

Full details and the verification chain: `solution/WRITEUP.md` §12-13.

## The keygen

```bash
# 1. build
cd solution/keygen
gcc -O2 -o hydra_selftest hydra_selftest.c hydra_core.c hydra_vm.c hydra_data.c -I.
gcc -O2 -o keygen        keygen.c        hydra_core.c hydra_vm.c hydra_data.c -I.

# 2. self-test (VM fuzz vs emulator corpus, kt vs emulator, KSA round-trip)
./hydra_selftest ../emulator/probes

# 3. generate a password for a flag of your choosing (1024 raw bytes;
#    the binary prints the flag on bare metal / NICE! in a VM)
./keygen ../emulator/probes 0x21
# -> forward check: FNV=8eda89a9 ... KEYGEN VALID

# 4. gold verification: the REAL check() code on the generated password
cd ../emulator
python3 verify_keygen_gold.py ../keygen/keygen_password.bin
# -> VERDICT: ACCEPTED, check_buf = 'MCM7{Full_Algebraic_Keygen!}'
```

The generated password is 1024 raw bytes (the keygen inverts the whole
chain, and the inversion naturally lands there). For a password a human
can type, run the AVX2 search instead — the check is a 32-bit FNV
condition, so a typable password exists and `hydra_search_avx2` finds it
at ~8.4k passwords/s/core.

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
