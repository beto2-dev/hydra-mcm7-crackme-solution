/*
 * HYDRA (MCM 7) — password search (fase B).
 *
 * Any password whose FNV(check_buf) == 0x8EDA89A9 is accepted. We search
 * console-typable passwords (printable prefix + counter) with the fast C
 * pipeline. ~2^32 expected trials; optimized inner loop.
 *
 * Usage: ./hydra_search <start_hex> <end_hex> [charset] [prefix]
 *   ranges are over a 64-bit counter rendered into the password tail.
 */
#include "hydra_core.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

extern int hydra_load_tables(const char *probes_dir);
extern uint8_t T64[4][64];
extern uint8_t BLOB1[32];
uint32_t check_password(const uint8_t *pwd, size_t len, check_result_t *out);

int main(int argc, char **argv) {
    const char *probes = argc > 1 ? argv[1] : "../emulator/probes";
    uint64_t start = argc > 2 ? strtoull(argv[2], NULL, 16) : 0;
    uint64_t end   = argc > 3 ? strtoull(argv[3], NULL, 16) : 0x100000000ull;

    if (!hydra_load_tables(probes)) {
        fprintf(stderr, "[!] table load failed\n");
        return 1;
    }
    printf("[*] searching [%llx, %llx)\n", (unsigned long long)start,
           (unsigned long long)end);

    char pwd[64];
    int prefix_len = 8;
    memcpy(pwd, "HydraKey", 8);

    check_result_t res;
    uint64_t found = 0;
    time_t t0 = time(NULL);
    for (uint64_t c = start; c < end; c++) {
        /* password: fixed prefix + 8 hex digits of the counter */
        int n = prefix_len;
        for (int i = 0; i < 8; i++)
            pwd[n++] = "0123456789abcdef"[(c >> (4 * (7 - i))) & 0xF];
        /* keep trying while the prefix stays: use the counter itself */

        uint32_t v = check_password((const uint8_t *)pwd, n, &res);
        if (v == FNV_TARGET) {
            printf("\n[+] FOUND: %.*s\n", n, pwd);
            printf("    r11=%08x vm_out=%08x\n", res.r11, res.vm_out);
            printf("    check_buf: %.*s\n", 64, res.check_buf);
            FILE *f = fopen("found_password.txt", "a");
            fprintf(f, "%.*s\n", n, pwd);
            fclose(f);
            found++;
        }
        if ((c & 0xFFFFF) == 0) {
            double rate = (double)(c - start) / (double)(time(NULL) - t0 + 1);
            fprintf(stderr, "\r[*] %llx (%.0f/s)", (unsigned long long)c, rate);
        }
    }
    printf("\n[*] done, %llu found\n", (unsigned long long)found);
    return found ? 0 : 1;
}
