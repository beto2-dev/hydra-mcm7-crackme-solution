/*
 * HYDRA (MCM 7) — core pipeline (C, bit-exact with the Unicorn emulator).
 */
#include "hydra_core.h"
#include "bitslice_gen.h"
#include <string.h>
#include <stdlib.h>

uint8_t  SBOX[256];
uint8_t  SINV[256];
uint16_t WPERM[1024];
uint16_t WPOS[1024];
uint32_t SCRATCH32[512 * 512];
uint32_t CONST32[512];

/* ---------------------------------------------------------------- tables */
static void build_sbox(void) {
    uint32_t s = 0x62FDDC14u;
    for (int i = 0; i < 256; i++) SBOX[i] = (uint8_t)i;
    for (int i = 255; i > 0; i--) {
        s = s * 0x41C64E6Du + 0x3039u;
        int j = ((s >> 16) & 0x7FFF) % (i + 1);
        uint8_t t = SBOX[i]; SBOX[i] = SBOX[j]; SBOX[j] = t;
    }
    for (int i = 0; i < 256; i++) SINV[SBOX[i]] = (uint8_t)i;
}

/* W permutation: dumped from the emulator (identity, FY-shuffled stride-3
 * with the MS-LCG seeded 0x8A888684). Reconstructed here from the dump file
 * at load time by the loader in hydra_data.c. */

/* ---------------------------------------------------------------- KSA */
static inline uint8_t lcg_byte(int i, int round) {
    uint32_t v = (uint32_t)i * 0x517CC1B7u - (uint32_t)round * 0x61C88647u;
    return (uint8_t)(v >> 16);
}

void ksa_forward(const uint8_t *pwd, size_t len, uint8_t *state) {
    uint8_t tmp[1024];

    if (len == 0) len = 1;
    for (int i = 0; i < 1024; i++)
        state[i] = (uint8_t)(((i & 0xFF) * 0x37 - 0x55) ^ pwd[i % len]);

    for (int rnd = 0; rnd < 48; rnd++) {
        for (int i = 0; i < 1024; i++) {
            uint8_t b = SBOX[state[i]];
            state[i] = b;
            tmp[WPERM[i]] = b;
        }
        memcpy(state, tmp, 1024);
        for (int g = 0; g < 256; g++) {
            uint32_t x;
            memcpy(&x, state + 4 * g, 4);
            uint32_t y = bs_apply(BS_FWD32, x);
            memcpy(state + 4 * g, &y, 4);
        }
        for (int i = 0; i < 1024; i++)
            state[i] ^= lcg_byte(i, rnd);
    }
}

void ksa_inverse(const uint8_t *state_in, uint8_t *K) {
    uint8_t state[1024], old[1024];
    memcpy(state, state_in, 1024);

    for (int rnd = 47; rnd >= 0; rnd--) {
        for (int i = 0; i < 1024; i++)
            state[i] ^= lcg_byte(i, rnd);
        for (int g = 0; g < 256; g++) {
            uint32_t y;
            memcpy(&y, state + 4 * g, 4);
            uint32_t x = bs_apply(BS_INV32, y);
            memcpy(state + 4 * g, &x, 4);
        }
        for (int i = 0; i < 1024; i++)
            old[i] = SINV[state[WPERM[i]]];
        memcpy(state, old, 1024);
    }
    memcpy(K, state, 1024);
}

/* ---------------------------------------------------------------- poly-mul */
void build_kt(const uint8_t *state1024, uint8_t *kt512) {
    uint32_t w[512];
    for (int i = 0; i < 512; i++) {
        uint32_t v = state1024[2 * i] | ((uint32_t)state1024[2 * i + 1] << 8);
        w[i] = gm(v);                    /* == v (< 65536) */
    }
    for (int r = 0; r < 512; r++) {
        uint32_t acc = 0;
        const uint32_t *row = SCRATCH32 + r * 512;
        for (int i = 0; i < 512; i++)
            acc = gm(acc + row[i] * w[i]);
        uint32_t ecx = (CONST32[r] - acc) + 0x10001u;
        ecx = gm(ecx);
        uint8_t cl = (uint8_t)ecx;
        cl ^= (uint8_t)(r >> 2);
        cl ^= (uint8_t)((1 - r) * 0x3B);
        kt512[r] = cl;
    }
}

