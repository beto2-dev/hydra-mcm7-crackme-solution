/*
 * HYDRA (MCM 7) keygen — algebraic inversion of the whole validation chain.
 *
 * Construction:
 *   1. pick r11 target R; unmix -> Y; required FNV(kt) x = ((Y^PI) * GOLDEN^-1) ^ vm_out
 *   2. build check_buf (64 bytes) with FNV == 0x8EDA89A9 via the 4-byte tail trick
 *   3. kt[0:64] = T64[R&3] ^ check_buf ^ rot(R)
 *   4. run the VM on the forced program -> vm_out (normally halts -> 0)
 *   5. kt[64:508] free; solve kt[508:512] so FNV(kt[0:512]) == x
 *   6. A_r = (const32[r] - z_r) mod 65537, z_r from kt bytes
 *   7. solve SCRATCH32 * w = A  (512x512 over GF(65537))
 *   8. unpack w -> state; invert the 48 KSA rounds -> K
 *   9. password[i] = K[i] ^ (((i&0xFF)*0x37 - 0x55) & 0xFF), len 1024
 *  10. forward-verify with check_password()
 */
#include "hydra_core.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int hydra_load_tables(const char *probes_dir);

extern uint8_t T64[4][64];
extern uint8_t BLOB1[32];

/* FNV1a inverse helpers */
static uint32_t powinv32(uint32_t m) {           /* m^-1 mod 2^32 */
    uint32_t inv = 1;
    for (int i = 0; i < 5; i++) inv *= 2 - m * inv;   /* Newton */
    return inv;
}

/* Solve 4 trailing bytes of buf so that fnv1a(buf, n, basis) == target,
 * keeping buf[n-4..n-1][1..3] fixed at their given values and only
 * deriving buf[n-4]. tail = the 3 fixed bytes (b_{n-3}, b_{n-2}, b_{n-1}). */
static uint32_t rng_state = 0x12345678u;
static inline uint32_t rng32(void) {
    rng_state ^= rng_state << 13; rng_state ^= rng_state >> 17;
    rng_state ^= rng_state << 5; return rng_state;
}

/* Solve the trailing 6 bytes of buf so fnv1a(buf, n, basis) == target.
 * byte n-6 is derived; bytes n-5..n-1 are searched (printable). */
static int fnv_tail_solve(uint8_t *buf, int n, uint32_t target) {
    uint32_t Pinv = powinv32(FNV_PRIME);
    uint32_t h = FNV_BASIS;
    for (int i = 0; i < n - 6; i++) h = (h ^ buf[i]) * FNV_PRIME;

    for (uint64_t trial = 0; trial < (1ull << 34); trial++) {
        uint32_t r = rng32(), r2 = rng32();
        uint8_t b1 = 0x21 + (uint8_t)(r % 94), b2 = 0x21 + (uint8_t)((r >> 8) % 94),
                b3 = 0x21 + (uint8_t)((r >> 16) % 94), b4 = 0x21 + (uint8_t)((r >> 24) % 94),
                b5 = 0x21 + (uint8_t)(r2 % 94);
        uint32_t s = (target * Pinv) ^ b5;
        s = (s * Pinv) ^ b4;
        s = (s * Pinv) ^ b3;
        s = (s * Pinv) ^ b2;
        s = (s * Pinv) ^ b1;                 /* state after the derived byte */
        uint32_t need = (s * Pinv) ^ h;
        if (need >= 0x20 && need < 0x7F) {   /* derived byte printable too */
            buf[n - 6] = (uint8_t)need;
            buf[n - 5] = b1; buf[n - 4] = b2; buf[n - 3] = b3;
            buf[n - 2] = b4; buf[n - 1] = b5;
            return fnv1a(buf, n, FNV_BASIS) == target;
        }
    }
    return 0;
}

