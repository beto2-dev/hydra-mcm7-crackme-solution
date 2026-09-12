#!/usr/bin/env python3
"""
HYDRA MCM 7 — pure-Python pipeline (fast port, validated vs the Unicorn reference).

Components:
  - KSA (RC4-style 48-round shuffle) forward + INVERSE
  - poly-mul key table (forward, bit-exact GM reduction)
  - linear solver mod 65537 (Gaussian elimination over GF(65537))
  - FNV1a, blob decrypt, T64 mix, verdict
"""
import struct
import numpy as np
import pickle
import os

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = "/home/z/my-project/repo/hydra"

# ---------------------------------------------------------------- constants
BLOB1 = bytes.fromhex("0a262379e09b70bba4848fa5d5c447ef0780f9170cd8276a887106fd397e81f6")
BLOB2 = open(os.path.join(REPO, "evidence/dumps/pid8140_prompt_0x2535A128000_0x4000.bin"), "rb").read()[0xFC0:0xFC0 + 16]

with open(os.path.join(HERE, "ksa_tables.pkl"), "rb") as f:
    _t = pickle.load(f)
S_TABLE = _t["S"]                        # 256-byte permutation
W_TABLE = np.frombuffer(_t["W"], dtype="<u2").astype(np.int64)   # 1024-word permutation

with open(os.path.join(HERE, "bitslice_matrix.pkl"), "rb") as f:
    BS_COLS = pickle.load(f)             # 32 column ints (LSB-first bit numbering)

T64 = open(os.path.join(REPO, "evidence/dumps/pid8140_prompt_0x25359BD2000_0x3000.bin"), "rb").read()[0xCA0:0xCA0 + 0x100]
CONST32 = np.frombuffer(
    open(os.path.join(REPO, "evidence/dumps/pid8140_prompt_0x25359BD2000_0x3000.bin"), "rb").read()[0xDA0:0xDA0 + 0x800],
    dtype="<u4").astype(np.int64)

FNV_BASIS = 0x811C9DC5
FNV_PRIME = 0x1000193
GOLDEN = 0x9E3779B9
PI_X = 0x31415926
E_X = 0x27182818
POLY_X = 0x504F4C59
TARGET_FVN = 0x8EDA89A9
ARG4_CLEAN = 0x29DF32308AA1DF6
ARG3_C = 0x00C71BEB000001EB  # packed code bytes ^ tamper zeros


def fnv1a(data, basis=FNV_BASIS):
    h = basis
    for b in data:
        h = ((h ^ b) * FNV_PRIME) & 0xFFFFFFFF
    return h


# ---------------------------------------------------------------- bitslice (GF(2) matrix)
# Convert column ints to a 32x32 boolean matrix; build the inverse via GF(2) Gauss.
_BS_M = np.zeros((32, 32), dtype=bool)
for j, col in enumerate(BS_COLS):
    for i in range(32):
        _BS_M[i, j] = bool((col >> i) & 1)

# invert _BS_M over GF(2)
def _gf2_invert(M):
    n = M.shape[0]
    A = np.concatenate([M.copy(), np.eye(n, dtype=bool)], axis=1)
    for c in range(n):
        piv = None
        for r in range(c, n):
            if A[r, c]:
                piv = r
                break
        if piv is None:
            return None
        if piv != c:
            A[[c, piv]] = A[[piv, c]]
        for r in range(n):
            if r != c and A[r, c]:
                A[r] ^= A[c]
    return A[:, n:]

_BS_MINV = _gf2_invert(_BS_M)
assert _BS_MINV is not None, "bitslice matrix not invertible"


def bitslice_block(x):
    """Apply the GF(2) matrix to a 4-byte int (LSB-first)."""
    v = np.zeros(32, dtype=bool)
    for j in range(32):
        if (x >> j) & 1:
            v ^= _BS_M[:, j]
    r = 0
    for i in range(32):
        if v[i]:
            r |= 1 << i
    return r


def bitslice_inv_block(y):
    v = np.zeros(32, dtype=bool)
    for j in range(32):
        if (y >> j) & 1:
            v ^= _BS_MINV[:, j]
    r = 0
    for i in range(32):
        if v[i]:
            r |= 1 << i
    return r


