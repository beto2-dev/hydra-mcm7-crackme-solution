/*
 * HYDRA (MCM 7) — optimized password search (AVX2, 8 lanes).
 *
 * Key optimization: the poly-mul accumulator never exceeds 32 bits
 * (acc <= 65536, s*w <= 65535*65535 < 2^32), so the per-MAC GM reduction
 * can be deferred: acc = (sum of exact u32 products) mod 65537 — identical
 * result, 10x faster. Verified bit-exact against the reference build_kt().
 */
#include "hydra_core.h"

#include <immintrin.h>
extern uint32_t BS_FWD32[32];
extern uint32_t BS_INV32[32];
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

extern int hydra_load_tables(const char *probes_dir);
extern uint8_t T64[4][64];
extern uint8_t BLOB1[32];
uint32_t check_password(const uint8_t *pwd, size_t len, check_result_t *out);

/* bitslice byte tables (4 x 256 u32) for fwd and inv */
static uint32_t BS_T[2][4][256];

static void build_bs_tables(void) {
    for (int t = 0; t < 2; t++) {
        const uint32_t *M = t ? BS_INV32 : BS_FWD32;
        for (int bytepos = 0; bytepos < 4; bytepos++) {
            for (int v = 0; v < 256; v++) {
                uint32_t x = (uint32_t)v << (8 * bytepos);
                uint32_t y = 0;
                for (int j = 0; j < 32; j++)
                    y |= (uint32_t)__builtin_parity(M[j] & x) << j;
                BS_T[t][bytepos][v] = y;
            }
        }
    }
}

static inline uint32_t bs_fwd_fast(uint32_t x) {
    return BS_T[0][0][x & 0xFF] ^ BS_T[0][1][(x >> 8) & 0xFF]
         ^ BS_T[0][2][(x >> 16) & 0xFF] ^ BS_T[0][3][x >> 24];
}

/* ---------------- 8-lane batch pipeline ---------------- */
typedef struct {
    uint8_t  pwd[8][64];
    int      len[8];
    int      n;                       /* number of active lanes */
} batch_t;

/* packed state words, i-major, u32 lanes: w[i][lane] — one vector load per column */
static uint32_t wcol[512][8] __attribute__((aligned(32)));

static void ksa8(const batch_t *b) {
    /* interleaved state: st[i] holds 8 dwords (one per lane) */
    static uint32_t st[1024][8] __attribute__((aligned(32)));
    static uint32_t tmp[1024][8] __attribute__((aligned(32)));
    static uint32_t sboxext[256];

    for (int v = 0; v < 256; v++) sboxext[v] = SBOX[v];

    for (int l = 0; l < b->n; l++) {
        const uint8_t *pwd = b->pwd[l];
        int len = b->len[l] ? b->len[l] : 1;
        for (int i = 0; i < 1024; i++)
            st[i][l] = (uint8_t)(((i & 0xFF) * 0x37 - 0x55) ^ pwd[i % len]);
    }

    for (int rnd = 0; rnd < 48; rnd++) {
        /* phase 1: substitute + scatter (vector, 8 lanes at a time) */
        for (int i = 0; i < 1024; i++) {
            __m256i v = _mm256_load_si256((const __m256i *)st[i]);
            __m256i g = _mm256_i32gather_epi32((const int *)sboxext, v, 4);
            _mm256_store_si256((__m256i *)tmp[WPERM[i]], g);
        }
        /* phase 2: bitslice per lane: groups of 4 consecutive rows */
        for (int l = 0; l < b->n; l++) {
            for (int g = 0; g < 256; g++) {
                uint32_t x = tmp[4*g][l] | (tmp[4*g+1][l] << 8)
                           | (tmp[4*g+2][l] << 16) | (tmp[4*g+3][l] << 24);
                uint32_t y = BS_T[0][0][x & 0xFF] ^ BS_T[0][1][(x >> 8) & 0xFF]
                           ^ BS_T[0][2][(x >> 16) & 0xFF] ^ BS_T[0][3][x >> 24];
                tmp[4*g][l]   = y & 0xFF;
                tmp[4*g+1][l] = (y >> 8) & 0xFF;
                tmp[4*g+2][l] = (y >> 16) & 0xFF;
                tmp[4*g+3][l] = (y >> 24) & 0xFF;
            }
        }
        /* phase 3: LCG keystream xor (byte-masked!) */
        for (int i = 0; i < 1024; i++) {
            uint32_t k = ((uint32_t)i * 0x517CC1B7u
                          - (uint32_t)rnd * 0x61C88647u) >> 16 & 0xFF;
            __m256i v = _mm256_load_si256((const __m256i *)tmp[i]);
            v = _mm256_xor_si256(v, _mm256_set1_epi32((int)k));
            _mm256_store_si256((__m256i *)st[i], v);
        }
    }
    for (int i = 0; i < 512; i++)
        for (int l = 0; l < 8; l++)
            wcol[i][l] = (uint32_t)(st[2*i][l] | (st[2*i+1][l] << 8));
}