/* ---- solve SCRATCH32 * w = A (mod 65537), Gaussian elimination -------- */
int solve_mod_p(const uint32_t *A, uint32_t *w_out) {
    /* augmented matrix [SCRATCH32 | A] over GF(65537) */
    static uint32_t M[512][513];
    for (int r = 0; r < 512; r++) {          /* row-wise: stride differs! */
        memcpy(M[r], SCRATCH32 + r * 512, 512 * sizeof(uint32_t));
        M[r][512] = A[r];
    }

    for (int col = 0; col < 512; col++) {
        int piv = -1;
        for (int r = col; r < 512; r++)
            if (M[r][col] % POLY_P) { piv = r; break; }
        if (piv < 0) return 0;             /* singular */
        if (piv != col) {
            uint32_t *a = M[col], *b = M[piv];
            for (int k = col; k < 513; k++) { uint32_t t = a[k]; a[k] = b[k]; b[k] = t; }
        }
        uint32_t inv = modinv(M[col][col] % POLY_P);
        for (int k = col; k < 513; k++)
            M[col][k] = (uint32_t)((uint64_t)M[col][k] * inv % POLY_P);
        for (int r = 0; r < 512; r++) {
            if (r == col || !(M[r][col] % POLY_P)) continue;
            uint32_t f = M[r][col] % POLY_P;
            for (int k = col; k < 513; k++) {
                uint32_t sub = (uint32_t)((uint64_t)M[col][k] * f % POLY_P);
                M[r][k] = (M[r][k] + POLY_P - sub) % POLY_P;
            }
        }
    }
    for (int r = 0; r < 512; r++) w_out[r] = M[r][512];
    return 1;
}

uint32_t modinv(uint32_t a); /* fwd decl */

/* modular inverse mod 65537 (prime) 2014 Fermat */
uint32_t modinv(uint32_t a) {
    uint32_t e = POLY_P - 2, r = 1;
    uint64_t b = a;
    while (e) {
        if (e & 1) r = (uint32_t)((r * b) % POLY_P);
        b = (b * b) % POLY_P;
        e >>= 1;
    }
    return (uint32_t)r;
}

/* ---- invert the kt -> state ---- */
int solve_state_for_kt(const uint8_t *kt512, const uint8_t *kfree,
                       uint8_t *state1024) {
    uint32_t A[512], w[512];
    for (int r = 0; r < 512; r++) {
        uint32_t xors = ((uint32_t)(r >> 2)) ^ (uint32_t)((1 - r) * 0x3B & 0xFF);
        uint32_t t = (uint32_t)(kt512[r] ^ (uint8_t)xors) & 0xFF;
        uint32_t z = t + 256u * (uint32_t)kfree[r];
        if (z >= POLY_P) return 0;         /* z must be < 65537 */
        uint32_t c = CONST32[r] & 0xFFFF;   /* const32 values are 16-bit */
        A[r] = (c + POLY_P - z) % POLY_P;
    }
    if (!solve_mod_p(A, w)) return 0;
    for (int i = 0; i < 512; i++) {
        if (w[i] > 0xFFFF) return 0;       /* must be a 16-bit word */
        state1024[2 * i]     = (uint8_t)(w[i] & 0xFF);
        state1024[2 * i + 1] = (uint8_t)(w[i] >> 8);
    }
    return 1;
}

/* ---------------------------------------------------------------- r11 mix */
uint32_t r11_mix(uint32_t fnv, uint32_t vm_out) {
    uint32_t a = fnv ^ vm_out;
    a *= GOLDEN;
    uint32_t Y = a ^ PI_MAGIC;
    uint32_t u = Y ^ E_MAGIC;        /* Y without E bits  */
    uint32_t v = Y & E_MAGIC;        /* Y with only E bits */
    return u + 2 * v;
}

int r11_unmix(uint32_t r11, uint32_t *Y_out) {
    /* forward: r11 = ((Y^E) + 2*(Y&E)) mod 2^32,  E = E_MAGIC.
     * write Y = u | v with v = Y&E (v subset of E), u = Y\E (u & E == 0):
     *   Y^E = u | (E\v) = u | (E^v)
     *   r11 = (u | (E^v)) + 2v
     * For each candidate v (2^10 subsets of E):
     *   M = r11 - 2v ; M must contain all bits of E^v ; u = M \ (E^v)
     * then verify forward. */
    const uint32_t E = E_MAGIC;
    uint32_t bits[16]; int nb = 0;
    for (int b = 0; b < 32; b++) if ((E >> b) & 1) bits[nb++] = 1u << b;
    for (uint32_t mask = 0; mask < (1u << nb); mask++) {
        uint32_t v = 0;
        for (int b = 0; b < nb; b++) if ((mask >> b) & 1) v |= bits[b];
        uint32_t Ev = E ^ v;
        uint32_t M = r11 - 2 * v;
        if ((M & Ev) != Ev) continue;      /* M must cover E\v */
        uint32_t u = M & ~Ev;
        if (u & E) continue;               /* u must avoid E      */
        uint32_t Y = u | v;
        /* exact forward verification */
        uint32_t r = (Y ^ E) + 2 * (Y & E);
        if (r == r11) { *Y_out = Y; return 1; }
    }
    return 0;
}
