#!/usr/bin/env python3
"""Pure-Python model of HYDRA MCM7 build_key_table — validated vs the Unicorn emulator.

Pipeline: K(pwd) -> 48 rounds (scatter+subst, bitslice, lcg-xor) -> pack -> poly-mul
"""
import struct
import sys
import os

P = os.path.dirname(os.path.abspath(__file__))
PROBES = os.path.join(os.path.dirname(P), "emulator", "probes")

# ---------------------------------------------------------------- constants
def fnv1a(data, basis=0x811C9DC5):
    h = basis
    for b in data:
        h = ((h ^ b) * 0x1000193) & 0xFFFFFFFF
    return h

def gm(x):
    q = (x * 0xFFFF0001) >> 48
    return (x - q * 0x10001) & 0xFFFFFFFF

# S-box: identity FY-shuffled with MS-LCG seed 0x62FDDC14
def ms_lcg(s):
    return (s * 0x41C64E6D + 0x3039) & 0xFFFFFFFF

S = list(range(256))
s = 0x62FDDC14
for i in range(255, 0, -1):
    s = ms_lcg(s)
    j = ((s >> 16) & 0x7FFF) % (i + 1)
    S[i], S[j] = S[j], S[i]
SINV = [0] * 256
for i, v in enumerate(S):
    SINV[v] = i

# W permutation (dumped from the emulator run)
W = struct.unpack('<1024H', open(os.path.join(PROBES, "W_perm.bin"), "rb").read())
# position -> index map for inversion
WPOS = [0] * 1024   # WPOS[p] = i such that W[i] = p
for i, p in enumerate(W):
    WPOS[p] = i

# bitslice matrix: 32 input bits -> 32 output bytes?? no:
# each input bit -> an output BYTE pattern (from probes). The transform per 4-byte group:
# out_bytes = XOR over set input bits of their probe outputs.
BITSLICE_COLS = []
raw = open(os.path.join(PROBES, "bitslice_first32.bin"), "rb").read()
for bit in range(32):
    BITSLICE_COLS.append(raw[bit * 0x400: (bit + 1) * 0x400])   # 1024 bytes each, only first 4 nonzero

def bitslice_group(b0, b1, b2, b3):
    out = [0, 0, 0, 0]
    for byte_i, val in enumerate((b0, b1, b2, b3)):
        for bit in range(8):
            if val & (1 << bit):
                col = BITSLICE_COLS[byte_i * 8 + bit]
                out[0] ^= col[0]
                out[1] ^= col[1]
                out[2] ^= col[2]
                out[3] ^= col[3]
    return out

def bitslice_bytes(state):
    """state: 1024 bytes -> transformed in place (block-diagonal 4-byte groups)."""
    out = bytearray(1024)
    for g in range(256):
        b = state[4 * g:4 * g + 4]
        o = bitslice_group(b[0], b[1], b[2], b[3])
        out[4 * g:4 * g + 4] = bytes(o)
    return bytes(out)

def bitslice_inv_bytes(state):
    out = bytearray(1024)
    for g in range(256):
        b = state[4 * g:4 * g + 4]
        o = BS_INV_GROUP(b[0], b[1], b[2], b[3])
        out[4 * g:4 * g + 4] = bytes(o)
    return bytes(out)

# build the 32x32 matrices once (forward and inverse) as bit-matrices over packed ints
def build_matrices():
    # M as list of 32 ints: M[j] = bitmask of input bits contributing to output bit j
    M = [0] * 32
    for in_bit in range(32):
        col = BITSLICE_COLS[in_bit]
        for k in range(4):
            for j in range(8):
                if col[k] & (1 << j):
                    M[k * 8 + j] |= (1 << in_bit)
    # invert over GF(2) using row ops on [M | I]
    rows = [(M[i], 1 << i) for i in range(32)]
    for col in range(32):
        piv = next((r for r in range(col, 32) if (rows[r][0] >> col) & 1), None)
        if piv is None:
            raise RuntimeError("singular bitslice")
        rows[col], rows[piv] = rows[piv], rows[col]
        for r in range(32):
            if r != col and (rows[r][0] >> col) & 1:
                rows[r] = (rows[r][0] ^ rows[col][0], rows[r][1] ^ rows[col][1])
    # rows[i] = (e_i, Minv_row_i): Minv * M = I -> Minv rows
    Minv = [rows[i][1] for i in range(32)]
    return M, Minv

M_FWD, M_INV = build_matrices()

def fwd_group_bits(x):   # x = 32-bit (4 bytes LE)
    y = 0
    for j in range(32):
        # out bit j = parity( M[j] & x )
        v = M_FWD[j] & x
        y |= (bin(v).count('1') & 1) << j
    return y

def inv_group_bits(y):
    x = 0
    for j in range(32):
        v = M_INV[j] & y
        x |= (bin(v).count('1') & 1) << j
    return x

def bitslice_inv_bytes2(state):
    out = bytearray(1024)
    for g in range(256):
        x = struct.unpack('<I', state[4*g:4*g+4])[0]
        y = fwd_group_bits(x)
        out[4*g:4*g+4] = struct.pack('<I', y)
    return bytes(out)

def bitslice_un_bytes(state):
    out = bytearray(1024)
    for g in range(256):
        y = struct.unpack('<I', state[4*g:4*g+4])[0]
        x = inv_group_bits(y)
        out[4*g:4*g+4] = struct.pack('<I', x)
    return bytes(out)