/* poly-mul for 8 lanes with deferred reduction */
static inline uint8_t kt_byte(uint64_t acc, int r) {
    uint32_t z = (uint32_t)(acc % 65537);
    uint32_t val = (CONST32[r] + 65537 - z) % 65537;
    uint8_t cl = (uint8_t)(val & 0xFF);
    cl ^= (uint8_t)(r >> 2);
    cl ^= (uint8_t)((1 - r) * 0x3B);
    return cl;
}

static void kt8(uint8_t kt[8][512]) {
    for (int r = 0; r < 512; r++) {
        const uint32_t *row = SCRATCH32 + r * 512;
        __m256i acc0[4], acc1[4];      /* independent chains, unrolled x4 */
        for (int u = 0; u < 4; u++) { acc0[u] = _mm256_setzero_si256();
                                      acc1[u] = _mm256_setzero_si256(); }
        int i = 0;
        for (; i + 3 < 512; i += 4) {
            for (int u = 0; u < 4; u++) {
                __m256i s  = _mm256_set1_epi32((int)row[i + u]);
                __m256i wc = _mm256_load_si256((const __m256i *)wcol[i + u]);
                acc0[u] = _mm256_add_epi64(acc0[u], _mm256_mul_epu32(wc, s));
                __m256i wo = _mm256_shuffle_epi32(wc, _MM_SHUFFLE(3, 3, 1, 1));
                __m256i so = _mm256_shuffle_epi32(s,  _MM_SHUFFLE(3, 3, 1, 1));
                acc1[u] = _mm256_add_epi64(acc1[u], _mm256_mul_epu32(wo, so));
            }
        }
        __m256i A0 = _mm256_add_epi64(_mm256_add_epi64(acc0[0], acc0[1]),
                                     _mm256_add_epi64(acc0[2], acc0[3]));
        __m256i A1 = _mm256_add_epi64(_mm256_add_epi64(acc1[0], acc1[1]),
                                     _mm256_add_epi64(acc1[2], acc1[3]));
        uint64_t a0[4], a1[4];
        _mm256_storeu_si256((__m256i_u *)a0, A0);
        _mm256_storeu_si256((__m256i_u *)a1, A1);
        for (int l = 0; l < 4; l++) {
            kt[2*l][r]     = kt_byte(a0[l], r);
            kt[2*l+1][r]   = kt_byte(a1[l], r);
        }
    }
}

/* NOTE: careful — the reference forward is kt[r] = low8(gm(const32 - acc) ^ xors)
 * where acc = the canonical residue. With deferred sums:
 *   acc_canon = sum % 65537 ; val = (const32 - acc_canon + 65537) % 65537
 * — identical. (The +0x10001 in the asm equals +65537 which vanishes mod p.) */

static uint32_t finish_lane(const uint8_t *kt, uint32_t *r11_out, uint8_t *cb_out) {
    uint8_t pt[32];
    for (int i = 0; i < 32; i++)
        pt[i] = (uint8_t)(BLOB1[i] ^ kt[i]
                ^ (uint8_t)(ARG3 >> ((i & 7) * 8))
                ^ (uint8_t)(ARG4 >> ((i & 7) * 8)));
    uint32_t vm_seed = fnv1a(kt, 4, FNV_BASIS) ^ POLY_MAGIC;
    uint32_t vm_out = (uint32_t)hydra_vm(pt, 32, vm_seed, NULL);
    uint32_t f = fnv1a(kt, 512, FNV_BASIS);
    uint32_t r11 = r11_mix(f, vm_out);
    uint32_t t = r11 & 3;
    for (int j = 0; j < 64; j++) {
        uint32_t rot = (r11 >> ((j & 3) * 8)) & 0xFF;
        cb_out[j] = T64[t][j] ^ kt[j] ^ (uint8_t)rot;
    }
    *r11_out = r11;
    return fnv1a(cb_out, 64, FNV_BASIS);
}

