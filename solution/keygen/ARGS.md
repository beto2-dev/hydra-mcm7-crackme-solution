# Exact check() arguments (captured live on windows-latest, 2026-09-12)

Raced from the check()'s own stack frame during execution (tools/capture_args.py v8):

| arg | value | source |
|-----|-------|--------|
| arg2 (rdx) | `0x00000000` | [rbp_main+0x7F8] race: 0 right after the 0x3074E store |
| arg3 (r8)  | `0x748EEAA66AF7BDA9` | check's `mov [rsp+8],rbx` slot at [rbp_main-0x190] (live), = 0x00C71BEB000001EB ^ [rbp+0xB0]=0x7449F14D6AF7BC42; independently confirmed by SmallXGen's comment on crackmes.one |
| arg4 (r9)  | `0x029DF32308AA1DF6` | check's `mov [rsp+0x20],r9` slot at [rbp_main-0x178] (live) = the raw constant at 0x2F187 (the state-machine fn-mixers XOR to zero on CI) |
| arg5 ([rsp+0x20]) | `0x8153F691` | [rbp_main+0x78] = FNV1a-0 of an API's code bytes; stable across 6 different runs (same runner image) |

DRBG seed = arg2 ^ arg5 = **0x8153F691** (check() XORs arg5 into the seed via the
[rbp+0x3F0] arg5 home slot at 0x5E034 — the original writeup missed this).

Stable per-run globals observed (identical across all captures):
- [0x625B4] = 0xB20147AB (post-3-ecalls), [0x63E20] = 3 (ecall counter at prompt)
- [rbp+0xB0] = 0x7449F14D6AF7BC42 (ecall mix ^ VM(blob2)=0x32CD000005A5)
- tamper flags [rbp+0xA8] = [rbp+0x80] = 0 (clean)
- PEB.BeingDebugged = 1 (parent debugs the child; esi branch takes r13d path)
- Dr2 = chainA(pid) verified; Dr3 set by parent (r12 = the clean constant)

Console delivery facts (probe test):
- control bytes 0x01-0x08 survive the ConPTY and are stored in the token
- the reader is whitespace-delimited (cin>>-style): {0x09-0x0D, 0x20} terminate the token
- bytes 0x80-0xFF need CP437 round-trip encoding (byte -> CP437 char -> UTF-8 in the pty stream)