# ---------------------------------------------------------------- KSA
def build_K(password: bytes):
    ln = len(password)
    K = bytearray(1024)
    for i in range(1024):
        K[i] = (((i & 0xFF) * 0x37 - 0x55) ^ password[i % ln]) & 0xFF
    return bytes(K)

def lcg_byte(i, round_):
    return ((i * 0x517CC1B7 - round_ * 0x61C88647) >> 16) & 0xFF

def ksa_forward(password: bytes):
    state = bytearray(build_K(password))
    tmp = bytearray(1024)
    for rnd in range(48):
        for i in range(1024):
            b = S[state[i]]
            state[i] = b
            tmp[W[i]] = b
        state[:] = tmp[:]
        state[:] = bitslice_bytes(state)
        for i in range(1024):
            state[i] ^= lcg_byte(i, rnd)
    return bytes(state)

def ksa_inverse(final_state: bytes):
    """Invert the 48 rounds to recover K."""
    state = bytearray(final_state)
    for rnd in range(47, -1, -1):
        # undo lcg xor
        for i in range(1024):
            state[i] ^= lcg_byte(i, rnd)
        # undo bitslice
        state[:] = bitslice_un_bytes(bytes(state))
        # undo scatter+substitute: state_old[i] = SINV[state_new[W[i]]]
        old = bytearray(1024)
        for i in range(1024):
            old[i] = SINV[state[W[i]]]
        state = old
    return bytes(state)

def pack_state(state: bytes):
    out = []
    for i in range(512):
        w = state[2 * i] | (state[2 * i + 1] << 8)
        out.append(gm(w))   # == w mod 65537, w < 65536
    return out

def unpack_state(words):
    st = bytearray(1024)
    for i, w in enumerate(words):
        assert 0 <= w <= 65535, f"word {i} out of range: {w}"
        st[2 * i] = w & 0xFF
        st[2 * i + 1] = w >> 8
    return bytes(st)

# ---------------------------------------------------------------- key table
def build_key_table(password: bytes, scratch32, const32):
    state = ksa_forward(password)
    words = pack_state(state)
    kt = bytearray(512)
    for r in range(512):
        acc = 0
        base = r * 512
        for i in range(512):
            acc = gm(acc + (scratch32[base + i] * words[i]) & 0xFFFFFFFF)
        ecx = (const32[r] - acc) & 0xFFFFFFFF
        ecx = (ecx + 0x10001) & 0xFFFFFFFF
        ecx = gm(ecx)
        cl = ecx & 0xFF
        cl ^= (r >> 2) & 0xFF
        cl ^= ((1 - r) * 0x3B) & 0xFF
        kt[r] = cl & 0xFF
    return bytes(kt)

if __name__ == "__main__":
    drbg = open(os.path.join(PROBES, "drbg_12345678.bin"), "rb").read()
    scratch32 = struct.unpack('<262144I', drbg)
    img = open(os.path.join(os.path.dirname(P), "..", "evidence", "original_image.bin"), "rb").read()
    const32 = struct.unpack('<512I', img[0x61DA0:0x61DA0 + 0x800])

    kt = build_key_table(b"AAAA", scratch32, const32)
    print("model kt[:64]:", kt[:64].hex())
    emu_kt = bytes.fromhex(
        "eb2f9747573ed925e6421a9f66228a75acded92b3edf009802d27f3fcd3280a37df8c1c05d57004e45d913dad744c530ea2bb22adda4cfaf97ab972db4b43789fc34cbb3e609c06a91a80d4bbe5e7b0fa19632a4ebd28da346882c5cd88884ca0a55ab31ec122f832e3c0baa76050411b3906b9e6037c7dda170b247a8543f307531ceb5e46d9e4c3e1a0e7289de6558fcb1232bcd1fd94796724228124cbb5e5ced5ea0af6211e27e1d4c0ddb1a7792a9d563196c0b4f1ba077b617645bbebc7404745c9c8bc7d5241d2fb26572e1db57a4863e432e314df2dc171d078d1c60d380aa7bd13818a1d0f8af17a86b24500787567e0d0ac5adc104015f2eabc544ae7cd2a2a077e65c72b625e68c8afbd3396aa56e57f2a0f558c89123ed417280b67edf2a6dfb1c37ab83bdceeba101b3278598a4381df928f34c53d82ac466858a5c0a1f7c6f6662c6d6af6461ac83a99c38e8623cdc992ddae4bd4a0197153e2aff6e2bc1945e9ddd84bd5ca2effe1d6ea8128ff4132c3c4e53383718e4447a2fad4595a79b45d7cf18ff66f4bab19cfd858f17c6bcc4943b369c3c9902a0fdce4cc1dda104b5206bef94439791b1dcdec716fa4fb40d8b922bab316c2d0ff192198568818e4ac2ac767148d0ca18412adcb41aa873619abc8bc6264fff50e5cae5ac8659e0da4f25437de22fd6da0ae3a2eddfd1e6e1abe5638ceb3923b1de"
    )
    print("emu   kt[:64]:", emu_kt[:64].hex())
    print("MATCH:", kt == emu_kt)
    if kt != emu_kt:
        n = sum(1 for a, b in zip(kt, emu_kt) if a == b)
        print(f"matching bytes: {n}/512")
        for i in range(0, 64):
            if kt[i] != emu_kt[i]:
                print(f"  first diff at {i}: model={kt[i]:02x} emu={emu_kt[i]:02x}")
                break
