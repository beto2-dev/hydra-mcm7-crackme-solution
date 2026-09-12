# HYDRA MCM 7 — algebraic keygen (full pipeline inversion)

## Status: SOLVED (offline) — password passes the complete check()

`hydra_solve.py` inverts the entire validation pipeline:

1. **framing** — choose r11=0 (t=0, rot=0), a 32-byte all-zero VM program
   (blob1_pt = blob1 ^ kt[0:32] ^ argbytes => kt[0:32] pinned), an ASCII
   filler for check_buf[32:60]
2. **check_buf suffix** — solve check_buf[60:64] by FNV MITM (2x2^16) so
   FNV1a(check_buf) == 0x8EDA89A9
3. **linear system** — kt[r] = ((const32[r] - acc_r) mod 65537 ^ obf_r)&0xFF with
   acc_r = sum_i A[r][i]*state32[i] (mod 65537); A = the DRBG scratch matrix.
   Gaussian elimination gives A^-1 mod 65537 -> state32 from any target kt
4. **FNV(kt) MITM** — solve kt[508:512] (2x2^16 MITM) so FNV1a(kt[0:512])
   equals the value implied by r11 (r11 = ((FNV^vm_out)*G ^ pi + e))
5. **KSA inversion** — invert the 48 rounds (scatter/S-box/bitslice/LCG) to get
   K, then password = K ^ base (1024 bytes)

## Validated bit-exact against the Unicorn reference
- KSA forward/inverse: matches emulated code byte-for-byte
- poly-mul + GM reduction: matches emulated build_key_table
- VM: matches (VM(blob2,0)=0x32CD000005A5; zero program returns 0)
- the generated password passes the full offline check: FNV(check_buf) == 0x8EDA89A9

## The remaining gap: console delivery
The 1024-byte password contains ~21 whitespace + 10 NUL bytes (random).
The binary reads a whitespace-delimited token, so the password must avoid
{0x09-0x0D, 0x20} in all 1024 bytes: probability (250/256)^1024 = 2^-35.7 per
keygen re-roll. A C-optimized re-roll loop (~2ms/roll) needs ~3 years; the
practical paths are a CP-SAT encoding of the 48-round KSA preimage with the
whitespace constraints, or a 2^32 forward search with an AVX2 oracle
(see hydra_search_avx2.c). Everything else is done: args captured, pipeline
inverted, offline verdict reproduced.

## Files
- hydra_py.py — pure-Python (numpy) pipeline: KSA fwd/inv, poly-mul, verdict
- hydra_ref.py — Unicorn reference (bit-exact ground truth)
- hydra_solve.py — the solver (produces password_keygen.bin)
- scratch_seed.bin — DRBG output for seed 0x8153F691 (1 MiB)
- scratch_12345678.bin — reference DRBG output for validation
- ksa_tables.pkl / bitslice_matrix.pkl — extracted fixed tables
- password_keygen.bin — the generated 1024-byte password (offline PASS)
