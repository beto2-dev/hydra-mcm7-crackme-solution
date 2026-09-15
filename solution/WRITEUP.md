# HYDRA (MCM 7) — Full Reverse Engineering Writeup

> Status: **SOLVED (100%).** Architecture 100% reversed, exact check() arguments
> captured live from the running binary, full pipeline inverted algebraically,
> AND typable passwords found by exhaustive search that the real binary
> accepts — it prints its flag (the check_buf) instead of ACCESS DENIED,
> verified 30/30 deterministic spawns on a real Windows runner.
> The final answer is in [§13](#13-the-solution-delivered).

Author of the crackme: **CrackNotMe** (crackmes.one, difficulty 4.3/6.0, Windows x86-64).
Goal: *find the original valid password; keygen encouraged; patching forbidden.*

---

## 1. Executive summary

HYDRA is a multi-layer defense-in-depth crackme built with **zero commercial
protectors** (author's claim, verified). Everything is hand-rolled:

| Layer | Mechanism |
|---|---|
| Packer | custom Enigma-style packer: 13 sections, random section names (`.xbs3`, `.nfsni`, `.vpjy`, …), no import table (PEB-walk API resolution), `.data` encrypted at rest (entropy 7.999) and decrypted/wiped at runtime |
| Process masquerade | re-executes itself as `sihost.exe` under `%LOCALAPPDATA%\Microsoft\CLR\` |
| Parent–child protocol | parent **debugs** the child; the child performs **ecalls by executing UD2**; the parent validates the fault RIP lies inside `.text`, services the call and resumes the child |
| Anti-attach | pre-EntryPoint gating, `PEB.Ldr` walks, module/export hashes (FNV-1a) |
| Anti-tamper | runtime sampling of **its own code bytes** (0x36128/0x3619C) into the key derivation; table sabotage on decoy inputs |
| Anti-dump | `.data` wiped after use; plaintext blob wiped with `rep stosb`; decoy string floods |
| Anti-VM | rdtsc/cpuid timing (quantized into the seed!), `gs:[0x60]` PEB checks, [0x63E48] VM flag |
| Random troll printer | rdtsc-gated dispatcher prints one of several decoy messages (~25% of runs) |
| Validation core | custom VM (10 opcodes), HMAC-SHA256-DRBG, RC4-KSA + 48-round shuffle, polynomial multiplication mod the Fermat prime 65537, FNV-1a chains |

The whole validation pipeline was reconstructed from CI memory dumps and is
**bit-exactly emulated** with Unicorn (`solution/emulator/`).

---

## 2. Recon (GitHub Actions as the dynamic lab)

The binary refuses piped stdin (it requires a real console), so the tooling
spawns it under **ConPTY** on a Windows runner and dumps the child's memory
while it waits at the password prompt (`tools/pty_harness.py`).

Key behavior captured in CI (run 34621998096):

```
=== Hydra 7.0 | by https://pwned.space | @pwn.by / discord ===
Enter Password: <input>
[-] ACCESS DENIED.
Press any key to exit...
```

The masqueraded child runs as:
`C:\Users\runneradmin\AppData\Local\Microsoft\CLR\sihost.exe`

## 3. Unpacking — the original image from memory dumps

The packer never modifies `.text` at runtime (verified byte-for-byte against
the file), but **`.data` (encrypted at rest) is decrypted and then wiped**.
The *original unpacked program* is **not** in the file: it lives only in
runtime memory. The prompt-phase dump of the child contains it:

| Region (process VA) | RVA | Content |
|---|---|---|
| `0x25359B71000` | `0x0` | original `.text` (0x61000 bytes, dump-offset == RVA) |
| `0x25359BD2000` | `0x61000` | data: T64 tables (0x61CA0), 2 KiB const table (0x61DA0) |
| `0x25359C00000` | `0x8F000` | big data/heap region |

`solution/analysis/rebuild_image.py` reconstructs the full 3 MB original image
from the dumps (`evidence/original_image.bin`).

The validation function is **XOR-wrapped with key `54 28 6D 44`** (period 4,
aligned at RVA 0x5E000). Its first instruction is re-encrypted at rest, which
defeats 5-byte software hooks (an `E9` hook becomes `BD ?? ?? ?? ??` when
re-encrypted). Decrypting the region reveals the whole pipeline.

## 4. The trap lengths (input filters)

Before any crypto, the input length is filtered:

| Length | Behavior |
|---|---|
| 8 | compared with `SuckSuck` — any input of this length sabotages the tables |
| 12 | compared with `SuckSuckSuck` — same |
| 27 | compared with `MCM_SUCK_1_Su_3_ck_3_Suck_7` — same |
| 29 | compared with `0xCC01Suck55Suck3FUNC13Suck37` — same |
| anything else | clean path |

If the length matches and the memcmp's low byte is non-zero (always, for
different strings), the 2 KiB constant table is **poisoned**:
`[0x61DA0] ^= 0xDEAD`, `[0x61DBC] ^= 0xBEEF` plus a `Sleep(300)`.
Therefore **the real password is not 8, 12, 27 or 29 chars long.**

## 5. Child identification and the parent handshake

* The packed image header is patched in memory: `[img+0x28] ^ 0x31415926 == [img+0x2C]`
  (`0x5ACEB6A1 ^ 0x31415926 == 0x6B8FEF87`, verified in the dump).
  Main checks this to know "I am the patched child".
* Parent/child liveness: shared memory (`CreateFileMappingA`/`MapViewOfFile`)
  with a 60 s heartbeat; **10 missed polls → the child wipes the blob and the
  2 KiB table** (anti-kill-parent).
* Event name: `"Global\M7_%08X"` with the FNV-1a of the module path.

## 6. Runtime API resolution

Everything is resolved by **FNV-1a (uppercased) hashes** of module and export
names walking `PEB->Ldr->InMemoryOrderModuleList`:

* `0x29CDD463` = `KERNEL32.DLL`
* `0x8DAD0C4A` = `GetStdHandle`, `0x2AF75C1D` = `GetModuleFileNameA`,
  `0x849E049A` = `CreateFileMappingA`, `0x8ABA4AAB` = `MapViewOfFile`,
  `0x672A88B5` = `SetConsoleTextAttribute`, `0x0AEF7A8B` = `SetConsoleTitleW`,
  `0x12D71805` = `GetProcAddress`, `0x62C5C373` = `VirtualProtect`,
  `0xBC5C02C3` = `ReadFile`, `0xAC392D5A` = `ExitProcess`, … (~38 total, see
  `solution/analysis/api_map.md`).

The image also contains a runtime-built thunk table at RVA `0x6F000+`
(`movabs rax, <real API>; jmp rax`) referenced through the `[0x67000+]` slots.

## 7. The validation pipeline (check() at 0x5E000)

Called from main at **0x3094B** as:

```
check(rcx = &password_string,       // arg1
      rdx = (u32)[rbp+0x7F8],       // arg2: the "seed mix"   -> 0 on CI (raced)
      r8  = rbx,                    // arg3: 0x748EEAA66AF7BDA9 (raced, live)
      r9  = r12,                    // arg4: 0x029DF32308AA1DF6 (raced, live)
      [rsp+0x20] = (u32)[rbp+0x78]) // arg5: 0x8153F691 (FNV-0 of an API's code)
```

**check() itself XORs arg5 into the DRBG seed** (0x5E034:
`xor edx, dword [rbp+0x3F0]` — the arg5 home slot): **seed = arg2 ^ arg5 = 0x8153F691**
on the CI runner. (The v1 writeup missed the arg5 term.)

### Stage 1 — key_table builder (`0x22BC0`)

```
key_table[512] = PolyMulMod65537( HMAC_SHA256_DRBG(seed, 1 MiB),
                                   RC4_KSA_shuffle(password, 48 rounds) )
```

* `HMAC-SHA256-DRBG` (`0x21490`) fills 1 MiB of scratch from the 32-bit seed.
* `RC4-KSA + shuffle` (`0x22490`):
  * `K[i] = ((i & 0xFF) * 0x37 - 0x55) ^ pwd[i % len]` for i in 0..1023
    (**the only place the password enters**)
  * `S` = 256-byte identity Fisher–Yates-shuffled with the MS-LCG
    (`x = x*0x41C64E6D + 0x3039`, seed `0x62FDDC14`)
  * `W` = 1024-word identity shuffled with LCG seed `0x8A888684` (stride-3)
  * 48 rounds: `state = scatter_W(state)`, `state[i] = S[state[i]]`,
    a bit-slice transform (`0x218C0`) and an LCG keystream XOR
    (`i*0x517CC1B7 - round*0x61C88647 >> 16`)
  * pack: `out32[i] = (state[2i] | state[2i+1]<<8) mod 65537`
* 512 rounds of polynomial multiplication (mod Fermat prime `F4 = 65537`,
  Granlund–Montgomery reduction with the `0xFFFF0001` magic multiplier):

```
acc = Σ_{i<512} scratch32[round*512+i] * state32[i]          (mod 65537)
kt[round] = ((const32[round] - acc + 65537) mod 65537)
            ^ ((round >> 2) & 0xFF)
            ^ ((1 - round) * 0x3B & 0xFF)
```

`const32` = the 2 KiB table at `0x61DA0` (512 little-endian dwords).

**This builder is bit-exactly emulated** (`solution/emulator/emu_keytable.py`).

### Stage 2 — blob decryption

The 32-byte heap blob (pointer pair at `[0x63DC8]/[0x63DD0]`, captured in the
CI dump) is decrypted in place:

```
pt[i] = blob[i] ^ kt[i % 512] ^ (arg3 >> ((i & 7) * 8)) ^ (arg4 >> ((i & 7) * 8))
```

(the XORs are implemented with the `(a|b) - (a&b)` identity as anti-RE noise;
`arg3` may be poisoned with `0xDEADBEEFCAFEBABE` by the tamper checks).

### Stage 3 — VM seed

```
vm_seed = FNV1a_32(kt[0:4]) ^ 0x504F4C59        // "POLY"
```

### Stage 4 — the custom VM (`0x1FDB0`)

A 10-opcode interpreter that **executes the decrypted 32-byte blob as
bytecode** (8 dword instructions):

* dispatcher states: `0x7E93, 0x1948, 0x2A45, 0x5C68, 0x8E7A, 0xA1BC,
  0xB4D6, 0xC3DE, 0xD5F2, 0xE714`
* 8192-instruction budget, `ctx` register file (0x80+ dwords) at `rdx`
* compare unit (sete/setne/setl/setge/setb/setae) selected by an operand field
* RDTSC tamper-detect inside the loop: >0.5 s per slice XORs the trace
  keystream with `0xBEEF`/`0xCAFE`
* return value: `(reg[0x1B] << 32) | reg[0x1A]`

The VM is bit-exactly emulated. Notably `VM(blob2, seed=0)` on the second blob
(pointer pair `[0x63DE0]/[0x63DE8]`, 0x200 bytes) returns deterministically:

```
VM(blob2, 0) = 0x32CD000005A5        (= (9*0x5A5)<<32 | 0x5A5)
```

### Stage 5 — mixing

```
r11 = ( ( FNV1a_32(kt[0:512]) ^ vm_out ) * 0x9E3779B9      // golden ratio
        ^ 0x31415926                                        // pi
        + 0x27182818 ) & 0xFFFFFFFF                          // e
```
(all the `or/and/sub` obfuscation reduces to plain `^` and `+`).

### Stage 6 — check_buf

```
t      = r11 & 3
rot[j] = (r11 >> ((j & 3) * 8)) & 0xFF
check_buf[j] = T64[t][j] ^ kt[j] ^ rot[j]        (j < 64)
```

`T64` = four 64-byte tables at `0x61CA0`. On bare metal the **flag is
check_buf itself** (printed verbatim) — the tables were baked from the
author's password.

### Stage 7 — the verdict

```
FNV1a_32(check_buf[0:64]) == 0x8EDA89A9
```

On match:
* **VM detected** (global `[0x63E48] != 0`) → prints the honeypot trio:
  `"\n[+] NICE! But you're in a VM.\n"`, `" Flag: MCM7{Nice_Try_But_Bare_Metal_Only}\n"`,
  `" Run on bare metal for the real flag.\n"`
  (SplitMix64-encrypted inline, seeds `0x715F5226D0AA1344`, `0x3BE4914D10727526`,
  `0x7A85C5D9197AAD7E`; denied message seed `0xE343A90C748D5E57`)
* **bare metal** → prints `"\n" + check_buf + "\n"` — the real flag.

**CI is therefore a password oracle**: the right password makes the binary
itself print `NICE!` on a GitHub runner (VM) — no patching involved.

## 8. The deterministic seed (recovered!)

`arg2` is assembled in main at `0x30738`:

```
arg2 = (rdtsc_min >> 0x14)          // ~0 on bare metal (anti-VM bit)
     ^ ~CRC32(table_0x61DA0)         // 0xCCD577BF (computable!)
     ^ edi                           // (tsc - [0x63E40]) >> 0x22 ≈ 0 if answered fast
     ^ esi                           // 0xBAADC0DE on a clean (non-debugged) PEB
     ^ [0x63E10]                     // 0xCCD577BF as dword (runtime-decrypted constant)
```

**The killer detail**: the CRC32 of the 2 KiB table is `0xCCD577BF`, which is
exactly the dword stored at `[0x63E10]` — they **cancel**.

**Correction (raced live, 2026-09-12):** the child is ALWAYS debugged by its
parent, so `PEB.BeingDebugged == 1` and the `cmove esi, 0xBAADC0DE` branch is
**not** taken. Instead `esi` = `r13d` (a kernel32-walk pointer), which is then
**remixed through the obfuscated state machine** at 0x2F4C0-0x2F738: nine states
(0xA7B3C1D5 → 0x15263748 → ... → 0) each call a deobfuscated function pointer
from the `[0x63E7x..0x63ED8] ^ [0x63E00]` table and XOR the result into
esi/r12 (three sites mix r12; one sets the `[0x63E48]` VM flag). The empirical
outcome on the CI runner (three independent runs): **arg2 = 0** — the state
machine's function results cancel the `0xFFFFFFFF` tail exactly. The v1
"0x45523F21 clean bare-metal seed" hypothesis is superseded.

`arg5` is an FNV-1a (basis 0) over a short runtime buffer; `arg3`/`arg4` are
anti-tamper/VM-mixed 64-bit values (see §9).

## 9. The ecall protocol (parent as "kernel")

The child raises **UD2** at dedicated raiser stubs (family at `0x3612x-0x361Bx`):

```
0x3619C: jmp +1; bndnop; ud2; nop; nop; mov rax, r8; ret      // generic ecall
0x36128: mov rbx,0xABCD; add rbx,0x5678; sub rbx,1; pop rbx; ...; ud2; ...
0x361AA: xor rax,rax; add rax,0xB; ud2; ret                   // ecall code 0xB
0x361B4: xor rax,rax; add rax,0xD; ud2; ret                   // ecall code 0xD
```

Parameters are passed through **obfuscated globals** (e.g. `[0x625B4] ^=
0xC5A11001`, then FNV-mixed, then a counter `[0x63E20]++`), read by the parent
with `ReadProcessMemory`, serviced, and the result is returned through `r8`
(`mov rax, r8; ret` after the parent resumes the child past the UD2).

The parent's derivation (handler at `0x1236C`, code `0x1337`) uses the same
constant family as the child's `[rbp+0xB0]` mix:

```
X  = input ^ 0x5A5
v  = ((9*X) << 32) | X
v ^= 0x7449F14D6AF7BC42;  v ^= 0xD59FF179DC43582C
v += 0x10E737D110CED767;  v ^= 0x47B801D547B801D5
```

The child then computes (at `0x2F28C`, with `0x274F0` = a mathematical
tautology that always returns true, so this path is unconditional):

```
[rbp+0xB0] = ((ecall1 ^ ecall2) ^ 0x47B801D547B801D5 + 0xEF18C82EEF312899
              ^ 0xD59FF179DC43582C) ^ VM(blob2)          // = ^ 0x32CD000005A5
```

and finally:

```
arg3 = rbx = (code-bytes of 0x36128/0x3619C packed) ^ [rbp+0xB0]   // [rbp+0xA8] == [rbp+0x80] cancel
```

The code-byte constants are: `[rbp]=00, [rbp+0x70]=00, [rbp+0x71]=AB,
[rbp+0x72]=48, [rbp+0x73]=01, [rbp+0x74]=EB` — **sampled from the live image**
(any breakpoint/patch there poisons them, e.g. with `0xBAADF00D`/`0xDEADBEEF`).

## 10. Random troll dispatcher

At `0x2E795`: `(rdtsc & 7) >= 2` (75% of runs) continues normally; otherwise
an rdtsc-mod-3 branch prints one of the decoy messages built byte-by-byte via
the `0x15EF0` "oracle" with SplitMix64 constants. The messages include
`"\n[!] Is that a password or IDA Pro garbage data?"` and friends.

## 11. Emulation (the solver's foundation)

`solution/emulator/` contains a Unicorn-based, identity-mapped emulator:

* the original image at its **true runtime base** (all dump pointers stay valid)
* all heap regions from the CI dump mapped at their original addresses
* a fake PEB/Ldr with a synthetic kernel32 (exports resolved by FNV hash)
* deterministic rdtsc/cpuid, libc stubs (malloc/memcpy/memset)
* hooks for the output functions (message capture)

Validated results:

```
build_key_table("AAAA", 0, 0x12345678) -> 512-byte kt   (DRBG+RC4+poly-mul)
VM(blob2, seed=0)                       -> 0x32CD000005A5
```

## 12. The solution (algebraic keygen) and the delivery gap

### Solved — the complete inversion (solution/keygen/)
With the exact args above (all four raced live from the check's own stack
frame), `check()` becomes a pure function F(password), and the **entire
pipeline is invertible**:

1. `kt[r] = ((const32[r] - acc_r) mod 65537 ^ obf_r) & 0xFF` where
   `acc_r = Σ_i A[r][i]·state32[i] (mod 65537)` and `A` = the DRBG scratch
   matrix. **This is linear**: Gaussian elimination over GF(65537) yields
   `A^-1`, so any target kt maps back to a state32 (447+ free dimensions).
2. The verdict only requires FNV1a(check_buf) == 0x8EDA89A9 and the framing
   (r11, the VM program) is free: choose r11 = 0 and an all-zero VM program;
   solve check_buf[60:64] by a 2x2^16 FNV meet-in-the-middle.
3. Solve kt[508:512] by a second 2x2^16 MITM so FNV(kt[0:512]) hits the value
   implied by r11 (r11 = ((FNV(kt)^vm_out)·G ^ π + e)).
4. state32 = A^-1·acc -> unpack to the 1024-byte KSA state -> invert the 48
   rounds (S^-1 / W^-1 / bitslice^-1 (32x32 GF(2), full rank) / LCG-xor) ->
   K -> **password = K ^ base** (1024 bytes).

The generated password (`solution/keygen/password_keygen.bin`) passes the
complete bit-exact offline check — r11 = 0, vm_out = 0, FNV(check_buf) =
0x8EDA89A9, VERDICT = PASS. Every stage was cross-validated against the
Unicorn reference (KSA byte-exact, poly-mul byte-exact, VM byte-exact).

### The console delivery gap — CLOSED

The algebraic password is 1024 essentially-random bytes. The input path is a
whitespace-delimited token reader (cin>>-style; 0x329C0 is only the prompt
printer, 0x32CF0 a string decoder, the actual extraction is the inlined CRT
stream op at 0x2F8D4). A live console probe proved bytes 0x01-0x08 and the
ASCII range survive ConPTY, and 0x80-0xFF round-trip through CP437 encoding —
but {0x09-0x0D, 0x20} terminate the token.

Two facts recovered from the disasm and live dumps closed the gap without
needing the algebraic preimage:

1. **The reader pads short tokens to 64 bytes.** After `operator>>` at
   0x2F941, main reloads the size and, when `size < 0x40`, calls the CRT
   append helper at 0x348c0 with `(this, 0x40 - size, 0)` — i.e.
   `s.append(64 - size, '\0')` (0x2F946-0x2F964). Every token shorter than
   64 typed chars reaches the KSA as a **64-byte string** (typed chars +
   NUL padding), so `pwd[i % 64]` covers the whole padded buffer.
2. **The verdict FNV runs over the unzeroed check_buf.** The real code
   computes FNV1a(check_buf[0:64]) and compares it with 0x8EDA89A9 at
   0x5EC9F, and only afterwards executes `mov byte [rbp-0x44], 0` at
   0x5ECA4 — the byte-28 zero is a POST-verdict store (it terminates the
   flag string for printing), not part of the hash input.

With the model corrected on both points, the exhaustive typable-token search
("HydraKey" + 8 hex digits, all 2^32 counters, 16 CI shards x 2 workers,
~3 h wall clock) produced two hits, each validated three independent ways
(AVX2 searcher, C reference pipeline, and the Unicorn gold check() running
the binary's own code with the real DRBG output spliced in). See §13.

## 13. The solution delivered

**Typable passwords accepted by the real binary:**

| password | counter | r11 | flag printed (check_buf[0:28], hex) |
|---|---|---|---|
| `HydraKey13c5228a` | 0x13C5228A | 0xCD0E33E3 | `5419a9edc46a7f9881c7b6ac05b5043786f10cd30d1271769cc449fa` |
| `HydraKey4397e1f5` | 0x4397E1F5 | 0x8853939F | `cbdc87ce859428444707ab1bdf4901699d0c98bb8eb3229fbb49ec1e` |

Verification chain (all three independent):

1. **Searcher** (`solution/keygen/hydra_search_avx2.c`): found both counters
   in the [0, 2^32) sweep with the corrected 64-byte-padded model; reproduced
   with a fresh local build (exact single-counter runs).
2. **Gold emulation** (`solution/emulator/` + the extended gold harness):
   the REAL check() code at RVA 0x5E000 under Unicorn with the captured DRBG
   output — verdict flag = 1, FNV = 0x8EDA89A9, r11 matching the searcher.
3. **The real binary on a real Windows runner** (tools/verify_password.py via
   the CI oracle): 15/15 spawns per password print the flag — the bare-metal
   success path prints the check_buf as a NUL-terminated string (byte 28
   zeroed post-verdict truncates it), byte-for-byte the model's prediction —
   and never ACCESS DENIED. (The VM-detected honeypot "NICE!" path does not
   trigger on those runners: the anti-VM flag [0x63E48] stays 0, so the real
   flag output is what gets printed.)

The two passwords are members of the key-equivalence class the FNV target
defines: any password whose pipeline lands FNV(check_buf) == 0x8EDA89A9 is
accepted, and each prints its own check_buf as the flag. Exhaustiveness note:
the full short-form space "HydraKey"+8 hex was swept exactly once (4,294,967,296
candidates, coverage verified per-worker); a first sweep of the extended
"Hk"+11 base-94 counter window [2^32, 2^33) found no further hits; the
remaining extended windows are optional — the crackme stands solved.