int main(int argc, char **argv) {
    const char *probes = argc > 1 ? argv[1] : "../emulator/probes";
    uint64_t start = argc > 2 ? strtoull(argv[2], NULL, 16) : 0;
    uint64_t end   = argc > 3 ? strtoull(argv[3], NULL, 16) : 0x100000000ull;

    if (!hydra_load_tables(probes)) { fprintf(stderr, "[!] tables\n"); return 1; }
    build_bs_tables();
    printf("[*] AVX2 search [%llx, %llx)\n", (unsigned long long)start,
           (unsigned long long)end);

    batch_t b;
    static uint8_t kt[8][512];
    uint8_t cb[64];
    time_t t0 = time(NULL);
    uint64_t found = 0, done = 0;

    /* --- self-check against the reference implementation --- */
    {
        const char *ref[] = {"HydraKey00000000", "HydraKey00000001", "HydraKey0000000f"};
        b.n = 0;
        for (int k = 0; k < 3; k++) {
            memset(b.pwd[k], 0, sizeof b.pwd[k]);
            memcpy(b.pwd[k], ref[k], 16);
            b.len[k] = 64;         /* console delivery: chars + NUL pad to 64 */
            b.n++;
        }
        ksa8(&b);
        kt8(kt);
        check_result_t r;
        int ok = 1;
        for (int l = 0; l < 3; l++) {
            uint32_t v = check_password(b.pwd[l], b.len[l], &r);
            uint32_t r11;
            uint32_t v2 = finish_lane(kt[l], &r11, cb);
            if (v != v2 || memcmp(r.kt, kt[l], 512) != 0) {
                printf("[!] lane %d MISMATCH: ref FNV=%08x avx=%08x\n", l, v, v2);
                ok = 0;
            }
        }
        printf("[*] self-check: %s\n", ok ? "PASS" : "FAIL");
        if (!ok) return 1;
    }

    for (uint64_t c = start; c < end; ) {
        b.n = 0;
        for (int k = 0; k < 8 && c < end; k++, c++) {
            int n;
            if (c < 0x100000000ull) {
                /* short form: HydraKey + 8 hex. The console reader delivers
                 * the typed chars NUL-padded to a 64-byte string, so the
                 * pipeline must see all 64 bytes. */
                memset(b.pwd[k], 0, 64);
                n = 8;
                memcpy(b.pwd[k], "HydraKey", 8);
                for (int i = 0; i < 8; i++)
                    b.pwd[k][n++] = "0123456789abcdef"[(c >> (4 * (7 - i))) & 0xF];
                n = 64;
            } else {
                /* extended form: Hk + 11 base-94 digits of the counter
                 * (13 typed chars, NUL-padded to the 64-byte string;
                 * typed length 12 must be avoided - trap length). */
                memset(b.pwd[k], 0, 64);
                n = 2;
                memcpy(b.pwd[k], "Hk", 2);
                uint64_t v = c - 0x100000000ull;
                uint8_t digits[11];
                for (int i = 10; i >= 0; i--) { digits[i] = v % 94; v /= 94; }
                for (int i = 0; i < 11; i++)
                    b.pwd[k][n++] = (uint8_t)(0x21 + digits[i]);
                n = 64;
            }
            b.len[k] = n;
            b.n++;
        }
        ksa8(&b);
        kt8(kt);
        for (int l = 0; l < b.n; l++) {
            uint32_t r11;
            uint32_t v = finish_lane(kt[l], &r11, cb);
            done++;
            if (v == FNV_TARGET) {
                printf("\n[+] FOUND: %.*s (r11=%08x)\n  check_buf: %.*s\n",
                       b.len[l], b.pwd[l], r11, 64, cb);
                FILE *f = fopen("found_password.txt", "a");
                fprintf(f, "%.*s r11=%08x\n", b.len[l], b.pwd[l], r11);
                fclose(f);
                found++;
            }
        }
        if ((done & 0x3FFFF) == 0) {
            double rate = (double)done / (double)(time(NULL) - t0 + 1);
            fprintf(stderr, "\r[*] %llu done (%.0f/s)", (unsigned long long)done, rate);
        }
    }
    printf("\n[*] done: %llu passwords, %llu found\n",
           (unsigned long long)done, (unsigned long long)found);
    return found ? 0 : 1;
}
