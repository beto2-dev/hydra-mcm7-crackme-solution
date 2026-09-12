/*
 * HYDRA (MCM 7) custom VM (0x1FDB0) — exact C transcription of the asm.
 * 10 opcodes, self-modifying code XORed with an evolving keystream when
 * seeded, ctx[32] = PC, return (ctx[15] << 32) | ctx[14].
 */
#include "hydra_core.h"
#include <string.h>

#define VM_OPCODE_KEY 0x91u      /* [0x63DA8] = arg5 low byte */

static uint64_t vm_tsc;
static inline uint32_t vm_rdtsc32(void) {
    vm_tsc += 0x100;
    return (uint32_t)vm_tsc;
}

static inline int32_t sign12(uint32_t v) {
    v &= 0xFFF;
    return (v & 0x800) ? (int32_t)(v | 0xFFFFF000u) : (int32_t)v;
}

static inline void xor_code_at(uint8_t *code, uint32_t at, uint32_t v) {
    uint32_t d;
    memcpy(&d, code + at, 4);
    d ^= v;
    memcpy(code + at, &d, 4);
}

uint64_t hydra_vm(const uint8_t *code_in, size_t size, uint32_t seed,
                 uint8_t *code_out)
{
    uint8_t code[8192];
    uint32_t ctx[64];
    memset(ctx, 0, sizeof(ctx));
    if (size > sizeof(code)) size = sizeof(code);
    memcpy(code, code_in, size);

    uint32_t esi = seed;
    uint32_t budget = 0x2000;
    int halted = 0;
    uint32_t pc = 0;                 /* ctx[32] */
    vm_tsc = 0x1122334455667788ull;
    (void)vm_rdtsc32();              /* entry rdtsc */

    while (budget-- && !halted) {
        /* ---------------- FETCH (state 0x7E93) ---------------- */
        uint32_t insn;
        if ((uint64_t)pc >= size || (uint64_t)pc + 4 > size) {
            halted = 1;              /* OOB -> state 0x1948 -> exit */
            break;
        }
        uint32_t fetch_pc = pc;
        if (seed != 0) {
            if (esi != 0)
                xor_code_at(code, pc, esi);
            memcpy(&insn, code + pc, 4);
            if (esi & 1) {
                uint32_t r = 28 + ((esi >> 3) & 3);
                ctx[r] ^= esi * GOLDEN;
            }
        } else {
            memcpy(&insn, code + pc, 4);
        }
        ctx[0] = 0;

        /* ---------------- DECODE (state 0xB4D6) ---------------- */
        uint32_t t = insn ^ VM_OPCODE_KEY;   /* low byte only */
        uint8_t op   = t & 0xFF;
        uint8_t regA = (t >> 7) & 0x1F;
        uint8_t regB = (t >> 20) & 0x1F;
        uint8_t regC = (t >> 15) & 0x1F;
        uint8_t alu  = (t >> 12) & 7;
        uint8_t flags = (uint8_t)(insn >> 25);

        uint32_t k1 = esi * FNV_PRIME;   /* ((delta>>28)^esi)*P, delta==0 */

        switch (op) {
        case 0x3A: case 0x4B: case 0x6D: {   /* ALU1: dst = op(ctx[regC], imm12) */
            uint32_t imm = (uint32_t)sign12(insn >> 20);
            uint32_t X = ctx[regC], r;
            switch (alu) {
            case 0: r = X + imm; break;
            case 1: r = X << (imm & 0x1F); break;
            case 2: r = (int32_t)X < (int32_t)imm ? 1u : 0u; break;
            case 3: r = X < imm ? 1u : 0u; break;
            case 4: r = X ^ imm; break;
            case 5: r = (flags & 0x20) ? (uint32_t)((int32_t)X >> (imm & 0x1F))
                                       : X >> (imm & 0x1F); break;
            case 6: r = X | imm; break;
            default: r = X & imm; break;
            }
            if (regA) ctx[regA] = r;
            ctx[32] = pc + 4;
            if (seed != 0) {
                esi = (k1 ^ (regA ? ctx[regA] : 0) ^ ctx[regC]) * FNV_PRIME;
                xor_code_at(code, fetch_pc, esi);
            }
            break;
        }
        case 0xA3: case 0x5C: case 0x6E: {   /* ALU2: dst = op(ctx[regC], ctx[regB]) */
            uint32_t X = ctx[regC], Y = ctx[regB], r;
            switch (alu) {
            case 0: r = (flags & 0x20) ? (uint32_t)((int32_t)X - (int32_t)Y)
                                       : X + Y; break;
            case 1: r = X << (Y & 0x1F); break;
            case 2: r = (int32_t)X < (int32_t)Y ? 1u : 0u; break;
            case 3: r = X < Y ? 1u : 0u; break;
            case 4: r = X ^ Y; break;
            case 5: r = (flags & 0x20) ? (uint32_t)((int32_t)X >> (Y & 0x1F))
                                       : X >> (Y & 0x1F); break;
            case 6: r = X | Y; break;
            default: r = X & Y; break;
            }
            if (regA) ctx[regA] = r;
            ctx[32] = pc + 4;
            if (seed != 0) {
                esi = (k1 ^ (regA ? ctx[regA] : 0) ^ ctx[regC] ^ ctx[regB]) * FNV_PRIME;
                xor_code_at(code, fetch_pc, esi);
            }
            break;
        }
        case 0xC8: case 0x7F: {              /* compare-branch */
            int taken;
            switch (alu) {
            case 0: taken = (ctx[regC] == ctx[regB]); break;
            case 1: taken = (ctx[regC] != ctx[regB]); break;
            case 4: taken = ((int32_t)ctx[regC] < (int32_t)ctx[regB]); break;
            case 5: taken = ((int32_t)ctx[regC] >= (int32_t)ctx[regB]); break;
            case 6: taken = (ctx[regC] < ctx[regB]); break;
            case 7: taken = (ctx[regC] >= ctx[regB]); break;
            default: taken = 0; break;
            }
            uint32_t off = ((insn >> 8) & 0xF) << 1
                         | (((insn >> 13) & 0x3F) << 5)
                         | (((insn >> 7) & 1) << 11)
                         | ((insn >> 31) << 12);
            if (off & 0x1000) off |= 0xFFFFE000u;
            ctx[32] = pc + (taken ? off : 4u);
            if (seed != 0) {
                esi = (k1 ^ (taken ? 0xBEEFu : 0xCAFEu) ^ ctx[regC] ^ ctx[regB])
                    * FNV_PRIME;
                xor_code_at(code, fetch_pc, esi);
            }
            break;
        }
        case 0xD7: case 0x8D: {              /* branch (+link) */
            uint32_t off = (((insn >> 11) & 0xFFC00u) >> 9)
                         | ((insn & 0x100000u) >> 9)
                         | (insn & 0xFF000u)
                         | ((insn >> 31) << 20);
            if (off & 0x100000) off |= 0xFFE00000u;
            if (regA) ctx[regA] = pc + 4;
            ctx[32] = pc + off;
            if (seed != 0) {
                esi = (k1 ^ (regA ? ctx[regA] : 0) ^ off) * FNV_PRIME;
                xor_code_at(code, fetch_pc, esi);
            }
            break;
        }
        case 0x2E: case 0x92: case 0xA1: {   /* SYS by imm12 */
            int32_t imm = sign12(insn >> 20);
            if (imm <= 1) { halted = 1; break; }
            if (imm == 2) {                   /* RDTSC -> ctx[regA] */
                if (regA) ctx[regA] = vm_rdtsc32();
                ctx[32] = pc + 4;
                if (seed != 0) {
                    esi = (k1 ^ 0xABCD1234u) * FNV_PRIME;
                    xor_code_at(code, fetch_pc, esi);
                }
            } else if (imm == 3) {           /* esi -> ctx[regA] */
                if (regA) ctx[regA] = esi;
                ctx[32] = pc + 4;
                if (seed != 0) {
                    esi = (k1 ^ esi) * FNV_PRIME;
                    xor_code_at(code, fetch_pc, esi);
                }
            } else {
                ctx[32] = pc + 4;             /* nop: no keystream update */
            }
            break;
        }
        case 0x51: {                          /* LOAD */
            uint32_t imm = (uint32_t)sign12(insn >> 20);
            uint32_t addr = ctx[regC] + imm;
            uint32_t val = 0xDEADDEADu;
            if ((uint64_t)addr + 4 <= size)
                memcpy(&val, code + addr, 4);
            if (regA) ctx[regA] = val;
            ctx[32] = pc + 4;
            if (seed != 0) {
                esi = (k1 ^ (regA ? ctx[regA] : 0) ^ val) * FNV_PRIME;
                xor_code_at(code, fetch_pc, esi);
            }
            break;
        }
        case 0x73: {                          /* STORE */
            uint32_t off2 = ((insn >> 7) & 0x1F) | ((insn >> 8) & 0xFE0);
            if (off2 & 0x800) off2 |= 0xFFFFF000u;
            uint32_t addr = ctx[regC] + off2;
            if ((uint64_t)addr + 4 <= size) {
                uint32_t v = ctx[regB];
                memcpy(code + addr, &v, 4);
            }
            ctx[32] = pc + 4;
            if (seed != 0) {
                esi = (k1 ^ (regA ? ctx[regA] : 0) ^ addr) * FNV_PRIME;
                xor_code_at(code, fetch_pc, esi);
            }
            break;
        }
        default:
            halted = 1;
            break;
        }
        pc = ctx[32];
    }

    if (code_out && size <= 8192)
        memcpy(code_out, code, size);

    return ((uint64_t)ctx[15] << 32) | (uint64_t)ctx[14];
}