def bitslice(state: np.ndarray):
    """Vectorized: state uint8[1024] -> transformed. 4-byte blocks, LSB-first ints."""
    v = state.view(np.uint8).reshape(256, 4)
    x = v[:, 0].astype(np.uint32) | (v[:, 1].astype(np.uint32) << 8) | (v[:, 2].astype(np.uint32) << 16) | (v[:, 3].astype(np.uint32) << 24)
    # GF(2) matvec via bit tricks: out_bit_i = parity(dot(row_i, x))
    xb = np.zeros((32, 256), dtype=bool)
    for j in range(32):
        xb[j] = (x >> j) & 1
    out = np.zeros(256, dtype=np.uint32)
    M = _BS_M
    for i in range(32):
        par = (xb & M[i][:, None]).sum(axis=0) & 1
        out |= par.astype(np.uint32) << i
    v[:, 0] = out & 0xFF
    v[:, 1] = (out >> 8) & 0xFF
    v[:, 2] = (out >> 16) & 0xFF
    v[:, 3] = (out >> 24) & 0xFF
    return v.reshape(-1)


def bitslice_inv(state: np.ndarray):
    v = state.view(np.uint8).reshape(256, 4)
    x = v[:, 0].astype(np.uint32) | (v[:, 1].astype(np.uint32) << 8) | (v[:, 2].astype(np.uint32) << 16) | (v[:, 3].astype(np.uint32) << 24)
    xb = np.zeros((32, 256), dtype=bool)
    for j in range(32):
        xb[j] = (x >> j) & 1
    out = np.zeros(256, dtype=np.uint32)
    M = _BS_MINV
    for i in range(32):
        par = (xb & M[i][:, None]).sum(axis=0) & 1
        out |= par.astype(np.uint32) << i
    v[:, 0] = out & 0xFF
    v[:, 1] = (out >> 8) & 0xFF
    v[:, 2] = (out >> 16) & 0xFF
    v[:, 3] = (out >> 24) & 0xFF
    return v.reshape(-1)


# ---------------------------------------------------------------- KSA
def ksa_round_keystream(round_):
    i = np.arange(1024, dtype=np.uint64)
    key = ((i * np.uint64(0x517CC1B7) - np.uint64(round_ * 0x61C88647 & 0xFFFFFFFF)) & np.uint64(0xFFFFFFFF)) >> np.uint64(16)
    return (key & 0xFF).astype(np.uint8)


def ksa_forward(pwd: bytes):
    """Password -> final 1024-byte state (after 48 rounds), as in the binary."""
    assert 1 <= len(pwd)
    n = len(pwd)
    idx = np.arange(1024)
    base = ((idx & 0xFF) * 0x37 - 0x55) & 0xFF
    pr = idx % n
    K = (base ^ np.frombuffer(pwd, dtype=np.uint8)[pr]).astype(np.uint8)
    state = K.copy()
    S = np.frombuffer(S_TABLE, dtype=np.uint8)
    W = W_TABLE
    for r in range(48):
        # scatter: state2[W[i]] = S[state[i]]
        v = S[state]
        state2 = np.empty(1024, dtype=np.uint8)
        state2[W] = v
        state = state2
        state = bitslice(state)
        state = state ^ ksa_round_keystream(r)
    return state


def ksa_inverse(final_state: np.ndarray):
    """Invert the 48 rounds: final state -> K (initial pwd-xored array)."""
    state = final_state.copy()
    S = np.frombuffer(S_TABLE, dtype=np.uint8)
    Sinv = np.empty(256, dtype=np.uint8)
    Sinv[S] = np.arange(256, dtype=np.uint8)
    W = W_TABLE
    for r in range(47, -1, -1):
        state = state ^ ksa_round_keystream(r)
        state = bitslice_inv(state)
        # inverse scatter: state_new[i] = Sinv[state2[W[i]]] where state2 = current
        state = Sinv[state[W]]
    return state


def ksa_pack(state):
    """state bytes -> 512 dwords (state32)."""
    v = state.reshape(512, 2)
    return (v[:, 0].astype(np.int64) | (v[:, 1].astype(np.int64) << 8))


def ksa_unpack(state32):
    v = np.empty((512, 2), dtype=np.uint8)
    v[:, 0] = state32 & 0xFF
    v[:, 1] = (state32 >> 8) & 0xFF
    return v.reshape(-1)


# ---------------------------------------------------------------- poly-mul / kt
def gm_reduce_np(x):
    """Exact GM reduction sequence (vectorized, uint64 intermediate)."""
    x = x.astype(np.uint64)
    prod = (np.uint64(0xFFFF0001) * x) & np.uint64(0xFFFFFFFFFFFFFFFF)
    q = prod >> np.uint64(48)
    r = (x & np.uint64(0xFFFFFFFF)) - q * np.uint64(0x10001)
    return (r & np.uint64(0xFFFFFFFF)).astype(np.uint64)


