/*
 * HYDRA (MCM 7) — full pipeline reimplementation + keygen.
 *
 * Bit-exact C model of the validation chain:
 *   seed = arg2 ^ arg5
 *   kt   = build_key_table(password, seed)
 *   pt   = blob1 ^ kt[0:32] ^ arg3 ^ arg4
 *   r11  = mix(FNV(kt) ^ VM(pt, FNV(kt[0:4]) ^ POLY))
 *   check_buf = T64[r11&3] ^ kt[0:64] ^ rot(r11)
 *   verdict: FNV1a(check_buf) == 0x8EDA89A9
 *
 * Everything validated against the Unicorn identity-mapped emulator.
 */
#ifndef HYDRA_CORE_H
#define HYDRA_CORE_H

#include <stdint.h>
#include <stddef.h>

#define POLY_P      65537u          /* Fermat prime F4 */
#define FNV_PRIME   0x01000193u
#define FNV_BASIS   0x811C9DC5u
#define FNV_TARGET  0x8EDA89A9u
#define GOLDEN      0x9E3779B9u
#define PI_MAGIC    0x31415926u
#define E_MAGIC     0x27182818u
#define POLY_MAGIC  0x504F4C59u     /* "POLY" */

/* real-machine check() arguments (deterministic, see WRITEUP §12) */
#define ARG2  0x00000000u   /* raced live: BeingDebugged=1 path (parent always debugs child) */
#define ARG3  0x748EEAA66AF7BDA9ull
#define ARG4  0x029DF32308AA1DF6ull
#define ARG5  0x8153F691u   /* FNV of own code @ RVA 0x36100:0x36140   */

static inline uint32_t fnv1a(const uint8_t *buf, size_t n, uint32_t h) {
    for (size_t i = 0; i < n; i++)
        h = (h ^ buf[i]) * FNV_PRIME;
    return h;
}

/* Granlund-Montgomery reduction mod 65537 — exact copy of the asm:
 *   q = (x * 0xFFFF0001) >> 48 ; r = x - q * 0x10001   (32-bit) */
static inline uint32_t gm(uint32_t x) {
    uint32_t q = (uint32_t)(((uint64_t)x * 0xFFFF0001ull) >> 48);
    return x - q * 0x10001u;
}

/* the final obfuscated r11 mix (exact asm transcription):
 *   a   = (FNV ^ vm_out) * GOLDEN
 *   Y   = a ^ PI
 *   r11 = 2*(Y|E) - (Y^E)  ==  (Y^E) + 2*(Y&E)                        */
uint32_t r11_mix(uint32_t fnv, uint32_t vm_out);

/* inverse of r11_mix on the reachable set: find Y with 2*(Y|E)-(Y^E)==r11 */
int r11_unmix(uint32_t r11, uint32_t *Y_out);

/* ---- KSA (RC4-KSA + 48-round shuffle), forward and inverse ---- */
extern uint8_t  SBOX[256];
extern uint8_t  SINV[256];
extern uint16_t WPERM[1024];    /* W[i]: scatter target of i           */
extern uint16_t WPOS[1024];     /* inverse: position -> source index   */
/* bitslice matrices BS_FWD32/BS_INV32 come from bitslice_gen.h */

void ksa_forward(const uint8_t *pwd, size_t len, uint8_t *state1024);
void ksa_inverse(const uint8_t *state1024, uint8_t *K1024);

/* ---- poly-mul key table ---- */
extern uint32_t SCRATCH32[512 * 512];   /* DRBG output for the real seed */
extern uint32_t CONST32[512];           /* 2 KiB table at RVA 0x61DA0    */

void build_kt(const uint8_t *state1024, uint8_t *kt512);

/* modular helpers */
uint32_t modinv(uint32_t a);
int solve_mod_p(const uint32_t *A, uint32_t *w_out);

/* invert the kt: solve the 512x512 system and return the state bytes.
 * kfree[r] in [0,255] picks which multiple of 256 each z_r uses. */
int solve_state_for_kt(const uint8_t *kt512, const uint8_t *kfree,
                       uint8_t *state1024);

/* ---- the custom VM ---- */
uint64_t hydra_vm(const uint8_t *code, size_t size, uint32_t seed,
                  uint8_t *code_out /* optional: modified code copy */);

/* ---- full forward check for a password ---- */
typedef struct {
    uint8_t  kt[512];
    uint32_t r11;
    uint32_t vm_out;
    uint8_t  check_buf[64];
    uint32_t fnv;
} check_result_t;

uint32_t check_password(const uint8_t *pwd, size_t len, check_result_t *out);

/* table loader (probes dir + image) — returns 1 on success */
int hydra_load_tables(const char *probes_dir);

#endif
