#!/usr/bin/env python3
"""
HYDRA MCM 7 — the algebraic keygen (linear inversion of the full pipeline).

Given the exact machine args, constructs a password P such that check(P) passes:
  1. framing: choose r11, check_buf[32:63], the VM program (all-zero dwords)
  2. pin kt[0:64] from the framing; free value_r's for r>=64
  3. solve the 512x512 linear system (A^-1 mod 65537) for state32
  4. fixed-point on kt[511] to hit FNV(kt[0:512]) == the value implied by r11
  5. invert the 48-round KSA -> K -> password = K ^ base (1024 bytes)

The password bytes are unconstrained by the console charset (documented limitation:
the final typeability filter is a 2^32-class search — see WRITEUP).
"""
import struct
import numpy as np
import pickle
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import hydra_py as H
import hydra_ref

P = 65537
FNV_P = 0x1000193

# ---------------------------------------------------------------- machine args (CI)
ARG2 = 0x00000000
ARG3 = 0x748EEAA66AF7BDA9
ARG4 = 0x029DF32308AAD1F6
ARG5 = 0x8153F691
SEED = ARG2 ^ ARG5

# ---------------------------------------------------------------- load pieces
scratch = open(os.path.join(HERE, "scratch_seed.bin"), "rb").read()
A = np.frombuffer(scratch[:0x100000], dtype="<u4").astype(np.int64).reshape(512, 512) % P


def gm(x):
    x = x & 0xFFFFFFFF
    q = ((0xFFFF0001 * x) & 0xFFFFFFFFFFFFFFFF) >> 48
    return (x - q * 0x10001) & 0xFFFFFFFF


def fnv1a_bytes(data, basis=0x811C9DC5):
    h = basis
    for b in data:
        h = ((h ^ b) * FNV_P) & 0xFFFFFFFF
    return h


FNV_P_INV = pow(FNV_P, 2**32 - 1, 2**32)  # multiplicative inverse mod 2^32
G_INV = pow(H.GOLDEN, 2**32 - 1, 2**32)


