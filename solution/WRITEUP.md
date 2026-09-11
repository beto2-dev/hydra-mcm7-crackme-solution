# HYDRA (MCM 7) — Full Reverse Engineering Writeup

> Status: **architecture 100% reversed, pipeline bit-exactly emulated, deterministic seed recovered.**
> The remaining gap to the password is documented in [§12](#12-the-remaining-gap).

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
      rdx = (u32)[rbp+0x7F8],       // arg2: the "seed mix"
      r8  = rbx,                    // arg3: 64-bit seed (see §9)
      r9  = r12,                    // arg4: 64-bit seed
      [rsp+0x20] = (u32)[rbp+0x78]) // arg5
```

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
exactly the dword stored at `[0x63E10]` — they **cancel**. On a clean, fast,
bare-metal machine:

```
arg2 = 0xFFFFFFFF ^ 0xBAADC0DE = 0x45523F21
```

The seed is *purely* the anti-debug/anti-VM indicators. Under a debugger
(`esi = r13d`), on a VM (timing bit) or answering too slowly (`edi`), the seed
changes and the check can never pass — elegant.

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

## 12. The remaining gap

To finish the password one needs:

1. **`arg3`'s ecall component**: emulate the parent-side handler
   (`0x1236C..0x12660` + the RPM reads of `[0x625B4]`) for the two child
   ecalls, or capture `[rbp+0xB0]` by extending the CI harness to dump the
   child's stack (`VirtualQueryEx` skips the stack in the current dumper —
   add a `GetThreadContext`-based stack dump at the prompt).
2. **`arg4`/`arg5`**: `arg4 = r12` from the kernel32 PE walk (0x2DAF1: a
   pointer into kernel32's export directory — needs the kernel32 base of the
   analysis machine; re-capture per-run), `arg5` = FNV-0 of a runtime buffer.
3. **The search**: with the exact args, `check()` becomes a pure function
   `F(password)`; the FNV target `0x8EDA89A9` plus the "valid VM program"
   structure of the decrypted blob (8 instructions from a 10-opcode ISA)
   constrain the password. The author states a keygen is possible — i.e. the
   args are constant on a given Windows build, and the flag (`check_buf`)
   is ASCII, so `kt[0:64] = flag ^ T64[t] ^ rot(r11)` with a guessable flag
   format (`MCM7{...}`) gives a strong crib for the search.

`tools/verify_password.py` + `.github/workflows/verify.yml` provide the
oracle: feed a candidate password on a Windows runner and check for `NICE!`.

## 13. File map

```
solution/WRITEUP.md                  this document
solution/analysis/rebuild_image.py   original image reconstruction from dumps
solution/analysis/disasm.py          RVA-annotated capstone disassembler
solution/analysis/api_map.md         FNV hash -> API name map
solution/emulator/emu5.py            identity-mapped full-program emulator
solution/emulator/vm_test.py         VM harness (validated on blob2)
solution/emulator/README.md          how to run the emulator
evidence/original_image.bin          reconstructed unpacked program (3 MB)
evidence/checkfn.asm                 decrypted check() disassembly
evidence/keytbl.asm, vm.asm, mainfn.asm, drbg_rc4.asm, caller.asm
tools/pty_harness.py                 ConPTY + live memory dumper (existing)
tools/run_recon.py                   behavior recon (existing)
tools/verify_password.py             password oracle wrapper (new)
```