int main(int argc, char **argv) {
    const char *probes = argc > 1 ? argv[1] : "../emulator/probes";
    uint32_t R = argc > 2 ? (uint32_t)strtoul(argv[2], NULL, 0) : 0x19480321u;

    if (!hydra_load_tables(probes)) {
        fprintf(stderr, "[!] table load failed\n");
        return 1;
    }
    {
        char path[1024];
        snprintf(path, sizeof path, "%s/../../../evidence/original_image.bin", probes);
        FILE *f = fopen(path, "rb");
        if (!f) { fprintf(stderr, "[!] image\n"); return 1; }
        static uint8_t img[0x63000];
        if (fread(img, 1, sizeof img, f) != sizeof img) { fclose(f); return 1; }
        fclose(f);
        memcpy(T64, img + 0x61CA0, 256);
        snprintf(path, sizeof path, "%s/blob1.bin", probes);
        f = fopen(path, "rb");
        if (!f || fread(BLOB1, 1, 32, f) != 32) { fprintf(stderr, "[!] blob1\n"); return 1; }
        fclose(f);
    }

    uint8_t kt[512], state[1024], K[1024], pwd[1024];
    uint32_t Y;
    if (!r11_unmix(R, &Y)) {
        fprintf(stderr, "[-] r11=%08x unreachable\n", R);
        return 1;
    }
    printf("[*] target r11  = %08x  (Y = %08x, table t = %u)\n", R, Y, R & 3);

    /* 2. check_buf: a flag of our choice, tail-solved */
    uint8_t check_buf[64];
    memset(check_buf, 0, sizeof check_buf);
    /* the binary prints check_buf as a C string and null-terminates byte 28
     * right after the verdict, so only the first 28 bytes are visible */
    memcpy(check_buf, "MCM7{Full_Algebraic_Keygen!}", 28);
    if (!fnv_tail_solve(check_buf, 64, FNV_TARGET)) {
        fprintf(stderr, "[-] check_buf FNV solve failed\n");
        return 1;
    }
    printf("[*] check_buf   = %.*s\n", 64, check_buf);
    printf("[*] FNV(check_buf) = %08x (target %08x)\n",
           fnv1a(check_buf, 64, FNV_BASIS), FNV_TARGET);

    /* 3. kt[0:64] */
    for (int j = 0; j < 64; j++) {
        uint32_t rot = (R >> ((j & 3) * 8)) & 0xFF;
        kt[j] = T64[R & 3][j] ^ check_buf[j] ^ (uint8_t)rot;
    }

    /* 4. forced VM program -> vm_out */
    uint8_t pt[32];
    for (int i = 0; i < 32; i++)
        pt[i] = (uint8_t)(BLOB1[i] ^ kt[i]
                ^ (uint8_t)(ARG3 >> ((i & 7) * 8))
                ^ (uint8_t)(ARG4 >> ((i & 7) * 8)));
    uint32_t vm_seed = fnv1a(kt, 4, FNV_BASIS) ^ POLY_MAGIC;
    uint64_t vm64 = hydra_vm(pt, 32, vm_seed, NULL);
    uint32_t vm_out = (uint32_t)vm64;
    printf("[*] vm_out      = %08x (seed %08x)\n", vm_out, vm_seed);

    /* 1. required FNV(kt[0:512]) */
    uint32_t Ginv = powinv32(GOLDEN);
    uint32_t x = ((Y ^ PI_MAGIC) * Ginv) ^ vm_out;

    /* 5. free kt[64:508], solve kt[508:512] */
    memset(kt + 64, 0, 512 - 64);
    if (!fnv_tail_solve(kt, 512, x)) {
        fprintf(stderr, "[-] kt FNV tail solve failed\n");
        return 1;
    }
    printf("[*] FNV(kt)     = %08x (required %08x)\n",
           fnv1a(kt, 512, FNV_BASIS), x);

    /* 6+7. solve the linear system */
    uint8_t kfree[512];
    memset(kfree, 0, sizeof kfree);
    if (!solve_state_for_kt(kt, kfree, state)) {
        fprintf(stderr, "[-] linear solve failed (try another kt)\n");
        return 1;
    }

    /* 8. invert the 48 rounds */
    ksa_inverse(state, K);

    /* 9. password */
    for (int i = 0; i < 1024; i++)
        pwd[i] = (uint8_t)(K[i] ^ (((i & 0xFF) * 0x37 - 0x55) & 0xFF));

    /* 10. forward verification */
    check_result_t res;
    uint32_t v = check_password(pwd, 1024, &res);
    printf("[*] forward check: FNV=%08x r11=%08x vm_out=%08x\n", v, res.r11, res.vm_out);
    printf("[*] check_buf recovered: %.*s\n", 64, res.check_buf);
    int ok = (v == FNV_TARGET) && (res.r11 == R);

    printf("[%s] %s\n", ok ? "+" : "-",
           ok ? "KEYGEN VALID — password accepted by check()"
              : "keygen FAILED (forward mismatch)");

    /* write the password */
    FILE *f = fopen("keygen_password.bin", "wb");
    fwrite(pwd, 1, 1024, f);
    fclose(f);
    printf("[*] password (1024 bytes) written to keygen_password.bin\n");
    /* hex + escaped forms */
    FILE *h = fopen("keygen_password.hex", "w");
    for (int i = 0; i < 1024; i++) fprintf(h, "%02x", pwd[i]);
    fprintf(h, "\n");
    fclose(h);
    FILE *e = fopen("keygen_password.py", "w");
    fprintf(e, "password = ");
    for (int i = 0; i < 1024; i++) fprintf(e, "\\x%02x", pwd[i]);
    fprintf(e, "\n");
    fclose(e);
    return ok ? 0 : 1;
}