def solve():
    print("[*] building A^-1 mod 65537 ...")
    n = 512
    M = np.concatenate([A.copy(), np.eye(n, dtype=np.int64)], axis=1)
    for c in range(n):
        piv = None
        for r in range(c, n):
            if M[r, c] % P:
                piv = r
                break
        if piv is None:
            print("    matrix singular at col", c)
            return None
        if piv != c:
            M[[c, piv]] = M[[piv, c]]
        inv = pow(int(M[c, c]) % P, P - 2, P)
        M[c] = (M[c] * inv) % P
        col = M[:, c].copy()
        col[c] = 0
        for r in np.nonzero(col)[0]:
            M[r] = (M[r] - col[r] * M[c]) % P
    Ainv = M[:, n:]
    print("    done")

    # ---------------- framing
    # VM program: 32 zero bytes => kt[0:32] = blob1 ^ argbytes ^ 0
    argb = bytearray(32)
    for i in range(32):
        argb[i] = ((ARG3 >> ((i & 7) * 8)) ^ (ARG4 >> ((i & 7) * 8))) & 0xFF
    kt_low32 = bytes(a ^ b for a, b in zip(H.BLOB1, argb))   # pt=0 => kt = blob1 ^ argbytes

    r11 = 0x00000000           # t=0, rot=[0,0,0,0]
    t = r11 & 3
    rot = bytes(((r11 >> ((j & 3) * 8)) & 0xFF) for j in range(64))
    t64 = H.T64[t * 64:(t + 1) * 64]

    # check_buf[0:32] determined by kt_low32
    check_buf = bytearray(64)
    for j in range(32):
        check_buf[j] = kt_low32[j] ^ t64[j] ^ rot[j]
    # check_buf[32:60] free — ASCII filler; [60:64] = FNV-solving suffix via MITM
    import itertools, random as _rnd
    _rnd.seed(0xC0FFEE)
    kt = bytearray(512)
    sol = None
    for attempt in range(64):
        filler = bytes(_rnd.randrange(0x41, 0x5B) for _ in range(28))
        for j in range(28):
            check_buf[32 + j] = filler[j]
        for j in range(64):
            kt[j] = check_buf[j] ^ t64[j] ^ rot[j]
        h60 = fnv1a_bytes(bytes(check_buf[:60]))
        tgt = H.TARGET_FVN
        fwd = {}
        for b60 in range(256):
            h61 = ((h60 ^ b60) * FNV_P) & 0xFFFFFFFF
            for b61 in range(256):
                h62 = ((h61 ^ b61) * FNV_P) & 0xFFFFFFFF
                fwd.setdefault(h62, []).append((b60, b61))
        for b63 in range(256):
            h63 = ((tgt * FNV_P_INV) ^ b63) & 0xFFFFFFFF
            for b62 in range(256):
                h62 = ((h63 * FNV_P_INV) & 0xFFFFFFFF) ^ b62
                if h62 in fwd:
                    for (b60, b61) in fwd[h62]:
                        cb = bytes(check_buf[:60]) + bytes([b60, b61, b62, b63])
                        if fnv1a_bytes(cb) == tgt:
                            sol = (b60, b61, b62, b63)
                            break
                    if sol:
                        break
            if sol:
                break
        if sol:
            print(f"[*] MITM hit on attempt {attempt}: suffix {[hex(x) for x in sol]}")
            break
    if sol is None:
        print("[!] MITM found no 4-byte suffix after 64 attempts")
        return None
    for i, v in enumerate(sol):
        check_buf[60 + i] = v
        kt[60 + i] = v ^ t64[60 + i] ^ rot[60 + i]
    assert fnv1a_bytes(bytes(check_buf)) == H.TARGET_FVN, "check_buf FNV framing failed"
    print(f"[*] check_buf framing OK (FNV == 0x{H.TARGET_FVN:08X})")

    # verify kt[0:32] consistency with the zero program
    assert bytes(kt[:32]) == bytes(kt_low32), "framing mismatch"


    # obf per round
    rr = np.arange(512)
    obf = (((rr >> 2) & 0xFF) ^ ((((1 - rr) & 0xFF) * 0x3B) & 0xFF)).astype(np.int64)

    # vm_out for the zero program with the actual vm_seed
    vm_seed = fnv1a_bytes(kt[0:4]) ^ H.POLY_X
    print(f"[*] vm_seed = {hex(vm_seed)}")
    # VM(zeros, vm_seed) returns 0 (validated); use 0.
    vm_out = 0

    # r11 implied FNV target for FNV(kt[0:512])
    fnv_kt_target = (((r11 - H.E_X) & 0xFFFFFFFF) ^ H.PI_X)
    fnv_kt_target = (fnv_kt_target * G_INV) & 0xFFFFFFFF
    fnv_kt_target ^= (vm_out & 0xFFFFFFFF)
    print(f"[*] FNV(kt) target = {hex(fnv_kt_target)}")

    # check_buf[63] is part of the MITM suffix now

    # ---------------- value_r's
    # r < 64: value = low byte (k=0 choice)
    # r in [64,511): value = 0
    # r = 511: fixed-point candidate b
    CONST = H.CONST32

    def build_acc(value):
        acc = np.zeros(512, dtype=np.int64)
        for r in range(64):
            acc[r] = (CONST[r] + 0x10001 - value[r]) % P
        for r in range(64, 512):
            acc[r] = (CONST[r] + 0x10001 - value[r]) % P
        return acc

    base_value = np.zeros(512, dtype=np.int64)
    for r in range(64):
        base_value[r] = kt[r] ^ obf[r]

    # MITM on kt[508:512] so FNV(kt[0:512]) == fnv_kt_target EXACTLY
    print("[*] MITM on kt[508:512] for FNV(kt) ...")
    found = None
    for attempt in range(32):
        # free-round base values for r in [64,508): attempt-dependent perturbation
        free_base = np.zeros(512, dtype=np.int64)
        free_base[:64] = base_value[:64]
        if attempt:
            for j in range(min(attempt, 400)):
                free_base[64 + j * 7 % 444] = (attempt * 131 + j * 17) & 0xFFFF
        kt_pre = bytearray(512)
        for r in range(64):
            kt_pre[r] = kt[r]
        for r in range(64, 508):
            kt_pre[r] = (free_base[r] ^ obf[r]) & 0xFF
        h507 = fnv1a_bytes(bytes(kt_pre[:508]))
        tgt = fnv_kt_target
        fwd = {}
        for b0 in range(256):
            h1 = ((h507 ^ b0) * FNV_P) & 0xFFFFFFFF
            for b1 in range(256):
                h2 = ((h1 ^ b1) * FNV_P) & 0xFFFFFFFF
                fwd.setdefault(h2, []).append((b0, b1))
        for b3 in range(256):
            h3 = ((tgt * FNV_P_INV) ^ b3) & 0xFFFFFFFF
            for b2 in range(256):
                h2 = ((h3 * FNV_P_INV) & 0xFFFFFFFF) ^ b2
                if h2 in fwd:
                    for (b0, b1) in fwd[h2]:
                        cand = bytes(kt_pre[:508]) + bytes([b0, b1, b2, b3])
                        if fnv1a_bytes(cand) == tgt:
                            value = free_base.copy()
                            value[508] = b0 ^ obf[508]
                            value[509] = b1 ^ obf[509]
                            value[510] = b2 ^ obf[510]
                            value[511] = b3 ^ obf[511]
                            acc = build_acc(value)
                            state32 = (Ainv @ acc) % P
                            found = (value, state32, cand)
                            break
                    if found:
                        break
            if found:
                break
        if found:
            print(f"    hit on attempt {attempt}: kt[508:512] = {cand[508:512].hex()}")
            break
    if found is None:
        print("[!] FNV(kt) MITM NOT FOUND")
        return None

    value, state32, kt_final = found
    kt_final = bytearray(kt_final)

    # constraints on state32: each word < 65536 (pack-able)
    if (state32 >= 0x10000).any():
        bad = np.nonzero(state32 >= 0x10000)[0]
        print(f"[!] {len(bad)} state32 words == 65536 (unpackable) — needs re-roll")
        return None

    # ---------------- forward validation
    print("[*] forward validation (bit-exact pipeline) ...")
    state = H.ksa_unpack(state32)
    st_check = H.ksa_forward_bytes(state) if hasattr(H, "ksa_forward_bytes") else None
    kt_fwd = H.build_kt_bytes(scratch, state32)
    ok = bytes(kt_fwd) == kt_final
    print(f"    forward kt == intended kt: {ok}")
    if not ok:
        diff = [i for i in range(512) if kt_fwd[i] != kt_final[i]]
        print(f"    {len(diff)} differing bytes (first: {diff[:8]})")
        # fall back: use the FORWARD kt as the real one and verify the verdict end-to-end
        return None

    # ---------------- password
    K = H.ksa_inverse(state)
    base = ((np.arange(1024) & 0xFF) * 0x37 - 0x55) & 0xFF
    pwd = (K ^ base.astype(np.uint8)).tobytes()
    print(f"[*] password (1024 bytes): {pwd[:48].hex()}...")

    # typeability report
    bad_bytes = [i for i, c in enumerate(pwd) if not (0x21 <= c <= 0x7E)]
    print(f"    printable-safe bytes: {1024 - len(bad_bytes)}/1024")

    return pwd, kt_final, state32


