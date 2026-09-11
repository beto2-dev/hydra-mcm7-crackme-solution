# HYDRA (MCM 7) — Full Reverse Engineering Solution

> Solved by **beto2-dev**

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
solution/   Solver / keygen + full technical explanation
evidence/   Runtime evidence captured in CI (reports, dumps, traces)
```

## Work in progress

This repository is a living writeup. The analysis pipeline:

1. **[Recon]** Run the target on native Windows (GitHub Actions runners) with
   controlled inputs; capture stdout, exit codes, spawned (masqueraded) child
   processes.
2. **[Static]** Disassembly and decompilation of the (heavily obfuscated) image.
3. **[Dynamic]** Runtime memory inspection and pipeline tracing.
4. **[Solve]** Recover the original password and produce a keygen.
5. **[Verify]** CI proves the solution: the binary itself prints its success
   message when fed the recovered password.

See `solution/WRITEUP.md` for the full technical deep-dive.

## License / Credits

- Original crackme by **CrackNotMe** (crackmes.one), used for educational
  reverse-engineering practice.
- Solution, tooling and writeup by **beto2-dev**.
