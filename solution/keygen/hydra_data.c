/*
 * HYDRA table loader (shared by selftest and keygen).
 */
#include "hydra_core.h"
#include <stdio.h>
#include <string.h>

uint8_t T64[4][64];
uint8_t BLOB1[32];

static int load_file(const char *dir, const char *name, void *buf, size_t n) {
    char path[1024];
    snprintf(path, sizeof path, "%s/%s", dir, name);
    FILE *f = fopen(path, "rb");
    if (!f) { fprintf(stderr, "[!] missing %s\n", path); return 0; }
    size_t got = fread(buf, 1, n, f);
    fclose(f);
    if (got != n) { fprintf(stderr, "[!] short read %s (%zu/%zu)\n", path, got, n); return 0; }
    return 1;
}

int hydra_load_tables(const char *probes_dir) {
    char path[1024];
    /* S + W */
    if (!load_file(probes_dir, "S_box.bin", SBOX, 256)) return 0;
    for (int i = 0; i < 256; i++) SINV[SBOX[i]] = (uint8_t)i;
    if (!load_file(probes_dir, "W_perm.bin", WPERM, 2048)) return 0;
    for (int i = 0; i < 1024; i++) WPOS[WPERM[i]] = (uint16_t)i;
    /* DRBG scratch for the real seed */
    if (!load_file(probes_dir, "drbg_real.bin", SCRATCH32, sizeof SCRATCH32)) return 0;
    /* const32 + T64 + blob1 from the reconstructed image */
    snprintf(path, sizeof path, "%s/../../../evidence/original_image.bin", probes_dir);
    FILE *f = fopen(path, "rb");
    if (!f) { fprintf(stderr, "[!] missing image\n"); return 0; }
    static uint8_t img[0x63000];
    if (fread(img, 1, 0x63000, f) != 0x63000) { fclose(f); return 0; }
    fclose(f);
    memcpy(CONST32, img + 0x61DA0, 0x800);
    memcpy(T64, img + 0x61CA0, 256);
    if (!load_file(probes_dir, "blob1.bin", BLOB1, 32)) return 0;
    return 1;
}


/* ------------------------------------------------------------------ check */
uint32_t check_password(const uint8_t *pwd, size_t len, check_result_t *out) {
    uint8_t state[1024];
    ksa_forward(pwd, len, state);
    build_kt(state, out->kt);

    /* blob decryption */
    uint8_t pt[32];
    uint64_t a3 = ARG3, a4 = ARG4;
    for (int i = 0; i < 32; i++) {
        pt[i] = (uint8_t)(BLOB1[i] ^ out->kt[i]
                ^ (uint8_t)(a3 >> ((i & 7) * 8))
                ^ (uint8_t)(a4 >> ((i & 7) * 8)));
    }
    uint32_t vm_seed = fnv1a(out->kt, 4, FNV_BASIS) ^ POLY_MAGIC;
    out->vm_out = (uint32_t)hydra_vm(pt, 32, vm_seed, NULL);

    uint32_t f = fnv1a(out->kt, 512, FNV_BASIS);
    out->r11 = r11_mix(f, out->vm_out);

    uint32_t t = out->r11 & 3;
    for (int j = 0; j < 64; j++) {
        uint32_t rot = (out->r11 >> ((j & 3) * 8)) & 0xFF;
        out->check_buf[j] = T64[t][j] ^ out->kt[j] ^ (uint8_t)rot;
    }
    /* verdict: FNV over the full unzeroed buffer (the real code zeroes
     * check_buf[28] only AFTER the comparison, at 0x5ECA4) */
    out->fnv = fnv1a(out->check_buf, 64, FNV_BASIS);
    out->check_buf[28] = 0;
    return out->fnv;
}