def build_kt_bytes(scratch: bytes, state32):
    """Forward: 1MiB DRBG scratch + state32 -> kt 512 bytes (bit-exact GM sequence)."""
    A = np.frombuffer(scratch[:0x100000], dtype="<u4").astype(np.uint64).reshape(512, 512)
    acc = np.zeros(512, dtype=np.uint64)
    st = np.array(state32, dtype=np.uint64, copy=True).reshape(-1)
    M = np.uint64(0xFFFFFFFF)
    for i in range(512):
        acc = (acc + A[:, i] * st[i]) & M
        acc = gm_reduce_np(acc)
    # kt[r] = ((const32[r] - acc + 0x10001) GM) ^ obf, low byte
    ecx = (CONST32.astype(np.uint64) + np.uint64(0x100000000) - acc + np.uint64(0x10001)) & np.uint64(0xFFFFFFFF)
    ecx = gm_reduce_np(ecx)
    r = np.arange(512, dtype=np.uint64)
    obf = ((r >> np.uint64(2)) & np.uint64(0xFF)) ^ ((((np.uint64(1) + np.uint64(0xFFFFFFFF) * np.uint64(0) + (np.uint64(0xFFFFFFFF) - r + np.uint64(1))) & np.uint64(0xFF)) * np.uint64(0x3B)) & np.uint64(0xFF))
    obf = (((np.arange(512) >> 2) & 0xFF) ^ ((((1 - np.arange(512)) % 256 * 0x3B) & 0xFF)).astype(object))
    # compute obf exactly with Python ints to avoid dtype pain
    obf_l = [(((i >> 2) & 0xFF) ^ ((((1 - i) % 256) * 0x3B) & 0xFF)) for i in range(512)]
    obf = np.array(obf_l, dtype=np.uint64)
    kt = (ecx & np.uint64(0xFF)) ^ obf
    return kt.astype(np.uint8)


def kt_matrix_inverse(scratch: bytes):
    """A = 512x512 scratch matrix over GF(65537); returns A^-1 (int64)."""
    A = np.frombuffer(scratch[:0x100000], dtype="<u4").astype(np.int64).reshape(512, 512) % 65537
    n = 512
    M = np.concatenate([A.copy(), np.eye(n, dtype=np.int64)], axis=1)
    p = 65537
    for c in range(n):
        piv = None
        for r in range(c, n):
            if M[r, c] % p:
                piv = r
                break
        if piv is None:
            return None
        if piv != c:
            M[[c, piv]] = M[[piv, c]]
        inv = pow(int(M[c, c]) % p, p - 2, p)
        M[c] = (M[c] * inv) % p
        colv = M[:, c].copy()
        colv[c] = 0
        nz = np.nonzero(colv)[0]
        for r in nz:
            M[r] = (M[r] - colv[r] * M[c]) % p
    return M[:, n:]


# ---------------------------------------------------------------- check pipeline
def blob_decrypt(kt: bytes, arg3, arg4, blob=BLOB1):
    n = len(blob)
    pt = bytearray(blob)
    for i in range(n):
        v = (arg3 >> ((i & 7) * 8)) & 0xFF
        w = (arg4 >> ((i & 7) * 8)) & 0xFF
        pt[i] ^= kt[i % len(kt)] ^ v ^ w
    return bytes(pt)


def vm_seed_of(kt: bytes):
    return fnv1a(kt[0:4]) ^ POLY_X


def r11_of(kt: bytes, vm_out):
    h = fnv1a(kt) ^ (vm_out & 0xFFFFFFFF)
    x = ((h * GOLDEN) & 0xFFFFFFFF) ^ PI_X
    return (x + E_X) & 0xFFFFFFFF


def check_buf_of(kt: bytes, r11):
    t = r11 & 3
    t64 = T64[t * 64:(t + 1) * 64]
    rot = bytes(((r11 >> ((j & 3) * 8)) & 0xFF) for j in range(64))
    return bytes(t64[j] ^ kt[j] ^ rot[j] for j in range(64))


def verdict(check_buf):
    return fnv1a(check_buf) == TARGET_FVN


if __name__ == "__main__":
    # self-test: KSA forward vs reference emulator values for 'AAAA'
    print("[*] self-test: KSA('AAAA')")
    st = ksa_forward(b"AAAA")
    ref_state = bytes.fromhex("c3c2af4c64d97936d895968606620adce88a0dbccaec40d12ec027cbc6a4cde2")
    print("    py :", st[:32].hex())
    print("    ref:", ref_state.hex())
    print("    MATCH:", st[:32].hex() == ref_state.hex())

    # test inverse round-trip
    K = ksa_inverse(st)
    base = ((np.arange(1024) & 0xFF) * 0x37 - 0x55) & 0xFF
    pwd = K ^ base.astype(np.uint8)
    print("    inverse round-trip:", bytes(pwd) == b"AAAA" * 256, bytes(pwd)[:16])

    # bitslice block test vs known column structure
    x = 0x03040605  # column 0 as input
    print("[*] bitslice block(0x03040605) =", hex(bitslice_block(x)))