def full_check_pwd(pwd):
    """Pure-Python full check() with the real args."""
    state = H.ksa_forward(pwd)
    state32 = H.ksa_pack(state)
    kt = H.build_kt_bytes(scratch, state32)
    blob_pt = H.blob_decrypt(bytes(kt), ARG3, ARG4)
    vs = H.vm_seed_of(bytes(kt))
    # VM on the zero program: if blob_pt == zeros -> vm_out = 0
    vm_out = 0 if blob_pt == bytes(32) else None
    if vm_out is None:
        # run via emulator
        ref = hydra_ref.HydraRef()
        rax, _, _ = ref.vm(blob_pt, vs)
        vm_out = rax
    r11 = H.r11_of(bytes(kt), vm_out)
    cb = H.check_buf_of(bytes(kt), r11)
    return {
        "kt": bytes(kt), "blob_pt": blob_pt, "vm_seed": vs, "vm_out": vm_out,
        "r11": r11, "check_buf": cb, "verdict": H.verdict(cb),
        "fnv_check": hex(H.fnv1a(cb)),
    }


if __name__ == "__main__":
    res = solve()
    if res:
        pwd, kt_final, state32 = res
        print("\n[*] full offline check of the generated password:")
        r = full_check_pwd(pwd)
        print(f"    r11        = {hex(r['r11'])}")
        print(f"    vm_seed    = {hex(r['vm_seed'])}")
        print(f"    vm_out     = {hex(r['vm_out'])}")
        print(f"    check_buf  = {r['check_buf'][:32].hex()}...")
        print(f"    FNV(cb)    = {r['fnv_check']} (target {hex(H.TARGET_FVN)})")
        print(f"    VERDICT    = {'PASS' if r['verdict'] else 'FAIL'}")
        if r["verdict"]:
            open(os.path.join(HERE, "password_keygen.bin"), "wb").write(pwd)
            print("\n[+] SAVED password_keygen.bin (1024 bytes)")
