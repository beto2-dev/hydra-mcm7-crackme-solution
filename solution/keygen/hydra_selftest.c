/*
 * Verify the C VM against emulator fuzz vectors + full pipeline self-test.
 */
#include "hydra_core.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* loader lives in hydra_data.c */
extern uint8_t T64[4][64];
extern uint8_t BLOB1[32];

/* ------------------------------------------------------------------- main */
int main(int argc, char **argv) {
    const char *probes = argc > 1 ? argv[1]
        : "../emulator/probes";

    if (!hydra_load_tables(probes)) {
        fprintf(stderr, "[!] table load failed from %s\n", probes);
        return 1;
    }

    /* 1. VM fuzz against the emulator vectors */
    char path[1024];
    snprintf(path, sizeof path, "%s/vm_fuzz.bin", probes);
    FILE *f = fopen(path, "rb");
    if (!f) { fprintf(stderr, "[!] no fuzz vectors\n"); return 1; }
    unsigned nv;
    if (fread(&nv, 4, 1, f) != 1) return 1;
    int fails = 0, ran = 0;
    for (unsigned t = 0; t < nv; t++) {
        unsigned len; uint64_t seed, rax_ref; unsigned zero;
        uint8_t prog[64], ctx_ref[0x100];
        if (fread(&len, 4, 1, f) != 1) break;
        if (fread(prog, 1, len, f) != len) break;
        if (fread(&seed, 8, 1, f) != 1) break;
        if (fread(&zero, 4, 1, f) != 1) break;
        if (fread(&rax_ref, 8, 1, f) != 1) break;
        if (fread(ctx_ref, 1, 0x100, f) != 0x100) break;
        uint64_t rax = hydra_vm(prog, len, (uint32_t)seed, NULL);
        ran++;
        if (rax != rax_ref) {
            fails++;
            if (fails <= 5)
                fprintf(stderr, "[!] VM mismatch #%u seed=%llx: C=%llx emu=%llx\n",
                        t, (unsigned long long)seed,
                        (unsigned long long)rax, (unsigned long long)rax_ref);
        }
    }
    fclose(f);
    printf("[*] VM fuzz: %d vectors, %d FAILED\n", ran, fails);
    if (fails) return 1;

    /* 2. kt self-test against the emulator value (needs the 0x12345678 DRBG
     *    loaded into SCRATCH32 temporarily) */
    {
        static uint32_t save[512 * 512];
        uint8_t kt[512];
        uint8_t state[1024];
        memcpy(save, SCRATCH32, sizeof save);
        snprintf(path, sizeof path, "%s/drbg_12345678.bin", probes);
        FILE *g = fopen(path, "rb");
        if (g) {
            fread(SCRATCH32, 4, 512 * 512, g);
            fclose(g);
            ksa_forward((const uint8_t *)"AAAA", 4, state);
            build_kt(state, kt);
            static const char *ref_hex =
                "eb2f9747573ed925e6421a9f66228a75acded92b3edf009802d27f3fcd3280a37"
                "df8c1c05d57004e45d913dad744c530ea2bb22adda4cfaf97ab972db4b43789";
            char hex[129];
            for (int i = 0; i < 64; i++) sprintf(hex + 2 * i, "%02x", kt[i]);
            hex[128] = 0;
            int ok = strncmp(hex, ref_hex, 128) == 0;
            printf("[*] kt('AAAA', seed 0x12345678) vs emulator: %s\n", ok ? "MATCH" : "FAIL");
            if (!ok) { printf("    got: %s\n", hex); return 1; }
            memcpy(SCRATCH32, save, sizeof save);
        }
    }

    /* 3. ksa round-trip on a random password */
    {
        uint8_t pwd[97], state[1024], K[1024], K2[1024];
        for (int i = 0; i < 97; i++) pwd[i] = (uint8_t)(0x21 + (i * 7) % 94);
        ksa_forward(pwd, 97, state);
        ksa_inverse(state, K);
        for (int i = 0; i < 1024; i++)
            K2[i] = (uint8_t)(((i & 0xFF) * 0x37 - 0x55) ^ pwd[i % 97]);
        int ok = memcmp(K, K2, 1024) == 0;
        printf("[*] ksa round-trip: %s\n", ok ? "OK" : "FAIL");
        if (!ok) return 1;
    }

    /* 4. forward check on a dummy password (just exercise the pipeline) */
    {
        check_result_t r;
        const uint8_t *pwd = (const uint8_t *)"TestPassword123!";
        uint32_t v = check_password(pwd, 15, &r);
        printf("[*] check(TestPassword123!) FNV=%08x r11=%08x vm_out=%08x\n",
               v, r.r11, r.vm_out);
        printf("[*] (expected verdict: DENIED, target is %08x)\n", FNV_TARGET);
    }

    printf("[*] all self-tests passed\n");
    return 0;
}
