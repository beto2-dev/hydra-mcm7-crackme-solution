0005E000  48895c2408                 mov qword ptr [rsp + 8], rbx
0005E005  4c894c2420                 mov qword ptr [rsp + 0x20], r9
0005E00A  55                         push rbp
0005E00B  56                         push rsi
0005E00C  57                         push rdi
0005E00D  4154                       push r12
0005E00F  4155                       push r13
0005E011  4156                       push r14
0005E013  4157                       push r15
0005E015  488dac2470fcffff           lea rbp, [rsp - 0x390]
0005E01D  4881ec90040000             sub rsp, 0x490
0005E024  4d8bf1                     mov r14, r9
0005E027  4d8be8                     mov r13, r8
0005E02A  c785d803000000000000       mov dword ptr [rbp + 0x3d8], 0
0005E034  3395f0030000               xor edx, dword ptr [rbp + 0x3f0]
0005E03A  448bca                     mov r9d, edx
0005E03D  488bd1                     mov rdx, rcx
0005E040  488d8d90000000             lea rcx, [rbp + 0x90]
0005E047  e8744bfcff                 call 0x22bc0
0005E04C  90                         nop 
0005E04D  bec59d1c81                 mov esi, 0x811c9dc5
0005E052  48833dae5d000000           cmp qword ptr [rip + 0x5dae], 0   ; -> 0x63e08
0005E05A  0f84d1000000               je 0x5e131
0005E060  48c785d803000040000000     mov qword ptr [rbp + 0x3d8], 0x40
0005E06B  65488b042560000000         mov rax, qword ptr gs:[0x60]
0005E074  4c8b5018                   mov r10, qword ptr [rax + 0x18]
0005E078  4983c220                   add r10, 0x20
0005E07C  4d8b0a                     mov r9, qword ptr [r10]
0005E07F  4d3bca                     cmp r9, r10
0005E082  7459                       je 0x5e0dd
0005E084  498b7950                   mov rdi, qword ptr [r9 + 0x50]
0005E088  4885ff                     test rdi, rdi
0005E08B  7448                       je 0x5e0d5
0005E08D  448bc6                     mov r8d, esi
0005E090  0fb707                     movzx eax, word ptr [rdi]
0005E093  6685c0                     test ax, ax
0005E096  743d                       je 0x5e0d5
0005E098  0f1f840000000000           nop dword ptr [rax + rax]
0005E0A0  488d7f02                   lea rdi, [rdi + 2]
0005E0A4  8d509f                     lea edx, [rax - 0x61]
0005E0A7  0fb6c8                     movzx ecx, al
0005E0AA  2c20                       sub al, 0x20
0005E0AC  6683fa19                   cmp dx, 0x19
0005E0B0  0f47c1                     cmova eax, ecx
0005E0B3  0fbec0                     movsx eax, al
0005E0B6  4133c0                     xor eax, r8d
0005E0B9  4469c093010001             imul r8d, eax, 0x1000193
0005E0C0  0fb707                     movzx eax, word ptr [rdi]
0005E0C3  6685c0                     test ax, ax
0005E0C6  75d8                       jne 0x5e0a0
0005E0C8  4181f863d4cd29             cmp r8d, 0x29cdd463
0005E0CF  0f8471020000               je 0x5e346
0005E0D5  4d8b09                     mov r9, qword ptr [r9]
0005E0D8  4d3bca                     cmp r9, r10
0005E0DB  75a7                       jne 0x5e084
0005E0DD  33c0                       xor eax, eax
0005E0DF  488d8df0030000             lea rcx, [rbp + 0x3f0]
0005E0E6  48894c2428                 mov qword ptr [rsp + 0x28], rcx
0005E0EB  488d8dd8030000             lea rcx, [rbp + 0x3d8]
0005E0F2  48894c2420                 mov qword ptr [rsp + 0x20], rcx
0005E0F7  4c8d8d90010000             lea r9, [rbp + 0x190]
0005E0FE  41b800100000               mov r8d, 0x1000
0005E104  488b15fd5c0000             mov rdx, qword ptr [rip + 0x5cfd]   ; -> 0x63e08
0005E10B  33c9                       xor ecx, ecx
0005E10D  ffd0                       call rax
0005E10F  4c8bb5e8030000             mov r14, qword ptr [rbp + 0x3e8]
0005E116  85c0                       test eax, eax
0005E118  7517                       jne 0x5e131
0005E11A  4883bdd803000000           cmp qword ptr [rbp + 0x3d8], 0
0005E122  760d                       jbe 0x5e131
0005E124  48b8bebafecaefbeadde       movabs rax, 0xdeadbeefcafebabe
0005E12E  4c33e8                     xor r13, rax
0005E131  0f57c0                     xorps xmm0, xmm0
0005E134  f30f7f45e8                 movdqu xmmword ptr [rbp - 0x18], xmm0
0005E139  48c745f800000000           mov qword ptr [rbp - 8], 0
0005E141  488b15885c0000             mov rdx, qword ptr [rip + 0x5c88]   ; -> 0x63dd0
0005E148  482b15795c0000             sub rdx, qword ptr [rip + 0x5c79]   ; -> 0x63dc8
0005E14F  7449                       je 0x5e19a
0005E151  488d4de8                   lea rcx, [rbp - 0x18]
0005E155  e8c677fdff                 call 0x35920
0005E15A  488b5de8                   mov rbx, qword ptr [rbp - 0x18]
0005E15E  488b15635c0000             mov rdx, qword ptr [rip + 0x5c63]   ; -> 0x63dc8
0005E165  488b3d645c0000             mov rdi, qword ptr [rip + 0x5c64]   ; -> 0x63dd0
0005E16C  482bfa                     sub rdi, rdx
0005E16F  4c8bc7                     mov r8, rdi
0005E172  488bcb                     mov rcx, rbx
0005E175  e8669affff                 call 0x57be0
0005E17A  488d041f                   lea rax, [rdi + rbx]
0005E17E  488945f0                   mov qword ptr [rbp - 0x10], rax
0005E182  48c785d803000000000000     mov qword ptr [rbp + 0x3d8], 0
0005E18D  488d8dd8030000             lea rcx, [rbp + 0x3d8]
0005E194  e82777fdff                 call 0x358c0
0005E199  90                         nop 
0005E19A  4533c9                     xor r9d, r9d
0005E19D  4c8b55e8                   mov r10, qword ptr [rbp - 0x18]
0005E1A1  4c3955f0                   cmp qword ptr [rbp - 0x10], r10
0005E1A5  7478                       je 0x5e21f
0005E1A7  660f1f840000000000         nop word ptr [rax + rax]
0005E1B0  488b8d98000000             mov rcx, qword ptr [rbp + 0x98]
0005E1B7  488bbd90000000             mov rdi, qword ptr [rbp + 0x90]
0005E1BE  482bcf                     sub rcx, rdi
0005E1C1  33d2                       xor edx, edx
0005E1C3  498bc1                     mov rax, r9
0005E1C6  48f7f1                     div rcx
0005E1C9  440fb6043a                 movzx r8d, byte ptr [rdx + rdi]
0005E1CE  498bc9                     mov rcx, r9
0005E1D1  83e107                     and ecx, 7
0005E1D4  48c1e103                   shl rcx, 3
0005E1D8  498bd5                     mov rdx, r13
0005E1DB  48d3ea                     shr rdx, cl
0005E1DE  498bfe                     mov rdi, r14
0005E1E1  48d3ef                     shr rdi, cl
0005E1E4  0fb6c2                     movzx eax, dl
0005E1E7  410ac0                     or al, r8b
0005E1EA  4122d0                     and dl, r8b
0005E1ED  2ac2                       sub al, dl
0005E1EF  0fb6d0                     movzx edx, al
0005E1F2  400ad7                     or dl, dil
0005E1F5  4022c7                     and al, dil
0005E1F8  2ad0                       sub dl, al
0005E1FA  430fb6040a                 movzx eax, byte ptr [r10 + r9]
0005E1FF  0fb6c8                     movzx ecx, al
0005E202  0aca                       or cl, dl
0005E204  22c2                       and al, dl
0005E206  2ac8                       sub cl, al
0005E208  43880c0a                   mov byte ptr [r10 + r9], cl
0005E20C  49ffc1                     inc r9
0005E20F  488b45f0                   mov rax, qword ptr [rbp - 0x10]
0005E213  4c8b55e8                   mov r10, qword ptr [rbp - 0x18]
0005E217  492bc2                     sub rax, r10
0005E21A  4c3bc8                     cmp r9, rax
0005E21D  7291                       jb 0x5e1b0
0005E21F  488bbd90000000             mov rdi, qword ptr [rbp + 0x90]
0005E226  0fb607                     movzx eax, byte ptr [rdi]
0005E229  33c6                       xor eax, esi
0005E22B  69c893010001               imul ecx, eax, 0x1000193
0005E231  0fb64701                   movzx eax, byte ptr [rdi + 1]
0005E235  33c8                       xor ecx, eax
0005E237  69d193010001               imul edx, ecx, 0x1000193
0005E23D  0fb64702                   movzx eax, byte ptr [rdi + 2]
0005E241  33d0                       xor edx, eax
0005E243  69ca93010001               imul ecx, edx, 0x1000193
0005E249  0fb64703                   movzx eax, byte ptr [rdi + 3]
0005E24D  33c8                       xor ecx, eax
0005E24F  4469c193010001             imul r8d, ecx, 0x1000193
0005E256  4181f0594c4f50             xor r8d, 0x504f4c59
0005E25D  0f57c0                     xorps xmm0, xmm0
0005E260  33c0                       xor eax, eax
0005E262  0f118500010000             movups xmmword ptr [rbp + 0x100], xmm0
0005E269  0f118510010000             movups xmmword ptr [rbp + 0x110], xmm0
0005E270  0f118520010000             movups xmmword ptr [rbp + 0x120], xmm0
0005E277  0f118530010000             movups xmmword ptr [rbp + 0x130], xmm0
0005E27E  0f118540010000             movups xmmword ptr [rbp + 0x140], xmm0
0005E285  0f118550010000             movups xmmword ptr [rbp + 0x150], xmm0
0005E28C  0f118560010000             movups xmmword ptr [rbp + 0x160], xmm0
0005E293  0f118570010000             movups xmmword ptr [rbp + 0x170], xmm0
0005E29A  898580010000               mov dword ptr [rbp + 0x180], eax
0005E2A0  488d9500010000             lea rdx, [rbp + 0x100]
0005E2A7  488d4de8                   lea rcx, [rbp - 0x18]
0005E2AB  e8001bfcff                 call 0x1fdb0
0005E2B0  4c8bf8                     mov r15, rax
0005E2B3  488985d8030000             mov qword ptr [rbp + 0x3d8], rax
0005E2BA  488b4df0                   mov rcx, qword ptr [rbp - 0x10]
0005E2BE  488b7de8                   mov rdi, qword ptr [rbp - 0x18]
0005E2C2  482bcf                     sub rcx, rdi
0005E2C5  33c0                       xor eax, eax
0005E2C7  f3aa                       rep stosb byte ptr [rdi], al
0005E2C9  65488b142560000000         mov rdx, qword ptr gs:[0x60]
0005E2D2  4c8b5a18                   mov r11, qword ptr [rdx + 0x18]
0005E2D6  4983c320                   add r11, 0x20
0005E2DA  4d8b13                     mov r10, qword ptr [r11]
0005E2DD  4d3bd3                     cmp r10, r11
0005E2E0  0f8486030000               je 0x5e66c
0005E2E6  4d8b4250                   mov r8, qword ptr [r10 + 0x50]
0005E2EA  4d85c0                     test r8, r8
0005E2ED  744a                       je 0x5e339
0005E2EF  448bce                     mov r9d, esi
0005E2F2  410fb700                   movzx eax, word ptr [r8]
0005E2F6  6685c0                     test ax, ax
0005E2F9  743e                       je 0x5e339
0005E2FB  0f1f440000                 nop dword ptr [rax + rax]
0005E300  4d8d4002                   lea r8, [r8 + 2]
0005E304  8d789f                     lea edi, [rax - 0x61]
0005E307  0fb6d0                     movzx edx, al
0005E30A  2c20                       sub al, 0x20
0005E30C  0fb6c8                     movzx ecx, al
0005E30F  6683ff19                   cmp di, 0x19
0005E313  0f47ca                     cmova ecx, edx
0005E316  0fbec1                     movsx eax, cl
0005E319  4133c1                     xor eax, r9d
0005E31C  4469c893010001             imul r9d, eax, 0x1000193
0005E323  410fb700                   movzx eax, word ptr [r8]
0005E327  6685c0                     test ax, ax
0005E32A  75d4                       jne 0x5e300
0005E32C  4181f963d4cd29             cmp r9d, 0x29cdd463
0005E333  0f848f020000               je 0x5e5c8
0005E339  4d8b12                     mov r10, qword ptr [r10]
0005E33C  4d3bd3                     cmp r10, r11
0005E33F  75a5                       jne 0x5e2e6
0005E341  e926030000                 jmp 0x5e66c
0005E346  498b5920                   mov rbx, qword ptr [r9 + 0x20]
0005E34A  4885db                     test rbx, rbx
0005E34D  0f848afdffff               je 0x5e0dd
0005E353  4863433c                   movsxd rax, dword ptr [rbx + 0x3c]
0005E357  480588000000               add rax, 0x88
0005E35D  4803c3                     add rax, rbx
0005E360  488945e0                   mov qword ptr [rbp - 0x20], rax
0005E364  8b4804                     mov ecx, dword ptr [rax + 4]
0005E367  898df0030000               mov dword ptr [rbp + 0x3f0], ecx
0005E36D  85c9                       test ecx, ecx
0005E36F  0f8468fdffff               je 0x5e0dd
0005E375  8b00                       mov eax, dword ptr [rax]
0005E377  448b7c1820                 mov r15d, dword ptr [rax + rbx + 0x20]
0005E37C  4c03fb                     add r15, rbx
0005E37F  4533db                     xor r11d, r11d
0005E382  448b641818                 mov r12d, dword ptr [rax + rbx + 0x18]
0005E387  4585e4                     test r12d, r12d
0005E38A  0f844dfdffff               je 0x5e0dd
0005E390  478b049f                   mov r8d, dword ptr [r15 + r11*4]
0005E394  4c03c3                     add r8, rbx
0005E397  448bd6                     mov r10d, esi
0005E39A  410fb638                   movzx edi, byte ptr [r8]
0005E39E  4084ff                     test dil, dil
0005E3A1  7436                       je 0x5e3d9
0005E3A3  4d8d4001                   lea r8, [r8 + 1]
0005E3A7  8d579f                     lea edx, [rdi - 0x61]
0005E3AA  8d47e0                     lea eax, [rdi - 0x20]
0005E3AD  0fb6c8                     movzx ecx, al
0005E3B0  400fb6c7                   movzx eax, dil
0005E3B4  80fa19                     cmp dl, 0x19
0005E3B7  0f47c8                     cmova ecx, eax
0005E3BA  0fbec1                     movsx eax, cl
0005E3BD  4133c2                     xor eax, r10d
0005E3C0  4469d093010001             imul r10d, eax, 0x1000193
0005E3C7  410fb638                   movzx edi, byte ptr [r8]
0005E3CB  4084ff                     test dil, dil
0005E3CE  75d3                       jne 0x5e3a3
0005E3D0  4181fae1c5d67d             cmp r10d, 0x7dd6c5e1
0005E3D7  740d                       je 0x5e3e6
0005E3D9  41ffc3                     inc r11d
0005E3DC  453bdc                     cmp r11d, r12d
0005E3DF  72af                       jb 0x5e390
0005E3E1  e9f7fcffff                 jmp 0x5e0dd
0005E3E6  488b45e0                   mov rax, qword ptr [rbp - 0x20]
0005E3EA  8b38                       mov edi, dword ptr [rax]
0005E3EC  8b4c1f24                   mov ecx, dword ptr [rdi + rbx + 0x24]
0005E3F0  4803cb                     add rcx, rbx
0005E3F3  420fb71459                 movzx edx, word ptr [rcx + r11*2]
0005E3F8  8b4c1f1c                   mov ecx, dword ptr [rdi + rbx + 0x1c]
0005E3FC  4803cb                     add rcx, rbx
0005E3FF  8b0c91                     mov ecx, dword ptr [rcx + rdx*4]
0005E402  3bcf                       cmp ecx, edi
0005E404  0f82b5010000               jb 0x5e5bf
0005E40A  8b85f0030000               mov eax, dword ptr [rbp + 0x3f0]
0005E410  03c7                       add eax, edi
0005E412  3bc8                       cmp ecx, eax
0005E414  0f83a5010000               jae 0x5e5bf
0005E41A  488d3c0b                   lea rdi, [rbx + rcx]
0005E41E  0f57c0                     xorps xmm0, xmm0
0005E421  0f11442430                 movups xmmword ptr [rsp + 0x30], xmm0
0005E426  0f11442440                 movups xmmword ptr [rsp + 0x40], xmm0
0005E42B  0f11442450                 movups xmmword ptr [rsp + 0x50], xmm0
0005E430  0f11442460                 movups xmmword ptr [rsp + 0x60], xmm0
0005E435  33c9                       xor ecx, ecx
0005E437  380f                       cmp byte ptr [rdi], cl
0005E439  0f849efcffff               je 0x5e0dd
0005E43F  90                         nop 
0005E440  83f93c                     cmp ecx, 0x3c
0005E443  0f8d94fcffff               jge 0x5e0dd
0005E449  4863c1                     movsxd rax, ecx
0005E44C  488d1c38                   lea rbx, [rax + rdi]
0005E450  0fb613                     movzx edx, byte ptr [rbx]
0005E453  80fa2e                     cmp dl, 0x2e
0005E456  7414                       je 0x5e46c
0005E458  88540430                   mov byte ptr [rsp + rax + 0x30], dl
0005E45C  ffc1                       inc ecx
0005E45E  4863c1                     movsxd rax, ecx
0005E461  803c3800                   cmp byte ptr [rax + rdi], 0
0005E465  75d9                       jne 0x5e440
0005E467  e971fcffff                 jmp 0x5e0dd
0005E46C  85c9                       test ecx, ecx
0005E46E  0f8869fcffff               js 0x5e0dd
0005E474  c64404302e                 mov byte ptr [rsp + rax + 0x30], 0x2e
0005E479  4863c1                     movsxd rax, ecx
0005E47C  c644043144                 mov byte ptr [rsp + rax + 0x31], 0x44
0005E481  4863c1                     movsxd rax, ecx
0005E484  c64404324c                 mov byte ptr [rsp + rax + 0x32], 0x4c
0005E489  4863c1                     movsxd rax, ecx
0005E48C  c64404334c                 mov byte ptr [rsp + rax + 0x33], 0x4c
0005E491  4863c1                     movsxd rax, ecx
0005E494  c644043400                 mov byte ptr [rsp + rax + 0x34], 0
0005E499  0f57c0                     xorps xmm0, xmm0
0005E49C  0f114510                   movups xmmword ptr [rbp + 0x10], xmm0
0005E4A0  0f114520                   movups xmmword ptr [rbp + 0x20], xmm0
0005E4A4  0f114530                   movups xmmword ptr [rbp + 0x30], xmm0
0005E4A8  0f114540                   movups xmmword ptr [rbp + 0x40], xmm0
0005E4AC  0f114550                   movups xmmword ptr [rbp + 0x50], xmm0
0005E4B0  0f114560                   movups xmmword ptr [rbp + 0x60], xmm0
0005E4B4  0f114570                   movups xmmword ptr [rbp + 0x70], xmm0
0005E4B8  0f118580000000             movups xmmword ptr [rbp + 0x80], xmm0
0005E4BF  33d2                       xor edx, edx
0005E4C1  38542430                   cmp byte ptr [rsp + 0x30], dl
0005E4C5  741e                       je 0x5e4e5
0005E4C7  83fa3f                     cmp edx, 0x3f
0005E4CA  7d19                       jge 0x5e4e5
0005E4CC  4863ca                     movsxd rcx, edx
0005E4CF  0fbe440c30                 movsx eax, byte ptr [rsp + rcx + 0x30]
0005E4D4  6689444d10                 mov word ptr [rbp + rcx*2 + 0x10], ax
0005E4D9  ffc2                       inc edx
0005E4DB  4863c2                     movsxd rax, edx
0005E4DE  807c043000                 cmp byte ptr [rsp + rax + 0x30], 0
0005E4E3  75e2                       jne 0x5e4c7
0005E4E5  488d7d10                   lea rdi, [rbp + 0x10]
0005E4E9  448bd6                     mov r10d, esi
0005E4EC  0fb74510                   movzx eax, word ptr [rbp + 0x10]
0005E4F0  6685c0                     test ax, ax
0005E4F3  7433                       je 0x5e528
0005E4F5  6666660f1f840000000000     nop word ptr [rax + rax]
0005E500  488d7f02                   lea rdi, [rdi + 2]
0005E504  8d509f                     lea edx, [rax - 0x61]
0005E507  0fb6c8                     movzx ecx, al
0005E50A  2c20                       sub al, 0x20
0005E50C  6683fa19                   cmp dx, 0x19
0005E510  0f47c1                     cmova eax, ecx
0005E513  0fbec0                     movsx eax, al
0005E516  4133c2                     xor eax, r10d
0005E519  4469d093010001             imul r10d, eax, 0x1000193
0005E520  0fb707                     movzx eax, word ptr [rdi]
0005E523  6685c0                     test ax, ax
0005E526  75d8                       jne 0x5e500
0005E528  65488b042560000000         mov rax, qword ptr gs:[0x60]
0005E531  4c8b5818                   mov r11, qword ptr [rax + 0x18]
0005E535  4983c320                   add r11, 0x20
0005E539  4d8b0b                     mov r9, qword ptr [r11]
0005E53C  4d3bcb                     cmp r9, r11
0005E53F  0f8498fbffff               je 0x5e0dd
0005E545  498b7950                   mov rdi, qword ptr [r9 + 0x50]
0005E549  4885ff                     test rdi, rdi
0005E54C  743f                       je 0x5e58d
0005E54E  448bc6                     mov r8d, esi
0005E551  0fb707                     movzx eax, word ptr [rdi]
0005E554  6685c0                     test ax, ax
0005E557  742f                       je 0x5e588
0005E559  0f1f8000000000             nop dword ptr [rax]
0005E560  488d7f02                   lea rdi, [rdi + 2]
0005E564  8d509f                     lea edx, [rax - 0x61]
0005E567  0fb6c8                     movzx ecx, al
0005E56A  2c20                       sub al, 0x20
0005E56C  6683fa19                   cmp dx, 0x19
0005E570  0f47c1                     cmova eax, ecx
0005E573  0fbec0                     movsx eax, al
0005E576  4133c0                     xor eax, r8d
0005E579  4469c093010001             imul r8d, eax, 0x1000193
0005E580  0fb707                     movzx eax, word ptr [rdi]
0005E583  6685c0                     test ax, ax
0005E586  75d8                       jne 0x5e560
0005E588  453bc2                     cmp r8d, r10d
0005E58B  740d                       je 0x5e59a
0005E58D  4d8b09                     mov r9, qword ptr [r9]
0005E590  4d3bcb                     cmp r9, r11
0005E593  75b0                       jne 0x5e545
0005E595  e943fbffff                 jmp 0x5e0dd
0005E59A  498b7920                   mov rdi, qword ptr [r9 + 0x20]
0005E59E  4885ff                     test rdi, rdi
0005E5A1  0f8436fbffff               je 0x5e0dd
0005E5A7  488d4b01                   lea rcx, [rbx + 1]
0005E5AB  e83073fbff                 call 0x158e0
0005E5B0  8bd0                       mov edx, eax
0005E5B2  488bcf                     mov rcx, rdi
0005E5B5  e8c673fbff                 call 0x15980
0005E5BA  e920fbffff                 jmp 0x5e0df
0005E5BF  488d040b                   lea rax, [rbx + rcx]
0005E5C3  e917fbffff                 jmp 0x5e0df
0005E5C8  498b5a20                   mov rbx, qword ptr [r10 + 0x20]
0005E5CC  4885db                     test rbx, rbx
0005E5CF  0f8497000000               je 0x5e66c
0005E5D5  48634b3c                   movsxd rcx, dword ptr [rbx + 0x3c]
0005E5D9  8b84198c000000             mov eax, dword ptr [rcx + rbx + 0x8c]
0005E5E0  8985f0030000               mov dword ptr [rbp + 0x3f0], eax
0005E5E6  85c0                       test eax, eax
0005E5E8  0f847e000000               je 0x5e66c
0005E5EE  448bac1988000000           mov r13d, dword ptr [rcx + rbx + 0x88]
0005E5F6  468b7c2b20                 mov r15d, dword ptr [rbx + r13 + 0x20]
0005E5FB  4c03fb                     add r15, rbx
0005E5FE  4533db                     xor r11d, r11d
0005E601  468b642b18                 mov r12d, dword ptr [rbx + r13 + 0x18]
0005E606  4585e4                     test r12d, r12d
0005E609  745a                       je 0x5e665
0005E60B  0f1f440000                 nop dword ptr [rax + rax]
0005E610  478b049f                   mov r8d, dword ptr [r15 + r11*4]
0005E614  4c03c3                     add r8, rbx
0005E617  448bd6                     mov r10d, esi
0005E61A  410fb638                   movzx edi, byte ptr [r8]
0005E61E  4084ff                     test dil, dil
0005E621  743a                       je 0x5e65d
0005E623  4d8d4001                   lea r8, [r8 + 1]
0005E627  8d579f                     lea edx, [rdi - 0x61]
0005E62A  8d47e0                     lea eax, [rdi - 0x20]
0005E62D  0fb6c8                     movzx ecx, al
0005E630  400fb6c7                   movzx eax, dil
0005E634  80fa19                     cmp dl, 0x19
0005E637  0f47c8                     cmova ecx, eax
0005E63A  0fbec1                     movsx eax, cl
0005E63D  4133c2                     xor eax, r10d
0005E640  4469d093010001             imul r10d, eax, 0x1000193
0005E647  410fb638                   movzx edi, byte ptr [r8]
0005E64B  4084ff                     test dil, dil
0005E64E  75d3                       jne 0x5e623
0005E650  4181fa4a0cad8d             cmp r10d, 0x8dad0c4a
0005E657  0f84b10d0000               je 0x5f40e
0005E65D  41ffc3                     inc r11d
0005E660  453bdc                     cmp r11d, r12d
0005E663  72ab                       jb 0x5e610
0005E665  4c8bbdd8030000             mov r15, qword ptr [rbp + 0x3d8]
0005E66C  33c0                       xor eax, eax
0005E66E  b9f5ffffff                 mov ecx, 0xfffffff5
0005E673  ffd0                       call rax
0005E675  488945e0                   mov qword ptr [rbp - 0x20], rax
0005E679  4c8b8598000000             mov r8, qword ptr [rbp + 0x98]
0005E680  488b9d90000000             mov rbx, qword ptr [rbp + 0x90]
0005E687  4c2bc3                     sub r8, rbx
0005E68A  8bfe                       mov edi, esi
0005E68C  ba00000000                 mov edx, 0
0005E691  7421                       je 0x5e6b4
0005E693  0f1f4000                   nop dword ptr [rax]
0005E697  660f1f840000000000         nop word ptr [rax + rax]
0005E6A0  0fb60c1a                   movzx ecx, byte ptr [rdx + rbx]
0005E6A4  33cf                       xor ecx, edi
0005E6A6  69f993010001               imul edi, ecx, 0x1000193
0005E6AC  48ffc2                     inc rdx
0005E6AF  493bd0                     cmp rdx, r8
0005E6B2  72ec                       jb 0x5e6a0
0005E6B4  4133ff                     xor edi, r15d
0005E6B7  69c7b979379e               imul eax, edi, 0x9e3779b9
0005E6BD  8bc8                       mov ecx, eax
0005E6BF  81c926594131               or ecx, 0x31415926
0005E6C5  2526594131                 and eax, 0x31415926
0005E6CA  2bc8                       sub ecx, eax
0005E6CC  448bd9                     mov r11d, ecx
0005E6CF  4181cb18281827             or r11d, 0x27182818
0005E6D6  4503db                     add r11d, r11d
0005E6D9  81f118281827               xor ecx, 0x27182818
0005E6DF  442bd9                     sub r11d, ecx
0005E6E2  0f57c0                     xorps xmm0, xmm0
0005E6E5  0f1145a0                   movups xmmword ptr [rbp - 0x60], xmm0
0005E6E9  0f1145b0                   movups xmmword ptr [rbp - 0x50], xmm0
0005E6ED  0f1145c0                   movups xmmword ptr [rbp - 0x40], xmm0
0005E6F1  0f1145d0                   movups xmmword ptr [rbp - 0x30], xmm0
0005E6F5  4533d2                     xor r10d, r10d
0005E6F8  418bc3                     mov eax, r11d
0005E6FB  83e003                     and eax, 3
0005E6FE  48c1e006                   shl rax, 6
0005E702  488d1597350000             lea rdx, [rip + 0x3597]   ; -> 0x61ca0
0005E709  4c8d3410                   lea r14, [rax + rdx]
0005E70D  4c8d3c10                   lea r15, [rax + rdx]
0005E711  4c8d2410                   lea r12, [rax + rdx]
0005E715  4c8d2c10                   lea r13, [rax + rdx]
0005E719  488d4a04                   lea rcx, [rdx + 4]
0005E71D  4803c8                     add rcx, rax
0005E720  48898dd8030000             mov qword ptr [rbp + 0x3d8], rcx
0005E727  488d4a05                   lea rcx, [rdx + 5]
0005E72B  4803c8                     add rcx, rax
0005E72E  48894d00                   mov qword ptr [rbp], rcx
0005E732  488d4a06                   lea rcx, [rdx + 6]
0005E736  4803c8                     add rcx, rax
0005E739  48898da8000000             mov qword ptr [rbp + 0xa8], rcx
0005E740  488d4a07                   lea rcx, [rdx + 7]
0005E744  4803c8                     add rcx, rax
0005E747  48898db0000000             mov qword ptr [rbp + 0xb0], rcx
0005E74E  488d4a08                   lea rcx, [rdx + 8]
0005E752  4803c8                     add rcx, rax
0005E755  48898db8000000             mov qword ptr [rbp + 0xb8], rcx
0005E75C  488d4a09                   lea rcx, [rdx + 9]
0005E760  4803c8                     add rcx, rax
0005E763  48898dc0000000             mov qword ptr [rbp + 0xc0], rcx
0005E76A  488d4a0a                   lea rcx, [rdx + 0xa]
0005E76E  4803c8                     add rcx, rax
0005E771  48898dc8000000             mov qword ptr [rbp + 0xc8], rcx
0005E778  488d4a0b                   lea rcx, [rdx + 0xb]
0005E77C  4803c8                     add rcx, rax
0005E77F  48898dd0000000             mov qword ptr [rbp + 0xd0], rcx
0005E786  488d4a0c                   lea rcx, [rdx + 0xc]
0005E78A  4803c8                     add rcx, rax
0005E78D  48898dd8000000             mov qword ptr [rbp + 0xd8], rcx
0005E794  488d4a0d                   lea rcx, [rdx + 0xd]
0005E798  4803c8                     add rcx, rax
0005E79B  48898de0000000             mov qword ptr [rbp + 0xe0], rcx
0005E7A2  488d4a0e                   lea rcx, [rdx + 0xe]
0005E7A6  4803c8                     add rcx, rax
0005E7A9  48898de8000000             mov qword ptr [rbp + 0xe8], rcx
0005E7B0  4883c00f                   add rax, 0xf
0005E7B4  4803c2                     add rax, rdx
0005E7B7  488985f0000000             mov qword ptr [rbp + 0xf0], rax
0005E7BE  488bb5d8030000             mov rsi, qword ptr [rbp + 0x3d8]
0005E7C5  6666660f1f840000000000     nop word ptr [rax + rax]
0005E7D0  410fb6ca                   movzx ecx, r10b
0005E7D4  80e103                     and cl, 3
0005E7D7  c0e103                     shl cl, 3
0005E7DA  458bcb                     mov r9d, r11d
0005E7DD  41d3e9                     shr r9d, cl
0005E7E0  430fb60416                 movzx eax, byte ptr [r14 + r10]
0005E7E5  42320413                   xor al, byte ptr [rbx + r10]
0005E7E9  4132c1                     xor al, r9b
0005E7EC  42884415a0                 mov byte ptr [rbp + r10 - 0x60], al
0005E7F1  418d4a01                   lea ecx, [r10 + 1]
0005E7F5  80e103                     and cl, 3
0005E7F8  c0e103                     shl cl, 3
0005E7FB  418bfb                     mov edi, r11d
0005E7FE  d3ef                       shr edi, cl
0005E800  430fb6441701               movzx eax, byte ptr [r15 + r10 + 1]
0005E806  4232441301                 xor al, byte ptr [rbx + r10 + 1]
0005E80B  4032c7                     xor al, dil
0005E80E  42884415a1                 mov byte ptr [rbp + r10 - 0x5f], al
0005E813  418d8afe000000             lea ecx, [r10 + 0xfe]
0005E81A  80e103                     and cl, 3
0005E81D  c0e103                     shl cl, 3
0005E820  458bc3                     mov r8d, r11d
0005E823  41d3e8                     shr r8d, cl
0005E826  430fb6441402               movzx eax, byte ptr [r12 + r10 + 2]
0005E82C  4232441302                 xor al, byte ptr [rbx + r10 + 2]
0005E831  4132c0                     xor al, r8b
0005E834  42884415a2                 mov byte ptr [rbp + r10 - 0x5e], al
0005E839  418d8aff000000             lea ecx, [r10 + 0xff]
0005E840  80e103                     and cl, 3
0005E843  c0e103                     shl cl, 3
0005E846  418bd3                     mov edx, r11d
0005E849  d3ea                       shr edx, cl
0005E84B  430fb6442a03               movzx eax, byte ptr [r10 + r13 + 3]
0005E851  4232441303                 xor al, byte ptr [rbx + r10 + 3]
0005E856  32c2                       xor al, dl
0005E858  42884415a3                 mov byte ptr [rbp + r10 - 0x5d], al
0005E85D  420fb60416                 movzx eax, byte ptr [rsi + r10]
0005E862  4232441304                 xor al, byte ptr [rbx + r10 + 4]
0005E867  4132c1                     xor al, r9b
0005E86A  42884415a4                 mov byte ptr [rbp + r10 - 0x5c], al
0005E86F  488b4500                   mov rax, qword ptr [rbp]
0005E873  420fb60410                 movzx eax, byte ptr [rax + r10]
0005E878  4232441305                 xor al, byte ptr [rbx + r10 + 5]
0005E87D  4032c7                     xor al, dil
0005E880  42884415a5                 mov byte ptr [rbp + r10 - 0x5b], al
0005E885  488b85a8000000             mov rax, qword ptr [rbp + 0xa8]
0005E88C  420fb60410                 movzx eax, byte ptr [rax + r10]
0005E891  4232441306                 xor al, byte ptr [rbx + r10 + 6]
0005E896  4132c0                     xor al, r8b
0005E899  42884415a6                 mov byte ptr [rbp + r10 - 0x5a], al
0005E89E  488b85b0000000             mov rax, qword ptr [rbp + 0xb0]
0005E8A5  420fb60410                 movzx eax, byte ptr [rax + r10]
0005E8AA  4232441307                 xor al, byte ptr [rbx + r10 + 7]
0005E8AF  32c2                       xor al, dl
0005E8B1  42884415a7                 mov byte ptr [rbp + r10 - 0x59], al
0005E8B6  488b85b8000000             mov rax, qword ptr [rbp + 0xb8]
0005E8BD  420fb60410                 movzx eax, byte ptr [rax + r10]
0005E8C2  4232441308                 xor al, byte ptr [rbx + r10 + 8]
0005E8C7  4132c1                     xor al, r9b
0005E8CA  42884415a8                 mov byte ptr [rbp + r10 - 0x58], al
0005E8CF  488b85c0000000             mov rax, qword ptr [rbp + 0xc0]
0005E8D6  420fb60410                 movzx eax, byte ptr [rax + r10]
0005E8DB  4232441309                 xor al, byte ptr [rbx + r10 + 9]
0005E8E0  4032c7                     xor al, dil
0005E8E3  42884415a9                 mov byte ptr [rbp + r10 - 0x57], al
0005E8E8  488b85c8000000             mov rax, qword ptr [rbp + 0xc8]
0005E8EF  420fb60410                 movzx eax, byte ptr [rax + r10]
0005E8F4  423244130a                 xor al, byte ptr [rbx + r10 + 0xa]
0005E8F9  4132c0                     xor al, r8b
0005E8FC  42884415aa                 mov byte ptr [rbp + r10 - 0x56], al
0005E901  488b85d0000000             mov rax, qword ptr [rbp + 0xd0]
0005E908  420fb60410                 movzx eax, byte ptr [rax + r10]
0005E90D  423244130b                 xor al, byte ptr [rbx + r10 + 0xb]
0005E912  32c2                       xor al, dl
0005E914  42884415ab                 mov byte ptr [rbp + r10 - 0x55], al
0005E919  488b85d8000000             mov rax, qword ptr [rbp + 0xd8]
0005E920  420fb60410                 movzx eax, byte ptr [rax + r10]
0005E925  423244130c                 xor al, byte ptr [rbx + r10 + 0xc]
0005E92A  4132c1                     xor al, r9b
0005E92D  42884415ac                 mov byte ptr [rbp + r10 - 0x54], al
0005E932  488b85e0000000             mov rax, qword ptr [rbp + 0xe0]
0005E939  420fb60410                 movzx eax, byte ptr [rax + r10]
0005E93E  423244130d                 xor al, byte ptr [rbx + r10 + 0xd]
0005E943  4032c7                     xor al, dil
0005E946  42884415ad                 mov byte ptr [rbp + r10 - 0x53], al
0005E94B  488b85e8000000             mov rax, qword ptr [rbp + 0xe8]
0005E952  420fb60410                 movzx eax, byte ptr [rax + r10]
0005E957  423244130e                 xor al, byte ptr [rbx + r10 + 0xe]
0005E95C  4132c0                     xor al, r8b
0005E95F  42884415ae                 mov byte ptr [rbp + r10 - 0x52], al
0005E964  488b85f0000000             mov rax, qword ptr [rbp + 0xf0]
0005E96B  420fb60410                 movzx eax, byte ptr [rax + r10]
0005E970  423244130f                 xor al, byte ptr [rbx + r10 + 0xf]
0005E975  32c2                       xor al, dl
0005E977  42884415af                 mov byte ptr [rbp + r10 - 0x51], al
0005E97C  4983c210                   add r10, 0x10
0005E980  4983fa40                   cmp r10, 0x40
0005E984  0f8246feffff               jb 0x5e7d0
0005E98A  488d3d0f330000             lea rdi, [rip + 0x330f]   ; -> 0x61ca0
0005E991  33c0                       xor eax, eax
0005E993  b900010000                 mov ecx, 0x100
0005E998  f3aa                       rep stosb byte ptr [rdi], al
0005E99A  0fb645a0                   movzx eax, byte ptr [rbp - 0x60]
0005E99E  bec59d1c81                 mov esi, 0x811c9dc5
0005E9A3  33c6                       xor eax, esi
0005E9A5  69c893010001               imul ecx, eax, 0x1000193
0005E9AB  0fb645a1                   movzx eax, byte ptr [rbp - 0x5f]
0005E9AF  33c8                       xor ecx, eax
0005E9B1  69d193010001               imul edx, ecx, 0x1000193
0005E9B7  0fb645a2                   movzx eax, byte ptr [rbp - 0x5e]
0005E9BB  33d0                       xor edx, eax
0005E9BD  69ca93010001               imul ecx, edx, 0x1000193
0005E9C3  0fb645a3                   movzx eax, byte ptr [rbp - 0x5d]
0005E9C7  33c8                       xor ecx, eax
0005E9C9  69d193010001               imul edx, ecx, 0x1000193
0005E9CF  0fb645a4                   movzx eax, byte ptr [rbp - 0x5c]
0005E9D3  33d0                       xor edx, eax
0005E9D5  69ca93010001               imul ecx, edx, 0x1000193
0005E9DB  0fb645a5                   movzx eax, byte ptr [rbp - 0x5b]
0005E9DF  33c8                       xor ecx, eax
0005E9E1  69d193010001               imul edx, ecx, 0x1000193
0005E9E7  0fb645a6                   movzx eax, byte ptr [rbp - 0x5a]
0005E9EB  33d0                       xor edx, eax
0005E9ED  69ca93010001               imul ecx, edx, 0x1000193
0005E9F3  0fb645a7                   movzx eax, byte ptr [rbp - 0x59]
0005E9F7  33c8                       xor ecx, eax
0005E9F9  69d193010001               imul edx, ecx, 0x1000193
0005E9FF  0fb645a8                   movzx eax, byte ptr [rbp - 0x58]
0005EA03  33d0                       xor edx, eax
0005EA05  69ca93010001               imul ecx, edx, 0x1000193
0005EA0B  0fb645a9                   movzx eax, byte ptr [rbp - 0x57]
0005EA0F  33c8                       xor ecx, eax
0005EA11  69d193010001               imul edx, ecx, 0x1000193
0005EA17  0fb645aa                   movzx eax, byte ptr [rbp - 0x56]
0005EA1B  33d0                       xor edx, eax
0005EA1D  69ca93010001               imul ecx, edx, 0x1000193
0005EA23  0fb645ab                   movzx eax, byte ptr [rbp - 0x55]
0005EA27  33c8                       xor ecx, eax
0005EA29  69d193010001               imul edx, ecx, 0x1000193
0005EA2F  0fb645ac                   movzx eax, byte ptr [rbp - 0x54]
0005EA33  33d0                       xor edx, eax
0005EA35  69ca93010001               imul ecx, edx, 0x1000193
0005EA3B  0fb645ad                   movzx eax, byte ptr [rbp - 0x53]
0005EA3F  33c8                       xor ecx, eax
0005EA41  69d193010001               imul edx, ecx, 0x1000193
0005EA47  0fb645ae                   movzx eax, byte ptr [rbp - 0x52]
0005EA4B  33d0                       xor edx, eax
0005EA4D  69ca93010001               imul ecx, edx, 0x1000193
0005EA53  0fb645af                   movzx eax, byte ptr [rbp - 0x51]
0005EA57  33c8                       xor ecx, eax
0005EA59  69d193010001               imul edx, ecx, 0x1000193
0005EA5F  0fb645b0                   movzx eax, byte ptr [rbp - 0x50]
0005EA63  33d0                       xor edx, eax
0005EA65  69ca93010001               imul ecx, edx, 0x1000193
0005EA6B  0fb645b1                   movzx eax, byte ptr [rbp - 0x4f]
0005EA6F  33c8                       xor ecx, eax
0005EA71  69d193010001               imul edx, ecx, 0x1000193
0005EA77  0fb645b2                   movzx eax, byte ptr [rbp - 0x4e]
0005EA7B  33d0                       xor edx, eax
0005EA7D  69ca93010001               imul ecx, edx, 0x1000193
0005EA83  0fb645b3                   movzx eax, byte ptr [rbp - 0x4d]
0005EA87  33c8                       xor ecx, eax
0005EA89  69d193010001               imul edx, ecx, 0x1000193
0005EA8F  0fb645b4                   movzx eax, byte ptr [rbp - 0x4c]
0005EA93  33d0                       xor edx, eax
0005EA95  69ca93010001               imul ecx, edx, 0x1000193
0005EA9B  0fb645b5                   movzx eax, byte ptr [rbp - 0x4b]
0005EA9F  33c8                       xor ecx, eax
0005EAA1  69d193010001               imul edx, ecx, 0x1000193
0005EAA7  0fb645b6                   movzx eax, byte ptr [rbp - 0x4a]
0005EAAB  33d0                       xor edx, eax
0005EAAD  69ca93010001               imul ecx, edx, 0x1000193
0005EAB3  0fb645b7                   movzx eax, byte ptr [rbp - 0x49]
0005EAB7  33c8                       xor ecx, eax
0005EAB9  69d193010001               imul edx, ecx, 0x1000193
0005EABF  0fb645b8                   movzx eax, byte ptr [rbp - 0x48]
0005EAC3  33d0                       xor edx, eax
0005EAC5  69ca93010001               imul ecx, edx, 0x1000193
0005EACB  0fb645b9                   movzx eax, byte ptr [rbp - 0x47]
0005EACF  33c8                       xor ecx, eax
0005EAD1  69d193010001               imul edx, ecx, 0x1000193
0005EAD7  0fb645ba                   movzx eax, byte ptr [rbp - 0x46]
0005EADB  33d0                       xor edx, eax
0005EADD  69ca93010001               imul ecx, edx, 0x1000193
0005EAE3  0fb645bb                   movzx eax, byte ptr [rbp - 0x45]
0005EAE7  33c8                       xor ecx, eax
0005EAE9  69d193010001               imul edx, ecx, 0x1000193
0005EAEF  0fb645bc                   movzx eax, byte ptr [rbp - 0x44]
0005EAF3  33d0                       xor edx, eax
0005EAF5  69ca93010001               imul ecx, edx, 0x1000193
0005EAFB  0fb645bd                   movzx eax, byte ptr [rbp - 0x43]
0005EAFF  33c8                       xor ecx, eax
0005EB01  69d193010001               imul edx, ecx, 0x1000193
0005EB07  0fb645be                   movzx eax, byte ptr [rbp - 0x42]
0005EB0B  33d0                       xor edx, eax
0005EB0D  69ca93010001               imul ecx, edx, 0x1000193
0005EB13  0fb645bf                   movzx eax, byte ptr [rbp - 0x41]
0005EB17  33c8                       xor ecx, eax
0005EB19  69d193010001               imul edx, ecx, 0x1000193
0005EB1F  0fb645c0                   movzx eax, byte ptr [rbp - 0x40]
0005EB23  33d0                       xor edx, eax
0005EB25  69ca93010001               imul ecx, edx, 0x1000193
0005EB2B  0fb645c1                   movzx eax, byte ptr [rbp - 0x3f]
0005EB2F  33c8                       xor ecx, eax
0005EB31  69d193010001               imul edx, ecx, 0x1000193
0005EB37  0fb645c2                   movzx eax, byte ptr [rbp - 0x3e]
0005EB3B  33d0                       xor edx, eax
0005EB3D  69ca93010001               imul ecx, edx, 0x1000193
0005EB43  0fb645c3                   movzx eax, byte ptr [rbp - 0x3d]
0005EB47  33c8                       xor ecx, eax
0005EB49  69d193010001               imul edx, ecx, 0x1000193
0005EB4F  0fb645c4                   movzx eax, byte ptr [rbp - 0x3c]
0005EB53  33d0                       xor edx, eax
0005EB55  69ca93010001               imul ecx, edx, 0x1000193
0005EB5B  0fb645c5                   movzx eax, byte ptr [rbp - 0x3b]
0005EB5F  33c8                       xor ecx, eax
0005EB61  69d193010001               imul edx, ecx, 0x1000193
0005EB67  0fb645c6                   movzx eax, byte ptr [rbp - 0x3a]
0005EB6B  33d0                       xor edx, eax
0005EB6D  69ca93010001               imul ecx, edx, 0x1000193
0005EB73  0fb645c7                   movzx eax, byte ptr [rbp - 0x39]
0005EB77  33c8                       xor ecx, eax
0005EB79  69d193010001               imul edx, ecx, 0x1000193
0005EB7F  0fb645c8                   movzx eax, byte ptr [rbp - 0x38]
0005EB83  33d0                       xor edx, eax
0005EB85  69ca93010001               imul ecx, edx, 0x1000193
0005EB8B  0fb645c9                   movzx eax, byte ptr [rbp - 0x37]
0005EB8F  33c8                       xor ecx, eax
0005EB91  69d193010001               imul edx, ecx, 0x1000193
0005EB97  0fb645ca                   movzx eax, byte ptr [rbp - 0x36]
0005EB9B  33d0                       xor edx, eax
0005EB9D  69ca93010001               imul ecx, edx, 0x1000193
0005EBA3  0fb645cb                   movzx eax, byte ptr [rbp - 0x35]
0005EBA7  33c8                       xor ecx, eax
0005EBA9  69d193010001               imul edx, ecx, 0x1000193
0005EBAF  0fb645cc                   movzx eax, byte ptr [rbp - 0x34]
0005EBB3  33d0                       xor edx, eax
0005EBB5  69ca93010001               imul ecx, edx, 0x1000193
0005EBBB  0fb645cd                   movzx eax, byte ptr [rbp - 0x33]
0005EBBF  33c8                       xor ecx, eax
0005EBC1  69d193010001               imul edx, ecx, 0x1000193
0005EBC7  0fb645ce                   movzx eax, byte ptr [rbp - 0x32]
0005EBCB  33d0                       xor edx, eax
0005EBCD  69ca93010001               imul ecx, edx, 0x1000193
0005EBD3  0fb645cf                   movzx eax, byte ptr [rbp - 0x31]
0005EBD7  33c8                       xor ecx, eax
0005EBD9  69d193010001               imul edx, ecx, 0x1000193
0005EBDF  0fb645d0                   movzx eax, byte ptr [rbp - 0x30]
0005EBE3  33d0                       xor edx, eax
0005EBE5  69ca93010001               imul ecx, edx, 0x1000193
0005EBEB  0fb645d1                   movzx eax, byte ptr [rbp - 0x2f]
0005EBEF  33c8                       xor ecx, eax
0005EBF1  69d193010001               imul edx, ecx, 0x1000193
0005EBF7  0fb645d2                   movzx eax, byte ptr [rbp - 0x2e]
0005EBFB  33d0                       xor edx, eax
0005EBFD  69ca93010001               imul ecx, edx, 0x1000193
0005EC03  0fb645d3                   movzx eax, byte ptr [rbp - 0x2d]
0005EC07  33c8                       xor ecx, eax
0005EC09  69d193010001               imul edx, ecx, 0x1000193
0005EC0F  0fb645d4                   movzx eax, byte ptr [rbp - 0x2c]
0005EC13  33d0                       xor edx, eax
0005EC15  69ca93010001               imul ecx, edx, 0x1000193
0005EC1B  0fb645d5                   movzx eax, byte ptr [rbp - 0x2b]
0005EC1F  33c8                       xor ecx, eax
0005EC21  69d193010001               imul edx, ecx, 0x1000193
0005EC27  0fb645d6                   movzx eax, byte ptr [rbp - 0x2a]
0005EC2B  33d0                       xor edx, eax
0005EC2D  69ca93010001               imul ecx, edx, 0x1000193
0005EC33  0fb645d7                   movzx eax, byte ptr [rbp - 0x29]
0005EC37  33c8                       xor ecx, eax
0005EC39  69d193010001               imul edx, ecx, 0x1000193
0005EC3F  0fb645d8                   movzx eax, byte ptr [rbp - 0x28]
0005EC43  33d0                       xor edx, eax
0005EC45  69ca93010001               imul ecx, edx, 0x1000193
0005EC4B  0fb645d9                   movzx eax, byte ptr [rbp - 0x27]
0005EC4F  33c8                       xor ecx, eax
0005EC51  69d193010001               imul edx, ecx, 0x1000193
0005EC57  0fb645da                   movzx eax, byte ptr [rbp - 0x26]
0005EC5B  33d0                       xor edx, eax
0005EC5D  69ca93010001               imul ecx, edx, 0x1000193
0005EC63  0fb645db                   movzx eax, byte ptr [rbp - 0x25]
0005EC67  33c8                       xor ecx, eax
0005EC69  69d193010001               imul edx, ecx, 0x1000193
0005EC6F  0fb645dc                   movzx eax, byte ptr [rbp - 0x24]
0005EC73  33d0                       xor edx, eax
0005EC75  69ca93010001               imul ecx, edx, 0x1000193
0005EC7B  0fb645dd                   movzx eax, byte ptr [rbp - 0x23]
0005EC7F  33c8                       xor ecx, eax
0005EC81  69d193010001               imul edx, ecx, 0x1000193
0005EC87  0fb645de                   movzx eax, byte ptr [rbp - 0x22]
0005EC8B  33d0                       xor edx, eax
0005EC8D  69ca93010001               imul ecx, edx, 0x1000193
0005EC93  0fb645df                   movzx eax, byte ptr [rbp - 0x21]
0005EC97  33c8                       xor ecx, eax
0005EC99  69c193010001               imul eax, ecx, 0x1000193
0005EC9F  35a989da8e                 xor eax, 0x8eda89a9
0005ECA4  c645bc00                   mov byte ptr [rbp - 0x44], 0
0005ECA8  8bc8                       mov ecx, eax
0005ECAA  f7d9                       neg ecx
0005ECAC  0bc8                       or ecx, eax
0005ECAE  f7d1                       not ecx
0005ECB0  c1e91f                     shr ecx, 0x1f
0005ECB3  894d00                     mov dword ptr [rbp], ecx
0005ECB6  0fb7c1                     movzx eax, cx
0005ECB9  6603c0                     add ax, ax
0005ECBC  6603c8                     add cx, ax
0005ECBF  6603c9                     add cx, cx
0005ECC2  6683f10c                   xor cx, 0xc
0005ECC6  66898df0030000             mov word ptr [rbp + 0x3f0], cx
0005ECCD  65488b042560000000         mov rax, qword ptr gs:[0x60]
0005ECD6  4c8b5018                   mov r10, qword ptr [rax + 0x18]
0005ECDA  4983c220                   add r10, 0x20
0005ECDE  4d8b0a                     mov r9, qword ptr [r10]
0005ECE1  4d3bca                     cmp r9, r10
0005ECE4  7457                       je 0x5ed3d
0005ECE6  498b7950                   mov rdi, qword ptr [r9 + 0x50]
0005ECEA  4885ff                     test rdi, rdi
0005ECED  7446                       je 0x5ed35
0005ECEF  448bc6                     mov r8d, esi
0005ECF2  0fb707                     movzx eax, word ptr [rdi]
0005ECF5  6685c0                     test ax, ax
0005ECF8  743b                       je 0x5ed35
0005ECFA  660f1f440000               nop word ptr [rax + rax]
0005ED00  488d7f02                   lea rdi, [rdi + 2]
0005ED04  8d509f                     lea edx, [rax - 0x61]
0005ED07  0fb6c8                     movzx ecx, al
0005ED0A  2c20                       sub al, 0x20
0005ED0C  6683fa19                   cmp dx, 0x19
0005ED10  0f47c1                     cmova eax, ecx
0005ED13  0fbec0                     movsx eax, al
0005ED16  4133c0                     xor eax, r8d
0005ED19  4469c093010001             imul r8d, eax, 0x1000193
0005ED20  0fb707                     movzx eax, word ptr [rdi]
0005ED23  6685c0                     test ax, ax
0005ED26  75d8                       jne 0x5ed00
0005ED28  4181f863d4cd29             cmp r8d, 0x29cdd463
0005ED2F  0f84c1080000               je 0x5f5f6
0005ED35  4d8b09                     mov r9, qword ptr [r9]
0005ED38  4d3bca                     cmp r9, r10
0005ED3B  75a9                       jne 0x5ece6
0005ED3D  33c0                       xor eax, eax
0005ED3F  0fb795f0030000             movzx edx, word ptr [rbp + 0x3f0]
0005ED46  488b4de0                   mov rcx, qword ptr [rbp - 0x20]
0005ED4A  ffd0                       call rax
0005ED4C  488b8d98000000             mov rcx, qword ptr [rbp + 0x98]
0005ED53  488bbd90000000             mov rdi, qword ptr [rbp + 0x90]
0005ED5A  482bcf                     sub rcx, rdi
0005ED5D  33c0                       xor eax, eax
0005ED5F  f3aa                       rep stosb byte ptr [rdi], al
0005ED61  394500                     cmp dword ptr [rbp], eax
0005ED64  0f84010e0000               je 0x5fb6b
0005ED6A  8b05d8500000               mov eax, dword ptr [rip + 0x50d8]   ; -> 0x63e48
0005ED70  85c0                       test eax, eax
0005ED72  0f84c00d0000               je 0x5fb38
0005ED78  65488b042560000000         mov rax, qword ptr gs:[0x60]
0005ED81  4c8b5018                   mov r10, qword ptr [rax + 0x18]
0005ED85  4983c220                   add r10, 0x20
0005ED89  4d8b0a                     mov r9, qword ptr [r10]
0005ED8C  4d3bca                     cmp r9, r10
0005ED8F  745c                       je 0x5eded
0005ED91  498b7950                   mov rdi, qword ptr [r9 + 0x50]
0005ED95  4885ff                     test rdi, rdi
0005ED98  744b                       je 0x5ede5
0005ED9A  448bc6                     mov r8d, esi
0005ED9D  0fb707                     movzx eax, word ptr [rdi]
0005EDA0  6685c0                     test ax, ax
0005EDA3  7440                       je 0x5ede5
0005EDA5  6666660f1f840000000000     nop word ptr [rax + rax]
0005EDB0  488d7f02                   lea rdi, [rdi + 2]
0005EDB4  8d509f                     lea edx, [rax - 0x61]
0005EDB7  0fb6c8                     movzx ecx, al
0005EDBA  2c20                       sub al, 0x20
0005EDBC  6683fa19                   cmp dx, 0x19
0005EDC0  0f47c1                     cmova eax, ecx
0005EDC3  0fbec0                     movsx eax, al
0005EDC6  4133c0                     xor eax, r8d
0005EDC9  4469c093010001             imul r8d, eax, 0x1000193
0005EDD0  0fb707                     movzx eax, word ptr [rdi]
0005EDD3  6685c0                     test ax, ax
0005EDD6  75d8                       jne 0x5edb0
0005EDD8  4181f863d4cd29             cmp r8d, 0x29cdd463
0005EDDF  0f84d10a0000               je 0x5f8b6
0005EDE5  4d8b09                     mov r9, qword ptr [r9]
0005EDE8  4d3bca                     cmp r9, r10
0005EDEB  75a4                       jne 0x5ed91
0005EDED  33c0                       xor eax, eax
0005EDEF  ba0e000000                 mov edx, 0xe
0005EDF4  488b4de0                   mov rcx, qword ptr [rbp - 0x20]
0005EDF8  ffd0                       call rax
0005EDFA  660f6f056eebfaff           movdqa xmm0, xmmword ptr [rip - 0x51492]   ; -> 0xd970
0005EE02  f30f7f442470               movdqu xmmword ptr [rsp + 0x70], xmm0
0005EE08  660f6f0de0ebfaff           movdqa xmm1, xmmword ptr [rip - 0x51420]   ; -> 0xd9f0
0005EE10  f30f7f4d80                 movdqu xmmword ptr [rbp - 0x80], xmm1
0005EE15  0f57c0                     xorps xmm0, xmm0
0005EE18  0f11442430                 movups xmmword ptr [rsp + 0x30], xmm0
0005EE1D  48c744244000000000         mov qword ptr [rsp + 0x40], 0
0005EE26  48c74424480f000000         mov qword ptr [rsp + 0x48], 0xf
0005EE2F  c644243000                 mov byte ptr [rsp + 0x30], 0
0005EE34  c785d803000080000000       mov dword ptr [rbp + 0x3d8], 0x80
0005EE3E  4533c0                     xor r8d, r8d
0005EE41  ba1f000000                 mov edx, 0x1f
0005EE46  488d4c2430                 lea rcx, [rsp + 0x30]
0005EE4B  e8705afdff                 call 0x348c0
0005EE50  33d2                       xor edx, edx
0005EE52  48bfb9e5e41c6d4758bf       movabs rdi, 0xbf58476d1ce4e5b9
0005EE5C  48bbeb113113bb49d094       movabs rbx, 0x94d049bb133111eb
0005EE66  49b84413aad026525f71       movabs r8, 0x715f5226d0aa1344
0005EE70  4a8d0402                   lea rax, [rdx + r8]
0005EE74  488bc8                     mov rcx, rax
0005EE77  48c1e911                   shr rcx, 0x11
0005EE7B  4833c8                     xor rcx, rax
0005EE7E  480fafcf                   imul rcx, rdi
0005EE82  488bc1                     mov rax, rcx
0005EE85  48c1e81f                   shr rax, 0x1f
0005EE89  4833c1                     xor rax, rcx
0005EE8C  480fafc3                   imul rax, rbx
0005EE90  488bc8                     mov rcx, rax
0005EE93  48c1e920                   shr rcx, 0x20
0005EE97  324c1470                   xor cl, byte ptr [rsp + rdx + 0x70]
0005EE9B  32c8                       xor cl, al
0005EE9D  488d442430                 lea rax, [rsp + 0x30]
0005EEA2  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005EEA8  480f47442430               cmova rax, qword ptr [rsp + 0x30]
0005EEAE  880c10                     mov byte ptr [rax + rdx], cl
0005EEB1  48ffc2                     inc rdx
0005EEB4  4883fa1f                   cmp rdx, 0x1f
0005EEB8  72b6                       jb 0x5ee70
0005EEBA  488d442470                 lea rax, [rsp + 0x70]
0005EEBF  b920000000                 mov ecx, 0x20
0005EEC4  0f1f4000                   nop dword ptr [rax]
0005EEC8  0f1f840000000000           nop dword ptr [rax + rax]
0005EED0  c60000                     mov byte ptr [rax], 0
0005EED3  488d4001                   lea rax, [rax + 1]
0005EED7  4883e901                   sub rcx, 1
0005EEDB  75f3                       jne 0x5eed0
0005EEDD  488d542430                 lea rdx, [rsp + 0x30]
0005EEE2  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005EEE8  480f47542430               cmova rdx, qword ptr [rsp + 0x30]
0005EEEE  4c8b442440                 mov r8, qword ptr [rsp + 0x40]
0005EEF3  e8185dfdff                 call 0x34c10
0005EEF8  90                         nop 
0005EEF9  488b542448                 mov rdx, qword ptr [rsp + 0x48]
0005EEFE  4883fa0f                   cmp rdx, 0xf
0005EF02  7632                       jbe 0x5ef36
0005EF04  48ffc2                     inc rdx
0005EF07  488b4c2430                 mov rcx, qword ptr [rsp + 0x30]
0005EF0C  4881fa00100000             cmp rdx, 0x1000
0005EF13  721c                       jb 0x5ef31
0005EF15  488b41f8                   mov rax, qword ptr [rcx - 8]
0005EF19  482bc8                     sub rcx, rax
0005EF1C  4883e908                   sub rcx, 8
0005EF20  4883f91f                   cmp rcx, 0x1f
0005EF24  0f8762110000               ja 0x6008c
0005EF2A  4883c227                   add rdx, 0x27
0005EF2E  488bc8                     mov rcx, rax
0005EF31  e83699fdff                 call 0x3886c
0005EF36  48c744244000000000         mov qword ptr [rsp + 0x40], 0
0005EF3F  48c74424480f000000         mov qword ptr [rsp + 0x48], 0xf
0005EF48  c644243000                 mov byte ptr [rsp + 0x30], 0
0005EF4D  660f6f053be9faff           movdqa xmm0, xmmword ptr [rip - 0x516c5]   ; -> 0xd890
0005EF55  f30f7f442430               movdqu xmmword ptr [rsp + 0x30], xmm0
0005EF5B  660f6f0d6de9faff           movdqa xmm1, xmmword ptr [rip - 0x51693]   ; -> 0xd8d0
0005EF63  f30f7f4c2440               movdqu xmmword ptr [rsp + 0x40], xmm1
0005EF69  c7442450e93e782c           mov dword ptr [rsp + 0x50], 0x2c783ee9
0005EF71  c74424542fd3e800           mov dword ptr [rsp + 0x54], 0xe8d32f
0005EF79  c74424581c7c07a0           mov dword ptr [rsp + 0x58], 0xa0077c1c
0005EF81  66c744245c5240             mov word ptr [rsp + 0x5c], 0x4052
0005EF88  0f57c0                     xorps xmm0, xmm0
0005EF8B  0f11442470                 movups xmmword ptr [rsp + 0x70], xmm0
0005EF90  48c7458000000000           mov qword ptr [rbp - 0x80], 0
0005EF98  48c745880f000000           mov qword ptr [rbp - 0x78], 0xf
0005EFA0  c644247000                 mov byte ptr [rsp + 0x70], 0
0005EFA5  c785d803000048000000       mov dword ptr [rbp + 0x3d8], 0x48
0005EFAF  4533c0                     xor r8d, r8d
0005EFB2  ba2d000000                 mov edx, 0x2d
0005EFB7  488d4c2470                 lea rcx, [rsp + 0x70]
0005EFBC  e8ff58fdff                 call 0x348c0
0005EFC1  33d2                       xor edx, edx
0005EFC3  48be2e7572104d91e43b       movabs rsi, 0x3be4914d1072752e
0005EFCD  49b8267572104d91e43b       movabs r8, 0x3be4914d10727526
0005EFD7  49b9277572104d91e43b       movabs r9, 0x3be4914d10727527
0005EFE1  49ba287572104d91e43b       movabs r10, 0x3be4914d10727528
0005EFEB  49bb297572104d91e43b       movabs r11, 0x3be4914d10727529
0005EFF5  49be2a7572104d91e43b       movabs r14, 0x3be4914d1072752a
0005EFFF  49bf2b7572104d91e43b       movabs r15, 0x3be4914d1072752b
0005F009  49bc2c7572104d91e43b       movabs r12, 0x3be4914d1072752c
0005F013  49bd2d7572104d91e43b       movabs r13, 0x3be4914d1072752d
0005F01D  0f1f00                     nop dword ptr [rax]
0005F020  4a8d0402                   lea rax, [rdx + r8]
0005F024  488bc8                     mov rcx, rax
0005F027  48c1e911                   shr rcx, 0x11
0005F02B  4833c8                     xor rcx, rax
0005F02E  480fafcf                   imul rcx, rdi
0005F032  488bc1                     mov rax, rcx
0005F035  48c1e81f                   shr rax, 0x1f
0005F039  4833c1                     xor rax, rcx
0005F03C  480fafc3                   imul rax, rbx
0005F040  488bc8                     mov rcx, rax
0005F043  48c1e920                   shr rcx, 0x20
0005F047  324c1430                   xor cl, byte ptr [rsp + rdx + 0x30]
0005F04B  32c8                       xor cl, al
0005F04D  488d442470                 lea rax, [rsp + 0x70]
0005F052  48837d880f                 cmp qword ptr [rbp - 0x78], 0xf
0005F057  480f47442470               cmova rax, qword ptr [rsp + 0x70]
0005F05D  880c10                     mov byte ptr [rax + rdx], cl
0005F060  4a8d040a                   lea rax, [rdx + r9]
0005F064  488bc8                     mov rcx, rax
0005F067  48c1e911                   shr rcx, 0x11
0005F06B  4833c8                     xor rcx, rax
0005F06E  480fafcf                   imul rcx, rdi
0005F072  488bc1                     mov rax, rcx
0005F075  48c1e81f                   shr rax, 0x1f
0005F079  4833c1                     xor rax, rcx
0005F07C  480fafc3                   imul rax, rbx
0005F080  488bc8                     mov rcx, rax
0005F083  48c1e920                   shr rcx, 0x20
0005F087  324c1431                   xor cl, byte ptr [rsp + rdx + 0x31]
0005F08B  32c8                       xor cl, al
0005F08D  488d442470                 lea rax, [rsp + 0x70]
0005F092  48837d880f                 cmp qword ptr [rbp - 0x78], 0xf
0005F097  480f47442470               cmova rax, qword ptr [rsp + 0x70]
0005F09D  884c1001                   mov byte ptr [rax + rdx + 1], cl
0005F0A1  4a8d0412                   lea rax, [rdx + r10]
0005F0A5  488bc8                     mov rcx, rax
0005F0A8  48c1e911                   shr rcx, 0x11
0005F0AC  4833c8                     xor rcx, rax
0005F0AF  480fafcf                   imul rcx, rdi
0005F0B3  488bc1                     mov rax, rcx
0005F0B6  48c1e81f                   shr rax, 0x1f
0005F0BA  4833c1                     xor rax, rcx
0005F0BD  480fafc3                   imul rax, rbx
0005F0C1  488bc8                     mov rcx, rax
0005F0C4  48c1e920                   shr rcx, 0x20
0005F0C8  324c1432                   xor cl, byte ptr [rsp + rdx + 0x32]
0005F0CC  32c8                       xor cl, al
0005F0CE  488d442470                 lea rax, [rsp + 0x70]
0005F0D3  48837d880f                 cmp qword ptr [rbp - 0x78], 0xf
0005F0D8  480f47442470               cmova rax, qword ptr [rsp + 0x70]
0005F0DE  884c1002                   mov byte ptr [rax + rdx + 2], cl
0005F0E2  4a8d041a                   lea rax, [rdx + r11]
0005F0E6  488bc8                     mov rcx, rax
0005F0E9  48c1e911                   shr rcx, 0x11
0005F0ED  4833c8                     xor rcx, rax
0005F0F0  480fafcf                   imul rcx, rdi
0005F0F4  488bc1                     mov rax, rcx
0005F0F7  48c1e81f                   shr rax, 0x1f
0005F0FB  4833c1                     xor rax, rcx
0005F0FE  480fafc3                   imul rax, rbx
0005F102  488bc8                     mov rcx, rax
0005F105  48c1e920                   shr rcx, 0x20
0005F109  324c1433                   xor cl, byte ptr [rsp + rdx + 0x33]
0005F10D  32c8                       xor cl, al
0005F10F  488d442470                 lea rax, [rsp + 0x70]
0005F114  48837d880f                 cmp qword ptr [rbp - 0x78], 0xf
0005F119  480f47442470               cmova rax, qword ptr [rsp + 0x70]
0005F11F  884c1003                   mov byte ptr [rax + rdx + 3], cl
0005F123  4a8d0432                   lea rax, [rdx + r14]
0005F127  488bc8                     mov rcx, rax
0005F12A  48c1e911                   shr rcx, 0x11
0005F12E  4833c8                     xor rcx, rax
0005F131  480fafcf                   imul rcx, rdi
0005F135  488bc1                     mov rax, rcx
0005F138  48c1e81f                   shr rax, 0x1f
0005F13C  4833c1                     xor rax, rcx
0005F13F  480fafc3                   imul rax, rbx
0005F143  488bc8                     mov rcx, rax
0005F146  48c1e920                   shr rcx, 0x20
0005F14A  324c1434                   xor cl, byte ptr [rsp + rdx + 0x34]
0005F14E  32c8                       xor cl, al
0005F150  488d442470                 lea rax, [rsp + 0x70]
0005F155  48837d880f                 cmp qword ptr [rbp - 0x78], 0xf
0005F15A  480f47442470               cmova rax, qword ptr [rsp + 0x70]
0005F160  884c1004                   mov byte ptr [rax + rdx + 4], cl
0005F164  4a8d043a                   lea rax, [rdx + r15]
0005F168  488bc8                     mov rcx, rax
0005F16B  48c1e911                   shr rcx, 0x11
0005F16F  4833c8                     xor rcx, rax
0005F172  480fafcf                   imul rcx, rdi
0005F176  488bc1                     mov rax, rcx
0005F179  48c1e81f                   shr rax, 0x1f
0005F17D  4833c1                     xor rax, rcx
0005F180  480fafc3                   imul rax, rbx
0005F184  488bc8                     mov rcx, rax
0005F187  48c1e920                   shr rcx, 0x20
0005F18B  324c1435                   xor cl, byte ptr [rsp + rdx + 0x35]
0005F18F  32c8                       xor cl, al
0005F191  488d442470                 lea rax, [rsp + 0x70]
0005F196  48837d880f                 cmp qword ptr [rbp - 0x78], 0xf
0005F19B  480f47442470               cmova rax, qword ptr [rsp + 0x70]
0005F1A1  884c1005                   mov byte ptr [rax + rdx + 5], cl
0005F1A5  4a8d0422                   lea rax, [rdx + r12]
0005F1A9  488bc8                     mov rcx, rax
0005F1AC  48c1e911                   shr rcx, 0x11
0005F1B0  4833c8                     xor rcx, rax
0005F1B3  480fafcf                   imul rcx, rdi
0005F1B7  488bc1                     mov rax, rcx
0005F1BA  48c1e81f                   shr rax, 0x1f
0005F1BE  4833c1                     xor rax, rcx
0005F1C1  480fafc3                   imul rax, rbx
0005F1C5  488bc8                     mov rcx, rax
0005F1C8  48c1e920                   shr rcx, 0x20
0005F1CC  324c1436                   xor cl, byte ptr [rsp + rdx + 0x36]
0005F1D0  32c8                       xor cl, al
0005F1D2  488d442470                 lea rax, [rsp + 0x70]
0005F1D7  48837d880f                 cmp qword ptr [rbp - 0x78], 0xf
0005F1DC  480f47442470               cmova rax, qword ptr [rsp + 0x70]
0005F1E2  884c1006                   mov byte ptr [rax + rdx + 6], cl
0005F1E6  4a8d042a                   lea rax, [rdx + r13]
0005F1EA  488bc8                     mov rcx, rax
0005F1ED  48c1e911                   shr rcx, 0x11
0005F1F1  4833c8                     xor rcx, rax
0005F1F4  480fafcf                   imul rcx, rdi
0005F1F8  488bc1                     mov rax, rcx
0005F1FB  48c1e81f                   shr rax, 0x1f
0005F1FF  4833c1                     xor rax, rcx
0005F202  480fafc3                   imul rax, rbx
0005F206  488bc8                     mov rcx, rax
0005F209  48c1e920                   shr rcx, 0x20
0005F20D  324c1437                   xor cl, byte ptr [rsp + rdx + 0x37]
0005F211  32c8                       xor cl, al
0005F213  488d442470                 lea rax, [rsp + 0x70]
0005F218  48837d880f                 cmp qword ptr [rbp - 0x78], 0xf
0005F21D  480f47442470               cmova rax, qword ptr [rsp + 0x70]
0005F223  884c1007                   mov byte ptr [rax + rdx + 7], cl
0005F227  488d0432                   lea rax, [rdx + rsi]
0005F22B  488bc8                     mov rcx, rax
0005F22E  48c1e911                   shr rcx, 0x11
0005F232  4833c8                     xor rcx, rax
0005F235  480fafcf                   imul rcx, rdi
0005F239  488bc1                     mov rax, rcx
0005F23C  48c1e81f                   shr rax, 0x1f
0005F240  4833c1                     xor rax, rcx
0005F243  480fafc3                   imul rax, rbx
0005F247  488bc8                     mov rcx, rax
0005F24A  48c1e920                   shr rcx, 0x20
0005F24E  324c1438                   xor cl, byte ptr [rsp + rdx + 0x38]
0005F252  32c8                       xor cl, al
0005F254  488d442470                 lea rax, [rsp + 0x70]
0005F259  48837d880f                 cmp qword ptr [rbp - 0x78], 0xf
0005F25E  480f47442470               cmova rax, qword ptr [rsp + 0x70]
0005F264  884c1008                   mov byte ptr [rax + rdx + 8], cl
0005F268  4883c209                   add rdx, 9
0005F26C  4883fa2d                   cmp rdx, 0x2d
0005F270  0f82aafdffff               jb 0x5f020
0005F276  488d442430                 lea rax, [rsp + 0x30]
0005F27B  b92e000000                 mov ecx, 0x2e
0005F280  bec59d1c81                 mov esi, 0x811c9dc5
0005F285  6666660f1f840000000000     nop word ptr [rax + rax]
0005F290  c60000                     mov byte ptr [rax], 0
0005F293  488d4001                   lea rax, [rax + 1]
0005F297  4883e901                   sub rcx, 1
0005F29B  75f3                       jne 0x5f290
0005F29D  488d542470                 lea rdx, [rsp + 0x70]
0005F2A2  48837d880f                 cmp qword ptr [rbp - 0x78], 0xf
0005F2A7  480f47542470               cmova rdx, qword ptr [rsp + 0x70]
0005F2AD  4c8b4580                   mov r8, qword ptr [rbp - 0x80]
0005F2B1  e85a59fdff                 call 0x34c10
0005F2B6  90                         nop 
0005F2B7  488b5588                   mov rdx, qword ptr [rbp - 0x78]
0005F2BB  4883fa0f                   cmp rdx, 0xf
0005F2BF  7632                       jbe 0x5f2f3
0005F2C1  48ffc2                     inc rdx
0005F2C4  488b4c2470                 mov rcx, qword ptr [rsp + 0x70]
0005F2C9  4881fa00100000             cmp rdx, 0x1000
0005F2D0  721c                       jb 0x5f2ee
0005F2D2  488b41f8                   mov rax, qword ptr [rcx - 8]
0005F2D6  482bc8                     sub rcx, rax
0005F2D9  4883e908                   sub rcx, 8
0005F2DD  4883f91f                   cmp rcx, 0x1f
0005F2E1  0f87a50d0000               ja 0x6008c
0005F2E7  4883c227                   add rdx, 0x27
0005F2EB  488bc8                     mov rcx, rax
0005F2EE  e87995fdff                 call 0x3886c
0005F2F3  48c7458000000000           mov qword ptr [rbp - 0x80], 0
0005F2FB  48c745880f000000           mov qword ptr [rbp - 0x78], 0xf
0005F303  c644247000                 mov byte ptr [rsp + 0x70], 0
0005F308  660f6f0500e6faff           movdqa xmm0, xmmword ptr [rip - 0x51a00]   ; -> 0xd910
0005F310  f30f7f442470               movdqu xmmword ptr [rsp + 0x70], xmm0
0005F316  660f6f0dd2e5faff           movdqa xmm1, xmmword ptr [rip - 0x51a2e]   ; -> 0xd8f0
0005F31E  f30f7f4d80                 movdqu xmmword ptr [rbp - 0x80], xmm1
0005F323  c7459095b13ec2             mov dword ptr [rbp - 0x70], 0xc23eb195
0005F32A  c74594cf768ba7             mov dword ptr [rbp - 0x6c], 0xa78b76cf
0005F331  66c745981c8c               mov word ptr [rbp - 0x68], 0x8c1c
0005F337  0f57c0                     xorps xmm0, xmm0
0005F33A  0f11442430                 movups xmmword ptr [rsp + 0x30], xmm0
0005F33F  48c744244000000000         mov qword ptr [rsp + 0x40], 0
0005F348  48c74424480f000000         mov qword ptr [rsp + 0x48], 0xf
0005F351  c644243000                 mov byte ptr [rsp + 0x30], 0
0005F356  c785d803000064000000       mov dword ptr [rbp + 0x3d8], 0x64
0005F360  4533c0                     xor r8d, r8d
0005F363  ba29000000                 mov edx, 0x29
0005F368  488d4c2430                 lea rcx, [rsp + 0x30]
0005F36D  e84e55fdff                 call 0x348c0
0005F372  33d2                       xor edx, edx
0005F374  49b87ead7a19d9c5857a       movabs r8, 0x7a85c5d9197aad7e
0005F37E  6690                       nop 
0005F380  4a8d0402                   lea rax, [rdx + r8]
0005F384  488bc8                     mov rcx, rax
0005F387  48c1e911                   shr rcx, 0x11
0005F38B  4833c8                     xor rcx, rax
0005F38E  480fafcf                   imul rcx, rdi
0005F392  488bc1                     mov rax, rcx
0005F395  48c1e81f                   shr rax, 0x1f
0005F399  4833c1                     xor rax, rcx
0005F39C  480fafc3                   imul rax, rbx
0005F3A0  488bc8                     mov rcx, rax
0005F3A3  48c1e920                   shr rcx, 0x20
0005F3A7  324c1470                   xor cl, byte ptr [rsp + rdx + 0x70]
0005F3AB  32c8                       xor cl, al
0005F3AD  488d442430                 lea rax, [rsp + 0x30]
0005F3B2  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005F3B8  480f47442430               cmova rax, qword ptr [rsp + 0x30]
0005F3BE  880c02                     mov byte ptr [rdx + rax], cl
0005F3C1  48ffc2                     inc rdx
0005F3C4  4883fa29                   cmp rdx, 0x29
0005F3C8  72b6                       jb 0x5f380
0005F3CA  488d442470                 lea rax, [rsp + 0x70]
0005F3CF  b92a000000                 mov ecx, 0x2a
0005F3D4  0f1f4000                   nop dword ptr [rax]
0005F3D8  0f1f840000000000           nop dword ptr [rax + rax]
0005F3E0  c60000                     mov byte ptr [rax], 0
0005F3E3  488d4001                   lea rax, [rax + 1]
0005F3E7  4883e901                   sub rcx, 1
0005F3EB  75f3                       jne 0x5f3e0
0005F3ED  488d542430                 lea rdx, [rsp + 0x30]
0005F3F2  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005F3F8  480f47542430               cmova rdx, qword ptr [rsp + 0x30]
0005F3FE  4c8b442440                 mov r8, qword ptr [rsp + 0x40]
0005F403  e80858fdff                 call 0x34c10
0005F408  90                         nop 
0005F409  e90b0b0000                 jmp 0x5ff19
0005F40E  428b4c2b24                 mov ecx, dword ptr [rbx + r13 + 0x24]
0005F413  4803cb                     add rcx, rbx
0005F416  420fb71459                 movzx edx, word ptr [rcx + r11*2]
0005F41B  428b4c2b1c                 mov ecx, dword ptr [rbx + r13 + 0x1c]
0005F420  4803cb                     add rcx, rbx
0005F423  8b0c91                     mov ecx, dword ptr [rcx + rdx*4]
0005F426  413bcd                     cmp ecx, r13d
0005F429  0f82b7010000               jb 0x5f5e6
0005F42F  8b85f0030000               mov eax, dword ptr [rbp + 0x3f0]
0005F435  4103c5                     add eax, r13d
0005F438  3bc8                       cmp ecx, eax
0005F43A  0f83a6010000               jae 0x5f5e6
0005F440  488d3c0b                   lea rdi, [rbx + rcx]
0005F444  0f57c0                     xorps xmm0, xmm0
0005F447  0f11442430                 movups xmmword ptr [rsp + 0x30], xmm0
0005F44C  0f11442440                 movups xmmword ptr [rsp + 0x40], xmm0
0005F451  0f11442450                 movups xmmword ptr [rsp + 0x50], xmm0
0005F456  0f11442460                 movups xmmword ptr [rsp + 0x60], xmm0
0005F45B  33c9                       xor ecx, ecx
0005F45D  380f                       cmp byte ptr [rdi], cl
0005F45F  0f8400f2ffff               je 0x5e665
0005F465  83f93c                     cmp ecx, 0x3c
0005F468  0f8df7f1ffff               jge 0x5e665
0005F46E  4863c1                     movsxd rax, ecx
0005F471  488d1c07                   lea rbx, [rdi + rax]
0005F475  0fb613                     movzx edx, byte ptr [rbx]
0005F478  80fa2e                     cmp dl, 0x2e
0005F47B  7414                       je 0x5f491
0005F47D  88540430                   mov byte ptr [rsp + rax + 0x30], dl
0005F481  ffc1                       inc ecx
0005F483  4863c1                     movsxd rax, ecx
0005F486  803c3800                   cmp byte ptr [rax + rdi], 0
0005F48A  75d9                       jne 0x5f465
0005F48C  e9d4f1ffff                 jmp 0x5e665
0005F491  85c9                       test ecx, ecx
0005F493  0f88ccf1ffff               js 0x5e665
0005F499  c64404302e                 mov byte ptr [rsp + rax + 0x30], 0x2e
0005F49E  4863c1                     movsxd rax, ecx
0005F4A1  c644043144                 mov byte ptr [rsp + rax + 0x31], 0x44
0005F4A6  4863c1                     movsxd rax, ecx
0005F4A9  c64404324c                 mov byte ptr [rsp + rax + 0x32], 0x4c
0005F4AE  4863c1                     movsxd rax, ecx
0005F4B1  c64404334c                 mov byte ptr [rsp + rax + 0x33], 0x4c
0005F4B6  4863c1                     movsxd rax, ecx
0005F4B9  c644043400                 mov byte ptr [rsp + rax + 0x34], 0
0005F4BE  0f57c0                     xorps xmm0, xmm0
0005F4C1  0f114510                   movups xmmword ptr [rbp + 0x10], xmm0
0005F4C5  0f114520                   movups xmmword ptr [rbp + 0x20], xmm0
0005F4C9  0f114530                   movups xmmword ptr [rbp + 0x30], xmm0
0005F4CD  0f114540                   movups xmmword ptr [rbp + 0x40], xmm0
0005F4D1  0f114550                   movups xmmword ptr [rbp + 0x50], xmm0
0005F4D5  0f114560                   movups xmmword ptr [rbp + 0x60], xmm0
0005F4D9  0f114570                   movups xmmword ptr [rbp + 0x70], xmm0
0005F4DD  0f118580000000             movups xmmword ptr [rbp + 0x80], xmm0
0005F4E4  33d2                       xor edx, edx
0005F4E6  38542430                   cmp byte ptr [rsp + 0x30], dl
0005F4EA  7422                       je 0x5f50e
0005F4EC  0f1f4000                   nop dword ptr [rax]
0005F4F0  83fa3f                     cmp edx, 0x3f
0005F4F3  7d19                       jge 0x5f50e
0005F4F5  4863ca                     movsxd rcx, edx
0005F4F8  0fbe440c30                 movsx eax, byte ptr [rsp + rcx + 0x30]
0005F4FD  6689444d10                 mov word ptr [rbp + rcx*2 + 0x10], ax
0005F502  ffc2                       inc edx
0005F504  4863c2                     movsxd rax, edx
0005F507  807c043000                 cmp byte ptr [rsp + rax + 0x30], 0
0005F50C  75e2                       jne 0x5f4f0
0005F50E  488d7d10                   lea rdi, [rbp + 0x10]
0005F512  448bd6                     mov r10d, esi
0005F515  0fb74510                   movzx eax, word ptr [rbp + 0x10]
0005F519  6685c0                     test ax, ax
0005F51C  742a                       je 0x5f548
0005F51E  6690                       nop 
0005F520  488d7f02                   lea rdi, [rdi + 2]
0005F524  8d509f                     lea edx, [rax - 0x61]
0005F527  0fb6c8                     movzx ecx, al
0005F52A  2c20                       sub al, 0x20
0005F52C  6683fa19                   cmp dx, 0x19
0005F530  0f47c1                     cmova eax, ecx
0005F533  0fbec0                     movsx eax, al
0005F536  4133c2                     xor eax, r10d
0005F539  4469d093010001             imul r10d, eax, 0x1000193
0005F540  0fb707                     movzx eax, word ptr [rdi]
0005F543  6685c0                     test ax, ax
0005F546  75d8                       jne 0x5f520
0005F548  65488b042560000000         mov rax, qword ptr gs:[0x60]
0005F551  4c8b5818                   mov r11, qword ptr [rax + 0x18]
0005F555  4983c320                   add r11, 0x20
0005F559  4d8b0b                     mov r9, qword ptr [r11]
0005F55C  4d3bcb                     cmp r9, r11
0005F55F  0f8400f1ffff               je 0x5e665
0005F565  498b7950                   mov rdi, qword ptr [r9 + 0x50]
0005F569  4885ff                     test rdi, rdi
0005F56C  743f                       je 0x5f5ad
0005F56E  448bc6                     mov r8d, esi
0005F571  0fb707                     movzx eax, word ptr [rdi]
0005F574  6685c0                     test ax, ax
0005F577  742f                       je 0x5f5a8
0005F579  0f1f8000000000             nop dword ptr [rax]
0005F580  488d7f02                   lea rdi, [rdi + 2]
0005F584  8d509f                     lea edx, [rax - 0x61]
0005F587  0fb6c8                     movzx ecx, al
0005F58A  2c20                       sub al, 0x20
0005F58C  6683fa19                   cmp dx, 0x19
0005F590  0f47c1                     cmova eax, ecx
0005F593  0fbec0                     movsx eax, al
0005F596  4133c0                     xor eax, r8d
0005F599  4469c093010001             imul r8d, eax, 0x1000193
0005F5A0  0fb707                     movzx eax, word ptr [rdi]
0005F5A3  6685c0                     test ax, ax
0005F5A6  75d8                       jne 0x5f580
0005F5A8  453bc2                     cmp r8d, r10d
0005F5AB  740d                       je 0x5f5ba
0005F5AD  4d8b09                     mov r9, qword ptr [r9]
0005F5B0  4d3bcb                     cmp r9, r11
0005F5B3  75b0                       jne 0x5f565
0005F5B5  e9abf0ffff                 jmp 0x5e665
0005F5BA  498b7920                   mov rdi, qword ptr [r9 + 0x20]
0005F5BE  4885ff                     test rdi, rdi
0005F5C1  0f849ef0ffff               je 0x5e665
0005F5C7  488d4b01                   lea rcx, [rbx + 1]
0005F5CB  e81063fbff                 call 0x158e0
0005F5D0  8bd0                       mov edx, eax
0005F5D2  488bcf                     mov rcx, rdi
0005F5D5  e8a663fbff                 call 0x15980
0005F5DA  4c8bbdd8030000             mov r15, qword ptr [rbp + 0x3d8]
0005F5E1  e988f0ffff                 jmp 0x5e66e
0005F5E6  488d040b                   lea rax, [rbx + rcx]
0005F5EA  4c8bbdd8030000             mov r15, qword ptr [rbp + 0x3d8]
0005F5F1  e978f0ffff                 jmp 0x5e66e
0005F5F6  498b5920                   mov rbx, qword ptr [r9 + 0x20]
0005F5FA  4885db                     test rbx, rbx
0005F5FD  0f843af7ffff               je 0x5ed3d
0005F603  48634b3c                   movsxd rcx, dword ptr [rbx + 0x3c]
0005F607  8b84198c000000             mov eax, dword ptr [rcx + rbx + 0x8c]
0005F60E  8985d8030000               mov dword ptr [rbp + 0x3d8], eax
0005F614  85c0                       test eax, eax
0005F616  0f8421f7ffff               je 0x5ed3d
0005F61C  448bac1988000000           mov r13d, dword ptr [rcx + rbx + 0x88]
0005F624  468b7c2b20                 mov r15d, dword ptr [rbx + r13 + 0x20]
0005F629  4c03fb                     add r15, rbx
0005F62C  4533db                     xor r11d, r11d
0005F62F  468b642b18                 mov r12d, dword ptr [rbx + r13 + 0x18]
0005F634  4585e4                     test r12d, r12d
0005F637  0f8400f7ffff               je 0x5ed3d
0005F63D  0f1f00                     nop dword ptr [rax]
0005F640  478b049f                   mov r8d, dword ptr [r15 + r11*4]
0005F644  4c03c3                     add r8, rbx
0005F647  448bd6                     mov r10d, esi
0005F64A  410fb638                   movzx edi, byte ptr [r8]
0005F64E  4084ff                     test dil, dil
0005F651  7436                       je 0x5f689
0005F653  4d8d4001                   lea r8, [r8 + 1]
0005F657  8d579f                     lea edx, [rdi - 0x61]
0005F65A  8d47e0                     lea eax, [rdi - 0x20]
0005F65D  0fb6c8                     movzx ecx, al
0005F660  400fb6c7                   movzx eax, dil
0005F664  80fa19                     cmp dl, 0x19
0005F667  0f47c8                     cmova ecx, eax
0005F66A  0fbec1                     movsx eax, cl
0005F66D  4133c2                     xor eax, r10d
0005F670  4469d093010001             imul r10d, eax, 0x1000193
0005F677  410fb638                   movzx edi, byte ptr [r8]
0005F67B  4084ff                     test dil, dil
0005F67E  75d3                       jne 0x5f653
0005F680  4181fab5882a67             cmp r10d, 0x672a88b5
0005F687  740d                       je 0x5f696
0005F689  41ffc3                     inc r11d
0005F68C  453bdc                     cmp r11d, r12d
0005F68F  72af                       jb 0x5f640
0005F691  e9a7f6ffff                 jmp 0x5ed3d
0005F696  428b4c2b24                 mov ecx, dword ptr [rbx + r13 + 0x24]
0005F69B  4803cb                     add rcx, rbx
0005F69E  420fb71459                 movzx edx, word ptr [rcx + r11*2]
0005F6A3  428b4c2b1c                 mov ecx, dword ptr [rbx + r13 + 0x1c]
0005F6A8  4803cb                     add rcx, rbx
0005F6AB  8b0c91                     mov ecx, dword ptr [rcx + rdx*4]
0005F6AE  413bcd                     cmp ecx, r13d
0005F6B1  0f82f6010000               jb 0x5f8ad
0005F6B7  8b85d8030000               mov eax, dword ptr [rbp + 0x3d8]
0005F6BD  4103c5                     add eax, r13d
0005F6C0  3bc8                       cmp ecx, eax
0005F6C2  0f83e5010000               jae 0x5f8ad
0005F6C8  488d3c0b                   lea rdi, [rbx + rcx]
0005F6CC  0f57c0                     xorps xmm0, xmm0
0005F6CF  0f11442430                 movups xmmword ptr [rsp + 0x30], xmm0
0005F6D4  0f11442440                 movups xmmword ptr [rsp + 0x40], xmm0
0005F6D9  0f11442450                 movups xmmword ptr [rsp + 0x50], xmm0
0005F6DE  0f11442460                 movups xmmword ptr [rsp + 0x60], xmm0
0005F6E3  33c9                       xor ecx, ecx
0005F6E5  380f                       cmp byte ptr [rdi], cl
0005F6E7  0f8450f6ffff               je 0x5ed3d
0005F6ED  0f1f00                     nop dword ptr [rax]
0005F6F0  83f93c                     cmp ecx, 0x3c
0005F6F3  0f8d44f6ffff               jge 0x5ed3d
0005F6F9  4863c1                     movsxd rax, ecx
0005F6FC  488d1c07                   lea rbx, [rdi + rax]
0005F700  0fb613                     movzx edx, byte ptr [rbx]
0005F703  80fa2e                     cmp dl, 0x2e
0005F706  7414                       je 0x5f71c
0005F708  88540430                   mov byte ptr [rsp + rax + 0x30], dl
0005F70C  ffc1                       inc ecx
0005F70E  4863c1                     movsxd rax, ecx
0005F711  803c3800                   cmp byte ptr [rax + rdi], 0
0005F715  75d9                       jne 0x5f6f0
0005F717  e921f6ffff                 jmp 0x5ed3d
0005F71C  85c9                       test ecx, ecx
0005F71E  0f8819f6ffff               js 0x5ed3d
0005F724  c64404302e                 mov byte ptr [rsp + rax + 0x30], 0x2e
0005F729  4863c1                     movsxd rax, ecx
0005F72C  c644043144                 mov byte ptr [rsp + rax + 0x31], 0x44
0005F731  4863c1                     movsxd rax, ecx
0005F734  c64404324c                 mov byte ptr [rsp + rax + 0x32], 0x4c
0005F739  4863c1                     movsxd rax, ecx
0005F73C  c64404334c                 mov byte ptr [rsp + rax + 0x33], 0x4c
0005F741  4863c1                     movsxd rax, ecx
0005F744  c644043400                 mov byte ptr [rsp + rax + 0x34], 0
0005F749  0f57c0                     xorps xmm0, xmm0
0005F74C  0f114510                   movups xmmword ptr [rbp + 0x10], xmm0
0005F750  0f114520                   movups xmmword ptr [rbp + 0x20], xmm0
0005F754  0f114530                   movups xmmword ptr [rbp + 0x30], xmm0
0005F758  0f114540                   movups xmmword ptr [rbp + 0x40], xmm0
0005F75C  0f114550                   movups xmmword ptr [rbp + 0x50], xmm0
0005F760  0f114560                   movups xmmword ptr [rbp + 0x60], xmm0
0005F764  0f114570                   movups xmmword ptr [rbp + 0x70], xmm0
0005F768  0f118580000000             movups xmmword ptr [rbp + 0x80], xmm0
0005F76F  33d2                       xor edx, edx
0005F771  38542430                   cmp byte ptr [rsp + 0x30], dl
0005F775  741e                       je 0x5f795
0005F777  83fa3f                     cmp edx, 0x3f
0005F77A  7d19                       jge 0x5f795
0005F77C  4863ca                     movsxd rcx, edx
0005F77F  0fbe440c30                 movsx eax, byte ptr [rsp + rcx + 0x30]
0005F784  6689444d10                 mov word ptr [rbp + rcx*2 + 0x10], ax
0005F789  ffc2                       inc edx
0005F78B  4863c2                     movsxd rax, edx
0005F78E  807c043000                 cmp byte ptr [rsp + rax + 0x30], 0
0005F793  75e2                       jne 0x5f777
0005F795  488d7d10                   lea rdi, [rbp + 0x10]
0005F799  448bd6                     mov r10d, esi
0005F79C  0fb74510                   movzx eax, word ptr [rbp + 0x10]
0005F7A0  6685c0                     test ax, ax
0005F7A3  7433                       je 0x5f7d8
0005F7A5  6666660f1f840000000000     nop word ptr [rax + rax]
0005F7B0  488d7f02                   lea rdi, [rdi + 2]
0005F7B4  8d509f                     lea edx, [rax - 0x61]
0005F7B7  0fb6c8                     movzx ecx, al
0005F7BA  2c20                       sub al, 0x20
0005F7BC  6683fa19                   cmp dx, 0x19
0005F7C0  0f47c1                     cmova eax, ecx
0005F7C3  0fbec0                     movsx eax, al
0005F7C6  4133c2                     xor eax, r10d
0005F7C9  4469d093010001             imul r10d, eax, 0x1000193
0005F7D0  0fb707                     movzx eax, word ptr [rdi]
0005F7D3  6685c0                     test ax, ax
0005F7D6  75d8                       jne 0x5f7b0
0005F7D8  65488b042560000000         mov rax, qword ptr gs:[0x60]
0005F7E1  4c8b5818                   mov r11, qword ptr [rax + 0x18]
0005F7E5  4983c320                   add r11, 0x20
0005F7E9  4d8b0b                     mov r9, qword ptr [r11]
0005F7EC  4d3bcb                     cmp r9, r11
0005F7EF  0f8448f5ffff               je 0x5ed3d
0005F7F5  498b7950                   mov rdi, qword ptr [r9 + 0x50]
0005F7F9  4885ff                     test rdi, rdi
0005F7FC  743f                       je 0x5f83d
0005F7FE  448bc6                     mov r8d, esi
0005F801  0fb707                     movzx eax, word ptr [rdi]
0005F804  6685c0                     test ax, ax
0005F807  742f                       je 0x5f838
0005F809  0f1f8000000000             nop dword ptr [rax]
0005F810  488d7f02                   lea rdi, [rdi + 2]
0005F814  8d509f                     lea edx, [rax - 0x61]
0005F817  0fb6c8                     movzx ecx, al
0005F81A  2c20                       sub al, 0x20
0005F81C  6683fa19                   cmp dx, 0x19
0005F820  0f47c1                     cmova eax, ecx
0005F823  0fbec0                     movsx eax, al
0005F826  4133c0                     xor eax, r8d
0005F829  4469c093010001             imul r8d, eax, 0x1000193
0005F830  0fb707                     movzx eax, word ptr [rdi]
0005F833  6685c0                     test ax, ax
0005F836  75d8                       jne 0x5f810
0005F838  453bc2                     cmp r8d, r10d
0005F83B  740d                       je 0x5f84a
0005F83D  4d8b09                     mov r9, qword ptr [r9]
0005F840  4d3bcb                     cmp r9, r11
0005F843  75b0                       jne 0x5f7f5
0005F845  e9f3f4ffff                 jmp 0x5ed3d
0005F84A  4d8b5120                   mov r10, qword ptr [r9 + 0x20]
0005F84E  4d85d2                     test r10, r10
0005F851  0f84e6f4ffff               je 0x5ed3d
0005F857  4c8d4301                   lea r8, [rbx + 1]
0005F85B  448bce                     mov r9d, esi
0005F85E  410fb638                   movzx edi, byte ptr [r8]
0005F862  4084ff                     test dil, dil
0005F865  7436                       je 0x5f89d
0005F867  660f1f840000000000         nop word ptr [rax + rax]
0005F870  4d8d4001                   lea r8, [r8 + 1]
0005F874  8d579f                     lea edx, [rdi - 0x61]
0005F877  8d47e0                     lea eax, [rdi - 0x20]
0005F87A  0fb6c8                     movzx ecx, al
0005F87D  400fb6c7                   movzx eax, dil
0005F881  80fa19                     cmp dl, 0x19
0005F884  0f47c8                     cmova ecx, eax
0005F887  0fbec1                     movsx eax, cl
0005F88A  4133c1                     xor eax, r9d
0005F88D  4469c893010001             imul r9d, eax, 0x1000193
0005F894  410fb638                   movzx edi, byte ptr [r8]
0005F898  4084ff                     test dil, dil
0005F89B  75d3                       jne 0x5f870
0005F89D  418bd1                     mov edx, r9d
0005F8A0  498bca                     mov rcx, r10
0005F8A3  e8d860fbff                 call 0x15980
0005F8A8  e992f4ffff                 jmp 0x5ed3f
0005F8AD  488d040b                   lea rax, [rbx + rcx]
0005F8B1  e989f4ffff                 jmp 0x5ed3f
0005F8B6  498b5920                   mov rbx, qword ptr [r9 + 0x20]
0005F8BA  4885db                     test rbx, rbx
0005F8BD  0f842af5ffff               je 0x5eded
0005F8C3  48634b3c                   movsxd rcx, dword ptr [rbx + 0x3c]
0005F8C7  8b84198c000000             mov eax, dword ptr [rcx + rbx + 0x8c]
0005F8CE  8985f0030000               mov dword ptr [rbp + 0x3f0], eax
0005F8D4  85c0                       test eax, eax
0005F8D6  0f8411f5ffff               je 0x5eded
0005F8DC  448bac1988000000           mov r13d, dword ptr [rcx + rbx + 0x88]
0005F8E4  468b7c2b20                 mov r15d, dword ptr [rbx + r13 + 0x20]
0005F8E9  4c03fb                     add r15, rbx
0005F8EC  4533db                     xor r11d, r11d
0005F8EF  468b642b18                 mov r12d, dword ptr [rbx + r13 + 0x18]
0005F8F4  4585e4                     test r12d, r12d
0005F8F7  0f84f0f4ffff               je 0x5eded
0005F8FD  0f1f00                     nop dword ptr [rax]
0005F900  478b049f                   mov r8d, dword ptr [r15 + r11*4]
0005F904  4c03c3                     add r8, rbx
0005F907  448bd6                     mov r10d, esi
0005F90A  410fb638                   movzx edi, byte ptr [r8]
0005F90E  4084ff                     test dil, dil
0005F911  7436                       je 0x5f949
0005F913  4d8d4001                   lea r8, [r8 + 1]
0005F917  8d579f                     lea edx, [rdi - 0x61]
0005F91A  8d47e0                     lea eax, [rdi - 0x20]
0005F91D  0fb6c8                     movzx ecx, al
0005F920  400fb6c7                   movzx eax, dil
0005F924  80fa19                     cmp dl, 0x19
0005F927  0f47c8                     cmova ecx, eax
0005F92A  0fbec1                     movsx eax, cl
0005F92D  4133c2                     xor eax, r10d
0005F930  4469d093010001             imul r10d, eax, 0x1000193
0005F937  410fb638                   movzx edi, byte ptr [r8]
0005F93B  4084ff                     test dil, dil
0005F93E  75d3                       jne 0x5f913
0005F940  4181fab5882a67             cmp r10d, 0x672a88b5
0005F947  740d                       je 0x5f956
0005F949  41ffc3                     inc r11d
0005F94C  453bdc                     cmp r11d, r12d
0005F94F  72af                       jb 0x5f900
0005F951  e997f4ffff                 jmp 0x5eded
0005F956  428b4c2b24                 mov ecx, dword ptr [rbx + r13 + 0x24]
0005F95B  4803cb                     add rcx, rbx
0005F95E  420fb71459                 movzx edx, word ptr [rcx + r11*2]
0005F963  428b4c2b1c                 mov ecx, dword ptr [rbx + r13 + 0x1c]
0005F968  4803cb                     add rcx, rbx
0005F96B  8b0c91                     mov ecx, dword ptr [rcx + rdx*4]
0005F96E  413bcd                     cmp ecx, r13d
0005F971  0f82b8010000               jb 0x5fb2f
0005F977  8b85f0030000               mov eax, dword ptr [rbp + 0x3f0]
0005F97D  4103c5                     add eax, r13d
0005F980  3bc8                       cmp ecx, eax
0005F982  0f83a7010000               jae 0x5fb2f
0005F988  488d3c0b                   lea rdi, [rbx + rcx]
0005F98C  0f57c0                     xorps xmm0, xmm0
0005F98F  0f11442430                 movups xmmword ptr [rsp + 0x30], xmm0
0005F994  0f11442440                 movups xmmword ptr [rsp + 0x40], xmm0
0005F999  0f11442450                 movups xmmword ptr [rsp + 0x50], xmm0
0005F99E  0f11442460                 movups xmmword ptr [rsp + 0x60], xmm0
0005F9A3  33c9                       xor ecx, ecx
0005F9A5  380f                       cmp byte ptr [rdi], cl
0005F9A7  0f8440f4ffff               je 0x5eded
0005F9AD  0f1f00                     nop dword ptr [rax]
0005F9B0  83f93c                     cmp ecx, 0x3c
0005F9B3  0f8d34f4ffff               jge 0x5eded
0005F9B9  4863c1                     movsxd rax, ecx
0005F9BC  488d1c38                   lea rbx, [rax + rdi]
0005F9C0  0fb613                     movzx edx, byte ptr [rbx]
0005F9C3  80fa2e                     cmp dl, 0x2e
0005F9C6  7414                       je 0x5f9dc
0005F9C8  88540430                   mov byte ptr [rsp + rax + 0x30], dl
0005F9CC  ffc1                       inc ecx
0005F9CE  4863c1                     movsxd rax, ecx
0005F9D1  803c3800                   cmp byte ptr [rax + rdi], 0
0005F9D5  75d9                       jne 0x5f9b0
0005F9D7  e911f4ffff                 jmp 0x5eded
0005F9DC  85c9                       test ecx, ecx
0005F9DE  0f8809f4ffff               js 0x5eded
0005F9E4  c64404302e                 mov byte ptr [rsp + rax + 0x30], 0x2e
0005F9E9  4863c1                     movsxd rax, ecx
0005F9EC  c644043144                 mov byte ptr [rsp + rax + 0x31], 0x44
0005F9F1  4863c1                     movsxd rax, ecx
0005F9F4  c64404324c                 mov byte ptr [rsp + rax + 0x32], 0x4c
0005F9F9  4863c1                     movsxd rax, ecx
0005F9FC  c64404334c                 mov byte ptr [rsp + rax + 0x33], 0x4c
0005FA01  4863c1                     movsxd rax, ecx
0005FA04  c644043400                 mov byte ptr [rsp + rax + 0x34], 0
0005FA09  0f57c0                     xorps xmm0, xmm0
0005FA0C  0f114510                   movups xmmword ptr [rbp + 0x10], xmm0
0005FA10  0f114520                   movups xmmword ptr [rbp + 0x20], xmm0
0005FA14  0f114530                   movups xmmword ptr [rbp + 0x30], xmm0
0005FA18  0f114540                   movups xmmword ptr [rbp + 0x40], xmm0
0005FA1C  0f114550                   movups xmmword ptr [rbp + 0x50], xmm0
0005FA20  0f114560                   movups xmmword ptr [rbp + 0x60], xmm0
0005FA24  0f114570                   movups xmmword ptr [rbp + 0x70], xmm0
0005FA28  0f118580000000             movups xmmword ptr [rbp + 0x80], xmm0
0005FA2F  33d2                       xor edx, edx
0005FA31  38542430                   cmp byte ptr [rsp + 0x30], dl
0005FA35  741e                       je 0x5fa55
0005FA37  83fa3f                     cmp edx, 0x3f
0005FA3A  7d19                       jge 0x5fa55
0005FA3C  4863ca                     movsxd rcx, edx
0005FA3F  0fbe440c30                 movsx eax, byte ptr [rsp + rcx + 0x30]
0005FA44  6689444d10                 mov word ptr [rbp + rcx*2 + 0x10], ax
0005FA49  ffc2                       inc edx
0005FA4B  4863c2                     movsxd rax, edx
0005FA4E  807c043000                 cmp byte ptr [rsp + rax + 0x30], 0
0005FA53  75e2                       jne 0x5fa37
0005FA55  488d7d10                   lea rdi, [rbp + 0x10]
0005FA59  448bd6                     mov r10d, esi
0005FA5C  0fb74510                   movzx eax, word ptr [rbp + 0x10]
0005FA60  6685c0                     test ax, ax
0005FA63  7433                       je 0x5fa98
0005FA65  6666660f1f840000000000     nop word ptr [rax + rax]
0005FA70  488d7f02                   lea rdi, [rdi + 2]
0005FA74  8d509f                     lea edx, [rax - 0x61]
0005FA77  0fb6c8                     movzx ecx, al
0005FA7A  2c20                       sub al, 0x20
0005FA7C  6683fa19                   cmp dx, 0x19
0005FA80  0f47c1                     cmova eax, ecx
0005FA83  0fbec0                     movsx eax, al
0005FA86  4133c2                     xor eax, r10d
0005FA89  4469d093010001             imul r10d, eax, 0x1000193
0005FA90  0fb707                     movzx eax, word ptr [rdi]
0005FA93  6685c0                     test ax, ax
0005FA96  75d8                       jne 0x5fa70
0005FA98  65488b042560000000         mov rax, qword ptr gs:[0x60]
0005FAA1  4c8b5818                   mov r11, qword ptr [rax + 0x18]
0005FAA5  4983c320                   add r11, 0x20
0005FAA9  4d8b0b                     mov r9, qword ptr [r11]
0005FAAC  4d3bcb                     cmp r9, r11
0005FAAF  0f8438f3ffff               je 0x5eded
0005FAB5  498b7950                   mov rdi, qword ptr [r9 + 0x50]
0005FAB9  4885ff                     test rdi, rdi
0005FABC  743f                       je 0x5fafd
0005FABE  448bc6                     mov r8d, esi
0005FAC1  0fb707                     movzx eax, word ptr [rdi]
0005FAC4  6685c0                     test ax, ax
0005FAC7  742f                       je 0x5faf8
0005FAC9  0f1f8000000000             nop dword ptr [rax]
0005FAD0  488d7f02                   lea rdi, [rdi + 2]
0005FAD4  8d509f                     lea edx, [rax - 0x61]
0005FAD7  0fb6c8                     movzx ecx, al
0005FADA  2c20                       sub al, 0x20
0005FADC  6683fa19                   cmp dx, 0x19
0005FAE0  0f47c1                     cmova eax, ecx
0005FAE3  0fbec0                     movsx eax, al
0005FAE6  4133c0                     xor eax, r8d
0005FAE9  4469c093010001             imul r8d, eax, 0x1000193
0005FAF0  0fb707                     movzx eax, word ptr [rdi]
0005FAF3  6685c0                     test ax, ax
0005FAF6  75d8                       jne 0x5fad0
0005FAF8  453bc2                     cmp r8d, r10d
0005FAFB  740d                       je 0x5fb0a
0005FAFD  4d8b09                     mov r9, qword ptr [r9]
0005FB00  4d3bcb                     cmp r9, r11
0005FB03  75b0                       jne 0x5fab5
0005FB05  e9e3f2ffff                 jmp 0x5eded
0005FB0A  498b7920                   mov rdi, qword ptr [r9 + 0x20]
0005FB0E  4885ff                     test rdi, rdi
0005FB11  0f84d6f2ffff               je 0x5eded
0005FB17  488d4b01                   lea rcx, [rbx + 1]
0005FB1B  e8c05dfbff                 call 0x158e0
0005FB20  8bd0                       mov edx, eax
0005FB22  488bcf                     mov rcx, rdi
0005FB25  e8565efbff                 call 0x15980
0005FB2A  e9c0f2ffff                 jmp 0x5edef
0005FB2F  488d040b                   lea rax, [rbx + rcx]
0005FB33  e9b7f2ffff                 jmp 0x5edef
0005FB38  488d158ddbfaff             lea rdx, [rip - 0x52473]   ; -> 0xd6cc
0005FB3F  488d0d5a310000             lea rcx, [rip + 0x315a]   ; -> 0x62ca0
0005FB46  e83549fdff                 call 0x34480
0005FB4B  488bc8                     mov rcx, rax
0005FB4E  488d55a0                   lea rdx, [rbp - 0x60]
0005FB52  e82949fdff                 call 0x34480
0005FB57  488bc8                     mov rcx, rax
0005FB5A  488d156bdbfaff             lea rdx, [rip - 0x52495]   ; -> 0xd6cc
0005FB61  e81a49fdff                 call 0x34480
0005FB66  e9eb030000                 jmp 0x5ff56
0005FB6B  660f6f05addcfaff           movdqa xmm0, xmmword ptr [rip - 0x52353]   ; -> 0xd820
0005FB73  f30f7f442470               movdqu xmmword ptr [rsp + 0x70], xmm0
0005FB79  c745802f1dd9ac             mov dword ptr [rbp - 0x80], 0xacd91d2f
0005FB80  c6458456                   mov byte ptr [rbp - 0x7c], 0x56
0005FB84  0f57c0                     xorps xmm0, xmm0
0005FB87  0f11442430                 movups xmmword ptr [rsp + 0x30], xmm0
0005FB8C  48c744244000000000         mov qword ptr [rsp + 0x40], 0
0005FB95  48c74424480f000000         mov qword ptr [rsp + 0x48], 0xf
0005FB9E  c644243000                 mov byte ptr [rsp + 0x30], 0
0005FBA3  c785d803000002000000       mov dword ptr [rbp + 0x3d8], 2
0005FBAD  4533c0                     xor r8d, r8d
0005FBB0  ba14000000                 mov edx, 0x14
0005FBB5  488d4c2430                 lea rcx, [rsp + 0x30]
0005FBBA  e8014dfdff                 call 0x348c0
0005FBBF  33d2                       xor edx, edx
0005FBC1  48bfb9e5e41c6d4758bf       movabs rdi, 0xbf58476d1ce4e5b9
0005FBCB  48bbeb113113bb49d094       movabs rbx, 0x94d049bb133111eb
0005FBD5  48be5f5e8d740ca943e3       movabs rsi, 0xe343a90c748d5e5f
0005FBDF  49b8575e8d740ca943e3       movabs r8, 0xe343a90c748d5e57
0005FBE9  49b9585e8d740ca943e3       movabs r9, 0xe343a90c748d5e58
0005FBF3  49ba595e8d740ca943e3       movabs r10, 0xe343a90c748d5e59
0005FBFD  49bb5a5e8d740ca943e3       movabs r11, 0xe343a90c748d5e5a
0005FC07  49be5b5e8d740ca943e3       movabs r14, 0xe343a90c748d5e5b
0005FC11  49bf5c5e8d740ca943e3       movabs r15, 0xe343a90c748d5e5c
0005FC1B  49bc5d5e8d740ca943e3       movabs r12, 0xe343a90c748d5e5d
0005FC25  49bd5e5e8d740ca943e3       movabs r13, 0xe343a90c748d5e5e
0005FC2F  90                         nop 
0005FC30  4a8d0402                   lea rax, [rdx + r8]
0005FC34  488bc8                     mov rcx, rax
0005FC37  48c1e911                   shr rcx, 0x11
0005FC3B  4833c8                     xor rcx, rax
0005FC3E  480fafcf                   imul rcx, rdi
0005FC42  488bc1                     mov rax, rcx
0005FC45  48c1e81f                   shr rax, 0x1f
0005FC49  4833c1                     xor rax, rcx
0005FC4C  480fafc3                   imul rax, rbx
0005FC50  488bc8                     mov rcx, rax
0005FC53  48c1e920                   shr rcx, 0x20
0005FC57  324c1470                   xor cl, byte ptr [rsp + rdx + 0x70]
0005FC5B  32c8                       xor cl, al
0005FC5D  488d442430                 lea rax, [rsp + 0x30]
0005FC62  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005FC68  480f47442430               cmova rax, qword ptr [rsp + 0x30]
0005FC6E  880c10                     mov byte ptr [rax + rdx], cl
0005FC71  4a8d040a                   lea rax, [rdx + r9]
0005FC75  488bc8                     mov rcx, rax
0005FC78  48c1e911                   shr rcx, 0x11
0005FC7C  4833c8                     xor rcx, rax
0005FC7F  480fafcf                   imul rcx, rdi
0005FC83  488bc1                     mov rax, rcx
0005FC86  48c1e81f                   shr rax, 0x1f
0005FC8A  4833c1                     xor rax, rcx
0005FC8D  480fafc3                   imul rax, rbx
0005FC91  488bc8                     mov rcx, rax
0005FC94  48c1e920                   shr rcx, 0x20
0005FC98  324c1471                   xor cl, byte ptr [rsp + rdx + 0x71]
0005FC9C  32c8                       xor cl, al
0005FC9E  488d442430                 lea rax, [rsp + 0x30]
0005FCA3  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005FCA9  480f47442430               cmova rax, qword ptr [rsp + 0x30]
0005FCAF  884c1001                   mov byte ptr [rax + rdx + 1], cl
0005FCB3  4a8d0412                   lea rax, [rdx + r10]
0005FCB7  488bc8                     mov rcx, rax
0005FCBA  48c1e911                   shr rcx, 0x11
0005FCBE  4833c8                     xor rcx, rax
0005FCC1  480fafcf                   imul rcx, rdi
0005FCC5  488bc1                     mov rax, rcx
0005FCC8  48c1e81f                   shr rax, 0x1f
0005FCCC  4833c1                     xor rax, rcx
0005FCCF  480fafc3                   imul rax, rbx
0005FCD3  488bc8                     mov rcx, rax
0005FCD6  48c1e920                   shr rcx, 0x20
0005FCDA  324c1472                   xor cl, byte ptr [rsp + rdx + 0x72]
0005FCDE  32c8                       xor cl, al
0005FCE0  488d442430                 lea rax, [rsp + 0x30]
0005FCE5  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005FCEB  480f47442430               cmova rax, qword ptr [rsp + 0x30]
0005FCF1  884c1002                   mov byte ptr [rax + rdx + 2], cl
0005FCF5  4a8d041a                   lea rax, [rdx + r11]
0005FCF9  488bc8                     mov rcx, rax
0005FCFC  48c1e911                   shr rcx, 0x11
0005FD00  4833c8                     xor rcx, rax
0005FD03  480fafcf                   imul rcx, rdi
0005FD07  488bc1                     mov rax, rcx
0005FD0A  48c1e81f                   shr rax, 0x1f
0005FD0E  4833c1                     xor rax, rcx
0005FD11  480fafc3                   imul rax, rbx
0005FD15  488bc8                     mov rcx, rax
0005FD18  48c1e920                   shr rcx, 0x20
0005FD1C  324c1473                   xor cl, byte ptr [rsp + rdx + 0x73]
0005FD20  32c8                       xor cl, al
0005FD22  488d442430                 lea rax, [rsp + 0x30]
0005FD27  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005FD2D  480f47442430               cmova rax, qword ptr [rsp + 0x30]
0005FD33  884c1003                   mov byte ptr [rax + rdx + 3], cl
0005FD37  4a8d0432                   lea rax, [rdx + r14]
0005FD3B  488bc8                     mov rcx, rax
0005FD3E  48c1e911                   shr rcx, 0x11
0005FD42  4833c8                     xor rcx, rax
0005FD45  480fafcf                   imul rcx, rdi
0005FD49  488bc1                     mov rax, rcx
0005FD4C  48c1e81f                   shr rax, 0x1f
0005FD50  4833c1                     xor rax, rcx
0005FD53  480fafc3                   imul rax, rbx
0005FD57  488bc8                     mov rcx, rax
0005FD5A  48c1e920                   shr rcx, 0x20
0005FD5E  324c1474                   xor cl, byte ptr [rsp + rdx + 0x74]
0005FD62  32c8                       xor cl, al
0005FD64  488d442430                 lea rax, [rsp + 0x30]
0005FD69  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005FD6F  480f47442430               cmova rax, qword ptr [rsp + 0x30]
0005FD75  884c1004                   mov byte ptr [rax + rdx + 4], cl
0005FD79  4a8d043a                   lea rax, [rdx + r15]
0005FD7D  488bc8                     mov rcx, rax
0005FD80  48c1e911                   shr rcx, 0x11
0005FD84  4833c8                     xor rcx, rax
0005FD87  480fafcf                   imul rcx, rdi
0005FD8B  488bc1                     mov rax, rcx
0005FD8E  48c1e81f                   shr rax, 0x1f
0005FD92  4833c1                     xor rax, rcx
0005FD95  480fafc3                   imul rax, rbx
0005FD99  488bc8                     mov rcx, rax
0005FD9C  48c1e920                   shr rcx, 0x20
0005FDA0  324c1475                   xor cl, byte ptr [rsp + rdx + 0x75]
0005FDA4  32c8                       xor cl, al
0005FDA6  488d442430                 lea rax, [rsp + 0x30]
0005FDAB  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005FDB1  480f47442430               cmova rax, qword ptr [rsp + 0x30]
0005FDB7  884c1005                   mov byte ptr [rax + rdx + 5], cl
0005FDBB  4a8d0422                   lea rax, [rdx + r12]
0005FDBF  488bc8                     mov rcx, rax
0005FDC2  48c1e911                   shr rcx, 0x11
0005FDC6  4833c8                     xor rcx, rax
0005FDC9  480fafcf                   imul rcx, rdi
0005FDCD  488bc1                     mov rax, rcx
0005FDD0  48c1e81f                   shr rax, 0x1f
0005FDD4  4833c1                     xor rax, rcx
0005FDD7  480fafc3                   imul rax, rbx
0005FDDB  488bc8                     mov rcx, rax
0005FDDE  48c1e920                   shr rcx, 0x20
0005FDE2  324c1476                   xor cl, byte ptr [rsp + rdx + 0x76]
0005FDE6  32c8                       xor cl, al
0005FDE8  488d442430                 lea rax, [rsp + 0x30]
0005FDED  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005FDF3  480f47442430               cmova rax, qword ptr [rsp + 0x30]
0005FDF9  884c1006                   mov byte ptr [rax + rdx + 6], cl
0005FDFD  4a8d042a                   lea rax, [rdx + r13]
0005FE01  488bc8                     mov rcx, rax
0005FE04  48c1e911                   shr rcx, 0x11
0005FE08  4833c8                     xor rcx, rax
0005FE0B  480fafcf                   imul rcx, rdi
0005FE0F  488bc1                     mov rax, rcx
0005FE12  48c1e81f                   shr rax, 0x1f
0005FE16  4833c1                     xor rax, rcx
0005FE19  480fafc3                   imul rax, rbx
0005FE1D  488bc8                     mov rcx, rax
0005FE20  48c1e920                   shr rcx, 0x20
0005FE24  324c1477                   xor cl, byte ptr [rsp + rdx + 0x77]
0005FE28  32c8                       xor cl, al
0005FE2A  488d442430                 lea rax, [rsp + 0x30]
0005FE2F  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005FE35  480f47442430               cmova rax, qword ptr [rsp + 0x30]
0005FE3B  884c1007                   mov byte ptr [rax + rdx + 7], cl
0005FE3F  488d0432                   lea rax, [rdx + rsi]
0005FE43  488bc8                     mov rcx, rax
0005FE46  48c1e911                   shr rcx, 0x11
0005FE4A  4833c8                     xor rcx, rax
0005FE4D  480fafcf                   imul rcx, rdi
0005FE51  488bc1                     mov rax, rcx
0005FE54  48c1e81f                   shr rax, 0x1f
0005FE58  4833c1                     xor rax, rcx
0005FE5B  480fafc3                   imul rax, rbx
0005FE5F  488bc8                     mov rcx, rax
0005FE62  48c1e920                   shr rcx, 0x20
0005FE66  324c1478                   xor cl, byte ptr [rsp + rdx + 0x78]
0005FE6A  32c8                       xor cl, al
0005FE6C  488d442430                 lea rax, [rsp + 0x30]
0005FE71  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005FE77  480f47442430               cmova rax, qword ptr [rsp + 0x30]
0005FE7D  884c1008                   mov byte ptr [rax + rdx + 8], cl
0005FE81  48b8605e8d740ca943e3       movabs rax, 0xe343a90c748d5e60
0005FE8B  4803c2                     add rax, rdx
0005FE8E  488bc8                     mov rcx, rax
0005FE91  48c1e911                   shr rcx, 0x11
0005FE95  4833c8                     xor rcx, rax
0005FE98  480fafcf                   imul rcx, rdi
0005FE9C  488bc1                     mov rax, rcx
0005FE9F  48c1e81f                   shr rax, 0x1f
0005FEA3  4833c1                     xor rax, rcx
0005FEA6  480fafc3                   imul rax, rbx
0005FEAA  488bc8                     mov rcx, rax
0005FEAD  48c1e920                   shr rcx, 0x20
0005FEB1  324c1479                   xor cl, byte ptr [rsp + rdx + 0x79]
0005FEB5  32c8                       xor cl, al
0005FEB7  488d442430                 lea rax, [rsp + 0x30]
0005FEBC  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005FEC2  480f47442430               cmova rax, qword ptr [rsp + 0x30]
0005FEC8  884c1009                   mov byte ptr [rax + rdx + 9], cl
0005FECC  4883c20a                   add rdx, 0xa
0005FED0  4883fa14                   cmp rdx, 0x14
0005FED4  0f8256fdffff               jb 0x5fc30
0005FEDA  488d442470                 lea rax, [rsp + 0x70]
0005FEDF  b915000000                 mov ecx, 0x15
0005FEE4  bec59d1c81                 mov esi, 0x811c9dc5
0005FEE9  0f1f8000000000             nop dword ptr [rax]
0005FEF0  c60000                     mov byte ptr [rax], 0
0005FEF3  488d4001                   lea rax, [rax + 1]
0005FEF7  4883e901                   sub rcx, 1
0005FEFB  75f3                       jne 0x5fef0
0005FEFD  488d542430                 lea rdx, [rsp + 0x30]
0005FF02  48837c24480f               cmp qword ptr [rsp + 0x48], 0xf
0005FF08  480f47542430               cmova rdx, qword ptr [rsp + 0x30]
0005FF0E  4c8b442440                 mov r8, qword ptr [rsp + 0x40]
0005FF13  e8f84cfdff                 call 0x34c10
0005FF18  90                         nop 
0005FF19  488b542448                 mov rdx, qword ptr [rsp + 0x48]
0005FF1E  4883fa0f                   cmp rdx, 0xf
0005FF22  7632                       jbe 0x5ff56
0005FF24  48ffc2                     inc rdx
0005FF27  488b4c2430                 mov rcx, qword ptr [rsp + 0x30]
0005FF2C  4881fa00100000             cmp rdx, 0x1000
0005FF33  721c                       jb 0x5ff51
0005FF35  488b41f8                   mov rax, qword ptr [rcx - 8]
0005FF39  482bc8                     sub rcx, rax
0005FF3C  4883e908                   sub rcx, 8
0005FF40  4883f91f                   cmp rcx, 0x1f
0005FF44  0f8742010000               ja 0x6008c
0005FF4A  4883c227                   add rdx, 0x27
0005FF4E  488bc8                     mov rcx, rax
0005FF51  e81689fdff                 call 0x3886c
0005FF56  65488b042560000000         mov rax, qword ptr gs:[0x60]
0005FF5F  4c8b5018                   mov r10, qword ptr [rax + 0x18]
0005FF63  4983c220                   add r10, 0x20
0005FF67  4d8b0a                     mov r9, qword ptr [r10]
0005FF6A  4d3bca                     cmp r9, r10
0005FF6D  745e                       je 0x5ffcd
0005FF6F  90                         nop 
0005FF70  498b7950                   mov rdi, qword ptr [r9 + 0x50]
0005FF74  4885ff                     test rdi, rdi
0005FF77  744c                       je 0x5ffc5
0005FF79  448bc6                     mov r8d, esi
0005FF7C  0fb707                     movzx eax, word ptr [rdi]
0005FF7F  6685c0                     test ax, ax
0005FF82  7441                       je 0x5ffc5
0005FF84  0f1f4000                   nop dword ptr [rax]
0005FF88  0f1f840000000000           nop dword ptr [rax + rax]
0005FF90  488d7f02                   lea rdi, [rdi + 2]
0005FF94  8d509f                     lea edx, [rax - 0x61]
0005FF97  0fb6c8                     movzx ecx, al
0005FF9A  2c20                       sub al, 0x20
0005FF9C  6683fa19                   cmp dx, 0x19
0005FFA0  0f47c1                     cmova eax, ecx
0005FFA3  0fbec0                     movsx eax, al
0005FFA6  4133c0                     xor eax, r8d
0005FFA9  4469c093010001             imul r8d, eax, 0x1000193
0005FFB0  0fb707                     movzx eax, word ptr [rdi]
0005FFB3  6685c0                     test ax, ax
0005FFB6  75d8                       jne 0x5ff90
0005FFB8  4181f863d4cd29             cmp r8d, 0x29cdd463
0005FFBF  0f84ce000000               je 0x60093
0005FFC5  4d8b09                     mov r9, qword ptr [r9]
0005FFC8  4d3bca                     cmp r9, r10
0005FFCB  75a3                       jne 0x5ff70
0005FFCD  33c0                       xor eax, eax
0005FFCF  ba07000000                 mov edx, 7
0005FFD4  488b4de0                   mov rcx, qword ptr [rbp - 0x20]
0005FFD8  ffd0                       call rax
0005FFDA  488d7da0                   lea rdi, [rbp - 0x60]
0005FFDE  33c0                       xor eax, eax
0005FFE0  b940000000                 mov ecx, 0x40
0005FFE5  f3aa                       rep stosb byte ptr [rdi], al
0005FFE7  488b4de8                   mov rcx, qword ptr [rbp - 0x18]
0005FFEB  4885c9                     test rcx, rcx
0005FFEE  7441                       je 0x60031
0005FFF0  488b55f8                   mov rdx, qword ptr [rbp - 8]
0005FFF4  482bd1                     sub rdx, rcx
0005FFF7  4881fa00100000             cmp rdx, 0x1000
0005FFFE  721c                       jb 0x6001c
00060000  488b41f8                   mov rax, qword ptr [rcx - 8]
00060004  482bc8                     sub rcx, rax
00060007  4883e908                   sub rcx, 8
0006000B  4883f91f                   cmp rcx, 0x1f
0006000F  0f873e030000               ja 0x60353
00060015  4883c227                   add rdx, 0x27
00060019  488bc8                     mov rcx, rax
0006001C  e84b88fdff                 call 0x3886c
00060021  0f57c0                     xorps xmm0, xmm0
00060024  f30f7f45e8                 movdqu xmmword ptr [rbp - 0x18], xmm0
00060029  48c745f800000000           mov qword ptr [rbp - 8], 0
00060031  488b8d90000000             mov rcx, qword ptr [rbp + 0x90]
00060038  4885c9                     test rcx, rcx
0006003B  7434                       je 0x60071
0006003D  488b95a0000000             mov rdx, qword ptr [rbp + 0xa0]
00060044  482bd1                     sub rdx, rcx
00060047  4881fa00100000             cmp rdx, 0x1000
0006004E  721c                       jb 0x6006c
00060050  488b41f8                   mov rax, qword ptr [rcx - 8]
00060054  482bc8                     sub rcx, rax
00060057  4883e908                   sub rcx, 8
0006005B  4883f91f                   cmp rcx, 0x1f
0006005F  0f87f5020000               ja 0x6035a
00060065  4883c227                   add rdx, 0x27
00060069  488bc8                     mov rcx, rax
0006006C  e8fb87fdff                 call 0x3886c
00060071  488b9c24d0040000           mov rbx, qword ptr [rsp + 0x4d0]
00060079  4881c490040000             add rsp, 0x490
00060080  415f                       pop r15
00060082  415e                       pop r14
00060084  415d                       pop r13
00060086  415c                       pop r12
00060088  5f                         pop rdi
00060089  5e                         pop rsi
0006008A  5d                         pop rbp
0006008B  c3                         ret 
0006008C  b905000000                 mov ecx, 5
00060091  cd29                       int 0x29
00060093  498b5920                   mov rbx, qword ptr [r9 + 0x20]
00060097  4885db                     test rbx, rbx
0006009A  0f842dffffff               je 0x5ffcd
000600A0  48634b3c                   movsxd rcx, dword ptr [rbx + 0x3c]
000600A4  8b84198c000000             mov eax, dword ptr [rcx + rbx + 0x8c]
000600AB  8985f0030000               mov dword ptr [rbp + 0x3f0], eax
000600B1  85c0                       test eax, eax
000600B3  0f8414ffffff               je 0x5ffcd
000600B9  448bac1988000000           mov r13d, dword ptr [rcx + rbx + 0x88]
000600C1  468b7c2b20                 mov r15d, dword ptr [rbx + r13 + 0x20]
000600C6  4c03fb                     add r15, rbx
000600C9  4533db                     xor r11d, r11d
000600CC  468b642b18                 mov r12d, dword ptr [rbx + r13 + 0x18]
000600D1  4585e4                     test r12d, r12d
000600D4  0f84f3feffff               je 0x5ffcd
000600DA  660f1f440000               nop word ptr [rax + rax]
000600E0  478b049f                   mov r8d, dword ptr [r15 + r11*4]
000600E4  4c03c3                     add r8, rbx
000600E7  448bd6                     mov r10d, esi
000600EA  410fb638                   movzx edi, byte ptr [r8]
000600EE  4084ff                     test dil, dil
000600F1  7436                       je 0x60129
000600F3  4d8d4001                   lea r8, [r8 + 1]
000600F7  8d579f                     lea edx, [rdi - 0x61]
000600FA  8d47e0                     lea eax, [rdi - 0x20]
000600FD  0fb6c8                     movzx ecx, al
00060100  400fb6c7                   movzx eax, dil
00060104  80fa19                     cmp dl, 0x19
00060107  0f47c8                     cmova ecx, eax
0006010A  0fbec1                     movsx eax, cl
0006010D  4133c2                     xor eax, r10d
00060110  4469d093010001             imul r10d, eax, 0x1000193
00060117  410fb638                   movzx edi, byte ptr [r8]
0006011B  4084ff                     test dil, dil
0006011E  75d3                       jne 0x600f3
00060120  4181fab5882a67             cmp r10d, 0x672a88b5
00060127  740d                       je 0x60136
00060129  41ffc3                     inc r11d
0006012C  453bdc                     cmp r11d, r12d
0006012F  72af                       jb 0x600e0
00060131  e997feffff                 jmp 0x5ffcd
00060136  428b4c2b24                 mov ecx, dword ptr [rbx + r13 + 0x24]
0006013B  4803cb                     add rcx, rbx
0006013E  420fb71459                 movzx edx, word ptr [rcx + r11*2]
00060143  428b4c2b1c                 mov ecx, dword ptr [rbx + r13 + 0x1c]
00060148  4803cb                     add rcx, rbx
0006014B  8b0c91                     mov ecx, dword ptr [rcx + rdx*4]
0006014E  413bcd                     cmp ecx, r13d
00060151  0f82f3010000               jb 0x6034a
00060157  8b85f0030000               mov eax, dword ptr [rbp + 0x3f0]
0006015D  4103c5                     add eax, r13d
00060160  3bc8                       cmp ecx, eax
00060162  0f83e2010000               jae 0x6034a
00060168  488d3c0b                   lea rdi, [rbx + rcx]
0006016C  0f57c0                     xorps xmm0, xmm0
0006016F  0f11442430                 movups xmmword ptr [rsp + 0x30], xmm0
00060174  0f11442440                 movups xmmword ptr [rsp + 0x40], xmm0
00060179  0f11442450                 movups xmmword ptr [rsp + 0x50], xmm0
0006017E  0f11442460                 movups xmmword ptr [rsp + 0x60], xmm0
00060183  33c9                       xor ecx, ecx
00060185  380f                       cmp byte ptr [rdi], cl
00060187  0f8440feffff               je 0x5ffcd
0006018D  0f1f00                     nop dword ptr [rax]
00060190  83f93c                     cmp ecx, 0x3c
00060193  0f8d34feffff               jge 0x5ffcd
00060199  4863c1                     movsxd rax, ecx
0006019C  488d1c38                   lea rbx, [rax + rdi]
000601A0  0fb613                     movzx edx, byte ptr [rbx]
000601A3  80fa2e                     cmp dl, 0x2e
000601A6  7414                       je 0x601bc
000601A8  88540430                   mov byte ptr [rsp + rax + 0x30], dl
000601AC  ffc1                       inc ecx
000601AE  4863c1                     movsxd rax, ecx
000601B1  803c3800                   cmp byte ptr [rax + rdi], 0
000601B5  75d9                       jne 0x60190
000601B7  e911feffff                 jmp 0x5ffcd
000601BC  85c9                       test ecx, ecx
000601BE  0f8809feffff               js 0x5ffcd
000601C4  c64404302e                 mov byte ptr [rsp + rax + 0x30], 0x2e
000601C9  4863c1                     movsxd rax, ecx
000601CC  c644043144                 mov byte ptr [rsp + rax + 0x31], 0x44
000601D1  4863c1                     movsxd rax, ecx
000601D4  c64404324c                 mov byte ptr [rsp + rax + 0x32], 0x4c
000601D9  4863c1                     movsxd rax, ecx
000601DC  c64404334c                 mov byte ptr [rsp + rax + 0x33], 0x4c
000601E1  4863c1                     movsxd rax, ecx
000601E4  c644043400                 mov byte ptr [rsp + rax + 0x34], 0
000601E9  0f57c0                     xorps xmm0, xmm0
000601EC  0f114510                   movups xmmword ptr [rbp + 0x10], xmm0
000601F0  0f114520                   movups xmmword ptr [rbp + 0x20], xmm0
000601F4  0f114530                   movups xmmword ptr [rbp + 0x30], xmm0
000601F8  0f114540                   movups xmmword ptr [rbp + 0x40], xmm0
000601FC  0f114550                   movups xmmword ptr [rbp + 0x50], xmm0
00060200  0f114560                   movups xmmword ptr [rbp + 0x60], xmm0
00060204  0f114570                   movups xmmword ptr [rbp + 0x70], xmm0
00060208  0f118580000000             movups xmmword ptr [rbp + 0x80], xmm0
0006020F  33d2                       xor edx, edx
00060211  38542430                   cmp byte ptr [rsp + 0x30], dl
00060215  741e                       je 0x60235
00060217  83fa3f                     cmp edx, 0x3f
0006021A  7d19                       jge 0x60235
0006021C  4863ca                     movsxd rcx, edx
0006021F  0fbe440c30                 movsx eax, byte ptr [rsp + rcx + 0x30]
00060224  6689444d10                 mov word ptr [rbp + rcx*2 + 0x10], ax
00060229  ffc2                       inc edx
0006022B  4863c2                     movsxd rax, edx
0006022E  807c043000                 cmp byte ptr [rsp + rax + 0x30], 0
00060233  75e2                       jne 0x60217
00060235  488d7d10                   lea rdi, [rbp + 0x10]
00060239  448bd6                     mov r10d, esi
0006023C  0fb74510                   movzx eax, word ptr [rbp + 0x10]
00060240  6685c0                     test ax, ax
00060243  7433                       je 0x60278
00060245  6666660f1f840000000000     nop word ptr [rax + rax]
00060250  488d7f02                   lea rdi, [rdi + 2]
00060254  8d509f                     lea edx, [rax - 0x61]
00060257  0fb6c8                     movzx ecx, al
0006025A  2c20                       sub al, 0x20
0006025C  6683fa19                   cmp dx, 0x19
00060260  0f47c1                     cmova eax, ecx
00060263  0fbec0                     movsx eax, al
00060266  4133c2                     xor eax, r10d
00060269  4469d093010001             imul r10d, eax, 0x1000193
00060270  0fb707                     movzx eax, word ptr [rdi]
00060273  6685c0                     test ax, ax
00060276  75d8                       jne 0x60250
00060278  65488b042560000000         mov rax, qword ptr gs:[0x60]
00060281  4c8b5818                   mov r11, qword ptr [rax + 0x18]
00060285  4983c320                   add r11, 0x20
00060289  4d8b0b                     mov r9, qword ptr [r11]
0006028C  4d3bcb                     cmp r9, r11
0006028F  0f8438fdffff               je 0x5ffcd
00060295  498b7950                   mov rdi, qword ptr [r9 + 0x50]
00060299  4885ff                     test rdi, rdi
0006029C  743f                       je 0x602dd
0006029E  448bc6                     mov r8d, esi
000602A1  0fb707                     movzx eax, word ptr [rdi]
000602A4  6685c0                     test ax, ax
000602A7  742f                       je 0x602d8
000602A9  0f1f8000000000             nop dword ptr [rax]
000602B0  488d7f02                   lea rdi, [rdi + 2]
000602B4  8d509f                     lea edx, [rax - 0x61]
000602B7  0fb6c8                     movzx ecx, al
000602BA  2c20                       sub al, 0x20
000602BC  6683fa19                   cmp dx, 0x19
000602C0  0f47c1                     cmova eax, ecx
000602C3  0fbec0                     movsx eax, al
000602C6  4133c0                     xor eax, r8d
000602C9  4469c093010001             imul r8d, eax, 0x1000193
000602D0  0fb707                     movzx eax, word ptr [rdi]
000602D3  6685c0                     test ax, ax
000602D6  75d8                       jne 0x602b0
000602D8  453bc2                     cmp r8d, r10d
000602DB  740d                       je 0x602ea
000602DD  4d8b09                     mov r9, qword ptr [r9]
000602E0  4d3bcb                     cmp r9, r11
000602E3  75b0                       jne 0x60295
000602E5  e9e3fcffff                 jmp 0x5ffcd
000602EA  4d8b5120                   mov r10, qword ptr [r9 + 0x20]
000602EE  4d85d2                     test r10, r10
000602F1  0f84d6fcffff               je 0x5ffcd
000602F7  4c8d4301                   lea r8, [rbx + 1]
000602FB  410fb638                   movzx edi, byte ptr [r8]
000602FF  4084ff                     test dil, dil
00060302  7437                       je 0x6033b
00060304  0f1f4000                   nop dword ptr [rax]
00060308  0f1f840000000000           nop dword ptr [rax + rax]
00060310  4d8d4001                   lea r8, [r8 + 1]
00060314  8d579f                     lea edx, [rdi - 0x61]
00060317  8d47e0                     lea eax, [rdi - 0x20]
0006031A  0fb6c8                     movzx ecx, al
0006031D  400fb6c7                   movzx eax, dil
00060321  80fa19                     cmp dl, 0x19
00060324  0f47c8                     cmova ecx, eax
00060327  0fbec1                     movsx eax, cl
0006032A  33c6                       xor eax, esi
0006032C  69f093010001               imul esi, eax, 0x1000193
00060332  410fb638                   movzx edi, byte ptr [r8]
00060336  4084ff                     test dil, dil
00060339  75d5                       jne 0x60310
0006033B  8bd6                       mov edx, esi
0006033D  498bca                     mov rcx, r10
00060340  e83b56fbff                 call 0x15980
00060345  e985fcffff                 jmp 0x5ffcf
0006034A  488d040b                   lea rax, [rbx + rcx]
0006034E  e97cfcffff                 jmp 0x5ffcf
00060353  b905000000                 mov ecx, 5
00060358  cd29                       int 0x29
0006035A  b905000000                 mov ecx, 5
0006035F  cd29                       int 0x29
00060361  cc                         int3 
00060362  cc                         int3 
00060363  cc                         int3 
00060364  cc                         int3 
00060365  cc                         int3 
00060366  cc                         int3 
00060367  cc                         int3 
00060368  cc                         int3 
00060369  cc                         int3 
0006036A  cc                         int3 
0006036B  cc                         int3 
0006036C  cc                         int3 
0006036D  cc                         int3 
0006036E  cc                         int3 
0006036F  cc                         int3 
00060370  488d8a90010000             lea rcx, [rdx + 0x190]
00060377  e9e443fdff                 jmp 0x34760
0006037C  cc                         int3 
0006037D  cc                         int3 
0006037E  cc                         int3 
0006037F  cc                         int3 
00060380  488d8ae8000000             lea rcx, [rdx + 0xe8]
00060387  e9d443fdff                 jmp 0x34760
0006038C  cc                         int3 
0006038D  cc                         int3 
0006038E  cc                         int3 
0006038F  cc                         int3 
00060390  488d8a30000000             lea rcx, [rdx + 0x30]
00060397  e9f446fdff                 jmp 0x34a90
0006039C  cc                         int3 
0006039D  cc                         int3 
0006039E  cc                         int3 
0006039F  cc                         int3 
000603A0  488d8a70000000             lea rcx, [rdx + 0x70]
000603A7  e9e446fdff                 jmp 0x34a90
000603AC  cc                         int3 
000603AD  cc                         int3 
000603AE  cc                         int3 
000603AF  cc                         int3 
000603B0  4055                       push rbp
000603B2  4883ec20                   sub rsp, 0x20
000603B6  488bea                     mov rbp, rdx
000603B9  8b85d8040000               mov eax, dword ptr [rbp + 0x4d8]
000603BF  83e002                     and eax, 2
000603C2  85c0                       test eax, eax
000603C4  7410                       je 0x603d6
000603C6  83a5d8040000fd             and dword ptr [rbp + 0x4d8], 0xfffffffd
000603CD  488d4d30                   lea rcx, [rbp + 0x30]
000603D1  e8ba46fdff                 call 0x34a90
000603D6  4883c420                   add rsp, 0x20
000603DA  5d                         pop rbp
000603DB  c3                         ret 
000603DC  cc                         int3 
000603DD  cc                         int3 
000603DE  cc                         int3 
000603DF  cc                         int3 
000603E0  4055                       push rbp
000603E2  4883ec20                   sub rsp, 0x20
000603E6  488bea                     mov rbp, rdx
000603E9  8b85d8040000               mov eax, dword ptr [rbp + 0x4d8]
000603EF  83e008                     and eax, 8
000603F2  85c0                       test eax, eax
000603F4  7410                       je 0x60406
000603F6  83a5d8040000f7             and dword ptr [rbp + 0x4d8], 0xfffffff7
000603FD  488d4d70                   lea rcx, [rbp + 0x70]
00060401  e88a46fdff                 call 0x34a90
00060406  4883c420                   add rsp, 0x20
0006040A  5d                         pop rbp
0006040B  c3                         ret 
0006040C  cc                         int3 
0006040D  cc                         int3 
0006040E  cc                         int3 
0006040F  cc                         int3 
00060410  4055                       push rbp
00060412  4883ec20                   sub rsp, 0x20
00060416  488bea                     mov rbp, rdx
00060419  8b85d8040000               mov eax, dword ptr [rbp + 0x4d8]
0006041F  83e020                     and eax, 0x20
00060422  85c0                       test eax, eax
00060424  7410                       je 0x60436
00060426  83a5d8040000df             and dword ptr [rbp + 0x4d8], 0xffffffdf
0006042D  488d4d30                   lea rcx, [rbp + 0x30]
00060431  e85a46fdff                 call 0x34a90
00060436  4883c420                   add rsp, 0x20
0006043A  5d                         pop rbp
0006043B  c3                         ret 
0006043C  cc                         int3 
0006043D  cc                         int3 
0006043E  cc                         int3 
0006043F  cc                         int3 
00060440  4055                       push rbp
00060442  4883ec20                   sub rsp, 0x20
00060446  488bea                     mov rbp, rdx
00060449  8b85d8040000               mov eax, dword ptr [rbp + 0x4d8]
0006044F  2580000000                 and eax, 0x80
00060454  85c0                       test eax, eax
00060456  7413                       je 0x6046b
00060458  81a5d80400007fffffff       and dword ptr [rbp + 0x4d8], 0xffffff7f
00060462  488d4d30                   lea rcx, [rbp + 0x30]
00060466  e82546fdff                 call 0x34a90
0006046B  4883c420                   add rsp, 0x20
0006046F  5d                         pop rbp
00060470  c3                         ret 
00060471  0000                       add byte ptr [rax], al
00060473  0000                       add byte ptr [rax], al
00060475  0000                       add byte ptr [rax], al
00060477  0000                       add byte ptr [rax], al
00060479  0000                       add byte ptr [rax], al
0006047B  0000                       add byte ptr [rax], al
0006047D  0000                       add byte ptr [rax], al
0006047F  0000                       add byte ptr [rax], al
00060481  0000                       add byte ptr [rax], al
00060483  0000                       add byte ptr [rax], al
00060485  0000                       add byte ptr [rax], al
00060487  0000                       add byte ptr [rax], al
00060489  0000                       add byte ptr [rax], al
0006048B  0000                       add byte ptr [rax], al
0006048D  0000                       add byte ptr [rax], al
0006048F  0000                       add byte ptr [rax], al
00060491  0000                       add byte ptr [rax], al
00060493  0000                       add byte ptr [rax], al
00060495  0000                       add byte ptr [rax], al
00060497  0000                       add byte ptr [rax], al
00060499  0000                       add byte ptr [rax], al
0006049B  0000                       add byte ptr [rax], al
0006049D  0000                       add byte ptr [rax], al
0006049F  0000                       add byte ptr [rax], al
000604A1  0000                       add byte ptr [rax], al
000604A3  0000                       add byte ptr [rax], al
000604A5  0000                       add byte ptr [rax], al
000604A7  0000                       add byte ptr [rax], al
000604A9  0000                       add byte ptr [rax], al
000604AB  0000                       add byte ptr [rax], al
000604AD  0000                       add byte ptr [rax], al
000604AF  0000                       add byte ptr [rax], al
000604B1  0000                       add byte ptr [rax], al
000604B3  0000                       add byte ptr [rax], al
000604B5  0000                       add byte ptr [rax], al
000604B7  0000                       add byte ptr [rax], al
000604B9  0000                       add byte ptr [rax], al
000604BB  0000                       add byte ptr [rax], al
000604BD  0000                       add byte ptr [rax], al
000604BF  0000                       add byte ptr [rax], al
000604C1  0000                       add byte ptr [rax], al
000604C3  0000                       add byte ptr [rax], al
000604C5  0000                       add byte ptr [rax], al
000604C7  0000                       add byte ptr [rax], al
000604C9  0000                       add byte ptr [rax], al
000604CB  0000                       add byte ptr [rax], al
000604CD  0000                       add byte ptr [rax], al
000604CF  0000                       add byte ptr [rax], al
000604D1  0000                       add byte ptr [rax], al
000604D3  0000                       add byte ptr [rax], al
000604D5  0000                       add byte ptr [rax], al
000604D7  0000                       add byte ptr [rax], al
000604D9  0000                       add byte ptr [rax], al
000604DB  0000                       add byte ptr [rax], al
000604DD  0000                       add byte ptr [rax], al
000604DF  0000                       add byte ptr [rax], al
000604E1  0000                       add byte ptr [rax], al
000604E3  0000                       add byte ptr [rax], al
000604E5  0000                       add byte ptr [rax], al
000604E7  0000                       add byte ptr [rax], al
000604E9  0000                       add byte ptr [rax], al
000604EB  0000                       add byte ptr [rax], al
000604ED  0000                       add byte ptr [rax], al
000604EF  0000                       add byte ptr [rax], al
000604F1  0000                       add byte ptr [rax], al
000604F3  0000                       add byte ptr [rax], al
000604F5  0000                       add byte ptr [rax], al
000604F7  0000                       add byte ptr [rax], al
000604F9  0000                       add byte ptr [rax], al
000604FB  0000                       add byte ptr [rax], al
000604FD  0000                       add byte ptr [rax], al
000604FF  0000                       add byte ptr [rax], al
00060501  0000                       add byte ptr [rax], al
00060503  0000                       add byte ptr [rax], al
00060505  0000                       add byte ptr [rax], al
00060507  0000                       add byte ptr [rax], al
00060509  0000                       add byte ptr [rax], al
0006050B  0000                       add byte ptr [rax], al
0006050D  0000                       add byte ptr [rax], al
0006050F  0000                       add byte ptr [rax], al
00060511  0000                       add byte ptr [rax], al
00060513  0000                       add byte ptr [rax], al
00060515  0000                       add byte ptr [rax], al
00060517  0000                       add byte ptr [rax], al
00060519  0000                       add byte ptr [rax], al
0006051B  0000                       add byte ptr [rax], al
0006051D  0000                       add byte ptr [rax], al
0006051F  0000                       add byte ptr [rax], al
00060521  0000                       add byte ptr [rax], al
00060523  0000                       add byte ptr [rax], al
00060525  0000                       add byte ptr [rax], al
00060527  0000                       add byte ptr [rax], al
00060529  0000                       add byte ptr [rax], al
0006052B  0000                       add byte ptr [rax], al
0006052D  0000                       add byte ptr [rax], al
0006052F  0000                       add byte ptr [rax], al
00060531  0000                       add byte ptr [rax], al
00060533  0000                       add byte ptr [rax], al
00060535  0000                       add byte ptr [rax], al
00060537  0000                       add byte ptr [rax], al
00060539  0000                       add byte ptr [rax], al
0006053B  0000                       add byte ptr [rax], al
0006053D  0000                       add byte ptr [rax], al
0006053F  0000                       add byte ptr [rax], al
00060541  0000                       add byte ptr [rax], al
00060543  0000                       add byte ptr [rax], al
00060545  0000                       add byte ptr [rax], al
00060547  0000                       add byte ptr [rax], al
00060549  0000                       add byte ptr [rax], al
0006054B  0000                       add byte ptr [rax], al
0006054D  0000                       add byte ptr [rax], al
0006054F  0000                       add byte ptr [rax], al
00060551  0000                       add byte ptr [rax], al
00060553  0000                       add byte ptr [rax], al
00060555  0000                       add byte ptr [rax], al
00060557  0000                       add byte ptr [rax], al
00060559  0000                       add byte ptr [rax], al
0006055B  0000                       add byte ptr [rax], al
0006055D  0000                       add byte ptr [rax], al
0006055F  0000                       add byte ptr [rax], al
00060561  0000                       add byte ptr [rax], al
00060563  0000                       add byte ptr [rax], al
00060565  0000                       add byte ptr [rax], al
00060567  0000                       add byte ptr [rax], al
00060569  0000                       add byte ptr [rax], al
0006056B  0000                       add byte ptr [rax], al
0006056D  0000                       add byte ptr [rax], al
0006056F  0000                       add byte ptr [rax], al
00060571  0000                       add byte ptr [rax], al
00060573  0000                       add byte ptr [rax], al
00060575  0000                       add byte ptr [rax], al
00060577  0000                       add byte ptr [rax], al
00060579  0000                       add byte ptr [rax], al
0006057B  0000                       add byte ptr [rax], al
0006057D  0000                       add byte ptr [rax], al
0006057F  0000                       add byte ptr [rax], al
00060581  0000                       add byte ptr [rax], al
00060583  0000                       add byte ptr [rax], al
00060585  0000                       add byte ptr [rax], al
00060587  0000                       add byte ptr [rax], al
00060589  0000                       add byte ptr [rax], al
0006058B  0000                       add byte ptr [rax], al
0006058D  0000                       add byte ptr [rax], al
0006058F  0000                       add byte ptr [rax], al
00060591  0000                       add byte ptr [rax], al
00060593  0000                       add byte ptr [rax], al
00060595  0000                       add byte ptr [rax], al
00060597  0000                       add byte ptr [rax], al
00060599  0000                       add byte ptr [rax], al
0006059B  0000                       add byte ptr [rax], al
0006059D  0000                       add byte ptr [rax], al
0006059F  0000                       add byte ptr [rax], al
000605A1  0000                       add byte ptr [rax], al
000605A3  0000                       add byte ptr [rax], al
000605A5  0000                       add byte ptr [rax], al
000605A7  0000                       add byte ptr [rax], al
000605A9  0000                       add byte ptr [rax], al
000605AB  0000                       add byte ptr [rax], al
000605AD  0000                       add byte ptr [rax], al
000605AF  0000                       add byte ptr [rax], al
000605B1  0000                       add byte ptr [rax], al
000605B3  0000                       add byte ptr [rax], al
000605B5  0000                       add byte ptr [rax], al
000605B7  0000                       add byte ptr [rax], al
000605B9  0000                       add byte ptr [rax], al
000605BB  0000                       add byte ptr [rax], al
000605BD  0000                       add byte ptr [rax], al
000605BF  0000                       add byte ptr [rax], al
000605C1  0000                       add byte ptr [rax], al
000605C3  0000                       add byte ptr [rax], al
000605C5  0000                       add byte ptr [rax], al
000605C7  0000                       add byte ptr [rax], al
000605C9  0000                       add byte ptr [rax], al
000605CB  0000                       add byte ptr [rax], al
000605CD  0000                       add byte ptr [rax], al
000605CF  0000                       add byte ptr [rax], al
000605D1  0000                       add byte ptr [rax], al
000605D3  0000                       add byte ptr [rax], al
000605D5  0000                       add byte ptr [rax], al
000605D7  0000                       add byte ptr [rax], al
000605D9  0000                       add byte ptr [rax], al
000605DB  0000                       add byte ptr [rax], al
000605DD  0000                       add byte ptr [rax], al
000605DF  0000                       add byte ptr [rax], al
000605E1  0000                       add byte ptr [rax], al
000605E3  0000                       add byte ptr [rax], al
000605E5  0000                       add byte ptr [rax], al
000605E7  0000                       add byte ptr [rax], al
000605E9  0000                       add byte ptr [rax], al
000605EB  0000                       add byte ptr [rax], al
000605ED  0000                       add byte ptr [rax], al
000605EF  0000                       add byte ptr [rax], al
000605F1  0000                       add byte ptr [rax], al
000605F3  0000                       add byte ptr [rax], al
000605F5  0000                       add byte ptr [rax], al
000605F7  0000                       add byte ptr [rax], al
000605F9  0000                       add byte ptr [rax], al
000605FB  0000                       add byte ptr [rax], al
000605FD  0000                       add byte ptr [rax], al
000605FF  0054286d                   add byte ptr [rax + rbp + 0x6d], dl
00060603  4454                       push rsp
00060605  286d44                     sub byte ptr [rbp + 0x44], ch
00060608  54                         push rsp
00060609  286d44                     sub byte ptr [rbp + 0x44], ch
0006060C  54                         push rsp
0006060D  286d44                     sub byte ptr [rbp + 0x44], ch
00060610  54                         push rsp
00060611  286d44                     sub byte ptr [rbp + 0x44], ch
00060614  54                         push rsp
00060615  286d44                     sub byte ptr [rbp + 0x44], ch
00060618  54                         push rsp
00060619  286d44                     sub byte ptr [rbp + 0x44], ch
0006061C  54                         push rsp
0006061D  286d44                     sub byte ptr [rbp + 0x44], ch
00060620  54                         push rsp
00060621  286d44                     sub byte ptr [rbp + 0x44], ch
00060624  54                         push rsp
00060625  286d44                     sub byte ptr [rbp + 0x44], ch
00060628  54                         push rsp
00060629  286d44                     sub byte ptr [rbp + 0x44], ch
0006062C  54                         push rsp
0006062D  286d44                     sub byte ptr [rbp + 0x44], ch
00060630  54                         push rsp
00060631  286d44                     sub byte ptr [rbp + 0x44], ch
00060634  54                         push rsp
00060635  286d44                     sub byte ptr [rbp + 0x44], ch
00060638  54                         push rsp
00060639  286d44                     sub byte ptr [rbp + 0x44], ch
0006063C  54                         push rsp
0006063D  286d44                     sub byte ptr [rbp + 0x44], ch
00060640  54                         push rsp
00060641  286d44                     sub byte ptr [rbp + 0x44], ch
00060644  54                         push rsp
00060645  286d44                     sub byte ptr [rbp + 0x44], ch
00060648  54                         push rsp
00060649  286d44                     sub byte ptr [rbp + 0x44], ch
0006064C  54                         push rsp
0006064D  286d44                     sub byte ptr [rbp + 0x44], ch
00060650  54                         push rsp
00060651  286d44                     sub byte ptr [rbp + 0x44], ch
00060654  54                         push rsp
00060655  286d44                     sub byte ptr [rbp + 0x44], ch
00060658  54                         push rsp
00060659  286d44                     sub byte ptr [rbp + 0x44], ch
0006065C  54                         push rsp
0006065D  286d44                     sub byte ptr [rbp + 0x44], ch
00060660  54                         push rsp
00060661  286d44                     sub byte ptr [rbp + 0x44], ch
00060664  54                         push rsp
00060665  286d44                     sub byte ptr [rbp + 0x44], ch
00060668  54                         push rsp
00060669  286d44                     sub byte ptr [rbp + 0x44], ch
0006066C  54                         push rsp
0006066D  286d44                     sub byte ptr [rbp + 0x44], ch
00060670  54                         push rsp
00060671  286d44                     sub byte ptr [rbp + 0x44], ch
00060674  54                         push rsp
00060675  286d44                     sub byte ptr [rbp + 0x44], ch
00060678  54                         push rsp
00060679  286d44                     sub byte ptr [rbp + 0x44], ch
0006067C  54                         push rsp
0006067D  286d44                     sub byte ptr [rbp + 0x44], ch
00060680  54                         push rsp
00060681  286d44                     sub byte ptr [rbp + 0x44], ch
00060684  54                         push rsp
00060685  286d44                     sub byte ptr [rbp + 0x44], ch
00060688  54                         push rsp
00060689  286d44                     sub byte ptr [rbp + 0x44], ch
0006068C  54                         push rsp
0006068D  286d44                     sub byte ptr [rbp + 0x44], ch
00060690  54                         push rsp
00060691  286d44                     sub byte ptr [rbp + 0x44], ch
00060694  54                         push rsp
00060695  286d44                     sub byte ptr [rbp + 0x44], ch
00060698  54                         push rsp
00060699  286d44                     sub byte ptr [rbp + 0x44], ch
0006069C  54                         push rsp
0006069D  286d44                     sub byte ptr [rbp + 0x44], ch
000606A0  54                         push rsp
000606A1  286d44                     sub byte ptr [rbp + 0x44], ch
000606A4  54                         push rsp
000606A5  286d44                     sub byte ptr [rbp + 0x44], ch
000606A8  54                         push rsp
000606A9  286d44                     sub byte ptr [rbp + 0x44], ch
000606AC  54                         push rsp
000606AD  286d44                     sub byte ptr [rbp + 0x44], ch
000606B0  54                         push rsp
000606B1  286d44                     sub byte ptr [rbp + 0x44], ch
000606B4  54                         push rsp
000606B5  286d44                     sub byte ptr [rbp + 0x44], ch
000606B8  54                         push rsp
000606B9  286d44                     sub byte ptr [rbp + 0x44], ch
000606BC  54                         push rsp
000606BD  286d44                     sub byte ptr [rbp + 0x44], ch
000606C0  54                         push rsp
000606C1  286d44                     sub byte ptr [rbp + 0x44], ch
000606C4  54                         push rsp
000606C5  286d44                     sub byte ptr [rbp + 0x44], ch
000606C8  54                         push rsp
000606C9  286d44                     sub byte ptr [rbp + 0x44], ch
000606CC  54                         push rsp
000606CD  286d44                     sub byte ptr [rbp + 0x44], ch
000606D0  54                         push rsp
000606D1  286d44                     sub byte ptr [rbp + 0x44], ch
000606D4  54                         push rsp
000606D5  286d44                     sub byte ptr [rbp + 0x44], ch
000606D8  54                         push rsp
000606D9  286d44                     sub byte ptr [rbp + 0x44], ch
000606DC  54                         push rsp
000606DD  286d44                     sub byte ptr [rbp + 0x44], ch
000606E0  54                         push rsp
000606E1  286d44                     sub byte ptr [rbp + 0x44], ch
000606E4  54                         push rsp
000606E5  286d44                     sub byte ptr [rbp + 0x44], ch
000606E8  54                         push rsp
000606E9  286d44                     sub byte ptr [rbp + 0x44], ch
000606EC  54                         push rsp
000606ED  286d44                     sub byte ptr [rbp + 0x44], ch
000606F0  54                         push rsp
000606F1  286d44                     sub byte ptr [rbp + 0x44], ch
000606F4  54                         push rsp
000606F5  286d44                     sub byte ptr [rbp + 0x44], ch
000606F8  54                         push rsp
000606F9  286d44                     sub byte ptr [rbp + 0x44], ch
000606FC  54                         push rsp
000606FD  286d44                     sub byte ptr [rbp + 0x44], ch
00060700  54                         push rsp
00060701  286d44                     sub byte ptr [rbp + 0x44], ch
00060704  54                         push rsp
00060705  286d44                     sub byte ptr [rbp + 0x44], ch
00060708  54                         push rsp
00060709  286d44                     sub byte ptr [rbp + 0x44], ch
0006070C  54                         push rsp
0006070D  286d44                     sub byte ptr [rbp + 0x44], ch
00060710  54                         push rsp
00060711  286d44                     sub byte ptr [rbp + 0x44], ch
00060714  54                         push rsp
00060715  286d44                     sub byte ptr [rbp + 0x44], ch
00060718  54                         push rsp
00060719  286d44                     sub byte ptr [rbp + 0x44], ch
0006071C  54                         push rsp
0006071D  286d44                     sub byte ptr [rbp + 0x44], ch
00060720  54                         push rsp
00060721  286d44                     sub byte ptr [rbp + 0x44], ch
00060724  54                         push rsp
00060725  286d44                     sub byte ptr [rbp + 0x44], ch
00060728  54                         push rsp
00060729  286d44                     sub byte ptr [rbp + 0x44], ch
0006072C  54                         push rsp
0006072D  286d44                     sub byte ptr [rbp + 0x44], ch
00060730  54                         push rsp
00060731  286d44                     sub byte ptr [rbp + 0x44], ch
00060734  54                         push rsp
00060735  286d44                     sub byte ptr [rbp + 0x44], ch
00060738  54                         push rsp
00060739  286d44                     sub byte ptr [rbp + 0x44], ch
0006073C  54                         push rsp
0006073D  286d44                     sub byte ptr [rbp + 0x44], ch
00060740  54                         push rsp
00060741  286d44                     sub byte ptr [rbp + 0x44], ch
00060744  54                         push rsp
00060745  286d44                     sub byte ptr [rbp + 0x44], ch
00060748  54                         push rsp
00060749  286d44                     sub byte ptr [rbp + 0x44], ch
0006074C  54                         push rsp
0006074D  286d44                     sub byte ptr [rbp + 0x44], ch
00060750  54                         push rsp
00060751  286d44                     sub byte ptr [rbp + 0x44], ch
00060754  54                         push rsp
00060755  286d44                     sub byte ptr [rbp + 0x44], ch
00060758  54                         push rsp
00060759  286d44                     sub byte ptr [rbp + 0x44], ch
0006075C  54                         push rsp
0006075D  286d44                     sub byte ptr [rbp + 0x44], ch
00060760  54                         push rsp
00060761  286d44                     sub byte ptr [rbp + 0x44], ch
00060764  54                         push rsp
00060765  286d44                     sub byte ptr [rbp + 0x44], ch
00060768  54                         push rsp
00060769  286d44                     sub byte ptr [rbp + 0x44], ch
0006076C  54                         push rsp
0006076D  286d44                     sub byte ptr [rbp + 0x44], ch
00060770  54                         push rsp
00060771  286d44                     sub byte ptr [rbp + 0x44], ch
00060774  54                         push rsp
00060775  286d44                     sub byte ptr [rbp + 0x44], ch
00060778  54                         push rsp
00060779  286d44                     sub byte ptr [rbp + 0x44], ch
0006077C  54                         push rsp
0006077D  286d44                     sub byte ptr [rbp + 0x44], ch
00060780  54                         push rsp
00060781  286d44                     sub byte ptr [rbp + 0x44], ch
00060784  54                         push rsp
00060785  286d44                     sub byte ptr [rbp + 0x44], ch
00060788  54                         push rsp
00060789  286d44                     sub byte ptr [rbp + 0x44], ch
0006078C  54                         push rsp
0006078D  286d44                     sub byte ptr [rbp + 0x44], ch
00060790  54                         push rsp
00060791  286d44                     sub byte ptr [rbp + 0x44], ch
00060794  54                         push rsp
00060795  286d44                     sub byte ptr [rbp + 0x44], ch
00060798  54                         push rsp
00060799  286d44                     sub byte ptr [rbp + 0x44], ch
0006079C  54                         push rsp
0006079D  286d44                     sub byte ptr [rbp + 0x44], ch
000607A0  54                         push rsp
000607A1  286d44                     sub byte ptr [rbp + 0x44], ch
000607A4  54                         push rsp
000607A5  286d44                     sub byte ptr [rbp + 0x44], ch
000607A8  54                         push rsp
000607A9  286d44                     sub byte ptr [rbp + 0x44], ch
000607AC  54                         push rsp
000607AD  286d44                     sub byte ptr [rbp + 0x44], ch
000607B0  54                         push rsp
000607B1  286d44                     sub byte ptr [rbp + 0x44], ch
000607B4  54                         push rsp
000607B5  286d44                     sub byte ptr [rbp + 0x44], ch
000607B8  54                         push rsp
000607B9  286d44                     sub byte ptr [rbp + 0x44], ch
000607BC  54                         push rsp
000607BD  286d44                     sub byte ptr [rbp + 0x44], ch
000607C0  54                         push rsp
000607C1  286d44                     sub byte ptr [rbp + 0x44], ch
000607C4  54                         push rsp
000607C5  286d44                     sub byte ptr [rbp + 0x44], ch
000607C8  54                         push rsp
000607C9  286d44                     sub byte ptr [rbp + 0x44], ch
000607CC  54                         push rsp
000607CD  286d44                     sub byte ptr [rbp + 0x44], ch
000607D0  54                         push rsp
000607D1  286d44                     sub byte ptr [rbp + 0x44], ch
000607D4  54                         push rsp
000607D5  286d44                     sub byte ptr [rbp + 0x44], ch
000607D8  54                         push rsp
000607D9  286d44                     sub byte ptr [rbp + 0x44], ch
000607DC  54                         push rsp
000607DD  286d44                     sub byte ptr [rbp + 0x44], ch
000607E0  54                         push rsp
000607E1  286d44                     sub byte ptr [rbp + 0x44], ch
000607E4  54                         push rsp
000607E5  286d44                     sub byte ptr [rbp + 0x44], ch
000607E8  54                         push rsp
000607E9  286d44                     sub byte ptr [rbp + 0x44], ch
000607EC  54                         push rsp
000607ED  286d44                     sub byte ptr [rbp + 0x44], ch
000607F0  54                         push rsp
000607F1  286d44                     sub byte ptr [rbp + 0x44], ch
000607F4  54                         push rsp
000607F5  286d44                     sub byte ptr [rbp + 0x44], ch
000607F8  54                         push rsp
000607F9  286d44                     sub byte ptr [rbp + 0x44], ch
000607FC  54                         push rsp
000607FD  286d44                     sub byte ptr [rbp + 0x44], ch
00060800  54                         push rsp
00060801  286d44                     sub byte ptr [rbp + 0x44], ch
00060804  54                         push rsp
00060805  286d44                     sub byte ptr [rbp + 0x44], ch
00060808  54                         push rsp
00060809  286d44                     sub byte ptr [rbp + 0x44], ch
0006080C  54                         push rsp
0006080D  286d44                     sub byte ptr [rbp + 0x44], ch
00060810  54                         push rsp
00060811  286d44                     sub byte ptr [rbp + 0x44], ch
00060814  54                         push rsp
00060815  286d44                     sub byte ptr [rbp + 0x44], ch
00060818  54                         push rsp
00060819  286d44                     sub byte ptr [rbp + 0x44], ch
0006081C  54                         push rsp
0006081D  286d44                     sub byte ptr [rbp + 0x44], ch
00060820  54                         push rsp
00060821  286d44                     sub byte ptr [rbp + 0x44], ch
00060824  54                         push rsp
00060825  286d44                     sub byte ptr [rbp + 0x44], ch
00060828  54                         push rsp
00060829  286d44                     sub byte ptr [rbp + 0x44], ch
0006082C  54                         push rsp
0006082D  286d44                     sub byte ptr [rbp + 0x44], ch
00060830  54                         push rsp
00060831  286d44                     sub byte ptr [rbp + 0x44], ch
00060834  54                         push rsp
00060835  286d44                     sub byte ptr [rbp + 0x44], ch
00060838  54                         push rsp
00060839  286d44                     sub byte ptr [rbp + 0x44], ch
0006083C  54                         push rsp
0006083D  286d44                     sub byte ptr [rbp + 0x44], ch
00060840  54                         push rsp
00060841  286d44                     sub byte ptr [rbp + 0x44], ch
00060844  54                         push rsp
00060845  286d44                     sub byte ptr [rbp + 0x44], ch
00060848  54                         push rsp
00060849  286d44                     sub byte ptr [rbp + 0x44], ch
0006084C  54                         push rsp
0006084D  286d44                     sub byte ptr [rbp + 0x44], ch
00060850  54                         push rsp
00060851  286d44                     sub byte ptr [rbp + 0x44], ch
00060854  54                         push rsp
00060855  286d44                     sub byte ptr [rbp + 0x44], ch
00060858  54                         push rsp
00060859  286d44                     sub byte ptr [rbp + 0x44], ch
0006085C  54                         push rsp
0006085D  286d44                     sub byte ptr [rbp + 0x44], ch
00060860  54                         push rsp
00060861  286d44                     sub byte ptr [rbp + 0x44], ch
00060864  54                         push rsp
00060865  286d44                     sub byte ptr [rbp + 0x44], ch
00060868  54                         push rsp
00060869  286d44                     sub byte ptr [rbp + 0x44], ch
0006086C  54                         push rsp
0006086D  286d44                     sub byte ptr [rbp + 0x44], ch
00060870  54                         push rsp
00060871  286d44                     sub byte ptr [rbp + 0x44], ch
00060874  54                         push rsp
00060875  286d44                     sub byte ptr [rbp + 0x44], ch
00060878  54                         push rsp
00060879  286d44                     sub byte ptr [rbp + 0x44], ch
0006087C  54                         push rsp
0006087D  286d44                     sub byte ptr [rbp + 0x44], ch
00060880  54                         push rsp
00060881  286d44                     sub byte ptr [rbp + 0x44], ch
00060884  54                         push rsp
00060885  286d44                     sub byte ptr [rbp + 0x44], ch
00060888  54                         push rsp
00060889  286d44                     sub byte ptr [rbp + 0x44], ch
0006088C  54                         push rsp
0006088D  286d44                     sub byte ptr [rbp + 0x44], ch
00060890  54                         push rsp
00060891  286d44                     sub byte ptr [rbp + 0x44], ch
00060894  54                         push rsp
00060895  286d44                     sub byte ptr [rbp + 0x44], ch
00060898  54                         push rsp
00060899  286d44                     sub byte ptr [rbp + 0x44], ch
0006089C  54                         push rsp
0006089D  286d44                     sub byte ptr [rbp + 0x44], ch
000608A0  54                         push rsp
000608A1  286d44                     sub byte ptr [rbp + 0x44], ch
000608A4  54                         push rsp
000608A5  286d44                     sub byte ptr [rbp + 0x44], ch
000608A8  54                         push rsp
000608A9  286d44                     sub byte ptr [rbp + 0x44], ch
000608AC  54                         push rsp
000608AD  286d44                     sub byte ptr [rbp + 0x44], ch
000608B0  54                         push rsp
000608B1  286d44                     sub byte ptr [rbp + 0x44], ch
000608B4  54                         push rsp
000608B5  286d44                     sub byte ptr [rbp + 0x44], ch
000608B8  54                         push rsp
000608B9  286d44                     sub byte ptr [rbp + 0x44], ch
000608BC  54                         push rsp
000608BD  286d44                     sub byte ptr [rbp + 0x44], ch
000608C0  54                         push rsp
000608C1  286d44                     sub byte ptr [rbp + 0x44], ch
000608C4  54                         push rsp
000608C5  286d44                     sub byte ptr [rbp + 0x44], ch
000608C8  54                         push rsp
000608C9  286d44                     sub byte ptr [rbp + 0x44], ch
000608CC  54                         push rsp
000608CD  286d44                     sub byte ptr [rbp + 0x44], ch
000608D0  54                         push rsp
000608D1  286d44                     sub byte ptr [rbp + 0x44], ch
000608D4  54                         push rsp
000608D5  286d44                     sub byte ptr [rbp + 0x44], ch
000608D8  54                         push rsp
000608D9  286d44                     sub byte ptr [rbp + 0x44], ch
000608DC  54                         push rsp
000608DD  286d44                     sub byte ptr [rbp + 0x44], ch
000608E0  54                         push rsp
000608E1  286d44                     sub byte ptr [rbp + 0x44], ch
000608E4  54                         push rsp
000608E5  286d44                     sub byte ptr [rbp + 0x44], ch
000608E8  54                         push rsp
000608E9  286d44                     sub byte ptr [rbp + 0x44], ch
000608EC  54                         push rsp
000608ED  286d44                     sub byte ptr [rbp + 0x44], ch
000608F0  54                         push rsp
000608F1  286d44                     sub byte ptr [rbp + 0x44], ch
000608F4  54                         push rsp
000608F5  286d44                     sub byte ptr [rbp + 0x44], ch
000608F8  54                         push rsp
000608F9  286d44                     sub byte ptr [rbp + 0x44], ch
000608FC  54                         push rsp
000608FD  286d44                     sub byte ptr [rbp + 0x44], ch
00060900  54                         push rsp
00060901  286d44                     sub byte ptr [rbp + 0x44], ch
00060904  54                         push rsp
00060905  286d44                     sub byte ptr [rbp + 0x44], ch
00060908  54                         push rsp
00060909  286d44                     sub byte ptr [rbp + 0x44], ch
0006090C  54                         push rsp
0006090D  286d44                     sub byte ptr [rbp + 0x44], ch
00060910  54                         push rsp
00060911  286d44                     sub byte ptr [rbp + 0x44], ch
00060914  54                         push rsp
00060915  286d44                     sub byte ptr [rbp + 0x44], ch
00060918  54                         push rsp
00060919  286d44                     sub byte ptr [rbp + 0x44], ch
0006091C  54                         push rsp
0006091D  286d44                     sub byte ptr [rbp + 0x44], ch
00060920  54                         push rsp
00060921  286d44                     sub byte ptr [rbp + 0x44], ch
00060924  54                         push rsp
00060925  286d44                     sub byte ptr [rbp + 0x44], ch
00060928  54                         push rsp
00060929  286d44                     sub byte ptr [rbp + 0x44], ch
0006092C  54                         push rsp
0006092D  286d44                     sub byte ptr [rbp + 0x44], ch
00060930  54                         push rsp
00060931  286d44                     sub byte ptr [rbp + 0x44], ch
00060934  54                         push rsp
00060935  286d44                     sub byte ptr [rbp + 0x44], ch
00060938  54                         push rsp
00060939  286d44                     sub byte ptr [rbp + 0x44], ch
0006093C  54                         push rsp
0006093D  286d44                     sub byte ptr [rbp + 0x44], ch
00060940  54                         push rsp
00060941  286d44                     sub byte ptr [rbp + 0x44], ch
00060944  54                         push rsp
00060945  286d44                     sub byte ptr [rbp + 0x44], ch
00060948  54                         push rsp
00060949  286d44                     sub byte ptr [rbp + 0x44], ch
0006094C  54                         push rsp
0006094D  286d44                     sub byte ptr [rbp + 0x44], ch
00060950  54                         push rsp
00060951  286d44                     sub byte ptr [rbp + 0x44], ch
00060954  54                         push rsp
00060955  286d44                     sub byte ptr [rbp + 0x44], ch
00060958  54                         push rsp
00060959  286d44                     sub byte ptr [rbp + 0x44], ch
0006095C  54                         push rsp
0006095D  286d44                     sub byte ptr [rbp + 0x44], ch
00060960  54                         push rsp
00060961  286d44                     sub byte ptr [rbp + 0x44], ch
00060964  54                         push rsp
00060965  286d44                     sub byte ptr [rbp + 0x44], ch
00060968  54                         push rsp
00060969  286d44                     sub byte ptr [rbp + 0x44], ch
0006096C  54                         push rsp
0006096D  286d44                     sub byte ptr [rbp + 0x44], ch
00060970  54                         push rsp
00060971  286d44                     sub byte ptr [rbp + 0x44], ch
00060974  54                         push rsp
00060975  286d44                     sub byte ptr [rbp + 0x44], ch
00060978  54                         push rsp
00060979  286d44                     sub byte ptr [rbp + 0x44], ch
0006097C  54                         push rsp
0006097D  286d44                     sub byte ptr [rbp + 0x44], ch
00060980  54                         push rsp
00060981  286d44                     sub byte ptr [rbp + 0x44], ch
00060984  54                         push rsp
00060985  286d44                     sub byte ptr [rbp + 0x44], ch
00060988  54                         push rsp
00060989  286d44                     sub byte ptr [rbp + 0x44], ch
0006098C  54                         push rsp
0006098D  286d44                     sub byte ptr [rbp + 0x44], ch
00060990  54                         push rsp
00060991  286d44                     sub byte ptr [rbp + 0x44], ch
00060994  54                         push rsp
00060995  286d44                     sub byte ptr [rbp + 0x44], ch
00060998  54                         push rsp
00060999  286d44                     sub byte ptr [rbp + 0x44], ch
0006099C  54                         push rsp
0006099D  286d44                     sub byte ptr [rbp + 0x44], ch
000609A0  54                         push rsp
000609A1  286d44                     sub byte ptr [rbp + 0x44], ch
000609A4  54                         push rsp
000609A5  286d44                     sub byte ptr [rbp + 0x44], ch
000609A8  54                         push rsp
000609A9  286d44                     sub byte ptr [rbp + 0x44], ch
000609AC  54                         push rsp
000609AD  286d44                     sub byte ptr [rbp + 0x44], ch
000609B0  54                         push rsp
000609B1  286d44                     sub byte ptr [rbp + 0x44], ch
000609B4  54                         push rsp
000609B5  286d44                     sub byte ptr [rbp + 0x44], ch
000609B8  54                         push rsp
000609B9  286d44                     sub byte ptr [rbp + 0x44], ch
000609BC  54                         push rsp
000609BD  286d44                     sub byte ptr [rbp + 0x44], ch
000609C0  54                         push rsp
000609C1  286d44                     sub byte ptr [rbp + 0x44], ch
000609C4  54                         push rsp
000609C5  286d44                     sub byte ptr [rbp + 0x44], ch
000609C8  54                         push rsp
000609C9  286d44                     sub byte ptr [rbp + 0x44], ch
000609CC  54                         push rsp
000609CD  286d44                     sub byte ptr [rbp + 0x44], ch
000609D0  54                         push rsp
000609D1  286d44                     sub byte ptr [rbp + 0x44], ch
000609D4  54                         push rsp
000609D5  286d44                     sub byte ptr [rbp + 0x44], ch
000609D8  54                         push rsp
000609D9  286d44                     sub byte ptr [rbp + 0x44], ch
000609DC  54                         push rsp
000609DD  286d44                     sub byte ptr [rbp + 0x44], ch
000609E0  54                         push rsp
000609E1  286d44                     sub byte ptr [rbp + 0x44], ch
000609E4  54                         push rsp
000609E5  286d44                     sub byte ptr [rbp + 0x44], ch
000609E8  54                         push rsp
000609E9  286d44                     sub byte ptr [rbp + 0x44], ch
000609EC  54                         push rsp
000609ED  286d44                     sub byte ptr [rbp + 0x44], ch
000609F0  54                         push rsp
000609F1  286d44                     sub byte ptr [rbp + 0x44], ch
000609F4  54                         push rsp
000609F5  286d44                     sub byte ptr [rbp + 0x44], ch
000609F8  54                         push rsp
000609F9  286d44                     sub byte ptr [rbp + 0x44], ch
000609FC  54                         push rsp
000609FD  286d44                     sub byte ptr [rbp + 0x44], ch
00060A00  54                         push rsp
00060A01  286d44                     sub byte ptr [rbp + 0x44], ch
00060A04  54                         push rsp
00060A05  286d44                     sub byte ptr [rbp + 0x44], ch
00060A08  54                         push rsp
00060A09  286d44                     sub byte ptr [rbp + 0x44], ch
00060A0C  54                         push rsp
00060A0D  286d44                     sub byte ptr [rbp + 0x44], ch
00060A10  54                         push rsp
00060A11  286d44                     sub byte ptr [rbp + 0x44], ch
00060A14  54                         push rsp
00060A15  286d44                     sub byte ptr [rbp + 0x44], ch
00060A18  54                         push rsp
00060A19  286d44                     sub byte ptr [rbp + 0x44], ch
00060A1C  54                         push rsp
00060A1D  286d44                     sub byte ptr [rbp + 0x44], ch
00060A20  54                         push rsp
00060A21  286d44                     sub byte ptr [rbp + 0x44], ch
00060A24  54                         push rsp
00060A25  286d44                     sub byte ptr [rbp + 0x44], ch
00060A28  54                         push rsp
00060A29  286d44                     sub byte ptr [rbp + 0x44], ch
00060A2C  54                         push rsp
00060A2D  286d44                     sub byte ptr [rbp + 0x44], ch
00060A30  54                         push rsp
00060A31  286d44                     sub byte ptr [rbp + 0x44], ch
00060A34  54                         push rsp
00060A35  286d44                     sub byte ptr [rbp + 0x44], ch
00060A38  54                         push rsp
00060A39  286d44                     sub byte ptr [rbp + 0x44], ch
00060A3C  54                         push rsp
00060A3D  286d44                     sub byte ptr [rbp + 0x44], ch
00060A40  54                         push rsp
00060A41  286d44                     sub byte ptr [rbp + 0x44], ch
00060A44  54                         push rsp
00060A45  286d44                     sub byte ptr [rbp + 0x44], ch
00060A48  54                         push rsp
00060A49  286d44                     sub byte ptr [rbp + 0x44], ch
00060A4C  54                         push rsp
00060A4D  286d44                     sub byte ptr [rbp + 0x44], ch
00060A50  54                         push rsp
00060A51  286d44                     sub byte ptr [rbp + 0x44], ch
00060A54  54                         push rsp
00060A55  286d44                     sub byte ptr [rbp + 0x44], ch
00060A58  54                         push rsp
00060A59  286d44                     sub byte ptr [rbp + 0x44], ch
00060A5C  54                         push rsp
00060A5D  286d44                     sub byte ptr [rbp + 0x44], ch
00060A60  54                         push rsp
00060A61  286d44                     sub byte ptr [rbp + 0x44], ch
00060A64  54                         push rsp
00060A65  286d44                     sub byte ptr [rbp + 0x44], ch
00060A68  54                         push rsp
00060A69  286d44                     sub byte ptr [rbp + 0x44], ch
00060A6C  54                         push rsp
00060A6D  286d44                     sub byte ptr [rbp + 0x44], ch
00060A70  54                         push rsp
00060A71  286d44                     sub byte ptr [rbp + 0x44], ch
00060A74  54                         push rsp
00060A75  286d44                     sub byte ptr [rbp + 0x44], ch
00060A78  54                         push rsp
00060A79  286d44                     sub byte ptr [rbp + 0x44], ch
00060A7C  54                         push rsp
00060A7D  286d44                     sub byte ptr [rbp + 0x44], ch
00060A80  54                         push rsp
00060A81  286d44                     sub byte ptr [rbp + 0x44], ch
00060A84  54                         push rsp
00060A85  286d44                     sub byte ptr [rbp + 0x44], ch
00060A88  54                         push rsp
00060A89  286d44                     sub byte ptr [rbp + 0x44], ch
00060A8C  54                         push rsp
00060A8D  286d44                     sub byte ptr [rbp + 0x44], ch
00060A90  54                         push rsp
00060A91  286d44                     sub byte ptr [rbp + 0x44], ch
00060A94  54                         push rsp
00060A95  286d44                     sub byte ptr [rbp + 0x44], ch
00060A98  54                         push rsp
00060A99  286d44                     sub byte ptr [rbp + 0x44], ch
00060A9C  54                         push rsp
00060A9D  286d44                     sub byte ptr [rbp + 0x44], ch
00060AA0  54                         push rsp
00060AA1  286d44                     sub byte ptr [rbp + 0x44], ch
00060AA4  54                         push rsp
00060AA5  286d44                     sub byte ptr [rbp + 0x44], ch
00060AA8  54                         push rsp
00060AA9  286d44                     sub byte ptr [rbp + 0x44], ch
00060AAC  54                         push rsp
00060AAD  286d44                     sub byte ptr [rbp + 0x44], ch
00060AB0  54                         push rsp
00060AB1  286d44                     sub byte ptr [rbp + 0x44], ch
00060AB4  54                         push rsp
00060AB5  286d44                     sub byte ptr [rbp + 0x44], ch
00060AB8  54                         push rsp
00060AB9  286d44                     sub byte ptr [rbp + 0x44], ch
00060ABC  54                         push rsp
00060ABD  286d44                     sub byte ptr [rbp + 0x44], ch
00060AC0  54                         push rsp
00060AC1  286d44                     sub byte ptr [rbp + 0x44], ch
00060AC4  54                         push rsp
00060AC5  286d44                     sub byte ptr [rbp + 0x44], ch
00060AC8  54                         push rsp
00060AC9  286d44                     sub byte ptr [rbp + 0x44], ch
00060ACC  54                         push rsp
00060ACD  286d44                     sub byte ptr [rbp + 0x44], ch
00060AD0  54                         push rsp
00060AD1  286d44                     sub byte ptr [rbp + 0x44], ch
00060AD4  54                         push rsp
00060AD5  286d44                     sub byte ptr [rbp + 0x44], ch
00060AD8  54                         push rsp
00060AD9  286d44                     sub byte ptr [rbp + 0x44], ch
00060ADC  54                         push rsp
00060ADD  286d44                     sub byte ptr [rbp + 0x44], ch
00060AE0  54                         push rsp
00060AE1  286d44                     sub byte ptr [rbp + 0x44], ch
00060AE4  54                         push rsp
00060AE5  286d44                     sub byte ptr [rbp + 0x44], ch
00060AE8  54                         push rsp
00060AE9  286d44                     sub byte ptr [rbp + 0x44], ch
00060AEC  54                         push rsp
00060AED  286d44                     sub byte ptr [rbp + 0x44], ch
00060AF0  54                         push rsp
00060AF1  286d44                     sub byte ptr [rbp + 0x44], ch
00060AF4  54                         push rsp
00060AF5  286d44                     sub byte ptr [rbp + 0x44], ch
00060AF8  54                         push rsp
00060AF9  286d44                     sub byte ptr [rbp + 0x44], ch
00060AFC  54                         push rsp
00060AFD  286d44                     sub byte ptr [rbp + 0x44], ch
00060B00  54                         push rsp
00060B01  286d44                     sub byte ptr [rbp + 0x44], ch
00060B04  54                         push rsp
00060B05  286d44                     sub byte ptr [rbp + 0x44], ch
00060B08  54                         push rsp
00060B09  286d44                     sub byte ptr [rbp + 0x44], ch
00060B0C  54                         push rsp
00060B0D  286d44                     sub byte ptr [rbp + 0x44], ch
00060B10  54                         push rsp
00060B11  286d44                     sub byte ptr [rbp + 0x44], ch
00060B14  54                         push rsp
00060B15  286d44                     sub byte ptr [rbp + 0x44], ch
00060B18  54                         push rsp
00060B19  286d44                     sub byte ptr [rbp + 0x44], ch
00060B1C  54                         push rsp
00060B1D  286d44                     sub byte ptr [rbp + 0x44], ch
00060B20  54                         push rsp
00060B21  286d44                     sub byte ptr [rbp + 0x44], ch
00060B24  54                         push rsp
00060B25  286d44                     sub byte ptr [rbp + 0x44], ch
00060B28  54                         push rsp
00060B29  286d44                     sub byte ptr [rbp + 0x44], ch
00060B2C  54                         push rsp
00060B2D  286d44                     sub byte ptr [rbp + 0x44], ch
00060B30  54                         push rsp
00060B31  286d44                     sub byte ptr [rbp + 0x44], ch
00060B34  54                         push rsp
00060B35  286d44                     sub byte ptr [rbp + 0x44], ch
00060B38  54                         push rsp
00060B39  286d44                     sub byte ptr [rbp + 0x44], ch
00060B3C  54                         push rsp
00060B3D  286d44                     sub byte ptr [rbp + 0x44], ch
00060B40  54                         push rsp
00060B41  286d44                     sub byte ptr [rbp + 0x44], ch
00060B44  54                         push rsp
00060B45  286d44                     sub byte ptr [rbp + 0x44], ch
00060B48  54                         push rsp
00060B49  286d44                     sub byte ptr [rbp + 0x44], ch
00060B4C  54                         push rsp
00060B4D  286d44                     sub byte ptr [rbp + 0x44], ch
00060B50  54                         push rsp
00060B51  286d44                     sub byte ptr [rbp + 0x44], ch
00060B54  54                         push rsp
00060B55  286d44                     sub byte ptr [rbp + 0x44], ch
00060B58  54                         push rsp
00060B59  286d44                     sub byte ptr [rbp + 0x44], ch
00060B5C  54                         push rsp
00060B5D  286d44                     sub byte ptr [rbp + 0x44], ch
00060B60  54                         push rsp
00060B61  286d44                     sub byte ptr [rbp + 0x44], ch
00060B64  54                         push rsp
00060B65  286d44                     sub byte ptr [rbp + 0x44], ch
00060B68  54                         push rsp
00060B69  286d44                     sub byte ptr [rbp + 0x44], ch
00060B6C  54                         push rsp
00060B6D  286d44                     sub byte ptr [rbp + 0x44], ch
00060B70  54                         push rsp
00060B71  286d44                     sub byte ptr [rbp + 0x44], ch
00060B74  54                         push rsp
00060B75  286d44                     sub byte ptr [rbp + 0x44], ch
00060B78  54                         push rsp
00060B79  286d44                     sub byte ptr [rbp + 0x44], ch
00060B7C  54                         push rsp
00060B7D  286d44                     sub byte ptr [rbp + 0x44], ch
00060B80  54                         push rsp
00060B81  286d44                     sub byte ptr [rbp + 0x44], ch
00060B84  54                         push rsp
00060B85  286d44                     sub byte ptr [rbp + 0x44], ch
00060B88  54                         push rsp
00060B89  286d44                     sub byte ptr [rbp + 0x44], ch
00060B8C  54                         push rsp
00060B8D  286d44                     sub byte ptr [rbp + 0x44], ch
00060B90  54                         push rsp
00060B91  286d44                     sub byte ptr [rbp + 0x44], ch
00060B94  54                         push rsp
00060B95  286d44                     sub byte ptr [rbp + 0x44], ch
00060B98  54                         push rsp
00060B99  286d44                     sub byte ptr [rbp + 0x44], ch
00060B9C  54                         push rsp
00060B9D  286d44                     sub byte ptr [rbp + 0x44], ch
00060BA0  54                         push rsp
00060BA1  286d44                     sub byte ptr [rbp + 0x44], ch
00060BA4  54                         push rsp
00060BA5  286d44                     sub byte ptr [rbp + 0x44], ch
00060BA8  54                         push rsp
00060BA9  286d44                     sub byte ptr [rbp + 0x44], ch
00060BAC  54                         push rsp
00060BAD  286d44                     sub byte ptr [rbp + 0x44], ch
00060BB0  54                         push rsp
00060BB1  286d44                     sub byte ptr [rbp + 0x44], ch
00060BB4  54                         push rsp
00060BB5  286d44                     sub byte ptr [rbp + 0x44], ch
00060BB8  54                         push rsp
00060BB9  286d44                     sub byte ptr [rbp + 0x44], ch
00060BBC  54                         push rsp
00060BBD  286d44                     sub byte ptr [rbp + 0x44], ch
00060BC0  54                         push rsp
00060BC1  286d44                     sub byte ptr [rbp + 0x44], ch
00060BC4  54                         push rsp
00060BC5  286d44                     sub byte ptr [rbp + 0x44], ch
00060BC8  54                         push rsp
00060BC9  286d44                     sub byte ptr [rbp + 0x44], ch
00060BCC  54                         push rsp
00060BCD  286d44                     sub byte ptr [rbp + 0x44], ch
00060BD0  54                         push rsp
00060BD1  286d44                     sub byte ptr [rbp + 0x44], ch
00060BD4  54                         push rsp
00060BD5  286d44                     sub byte ptr [rbp + 0x44], ch
00060BD8  54                         push rsp
00060BD9  286d44                     sub byte ptr [rbp + 0x44], ch
00060BDC  54                         push rsp
00060BDD  286d44                     sub byte ptr [rbp + 0x44], ch
00060BE0  54                         push rsp
00060BE1  286d44                     sub byte ptr [rbp + 0x44], ch
00060BE4  54                         push rsp
00060BE5  286d44                     sub byte ptr [rbp + 0x44], ch
00060BE8  54                         push rsp
00060BE9  286d44                     sub byte ptr [rbp + 0x44], ch
00060BEC  54                         push rsp
00060BED  286d44                     sub byte ptr [rbp + 0x44], ch
00060BF0  54                         push rsp
00060BF1  286d44                     sub byte ptr [rbp + 0x44], ch
00060BF4  54                         push rsp
00060BF5  286d44                     sub byte ptr [rbp + 0x44], ch
00060BF8  54                         push rsp
00060BF9  286d44                     sub byte ptr [rbp + 0x44], ch
00060BFC  54                         push rsp
00060BFD  286d44                     sub byte ptr [rbp + 0x44], ch
00060C00  54                         push rsp
00060C01  286d44                     sub byte ptr [rbp + 0x44], ch
00060C04  54                         push rsp
00060C05  286d44                     sub byte ptr [rbp + 0x44], ch
00060C08  54                         push rsp
00060C09  286d44                     sub byte ptr [rbp + 0x44], ch
00060C0C  54                         push rsp
00060C0D  286d44                     sub byte ptr [rbp + 0x44], ch
00060C10  54                         push rsp
00060C11  286d44                     sub byte ptr [rbp + 0x44], ch
00060C14  54                         push rsp
00060C15  286d44                     sub byte ptr [rbp + 0x44], ch
00060C18  54                         push rsp
00060C19  286d44                     sub byte ptr [rbp + 0x44], ch
00060C1C  54                         push rsp
00060C1D  286d44                     sub byte ptr [rbp + 0x44], ch
00060C20  54                         push rsp
00060C21  286d44                     sub byte ptr [rbp + 0x44], ch
00060C24  54                         push rsp
00060C25  286d44                     sub byte ptr [rbp + 0x44], ch
00060C28  54                         push rsp
00060C29  286d44                     sub byte ptr [rbp + 0x44], ch
00060C2C  54                         push rsp
00060C2D  286d44                     sub byte ptr [rbp + 0x44], ch
00060C30  54                         push rsp
00060C31  286d44                     sub byte ptr [rbp + 0x44], ch
00060C34  54                         push rsp
00060C35  286d44                     sub byte ptr [rbp + 0x44], ch
00060C38  54                         push rsp
00060C39  286d44                     sub byte ptr [rbp + 0x44], ch
00060C3C  54                         push rsp
00060C3D  286d44                     sub byte ptr [rbp + 0x44], ch
00060C40  54                         push rsp
00060C41  286d44                     sub byte ptr [rbp + 0x44], ch
00060C44  54                         push rsp
00060C45  286d44                     sub byte ptr [rbp + 0x44], ch
00060C48  54                         push rsp
00060C49  286d44                     sub byte ptr [rbp + 0x44], ch
00060C4C  54                         push rsp
00060C4D  286d44                     sub byte ptr [rbp + 0x44], ch
00060C50  54                         push rsp
00060C51  286d44                     sub byte ptr [rbp + 0x44], ch
00060C54  54                         push rsp
00060C55  286d44                     sub byte ptr [rbp + 0x44], ch
00060C58  54                         push rsp
00060C59  286d44                     sub byte ptr [rbp + 0x44], ch
00060C5C  54                         push rsp
00060C5D  286d44                     sub byte ptr [rbp + 0x44], ch
00060C60  54                         push rsp
00060C61  286d44                     sub byte ptr [rbp + 0x44], ch
00060C64  54                         push rsp
00060C65  286d44                     sub byte ptr [rbp + 0x44], ch
00060C68  54                         push rsp
00060C69  286d44                     sub byte ptr [rbp + 0x44], ch
00060C6C  54                         push rsp
00060C6D  286d44                     sub byte ptr [rbp + 0x44], ch
00060C70  54                         push rsp
00060C71  286d44                     sub byte ptr [rbp + 0x44], ch
00060C74  54                         push rsp
00060C75  286d44                     sub byte ptr [rbp + 0x44], ch
00060C78  54                         push rsp
00060C79  286d44                     sub byte ptr [rbp + 0x44], ch
00060C7C  54                         push rsp
00060C7D  286d44                     sub byte ptr [rbp + 0x44], ch
00060C80  54                         push rsp
00060C81  286d44                     sub byte ptr [rbp + 0x44], ch
00060C84  54                         push rsp
00060C85  286d44                     sub byte ptr [rbp + 0x44], ch
00060C88  54                         push rsp
00060C89  286d44                     sub byte ptr [rbp + 0x44], ch
00060C8C  54                         push rsp
00060C8D  286d44                     sub byte ptr [rbp + 0x44], ch
00060C90  54                         push rsp
00060C91  286d44                     sub byte ptr [rbp + 0x44], ch
00060C94  54                         push rsp
00060C95  286d44                     sub byte ptr [rbp + 0x44], ch
00060C98  54                         push rsp
00060C99  286d44                     sub byte ptr [rbp + 0x44], ch
00060C9C  54                         push rsp
00060C9D  286d44                     sub byte ptr [rbp + 0x44], ch
00060CA0  54                         push rsp
00060CA1  286d44                     sub byte ptr [rbp + 0x44], ch
00060CA4  54                         push rsp
00060CA5  286d44                     sub byte ptr [rbp + 0x44], ch
00060CA8  54                         push rsp
00060CA9  286d44                     sub byte ptr [rbp + 0x44], ch
00060CAC  54                         push rsp
00060CAD  286d44                     sub byte ptr [rbp + 0x44], ch
00060CB0  54                         push rsp
00060CB1  286d44                     sub byte ptr [rbp + 0x44], ch
00060CB4  54                         push rsp
00060CB5  286d44                     sub byte ptr [rbp + 0x44], ch
00060CB8  54                         push rsp
00060CB9  286d44                     sub byte ptr [rbp + 0x44], ch
00060CBC  54                         push rsp
00060CBD  286d44                     sub byte ptr [rbp + 0x44], ch
00060CC0  54                         push rsp
00060CC1  286d44                     sub byte ptr [rbp + 0x44], ch
00060CC4  54                         push rsp
00060CC5  286d44                     sub byte ptr [rbp + 0x44], ch
00060CC8  54                         push rsp
00060CC9  286d44                     sub byte ptr [rbp + 0x44], ch
00060CCC  54                         push rsp
00060CCD  286d44                     sub byte ptr [rbp + 0x44], ch
00060CD0  54                         push rsp
00060CD1  286d44                     sub byte ptr [rbp + 0x44], ch
00060CD4  54                         push rsp
00060CD5  286d44                     sub byte ptr [rbp + 0x44], ch
00060CD8  54                         push rsp
00060CD9  286d44                     sub byte ptr [rbp + 0x44], ch
00060CDC  54                         push rsp
00060CDD  286d44                     sub byte ptr [rbp + 0x44], ch
00060CE0  54                         push rsp
00060CE1  286d44                     sub byte ptr [rbp + 0x44], ch
00060CE4  54                         push rsp
00060CE5  286d44                     sub byte ptr [rbp + 0x44], ch
00060CE8  54                         push rsp
00060CE9  286d44                     sub byte ptr [rbp + 0x44], ch
00060CEC  54                         push rsp
00060CED  286d44                     sub byte ptr [rbp + 0x44], ch
00060CF0  54                         push rsp
00060CF1  286d44                     sub byte ptr [rbp + 0x44], ch
00060CF4  54                         push rsp
00060CF5  286d44                     sub byte ptr [rbp + 0x44], ch
00060CF8  54                         push rsp
00060CF9  286d44                     sub byte ptr [rbp + 0x44], ch
00060CFC  54                         push rsp
00060CFD  286d44                     sub byte ptr [rbp + 0x44], ch
00060D00  54                         push rsp
00060D01  286d44                     sub byte ptr [rbp + 0x44], ch
00060D04  54                         push rsp
00060D05  286d44                     sub byte ptr [rbp + 0x44], ch
00060D08  54                         push rsp
00060D09  286d44                     sub byte ptr [rbp + 0x44], ch
00060D0C  54                         push rsp
00060D0D  286d44                     sub byte ptr [rbp + 0x44], ch
00060D10  54                         push rsp
00060D11  286d44                     sub byte ptr [rbp + 0x44], ch
00060D14  54                         push rsp
00060D15  286d44                     sub byte ptr [rbp + 0x44], ch
00060D18  54                         push rsp
00060D19  286d44                     sub byte ptr [rbp + 0x44], ch
00060D1C  54                         push rsp
00060D1D  286d44                     sub byte ptr [rbp + 0x44], ch
00060D20  54                         push rsp
00060D21  286d44                     sub byte ptr [rbp + 0x44], ch
00060D24  54                         push rsp
00060D25  286d44                     sub byte ptr [rbp + 0x44], ch
00060D28  54                         push rsp
00060D29  286d44                     sub byte ptr [rbp + 0x44], ch
00060D2C  54                         push rsp
00060D2D  286d44                     sub byte ptr [rbp + 0x44], ch
00060D30  54                         push rsp
00060D31  286d44                     sub byte ptr [rbp + 0x44], ch
00060D34  54                         push rsp
00060D35  286d44                     sub byte ptr [rbp + 0x44], ch
00060D38  54                         push rsp
00060D39  286d44                     sub byte ptr [rbp + 0x44], ch
00060D3C  54                         push rsp
00060D3D  286d44                     sub byte ptr [rbp + 0x44], ch
00060D40  54                         push rsp
00060D41  286d44                     sub byte ptr [rbp + 0x44], ch
00060D44  54                         push rsp
00060D45  286d44                     sub byte ptr [rbp + 0x44], ch
00060D48  54                         push rsp
00060D49  286d44                     sub byte ptr [rbp + 0x44], ch
00060D4C  54                         push rsp
00060D4D  286d44                     sub byte ptr [rbp + 0x44], ch
00060D50  54                         push rsp
00060D51  286d44                     sub byte ptr [rbp + 0x44], ch
00060D54  54                         push rsp
00060D55  286d44                     sub byte ptr [rbp + 0x44], ch
00060D58  54                         push rsp
00060D59  286d44                     sub byte ptr [rbp + 0x44], ch
00060D5C  54                         push rsp
00060D5D  286d44                     sub byte ptr [rbp + 0x44], ch
00060D60  54                         push rsp
00060D61  286d44                     sub byte ptr [rbp + 0x44], ch
00060D64  54                         push rsp
00060D65  286d44                     sub byte ptr [rbp + 0x44], ch
00060D68  54                         push rsp
00060D69  286d44                     sub byte ptr [rbp + 0x44], ch
00060D6C  54                         push rsp
00060D6D  286d44                     sub byte ptr [rbp + 0x44], ch
00060D70  54                         push rsp
00060D71  286d44                     sub byte ptr [rbp + 0x44], ch
00060D74  54                         push rsp
00060D75  286d44                     sub byte ptr [rbp + 0x44], ch
00060D78  54                         push rsp
00060D79  286d44                     sub byte ptr [rbp + 0x44], ch
00060D7C  54                         push rsp
00060D7D  286d44                     sub byte ptr [rbp + 0x44], ch
00060D80  54                         push rsp
00060D81  286d44                     sub byte ptr [rbp + 0x44], ch
00060D84  54                         push rsp
00060D85  286d44                     sub byte ptr [rbp + 0x44], ch
00060D88  54                         push rsp
00060D89  286d44                     sub byte ptr [rbp + 0x44], ch
00060D8C  54                         push rsp
00060D8D  286d44                     sub byte ptr [rbp + 0x44], ch
00060D90  54                         push rsp
00060D91  286d44                     sub byte ptr [rbp + 0x44], ch
00060D94  54                         push rsp
00060D95  286d44                     sub byte ptr [rbp + 0x44], ch
00060D98  54                         push rsp
00060D99  286d44                     sub byte ptr [rbp + 0x44], ch
00060D9C  54                         push rsp
00060D9D  286d44                     sub byte ptr [rbp + 0x44], ch
00060DA0  54                         push rsp
00060DA1  286d44                     sub byte ptr [rbp + 0x44], ch
00060DA4  54                         push rsp
00060DA5  286d44                     sub byte ptr [rbp + 0x44], ch
00060DA8  54                         push rsp
00060DA9  286d44                     sub byte ptr [rbp + 0x44], ch
00060DAC  54                         push rsp
00060DAD  286d44                     sub byte ptr [rbp + 0x44], ch
00060DB0  54                         push rsp
00060DB1  286d44                     sub byte ptr [rbp + 0x44], ch
00060DB4  54                         push rsp
00060DB5  286d44                     sub byte ptr [rbp + 0x44], ch
00060DB8  54                         push rsp
00060DB9  286d44                     sub byte ptr [rbp + 0x44], ch
00060DBC  54                         push rsp
00060DBD  286d44                     sub byte ptr [rbp + 0x44], ch
00060DC0  54                         push rsp
00060DC1  286d44                     sub byte ptr [rbp + 0x44], ch
00060DC4  54                         push rsp
00060DC5  286d44                     sub byte ptr [rbp + 0x44], ch
00060DC8  54                         push rsp
00060DC9  286d44                     sub byte ptr [rbp + 0x44], ch
00060DCC  54                         push rsp
00060DCD  286d44                     sub byte ptr [rbp + 0x44], ch
00060DD0  54                         push rsp
00060DD1  286d44                     sub byte ptr [rbp + 0x44], ch
00060DD4  54                         push rsp
00060DD5  286d44                     sub byte ptr [rbp + 0x44], ch
00060DD8  54                         push rsp
00060DD9  286d44                     sub byte ptr [rbp + 0x44], ch
00060DDC  54                         push rsp
00060DDD  286d44                     sub byte ptr [rbp + 0x44], ch
00060DE0  54                         push rsp
00060DE1  286d44                     sub byte ptr [rbp + 0x44], ch
00060DE4  54                         push rsp
00060DE5  286d44                     sub byte ptr [rbp + 0x44], ch
00060DE8  54                         push rsp
00060DE9  286d44                     sub byte ptr [rbp + 0x44], ch
00060DEC  54                         push rsp
00060DED  286d44                     sub byte ptr [rbp + 0x44], ch
00060DF0  54                         push rsp
00060DF1  286d44                     sub byte ptr [rbp + 0x44], ch
00060DF4  54                         push rsp
00060DF5  286d44                     sub byte ptr [rbp + 0x44], ch
00060DF8  54                         push rsp
00060DF9  286d44                     sub byte ptr [rbp + 0x44], ch
00060DFC  54                         push rsp
00060DFD  286d44                     sub byte ptr [rbp + 0x44], ch
00060E00  54                         push rsp
00060E01  286d44                     sub byte ptr [rbp + 0x44], ch
00060E04  54                         push rsp
00060E05  286d44                     sub byte ptr [rbp + 0x44], ch
00060E08  54                         push rsp
00060E09  286d44                     sub byte ptr [rbp + 0x44], ch
00060E0C  54                         push rsp
00060E0D  286d44                     sub byte ptr [rbp + 0x44], ch
00060E10  54                         push rsp
00060E11  286d44                     sub byte ptr [rbp + 0x44], ch
00060E14  54                         push rsp
00060E15  286d44                     sub byte ptr [rbp + 0x44], ch
00060E18  54                         push rsp
00060E19  286d44                     sub byte ptr [rbp + 0x44], ch
00060E1C  54                         push rsp
00060E1D  286d44                     sub byte ptr [rbp + 0x44], ch
00060E20  54                         push rsp
00060E21  286d44                     sub byte ptr [rbp + 0x44], ch
00060E24  54                         push rsp
00060E25  286d44                     sub byte ptr [rbp + 0x44], ch
00060E28  54                         push rsp
00060E29  286d44                     sub byte ptr [rbp + 0x44], ch
00060E2C  54                         push rsp
00060E2D  286d44                     sub byte ptr [rbp + 0x44], ch
00060E30  54                         push rsp
00060E31  286d44                     sub byte ptr [rbp + 0x44], ch
00060E34  54                         push rsp
00060E35  286d44                     sub byte ptr [rbp + 0x44], ch
00060E38  54                         push rsp
00060E39  286d44                     sub byte ptr [rbp + 0x44], ch
00060E3C  54                         push rsp
00060E3D  286d44                     sub byte ptr [rbp + 0x44], ch
00060E40  54                         push rsp
00060E41  286d44                     sub byte ptr [rbp + 0x44], ch
00060E44  54                         push rsp
00060E45  286d44                     sub byte ptr [rbp + 0x44], ch
00060E48  54                         push rsp
00060E49  286d44                     sub byte ptr [rbp + 0x44], ch
00060E4C  54                         push rsp
00060E4D  286d44                     sub byte ptr [rbp + 0x44], ch
00060E50  54                         push rsp
00060E51  286d44                     sub byte ptr [rbp + 0x44], ch
00060E54  54                         push rsp
00060E55  286d44                     sub byte ptr [rbp + 0x44], ch
00060E58  54                         push rsp
00060E59  286d44                     sub byte ptr [rbp + 0x44], ch
00060E5C  54                         push rsp
00060E5D  286d44                     sub byte ptr [rbp + 0x44], ch
00060E60  54                         push rsp
00060E61  286d44                     sub byte ptr [rbp + 0x44], ch
00060E64  54                         push rsp
00060E65  286d44                     sub byte ptr [rbp + 0x44], ch
00060E68  54                         push rsp
00060E69  286d44                     sub byte ptr [rbp + 0x44], ch
00060E6C  54                         push rsp
00060E6D  286d44                     sub byte ptr [rbp + 0x44], ch
00060E70  54                         push rsp
00060E71  286d44                     sub byte ptr [rbp + 0x44], ch
00060E74  54                         push rsp
00060E75  286d44                     sub byte ptr [rbp + 0x44], ch
00060E78  54                         push rsp
00060E79  286d44                     sub byte ptr [rbp + 0x44], ch
00060E7C  54                         push rsp
00060E7D  286d44                     sub byte ptr [rbp + 0x44], ch
00060E80  54                         push rsp
00060E81  286d44                     sub byte ptr [rbp + 0x44], ch
00060E84  54                         push rsp
00060E85  286d44                     sub byte ptr [rbp + 0x44], ch
00060E88  54                         push rsp
00060E89  286d44                     sub byte ptr [rbp + 0x44], ch
00060E8C  54                         push rsp
00060E8D  286d44                     sub byte ptr [rbp + 0x44], ch
00060E90  54                         push rsp
00060E91  286d44                     sub byte ptr [rbp + 0x44], ch
00060E94  54                         push rsp
00060E95  286d44                     sub byte ptr [rbp + 0x44], ch
00060E98  54                         push rsp
00060E99  286d44                     sub byte ptr [rbp + 0x44], ch
00060E9C  54                         push rsp
00060E9D  286d44                     sub byte ptr [rbp + 0x44], ch
00060EA0  54                         push rsp
00060EA1  286d44                     sub byte ptr [rbp + 0x44], ch
00060EA4  54                         push rsp
00060EA5  286d44                     sub byte ptr [rbp + 0x44], ch
00060EA8  54                         push rsp
00060EA9  286d44                     sub byte ptr [rbp + 0x44], ch
00060EAC  54                         push rsp
00060EAD  286d44                     sub byte ptr [rbp + 0x44], ch
00060EB0  54                         push rsp
00060EB1  286d44                     sub byte ptr [rbp + 0x44], ch
00060EB4  54                         push rsp
00060EB5  286d44                     sub byte ptr [rbp + 0x44], ch
00060EB8  54                         push rsp
00060EB9  286d44                     sub byte ptr [rbp + 0x44], ch
00060EBC  54                         push rsp
00060EBD  286d44                     sub byte ptr [rbp + 0x44], ch
00060EC0  54                         push rsp
00060EC1  286d44                     sub byte ptr [rbp + 0x44], ch
00060EC4  54                         push rsp
00060EC5  286d44                     sub byte ptr [rbp + 0x44], ch
00060EC8  54                         push rsp
00060EC9  286d44                     sub byte ptr [rbp + 0x44], ch
00060ECC  54                         push rsp
00060ECD  286d44                     sub byte ptr [rbp + 0x44], ch
00060ED0  54                         push rsp
00060ED1  286d44                     sub byte ptr [rbp + 0x44], ch
00060ED4  54                         push rsp
00060ED5  286d44                     sub byte ptr [rbp + 0x44], ch
00060ED8  54                         push rsp
00060ED9  286d44                     sub byte ptr [rbp + 0x44], ch
00060EDC  54                         push rsp
00060EDD  286d44                     sub byte ptr [rbp + 0x44], ch
00060EE0  54                         push rsp
00060EE1  286d44                     sub byte ptr [rbp + 0x44], ch
00060EE4  54                         push rsp
00060EE5  286d44                     sub byte ptr [rbp + 0x44], ch
00060EE8  54                         push rsp
00060EE9  286d44                     sub byte ptr [rbp + 0x44], ch
00060EEC  54                         push rsp
00060EED  286d44                     sub byte ptr [rbp + 0x44], ch
00060EF0  54                         push rsp
00060EF1  286d44                     sub byte ptr [rbp + 0x44], ch
00060EF4  54                         push rsp
00060EF5  286d44                     sub byte ptr [rbp + 0x44], ch
00060EF8  54                         push rsp
00060EF9  286d44                     sub byte ptr [rbp + 0x44], ch
00060EFC  54                         push rsp
00060EFD  286d44                     sub byte ptr [rbp + 0x44], ch
00060F00  54                         push rsp
00060F01  286d44                     sub byte ptr [rbp + 0x44], ch
00060F04  54                         push rsp
00060F05  286d44                     sub byte ptr [rbp + 0x44], ch
00060F08  54                         push rsp
00060F09  286d44                     sub byte ptr [rbp + 0x44], ch
00060F0C  54                         push rsp
00060F0D  286d44                     sub byte ptr [rbp + 0x44], ch
00060F10  54                         push rsp
00060F11  286d44                     sub byte ptr [rbp + 0x44], ch
00060F14  54                         push rsp
00060F15  286d44                     sub byte ptr [rbp + 0x44], ch
00060F18  54                         push rsp
00060F19  286d44                     sub byte ptr [rbp + 0x44], ch
00060F1C  54                         push rsp
00060F1D  286d44                     sub byte ptr [rbp + 0x44], ch
00060F20  54                         push rsp
00060F21  286d44                     sub byte ptr [rbp + 0x44], ch
00060F24  54                         push rsp
00060F25  286d44                     sub byte ptr [rbp + 0x44], ch
00060F28  54                         push rsp
00060F29  286d44                     sub byte ptr [rbp + 0x44], ch
00060F2C  54                         push rsp
00060F2D  286d44                     sub byte ptr [rbp + 0x44], ch
00060F30  54                         push rsp
00060F31  286d44                     sub byte ptr [rbp + 0x44], ch
00060F34  54                         push rsp
00060F35  286d44                     sub byte ptr [rbp + 0x44], ch
00060F38  54                         push rsp
00060F39  286d44                     sub byte ptr [rbp + 0x44], ch
00060F3C  54                         push rsp
00060F3D  286d44                     sub byte ptr [rbp + 0x44], ch
00060F40  54                         push rsp
00060F41  286d44                     sub byte ptr [rbp + 0x44], ch
00060F44  54                         push rsp
00060F45  286d44                     sub byte ptr [rbp + 0x44], ch
00060F48  54                         push rsp
00060F49  286d44                     sub byte ptr [rbp + 0x44], ch
00060F4C  54                         push rsp
00060F4D  286d44                     sub byte ptr [rbp + 0x44], ch
00060F50  54                         push rsp
00060F51  286d44                     sub byte ptr [rbp + 0x44], ch
00060F54  54                         push rsp
00060F55  286d44                     sub byte ptr [rbp + 0x44], ch
00060F58  54                         push rsp
00060F59  286d44                     sub byte ptr [rbp + 0x44], ch
00060F5C  54                         push rsp
00060F5D  286d44                     sub byte ptr [rbp + 0x44], ch
00060F60  54                         push rsp
00060F61  286d44                     sub byte ptr [rbp + 0x44], ch
00060F64  54                         push rsp
00060F65  286d44                     sub byte ptr [rbp + 0x44], ch
00060F68  54                         push rsp
00060F69  286d44                     sub byte ptr [rbp + 0x44], ch
00060F6C  54                         push rsp
00060F6D  286d44                     sub byte ptr [rbp + 0x44], ch
00060F70  54                         push rsp
00060F71  286d44                     sub byte ptr [rbp + 0x44], ch
00060F74  54                         push rsp
00060F75  286d44                     sub byte ptr [rbp + 0x44], ch
00060F78  54                         push rsp
00060F79  286d44                     sub byte ptr [rbp + 0x44], ch
00060F7C  54                         push rsp
00060F7D  286d44                     sub byte ptr [rbp + 0x44], ch
00060F80  54                         push rsp
00060F81  286d44                     sub byte ptr [rbp + 0x44], ch
00060F84  54                         push rsp
00060F85  286d44                     sub byte ptr [rbp + 0x44], ch
00060F88  54                         push rsp
00060F89  286d44                     sub byte ptr [rbp + 0x44], ch
00060F8C  54                         push rsp
00060F8D  286d44                     sub byte ptr [rbp + 0x44], ch
00060F90  54                         push rsp
00060F91  286d44                     sub byte ptr [rbp + 0x44], ch
00060F94  54                         push rsp
00060F95  286d44                     sub byte ptr [rbp + 0x44], ch
00060F98  54                         push rsp
00060F99  286d44                     sub byte ptr [rbp + 0x44], ch
00060F9C  54                         push rsp
00060F9D  286d44                     sub byte ptr [rbp + 0x44], ch
00060FA0  54                         push rsp
00060FA1  286d44                     sub byte ptr [rbp + 0x44], ch
00060FA4  54                         push rsp
00060FA5  286d44                     sub byte ptr [rbp + 0x44], ch
00060FA8  54                         push rsp
00060FA9  286d44                     sub byte ptr [rbp + 0x44], ch
00060FAC  54                         push rsp
00060FAD  286d44                     sub byte ptr [rbp + 0x44], ch
00060FB0  54                         push rsp
00060FB1  286d44                     sub byte ptr [rbp + 0x44], ch
00060FB4  54                         push rsp
00060FB5  286d44                     sub byte ptr [rbp + 0x44], ch
00060FB8  54                         push rsp
00060FB9  286d44                     sub byte ptr [rbp + 0x44], ch
00060FBC  54                         push rsp
00060FBD  286d44                     sub byte ptr [rbp + 0x44], ch
00060FC0  54                         push rsp
00060FC1  286d44                     sub byte ptr [rbp + 0x44], ch
00060FC4  54                         push rsp
00060FC5  286d44                     sub byte ptr [rbp + 0x44], ch
00060FC8  54                         push rsp
00060FC9  286d44                     sub byte ptr [rbp + 0x44], ch
00060FCC  54                         push rsp
00060FCD  286d44                     sub byte ptr [rbp + 0x44], ch
00060FD0  54                         push rsp
00060FD1  286d44                     sub byte ptr [rbp + 0x44], ch
00060FD4  54                         push rsp
00060FD5  286d44                     sub byte ptr [rbp + 0x44], ch
00060FD8  54                         push rsp
00060FD9  286d44                     sub byte ptr [rbp + 0x44], ch
00060FDC  54                         push rsp
00060FDD  286d44                     sub byte ptr [rbp + 0x44], ch
00060FE0  54                         push rsp
00060FE1  286d44                     sub byte ptr [rbp + 0x44], ch
00060FE4  54                         push rsp
00060FE5  286d44                     sub byte ptr [rbp + 0x44], ch
00060FE8  54                         push rsp
00060FE9  286d44                     sub byte ptr [rbp + 0x44], ch
00060FEC  54                         push rsp
00060FED  286d44                     sub byte ptr [rbp + 0x44], ch
00060FF0  54                         push rsp
00060FF1  286d44                     sub byte ptr [rbp + 0x44], ch
00060FF4  54                         push rsp
00060FF5  286d44                     sub byte ptr [rbp + 0x44], ch
00060FF8  54                         push rsp
00060FF9  286d44                     sub byte ptr [rbp + 0x44], ch
00060FFC  54                         push rsp
00060FFD  286d44                     sub byte ptr [rbp + 0x44], ch
