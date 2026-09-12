/* generated from emulator probes - do not edit */
#ifndef BITSLICE_GEN_H
#define BITSLICE_GEN_H
#include <stdint.h>
#include <stddef.h>

uint32_t BS_FWD32[32] = {
    0xc0408141u, 0x81800382u, 0x03010605u, 0x06020c0au,
    0xcc449854u, 0x58c8b0e8u, 0x70d0e090u, 0xe0a0c020u,
    0x408141c0u, 0x80038281u, 0x01060503u, 0x020c0a06u,
    0x449854ccu, 0xc8b0e858u, 0xd0e09070u, 0xa0c020e0u,
    0x8141c040u, 0x03828180u, 0x06050301u, 0x0c0a0602u,
    0x9854cc44u, 0xb0e858c8u, 0xe09070d0u, 0xc020e0a0u,
    0x41c04081u, 0x82818003u, 0x05030106u, 0x0a06020cu,
    0x54cc4498u, 0xe858c8b0u, 0x9070d0e0u, 0x20e0a0c0u,
};

uint32_t BS_INV32[32] = {
    0x42095718u, 0x8413af30u, 0x09275f60u, 0x134fbec1u,
    0x65962b9bu, 0x8925012fu, 0x50425546u, 0xa184ab8cu,
    0x09571842u, 0x13af3084u, 0x275f6009u, 0x4fbec113u,
    0x962b9b65u, 0x25012f89u, 0x42554650u, 0x84ab8ca1u,
    0x57184209u, 0xaf308413u, 0x5f600927u, 0xbec1134fu,
    0x2b9b6596u, 0x012f8925u, 0x55465042u, 0xab8ca184u,
    0x18420957u, 0x308413afu, 0x6009275fu, 0xc1134fbeu,
    0x9b65962bu, 0x2f892501u, 0x46504255u, 0x8ca184abu,
};

/* apply the 32x32 GF(2) matrix to the 4-byte group in place */
static inline uint32_t bs_apply(const uint32_t *M, uint32_t x) {
    uint32_t y = 0;
    for (int j = 0; j < 32; j++)
        y |= (uint32_t)__builtin_parity(M[j] & x) << j;
    return y;
}

#endif
