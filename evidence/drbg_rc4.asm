
; ======== HMAC_SHA256_DRBG_0x21490 ========
00021490  488bc4                   mov rax, rsp
00021493  48895810                 mov qword ptr [rax + 0x10], rbx
00021497  48894808                 mov qword ptr [rax + 8], rcx
0002149B  55                       push rbp
0002149C  56                       push rsi
0002149D  57                       push rdi
0002149E  4154                     push r12
000214A0  4155                     push r13
000214A2  4156                     push r14
000214A4  4157                     push r15
000214A6  488da8e8feffff           lea rbp, [rax - 0x118]
000214AD  4881ece0010000           sub rsp, 0x1e0
000214B4  0f2970b8                 movaps xmmword ptr [rax - 0x48], xmm6
000214B8  488bf9                   mov rdi, rcx
000214BB  0f2978a8                 movaps xmmword ptr [rax - 0x58], xmm7
000214BF  440f294098               movaps xmmword ptr [rax - 0x68], xmm8
000214C4  440f294888               movaps xmmword ptr [rax - 0x78], xmm9
000214C9  440f299078ffffff         movaps xmmword ptr [rax - 0x88], xmm10
000214D1  66440f6f15c6c3feff       movdqa xmm10, xmmword ptr [rip - 0x13c3a]   ; -> 0xd8a0
000214DA  899538010000             mov dword ptr [rbp + 0x138], edx
000214E0  33d2                     xor edx, edx
000214E2  440f299868ffffff         movaps xmmword ptr [rax - 0x98], xmm11
000214EA  448bfa                   mov r15d, edx
000214ED  66440f6f1d3ac3feff       movdqa xmm11, xmmword ptr [rip - 0x13cc6]   ; -> 0xd830
000214F6  8bf2                     mov esi, edx
000214F8  66c7853e0100001de8       mov word ptr [rbp + 0x13e], 0xe81d
00021501  448bea                   mov r13d, edx
00021504  0f1f4000                 nop dword ptr [rax]
00021508  0f1f840000000000         nop dword ptr [rax + rax]
00021510  410fb6c5                 movzx eax, r13b
00021514  458be5                   mov r12d, r13d
00021517  347a                     xor al, 0x7a
00021519  49c1e40b                 shl r12, 0xb
0002151D  88853c010000             mov byte ptr [rbp + 0x13c], al
00021523  4c8bf2                   mov r14, rdx
00021526  418bc5                   mov eax, r13d
00021529  418bcd                   mov ecx, r13d
0002152C  c1e803                   shr eax, 3
0002152F  34c3                     xor al, 0xc3
00021531  88853d010000             mov byte ptr [rbp + 0x13d], al
00021537  4c03e7                   add r12, rdi
0002153A  488bbd38010000           mov rdi, qword ptr [rbp + 0x138]
00021541  85f6                     test esi, esi
00021543  0f85aa020000             jne 0x217f3
00021549  0f57c9                   xorps xmm1, xmm1
0002154C  48895548                 mov qword ptr [rbp + 0x48], rdx
00021550  410fb6c7                 movzx eax, r15b
00021554  c1e908                   shr ecx, 8
00021557  345a                     xor al, 0x5a
00021559  48897d40                 mov qword ptr [rbp + 0x40], rdi
0002155D  888536010000             mov byte ptr [rbp + 0x136], al
00021563  488d542448               lea rdx, [rsp + 0x48]
00021568  418bc7                   mov eax, r15d
0002156B  888d35010000             mov byte ptr [rbp + 0x135], cl
00021571  c1e808                   shr eax, 8
00021574  488d4c2420               lea rcx, [rsp + 0x20]
00021579  0f57d2                   xorps xmm2, xmm2
0002157C  4489bd30010000           mov dword ptr [rbp + 0x130], r15d
00021583  0f57e4                   xorps xmm4, xmm4
00021586  4488ad34010000           mov byte ptr [rbp + 0x134], r13b
0002158D  34a5                     xor al, 0xa5
0002158F  c744242067e6096a         mov dword ptr [rsp + 0x20], 0x6a09e667
00021597  66410f6fdb               movdqa xmm3, xmm11
0002159C  888537010000             mov byte ptr [rbp + 0x137], al
000215A2  0f57d9                   xorps xmm3, xmm1
000215A5  c744242485ae67bb         mov dword ptr [rsp + 0x24], 0xbb67ae85
000215AD  66410f6ffa               movdqa xmm7, xmm10
000215B2  c744242872f36e3c         mov dword ptr [rsp + 0x28], 0x3c6ef372
000215BA  0f57f9                   xorps xmm7, xmm1
000215BD  c744242c3af54fa5         mov dword ptr [rsp + 0x2c], 0xa54ff53a
000215C5  66410f6feb               movdqa xmm5, xmm11
000215CA  c74424307f520e51         mov dword ptr [rsp + 0x30], 0x510e527f
000215D2  0f576d40                 xorps xmm5, xmmword ptr [rbp + 0x40]
000215D6  66410f6fcb               movdqa xmm1, xmm11
000215DB  66410f6fc3               movdqa xmm0, xmm11
000215E0  c74424348c68059b         mov dword ptr [rsp + 0x34], 0x9b05688c
000215E8  66410f6ff2               movdqa xmm6, xmm10
000215ED  c7442438abd9831f         mov dword ptr [rsp + 0x38], 0x1f83d9ab
000215F5  0f577540                 xorps xmm6, xmmword ptr [rbp + 0x40]
000215F9  0f57ca                   xorps xmm1, xmm2
000215FC  66450f6fc2               movdqa xmm8, xmm10
00021601  c744243c19cde05b         mov dword ptr [rsp + 0x3c], 0x5be0cd19
00021609  0f57c4                   xorps xmm0, xmm4
0002160C  48c744244000020000       mov qword ptr [rsp + 0x40], 0x200
00021615  66450f6fca               movdqa xmm9, xmm10
0002161A  440f57c2                 xorps xmm8, xmm2
0002161E  440f57cc                 xorps xmm9, xmm4
00021622  0f116c2448               movups xmmword ptr [rsp + 0x48], xmm5
00021627  0f115c2458               movups xmmword ptr [rsp + 0x58], xmm3
0002162C  0f114c2468               movups xmmword ptr [rsp + 0x68], xmm1
00021631  0f11442478               movups xmmword ptr [rsp + 0x78], xmm0
00021636  e8f5f0ffff               call 0x20730
0002163B  8b442440                 mov eax, dword ptr [rsp + 0x40]
0002163F  8bc8                     mov ecx, eax
00021641  c1e903                   shr ecx, 3
00021644  83c040                   add eax, 0x40
00021647  83e13f                   and ecx, 0x3f
0002164A  89442440                 mov dword ptr [rsp + 0x40], eax
0002164E  83f840                   cmp eax, 0x40
00021651  7304                     jae 0x21657
00021653  ff442444                 inc dword ptr [rsp + 0x44]
00021657  bb40000000               mov ebx, 0x40
0002165C  2bd9                     sub ebx, ecx
0002165E  83fb08                   cmp ebx, 8
00021661  7755                     ja 0x216b8
00021663  8bc1                     mov eax, ecx
00021665  488d9530010000           lea rdx, [rbp + 0x130]
0002166C  488d4c2448               lea rcx, [rsp + 0x48]
00021671  448bc3                   mov r8d, ebx
00021674  4803c8                   add rcx, rax
00021677  e864650300               call 0x57be0
0002167C  488d542448               lea rdx, [rsp + 0x48]
00021681  488d4c2420               lea rcx, [rsp + 0x20]
00021686  e8a5f0ffff               call 0x20730
0002168B  8d433f                   lea eax, [rbx + 0x3f]
0002168E  83f808                   cmp eax, 8
00021691  7321                     jae 0x216b4
00021693  8bc3                     mov eax, ebx
00021695  488d9530010000           lea rdx, [rbp + 0x130]
0002169C  4803d0                   add rdx, rax
0002169F  488d4c2420               lea rcx, [rsp + 0x20]
000216A4  e887f0ffff               call 0x20730
000216A9  83c340                   add ebx, 0x40
000216AC  8d433f                   lea eax, [rbx + 0x3f]
000216AF  83f808                   cmp eax, 8
000216B2  72df                     jb 0x21693
000216B4  33c9                     xor ecx, ecx
000216B6  eb02                     jmp 0x216ba
000216B8  33db                     xor ebx, ebx
000216BA  8bc3                     mov eax, ebx
000216BC  488d9530010000           lea rdx, [rbp + 0x130]
000216C3  4803d0                   add rdx, rax
000216C6  41b808000000             mov r8d, 8
000216CC  4c2bc0                   sub r8, rax
000216CF  8bc1                     mov eax, ecx
000216D1  488d4c2448               lea rcx, [rsp + 0x48]
000216D6  4803c8                   add rcx, rax
000216D9  e802650300               call 0x57be0
000216DE  488d5520                 lea rdx, [rbp + 0x20]
000216E2  488d4c2420               lea rcx, [rsp + 0x20]
000216E7  e8b4faffff               call 0x211a0
000216EC  488d55b8                 lea rdx, [rbp - 0x48]
000216F0  c7459067e6096a           mov dword ptr [rbp - 0x70], 0x6a09e667
000216F7  488d4d90                 lea rcx, [rbp - 0x70]
000216FB  c7459485ae67bb           mov dword ptr [rbp - 0x6c], 0xbb67ae85
00021702  c7459872f36e3c           mov dword ptr [rbp - 0x68], 0x3c6ef372
00021709  c7459c3af54fa5           mov dword ptr [rbp - 0x64], 0xa54ff53a
00021710  c745a07f520e51           mov dword ptr [rbp - 0x60], 0x510e527f
00021717  c745a48c68059b           mov dword ptr [rbp - 0x5c], 0x9b05688c
0002171E  c745a8abd9831f           mov dword ptr [rbp - 0x58], 0x1f83d9ab
00021725  c745ac19cde05b           mov dword ptr [rbp - 0x54], 0x5be0cd19
0002172C  48c745b000020000         mov qword ptr [rbp - 0x50], 0x200
00021734  0f1175b8                 movups xmmword ptr [rbp - 0x48], xmm6
00021738  0f117dc8                 movups xmmword ptr [rbp - 0x38], xmm7
0002173C  440f1145d8               movups xmmword ptr [rbp - 0x28], xmm8
00021741  440f114de8               movups xmmword ptr [rbp - 0x18], xmm9
00021746  e8e5efffff               call 0x20730
0002174B  8b45b0                   mov eax, dword ptr [rbp - 0x50]
0002174E  8bc8                     mov ecx, eax
00021750  c1e903                   shr ecx, 3
00021753  0500010000               add eax, 0x100
00021758  83e13f                   and ecx, 0x3f
0002175B  8945b0                   mov dword ptr [rbp - 0x50], eax
0002175E  3d00010000               cmp eax, 0x100
00021763  7303                     jae 0x21768
00021765  ff45b4                   inc dword ptr [rbp - 0x4c]
00021768  bb40000000               mov ebx, 0x40
0002176D  2bd9                     sub ebx, ecx
0002176F  83fb20                   cmp ebx, 0x20
00021772  774d                     ja 0x217c1
00021774  8bc1                     mov eax, ecx
00021776  488d5520                 lea rdx, [rbp + 0x20]
0002177A  488d4db8                 lea rcx, [rbp - 0x48]
0002177E  448bc3                   mov r8d, ebx
00021781  4803c8                   add rcx, rax
00021784  e857640300               call 0x57be0
00021789  488d55b8                 lea rdx, [rbp - 0x48]
0002178D  488d4d90                 lea rcx, [rbp - 0x70]
00021791  e89aefffff               call 0x20730
00021796  8d433f                   lea eax, [rbx + 0x3f]
00021799  83f820                   cmp eax, 0x20
0002179C  731f                     jae 0x217bd
0002179E  6690                     nop 
000217A0  8bc3                     mov eax, ebx
000217A2  488d5520                 lea rdx, [rbp + 0x20]
000217A6  4803d0                   add rdx, rax
000217A9  488d4d90                 lea rcx, [rbp - 0x70]
000217AD  e87eefffff               call 0x20730
000217B2  83c340                   add ebx, 0x40
000217B5  8d433f                   lea eax, [rbx + 0x3f]
000217B8  83f820                   cmp eax, 0x20
000217BB  72e3                     jb 0x217a0
000217BD  33c9                     xor ecx, ecx
000217BF  eb02                     jmp 0x217c3
000217C1  33db                     xor ebx, ebx
000217C3  8bc3                     mov eax, ebx
000217C5  488d5520                 lea rdx, [rbp + 0x20]
000217C9  4803d0                   add rdx, rax
000217CC  41b820000000             mov r8d, 0x20
000217D2  4c2bc0                   sub r8, rax
000217D5  8bc1                     mov eax, ecx
000217D7  488d4db8                 lea rcx, [rbp - 0x48]
000217DB  4803c8                   add rcx, rax
000217DE  e8fd630300               call 0x57be0
000217E3  488d5500                 lea rdx, [rbp]
000217E7  488d4d90                 lea rcx, [rbp - 0x70]
000217EB  e8b0f9ffff               call 0x211a0
000217F0  41ffc7                   inc r15d
000217F3  8d0476                   lea eax, [rsi + rsi*2]
000217F6  4863c8                   movsxd rcx, eax
000217F9  0fb6440d01               movzx eax, byte ptr [rbp + rcx + 1]
000217FE  440fb6440d00             movzx r8d, byte ptr [rbp + rcx]
00021804  41c1e008                 shl r8d, 8
00021808  440bc0                   or r8d, eax
0002180B  0fb6440d02               movzx eax, byte ptr [rbp + rcx + 2]
00021810  41c1e008                 shl r8d, 8
00021814  440bc0                   or r8d, eax
00021817  418bcd                   mov ecx, r13d
0002181A  b80100ffff               mov eax, 0xffff0001
0002181F  41f7e0                   mul r8d
00021822  c1ea10                   shr edx, 0x10
00021825  69c201000100             imul eax, edx, 0x10001
0002182B  442bc0                   sub r8d, eax
0002182E  b867666666               mov eax, 0x66666667
00021833  ffc6                     inc esi
00021835  478904b4                 mov dword ptr [r12 + r14*4], r8d
00021839  f7ee                     imul esi
0002183B  c1fa02                   sar edx, 2
0002183E  8bc2                     mov eax, edx
00021840  c1e81f                   shr eax, 0x1f
00021843  03d0                     add edx, eax
00021845  8d0492                   lea eax, [rdx + rdx*4]
00021848  ba00000000               mov edx, 0
0002184D  03c0                     add eax, eax
0002184F  2bf0                     sub esi, eax
00021851  49ffc6                   inc r14
00021854  4981fe00020000           cmp r14, 0x200
0002185B  0f85e0fcffff             jne 0x21541
00021861  488bbd20010000           mov rdi, qword ptr [rbp + 0x120]
00021868  41ffc5                   inc r13d
0002186B  4181fd00020000           cmp r13d, 0x200
00021872  0f8c98fcffff             jl 0x21510
00021878  4c8d9c24e0010000         lea r11, [rsp + 0x1e0]
00021880  33c0                     xor eax, eax
00021882  498b5b48                 mov rbx, qword ptr [r11 + 0x48]
00021886  488d7d00                 lea rdi, [rbp]
0002188A  410f2873f0               movaps xmm6, xmmword ptr [r11 - 0x10]
0002188F  b920000000               mov ecx, 0x20
00021894  410f287be0               movaps xmm7, xmmword ptr [r11 - 0x20]
00021899  450f2843d0               movaps xmm8, xmmword ptr [r11 - 0x30]
0002189E  450f284bc0               movaps xmm9, xmmword ptr [r11 - 0x40]
000218A3  450f2853b0               movaps xmm10, xmmword ptr [r11 - 0x50]
000218A8  450f285ba0               movaps xmm11, xmmword ptr [r11 - 0x60]
000218AD  f3aa                     rep stosb byte ptr [rdi], al
000218AF  498be3                   mov rsp, r11
000218B2  415f                     pop r15
000218B4  415e                     pop r14
000218B6  415d                     pop r13
000218B8  415c                     pop r12
000218BA  5f                       pop rdi
000218BB  5e                       pop rsi
000218BC  5d                       pop rbp
000218BD  c3                       ret 
000218BE  cc                       int3 
000218BF  cc                       int3 
000218C0  89542410                 mov dword ptr [rsp + 0x10], edx
000218C4  48894c2408               mov qword ptr [rsp + 8], rcx
000218C9  53                       push rbx
000218CA  55                       push rbp
000218CB  56                       push rsi
000218CC  57                       push rdi
000218CD  4154                     push r12
000218CF  4155                     push r13
000218D1  4156                     push r14
000218D3  4157                     push r15
000218D5  4883ec28                 sub rsp, 0x28
000218D9  33c0                     xor eax, eax
000218DB  89442418                 mov dword ptr [rsp + 0x18], eax
000218DF  90                       nop 
000218E0  4863d8                   movsxd rbx, eax
000218E3  4803d9                   add rbx, rcx
000218E6  0fb603                   movzx eax, byte ptr [rbx]
000218E9  0fb67301                 movzx esi, byte ptr [rbx + 1]
000218ED  0fb6f8                   movzx edi, al
000218F0  440fb65302               movzx r10d, byte ptr [rbx + 2]
000218F5  4080e701                 and dil, 1
000218F9  440fb65b03               movzx r11d, byte ptr [rbx + 3]
000218FE  400fb6cf                 movzx ecx, dil
00021902  f6d9                     neg cl
00021904  451ac0                   sbb r8b, r8b
00021907  d0e8                     shr al, 1
00021909  0fb6e8                   movzx ebp, al
0002190C  4180e005                 and r8b, 5
00021910  4080e501                 and bpl, 1
00021914  7404                     je 0x2191a
00021916  4180f00a                 xor r8b, 0xa
0002191A  d0e8                     shr al, 1
0002191C  410fb6c8                 movzx ecx, r8b
00021920  80f114                   xor cl, 0x14
00021923  440fb6f8                 movzx r15d, al
00021927  0fb6d1                   movzx edx, cl
0002192A  4180e701                 and r15b, 1
0002192E  410fb6c8                 movzx ecx, r8b
00021932  4584ff                   test r15b, r15b
00021935  440fb6f6                 movzx r14d, sil
00021939  44887c2413               mov byte ptr [rsp + 0x13], r15b
0002193E  0f44d1                   cmove edx, ecx
00021941  d0e8                     shr al, 1
00021943  440fb6c2                 movzx r8d, dl
00021947  440fb6c8                 movzx r9d, al
0002194B  4180e101                 and r9b, 1
0002194F  410fb6c8                 movzx ecx, r8b
00021953  80f128                   xor cl, 0x28
00021956  44888c2488000000         mov byte ptr [rsp + 0x88], r9b
0002195E  4584c9                   test r9b, r9b
00021961  0fb6d1                   movzx edx, cl
00021964  410f44d0                 cmove edx, r8d
00021968  d0e8                     shr al, 1
0002196A  440fb6c2                 movzx r8d, dl
0002196E  440fb6c8                 movzx r9d, al
00021972  4180e101                 and r9b, 1
00021976  410fb6c8                 movzx ecx, r8b
0002197A  80f150                   xor cl, 0x50
0002197D  44880c24                 mov byte ptr [rsp], r9b
00021981  0fb6d1                   movzx edx, cl
00021984  4584c9                   test r9b, r9b
00021987  410f44d0                 cmove edx, r8d
0002198B  d0e8                     shr al, 1
0002198D  440fb6c2                 movzx r8d, dl
00021991  440fb6c8                 movzx r9d, al
00021995  4180e101                 and r9b, 1
00021999  410fb6c8                 movzx ecx, r8b
0002199D  80f1a0                   xor cl, 0xa0
000219A0  44884c2401               mov byte ptr [rsp + 1], r9b
000219A5  0fb6d1                   movzx edx, cl
000219A8  4584c9                   test r9b, r9b
000219AB  410f44d0                 cmove edx, r8d
000219AF  d0e8                     shr al, 1
000219B1  440fb6c2                 movzx r8d, dl
000219B5  440fb6c8                 movzx r9d, al
000219B9  4180e101                 and r9b, 1
000219BD  410fb6c8                 movzx ecx, r8b
000219C1  80f131                   xor cl, 0x31
000219C4  44884c2402               mov byte ptr [rsp + 2], r9b
000219C9  0fb6d1                   movzx edx, cl
000219CC  4584c9                   test r9b, r9b
000219CF  410f44d0                 cmove edx, r8d
000219D3  440fb6c2                 movzx r8d, dl
000219D7  410fb6c8                 movzx ecx, r8b
000219DB  80f162                   xor cl, 0x62
000219DE  440fb6e1                 movzx r12d, cl
000219E2  3c02                     cmp al, 2
000219E4  450f42e0                 cmovb r12d, r8d
000219E8  4180e601                 and r14b, 1
000219EC  410fb6ce                 movzx ecx, r14b
000219F0  f6d9                     neg cl
000219F2  451ac0                   sbb r8b, r8b
000219F5  40d0ee                   shr sil, 1
000219F8  400fb6ce                 movzx ecx, sil
000219FC  4180e003                 and r8b, 3
00021A00  80e101                   and cl, 1
00021A03  884c2403                 mov byte ptr [rsp + 3], cl
00021A07  7404                     je 0x21a0d
00021A09  4180f006                 xor r8b, 6
00021A0D  40d0ee                   shr sil, 1
00021A10  410fb6c8                 movzx ecx, r8b
00021A14  80f10c                   xor cl, 0xc
00021A17  440fb6ce                 movzx r9d, sil
00021A1B  4180e101                 and r9b, 1
00021A1F  0fb6d1                   movzx edx, cl
00021A22  4584c9                   test r9b, r9b
00021A25  410fb6c8                 movzx ecx, r8b
00021A29  44884c2404               mov byte ptr [rsp + 4], r9b
00021A2E  0f44d1                   cmove edx, ecx
00021A31  40d0ee                   shr sil, 1
00021A34  440fb6c2                 movzx r8d, dl
00021A38  440fb6ce                 movzx r9d, sil
00021A3C  4180e101                 and r9b, 1
00021A40  410fb6c8                 movzx ecx, r8b
00021A44  80f118                   xor cl, 0x18
00021A47  44884c2405               mov byte ptr [rsp + 5], r9b
00021A4C  0fb6d1                   movzx edx, cl
00021A4F  4584c9                   test r9b, r9b
00021A52  410f44d0                 cmove edx, r8d
00021A56  40d0ee                   shr sil, 1
00021A59  440fb6c2                 movzx r8d, dl
00021A5D  440fb6ce                 movzx r9d, sil
00021A61  4180e101                 and r9b, 1
00021A65  410fb6c8                 movzx ecx, r8b
00021A69  80f130                   xor cl, 0x30
00021A6C  44884c2406               mov byte ptr [rsp + 6], r9b
00021A71  0fb6d1                   movzx edx, cl
00021A74  4584c9                   test r9b, r9b
00021A77  410f44d0                 cmove edx, r8d
00021A7B  40d0ee                   shr sil, 1
00021A7E  440fb6c2                 movzx r8d, dl
00021A82  440fb6ce                 movzx r9d, sil
00021A86  4180e101                 and r9b, 1
00021A8A  410fb6c8                 movzx ecx, r8b
00021A8E  80f160                   xor cl, 0x60
00021A91  44884c2407               mov byte ptr [rsp + 7], r9b
00021A96  0fb6d1                   movzx edx, cl
00021A99  4584c9                   test r9b, r9b
00021A9C  410f44d0                 cmove edx, r8d
00021AA0  40d0ee                   shr sil, 1
00021AA3  440fb6c2                 movzx r8d, dl
00021AA7  440fb6ce                 movzx r9d, sil
00021AAB  4180e101                 and r9b, 1
00021AAF  410fb6c8                 movzx ecx, r8b
00021AB3  80f1c0                   xor cl, 0xc0
00021AB6  44884c2408               mov byte ptr [rsp + 8], r9b
00021ABB  0fb6d1                   movzx edx, cl
00021ABE  4584c9                   test r9b, r9b
00021AC1  410fb6ca                 movzx ecx, r10b
00021AC5  410f44d0                 cmove edx, r8d
00021AC9  80e101                   and cl, 1
00021ACC  884c2478                 mov byte ptr [rsp + 0x78], cl
00021AD0  c0e102                   shl cl, 2
00021AD3  440fb6c1                 movzx r8d, cl
00021AD7  41d0ea                   shr r10b, 1
00021ADA  410fb6c8                 movzx ecx, r8b
00021ADE  80f108                   xor cl, 8
00021AE1  440fb6ca                 movzx r9d, dl
00021AE5  0fb6d1                   movzx edx, cl
00021AE8  450fb6ea                 movzx r13d, r10b
00021AEC  4180e501                 and r13b, 1
00021AF0  4584ed                   test r13b, r13b
00021AF3  44886c2409               mov byte ptr [rsp + 9], r13b
00021AF8  410f44d0                 cmove edx, r8d
00021AFC  41d0ea                   shr r10b, 1
00021AFF  440fb6c2                 movzx r8d, dl
00021B03  450fb6ea                 movzx r13d, r10b
00021B07  4180e501                 and r13b, 1
00021B0B  410fb6c8                 movzx ecx, r8b
00021B0F  80f110                   xor cl, 0x10
00021B12  44886c240a               mov byte ptr [rsp + 0xa], r13b
00021B17  4584ed                   test r13b, r13b
00021B1A  0fb6d1                   movzx edx, cl
00021B1D  410f44d0                 cmove edx, r8d
00021B21  41d0ea                   shr r10b, 1
00021B24  450fb6ea                 movzx r13d, r10b
00021B28  440fb6c2                 movzx r8d, dl
00021B2C  4180e501                 and r13b, 1
00021B30  410fb6c8                 movzx ecx, r8b
00021B34  44886c240b               mov byte ptr [rsp + 0xb], r13b
00021B39  80f120                   xor cl, 0x20
00021B3C  4584ed                   test r13b, r13b
00021B3F  0fb6d1                   movzx edx, cl
00021B42  410f44d0                 cmove edx, r8d
00021B46  41d0ea                   shr r10b, 1
00021B49  440fb6c2                 movzx r8d, dl
00021B4D  450fb6ea                 movzx r13d, r10b
00021B51  4180e501                 and r13b, 1
00021B55  410fb6c8                 movzx ecx, r8b
00021B59  80f140                   xor cl, 0x40
00021B5C  44886c240c               mov byte ptr [rsp + 0xc], r13b
00021B61  4584ed                   test r13b, r13b
00021B64  0fb6d1                   movzx edx, cl
00021B67  410f44d0                 cmove edx, r8d
00021B6B  41d0ea                   shr r10b, 1
00021B6E  440fb6c2                 movzx r8d, dl
00021B72  450fb6ea                 movzx r13d, r10b
00021B76  4180e501                 and r13b, 1
00021B7A  410fb6c8                 movzx ecx, r8b
00021B7E  80f180                   xor cl, 0x80
00021B81  44886c240d               mov byte ptr [rsp + 0xd], r13b
00021B86  4584ed                   test r13b, r13b
00021B89  0fb6d1                   movzx edx, cl
00021B8C  410f44d0                 cmove edx, r8d
00021B90  41d0ea                   shr r10b, 1
00021B93  440fb6c2                 movzx r8d, dl
00021B97  450fb6ea                 movzx r13d, r10b
00021B9B  4180e501                 and r13b, 1
00021B9F  448854240f               mov byte ptr [rsp + 0xf], r10b
00021BA4  410fb6c8                 movzx ecx, r8b
00021BA8  44886c240e               mov byte ptr [rsp + 0xe], r13b
00021BAD  80f171                   xor cl, 0x71
00021BB0  0fb6d1                   movzx edx, cl
00021BB3  4584ed                   test r13b, r13b
00021BB6  410f44d0                 cmove edx, r8d
00021BBA  440fb6c2                 movzx r8d, dl
00021BBE  410fb6c8                 movzx ecx, r8b
00021BC2  80f1e2                   xor cl, 0xe2
00021BC5  440fb6e9                 movzx r13d, cl
00021BC9  4180fa02                 cmp r10b, 2
00021BCD  410fb6c9                 movzx ecx, r9b
00021BD1  450f42e8                 cmovb r13d, r8d
00021BD5  80f1f1                   xor cl, 0xf1
00021BD8  0fb6d1                   movzx edx, cl
00021BDB  4080fe02                 cmp sil, 2
00021BDF  410fb6cb                 movzx ecx, r11b
00021BE3  410f42d1                 cmovb edx, r9d
00021BE7  80e101                   and cl, 1
00021BEA  4432ea                   xor r13b, dl
00021BED  888c2480000000           mov byte ptr [rsp + 0x80], cl
00021BF4  4532ec                   xor r13b, r12b
00021BF7  f6d9                     neg cl
00021BF9  44896c241c               mov dword ptr [rsp + 0x1c], r13d
00021BFE  451ac0                   sbb r8b, r8b
00021C01  41d0eb                   shr r11b, 1
00021C04  410fb6cb                 movzx ecx, r11b
00021C08  4180e006                 and r8b, 6
00021C0C  80e101                   and cl, 1
00021C0F  884c2410                 mov byte ptr [rsp + 0x10], cl
00021C13  7404                     je 0x21c19
00021C15  4180f00c                 xor r8b, 0xc
00021C19  41d0eb                   shr r11b, 1
00021C1C  410fb6c8                 movzx ecx, r8b
00021C20  80f118                   xor cl, 0x18
00021C23  450fb6e3                 movzx r12d, r11b
00021C27  0fb6d1                   movzx edx, cl
00021C2A  4180e401                 and r12b, 1
00021C2E  410fb6c8                 movzx ecx, r8b
00021C32  0f44d1                   cmove edx, ecx
00021C35  41d0eb                   shr r11b, 1
00021C38  440fb6c2                 movzx r8d, dl
00021C3C  450fb6eb                 movzx r13d, r11b
00021C40  410fb6c8                 movzx ecx, r8b
00021C44  80f130                   xor cl, 0x30
00021C47  0fb6d1                   movzx edx, cl
00021C4A  4180e501                 and r13b, 1
00021C4E  410f44d0                 cmove edx, r8d
00021C52  41d0eb                   shr r11b, 1
00021C55  440fb6c2                 movzx r8d, dl
00021C59  450fb6cb                 movzx r9d, r11b
00021C5D  4180e101                 and r9b, 1
00021C61  410fb6c8                 movzx ecx, r8b
00021C65  80f160                   xor cl, 0x60
00021C68  44884c2414               mov byte ptr [rsp + 0x14], r9b
00021C6D  0fb6d1                   movzx edx, cl
00021C70  4584c9                   test r9b, r9b
00021C73  410f44d0                 cmove edx, r8d
00021C77  41d0eb                   shr r11b, 1
00021C7A  440fb6c2                 movzx r8d, dl
00021C7E  450fb6d3                 movzx r10d, r11b
00021C82  4180e201                 and r10b, 1
00021C86  410fb6c8                 movzx ecx, r8b
00021C8A  80f1c0                   xor cl, 0xc0
00021C8D  4488542411               mov byte ptr [rsp + 0x11], r10b
00021C92  4584d2                   test r10b, r10b
00021C95  0fb6d1                   movzx edx, cl
00021C98  410f44d0                 cmove edx, r8d
00021C9C  41d0eb                   shr r11b, 1
00021C9F  440fb6c2                 movzx r8d, dl
00021CA3  450fb6d3                 movzx r10d, r11b
00021CA7  4180e201                 and r10b, 1
00021CAB  410fb6c8                 movzx ecx, r8b
00021CAF  80f1f1                   xor cl, 0xf1
00021CB2  4488542412               mov byte ptr [rsp + 0x12], r10b
00021CB7  0fb6d1                   movzx edx, cl
00021CBA  4584d2                   test r10b, r10b
00021CBD  410f44d0                 cmove edx, r8d
00021CC1  440fb6c2                 movzx r8d, dl
00021CC5  410fb6c8                 movzx ecx, r8b
00021CC9  80f193                   xor cl, 0x93
00021CCC  4180fb02                 cmp r11b, 2
00021CD0  0fb6d1                   movzx edx, cl
00021CD3  400fb6cf                 movzx ecx, dil
00021CD7  410f42d0                 cmovb edx, r8d
00021CDB  3254241c                 xor dl, byte ptr [rsp + 0x1c]
00021CDF  f6d9                     neg cl
00021CE1  8813                     mov byte ptr [rbx], dl
00021CE3  451ac0                   sbb r8b, r8b
00021CE6  4180e006                 and r8b, 6
00021CEA  4084ed                   test bpl, bpl
00021CED  7404                     je 0x21cf3
00021CEF  4180f00c                 xor r8b, 0xc
00021CF3  410fb6c8                 movzx ecx, r8b
00021CF7  80f118                   xor cl, 0x18
00021CFA  0fb6d1                   movzx edx, cl
00021CFD  4584ff                   test r15b, r15b
00021D00  410fb6c8                 movzx ecx, r8b
00021D04  0f44d1                   cmove edx, ecx
00021D07  440fb6c2                 movzx r8d, dl
00021D0B  410fb6c8                 movzx ecx, r8b
00021D0F  80f130                   xor cl, 0x30
00021D12  80bc248800000000         cmp byte ptr [rsp + 0x88], 0
00021D1A  0fb6d1                   movzx edx, cl
00021D1D  410f44d0                 cmove edx, r8d
00021D21  440fb6c2                 movzx r8d, dl
00021D25  410fb6c8                 movzx ecx, r8b
00021D29  80f160                   xor cl, 0x60
00021D2C  803c2400                 cmp byte ptr [rsp], 0
00021D30  0fb6d1                   movzx edx, cl
00021D33  410f44d0                 cmove edx, r8d
00021D37  440fb6c2                 movzx r8d, dl
00021D3B  410fb6c8                 movzx ecx, r8b
00021D3F  80f1c0                   xor cl, 0xc0
00021D42  807c240100               cmp byte ptr [rsp + 1], 0
00021D47  0fb6d1                   movzx edx, cl
00021D4A  410f44d0                 cmove edx, r8d
00021D4E  440fb6c2                 movzx r8d, dl
00021D52  410fb6c8                 movzx ecx, r8b
00021D56  80f1f1                   xor cl, 0xf1
00021D59  807c240200               cmp byte ptr [rsp + 2], 0
00021D5E  0fb6d1                   movzx edx, cl
00021D61  410f44d0                 cmove edx, r8d
00021D65  440fb6c2                 movzx r8d, dl
00021D69  410fb6c8                 movzx ecx, r8b
00021D6D  80f193                   xor cl, 0x93
00021D70  3c02                     cmp al, 2
00021D72  440fb6d1                 movzx r10d, cl
00021D76  410fb6ce                 movzx ecx, r14b
00021D7A  450f42d0                 cmovb r10d, r8d
00021D7E  f6d9                     neg cl
00021D80  451ac0                   sbb r8b, r8b
00021D83  4180e005                 and r8b, 5
00021D87  807c240300               cmp byte ptr [rsp + 3], 0
00021D8C  7404                     je 0x21d92
00021D8E  4180f00a                 xor r8b, 0xa
00021D92  410fb6c8                 movzx ecx, r8b
00021D96  80f114                   xor cl, 0x14
00021D99  807c240400               cmp byte ptr [rsp + 4], 0
00021D9E  0fb6d1                   movzx edx, cl
00021DA1  410fb6c8                 movzx ecx, r8b
00021DA5  0f44d1                   cmove edx, ecx
00021DA8  440fb6c2                 movzx r8d, dl
00021DAC  410fb6c8                 movzx ecx, r8b
00021DB0  80f128                   xor cl, 0x28
00021DB3  807c240500               cmp byte ptr [rsp + 5], 0
00021DB8  0fb6d1                   movzx edx, cl
00021DBB  410f44d0                 cmove edx, r8d
00021DBF  440fb6c2                 movzx r8d, dl
00021DC3  410fb6c8                 movzx ecx, r8b
00021DC7  80f150                   xor cl, 0x50
00021DCA  807c240600               cmp byte ptr [rsp + 6], 0
00021DCF  0fb6d1                   movzx edx, cl
00021DD2  410f44d0                 cmove edx, r8d
00021DD6  440fb6c2                 movzx r8d, dl
00021DDA  410fb6c8                 movzx ecx, r8b
00021DDE  80f1a0                   xor cl, 0xa0
00021DE1  807c240700               cmp byte ptr [rsp + 7], 0
00021DE6  0fb6d1                   movzx edx, cl
00021DE9  410f44d0                 cmove edx, r8d
00021DED  440fb6c2                 movzx r8d, dl
00021DF1  410fb6c8                 movzx ecx, r8b
00021DF5  80f131                   xor cl, 0x31
00021DF8  807c240800               cmp byte ptr [rsp + 8], 0
00021DFD  0fb6d1                   movzx edx, cl

; ======== RC4_SHUFFLE_0x22490 ========
00022490  4055                     push rbp
00022492  53                       push rbx
00022493  56                       push rsi
00022494  57                       push rdi
00022495  4156                     push r14
00022497  488dac24e0efffff         lea rbp, [rsp - 0x1020]
0002249F  b820110000               mov eax, 0x1120
000224A4  e8e76b0100               call 0x39090
000224A9  482be0                   sub rsp, rax
000224AC  488bf2                   mov rsi, rdx
000224AF  488bd9                   mov rbx, rcx
000224B2  33d2                     xor edx, edx
000224B4  488d4d20                 lea rcx, [rbp + 0x20]
000224B8  41b800040000             mov r8d, 0x400
000224BE  e8cd5d0300               call 0x58290
000224C3  4c8b5b10                 mov r11, qword ptr [rbx + 0x10]
000224C7  4533c0                   xor r8d, r8d
000224CA  4c8b5318                 mov r10, qword ptr [rbx + 0x18]
000224CE  6690                     nop 
000224D0  4983fa0f                 cmp r10, 0xf
000224D4  7605                     jbe 0x224db
000224D6  4c8b0b                   mov r9, qword ptr [rbx]
000224D9  eb03                     jmp 0x224de
000224DB  4c8bcb                   mov r9, rbx
000224DE  33d2                     xor edx, edx
000224E0  418bc0                   mov eax, r8d
000224E3  49f7f3                   div r11
000224E6  410fb6c0                 movzx eax, r8b
000224EA  6bc837                   imul ecx, eax, 0x37
000224ED  80e955                   sub cl, 0x55
000224F0  42320c0a                 xor cl, byte ptr [rdx + r9]
000224F4  42884c0520               mov byte ptr [rbp + r8 + 0x20], cl
000224F9  41ffc0                   inc r8d
000224FC  4181f800040000           cmp r8d, 0x400
00022503  7ccb                     jl 0x224d0
00022505  660f6f2db3b2feff         movdqa xmm5, xmmword ptr [rip - 0x14d4d]   ; -> 0xd7c0
0002250D  4533c0                   xor r8d, r8d
00022510  660f6f25b8b2feff         movdqa xmm4, xmmword ptr [rip - 0x14d48]   ; -> 0xd7d0
00022518  4533c9                   xor r9d, r9d
0002251B  0f1f440000               nop dword ptr [rax + rax]
00022520  418d4007                 lea eax, [r8 + 7]
00022524  66410f6ec0               movd xmm0, r8d
00022529  660f70c000               pshufd xmm0, xmm0, 0
0002252E  418d4806                 lea ecx, [r8 + 6]
00022532  660ffec5                 paddd xmm0, xmm5
00022536  660f6ec8                 movd xmm1, eax
0002253A  0f54c4                   andps xmm0, xmm4
0002253D  660f6ed1                 movd xmm2, ecx
00022541  660f62d1                 punpckldq xmm2, xmm1
00022545  418d5005                 lea edx, [r8 + 5]
00022549  660f67c0                 packuswb xmm0, xmm0
0002254D  418d7804                 lea edi, [r8 + 4]
00022551  660f67c0                 packuswb xmm0, xmm0
00022555  418d400b                 lea eax, [r8 + 0xb]
00022559  66420f7e440c20           movd dword ptr [rsp + r9 + 0x20], xmm0
00022560  418d480a                 lea ecx, [r8 + 0xa]
00022564  660f6ec2                 movd xmm0, edx
00022568  4d8d4910                 lea r9, [r9 + 0x10]
0002256C  660f6edf                 movd xmm3, edi
00022570  418d5009                 lea edx, [r8 + 9]
00022574  660f62d8                 punpckldq xmm3, xmm0
00022578  418d7808                 lea edi, [r8 + 8]
0002257C  660f6cda                 punpcklqdq xmm3, xmm2
00022580  0f54dc                   andps xmm3, xmm4
00022583  660f6ec8                 movd xmm1, eax
00022587  660f67db                 packuswb xmm3, xmm3
0002258B  418d400f                 lea eax, [r8 + 0xf]
0002258F  660f67db                 packuswb xmm3, xmm3
00022593  66420f7e5c0c14           movd dword ptr [rsp + r9 + 0x14], xmm3
0002259A  660f6ec2                 movd xmm0, edx
0002259E  418d500d                 lea edx, [r8 + 0xd]
000225A2  660f6edf                 movd xmm3, edi
000225A6  418d780c                 lea edi, [r8 + 0xc]
000225AA  660f62d8                 punpckldq xmm3, xmm0
000225AE  660f6ed1                 movd xmm2, ecx
000225B2  418d480e                 lea ecx, [r8 + 0xe]
000225B6  660f62d1                 punpckldq xmm2, xmm1
000225BA  4183c010                 add r8d, 0x10
000225BE  660f6cda                 punpcklqdq xmm3, xmm2
000225C2  660f6ec8                 movd xmm1, eax
000225C6  0f54dc                   andps xmm3, xmm4
000225C9  660f67db                 packuswb xmm3, xmm3
000225CD  660f67db                 packuswb xmm3, xmm3
000225D1  66420f7e5c0c18           movd dword ptr [rsp + r9 + 0x18], xmm3
000225D8  660f6edf                 movd xmm3, edi
000225DC  660f6ed1                 movd xmm2, ecx
000225E0  660f6ec2                 movd xmm0, edx
000225E4  660f62d8                 punpckldq xmm3, xmm0
000225E8  660f62d1                 punpckldq xmm2, xmm1
000225EC  660f6cda                 punpcklqdq xmm3, xmm2
000225F0  0f54dc                   andps xmm3, xmm4
000225F3  660f67db                 packuswb xmm3, xmm3
000225F7  660f67db                 packuswb xmm3, xmm3
000225FB  66420f7e5c0c1c           movd dword ptr [rsp + r9 + 0x1c], xmm3
00022602  4181f800010000           cmp r8d, 0x100
00022609  0f8c11ffffff             jl 0x22520
0002260F  41b914dcfd62             mov r9d, 0x62fddc14
00022615  41baff000000             mov r10d, 0xff
0002261B  0f1f440000               nop dword ptr [rax + rax]
00022620  418bc2                   mov eax, r10d
00022623  418d4a01                 lea ecx, [r10 + 1]
00022627  4569c96d4ec641           imul r9d, r9d, 0x41c64e6d
0002262E  488d7c2420               lea rdi, [rsp + 0x20]
00022633  4803f8                   add rdi, rax
00022636  33d2                     xor edx, edx
00022638  41ffca                   dec r10d
0002263B  440fb607                 movzx r8d, byte ptr [rdi]
0002263F  4181c139300000           add r9d, 0x3039
00022646  418bc1                   mov eax, r9d
00022649  c1e810                   shr eax, 0x10
0002264C  25ff7f0000               and eax, 0x7fff
00022651  f7f1                     div ecx
00022653  488d4c2420               lea rcx, [rsp + 0x20]
00022658  4863c2                   movsxd rax, edx
0002265B  4803c8                   add rcx, rax
0002265E  0fb601                   movzx eax, byte ptr [rcx]
00022661  8807                     mov byte ptr [rdi], al
00022663  448801                   mov byte ptr [rcx], r8b
00022666  4585d2                   test r10d, r10d
00022669  7fb5                     jg 0x22620
0002266B  4533c0                   xor r8d, r8d
0002266E  4533c9                   xor r9d, r9d
00022671  418d4007                 lea eax, [r8 + 7]
00022675  66410f6ec0               movd xmm0, r8d
0002267A  660f70c000               pshufd xmm0, xmm0, 0
0002267F  418d4806                 lea ecx, [r8 + 6]
00022683  660ffec5                 paddd xmm0, xmm5
00022687  418d5005                 lea edx, [r8 + 5]
0002268B  f30f70c0d8               pshufhw xmm0, xmm0, 0xd8
00022690  418d7804                 lea edi, [r8 + 4]
00022694  f20f70c8d8               pshuflw xmm1, xmm0, 0xd8
00022699  4d8d4910                 lea r9, [r9 + 0x10]
0002269D  660f70d1d8               pshufd xmm2, xmm1, 0xd8
000226A2  66420fd6944d00040000     movq qword ptr [rbp + r9*2 + 0x400], xmm2
000226AC  660f6ec8                 movd xmm1, eax
000226B0  418d400b                 lea eax, [r8 + 0xb]
000226B4  660f6ec2                 movd xmm0, edx
000226B8  418d5009                 lea edx, [r8 + 9]
000226BC  660f6ed1                 movd xmm2, ecx
000226C0  418d480a                 lea ecx, [r8 + 0xa]
000226C4  660f62d1                 punpckldq xmm2, xmm1
000226C8  660f6edf                 movd xmm3, edi
000226CC  418d7808                 lea edi, [r8 + 8]
000226D0  660f62d8                 punpckldq xmm3, xmm0
000226D4  660f6cda                 punpcklqdq xmm3, xmm2
000226D8  f30f70c3d8               pshufhw xmm0, xmm3, 0xd8
000226DD  f20f70c8d8               pshuflw xmm1, xmm0, 0xd8
000226E2  660f70d1d8               pshufd xmm2, xmm1, 0xd8
000226E7  66420fd6944d08040000     movq qword ptr [rbp + r9*2 + 0x408], xmm2
000226F1  660f6ec8                 movd xmm1, eax
000226F5  418d400f                 lea eax, [r8 + 0xf]
000226F9  660f6ec2                 movd xmm0, edx
000226FD  418d500d                 lea edx, [r8 + 0xd]
00022701  660f6ed1                 movd xmm2, ecx
00022705  418d480e                 lea ecx, [r8 + 0xe]
00022709  660f62d1                 punpckldq xmm2, xmm1
0002270D  660f6edf                 movd xmm3, edi
00022711  418d780c                 lea edi, [r8 + 0xc]
00022715  660f62d8                 punpckldq xmm3, xmm0
00022719  4183c010                 add r8d, 0x10
0002271D  660f6cda                 punpcklqdq xmm3, xmm2
00022721  f30f70c3d8               pshufhw xmm0, xmm3, 0xd8
00022726  f20f70c8d8               pshuflw xmm1, xmm0, 0xd8
0002272B  660f70d1d8               pshufd xmm2, xmm1, 0xd8
00022730  66420fd6944d10040000     movq qword ptr [rbp + r9*2 + 0x410], xmm2
0002273A  660f6ec8                 movd xmm1, eax
0002273E  660f6ec2                 movd xmm0, edx
00022742  660f6ed1                 movd xmm2, ecx
00022746  660f62d1                 punpckldq xmm2, xmm1
0002274A  660f6edf                 movd xmm3, edi
0002274E  660f62d8                 punpckldq xmm3, xmm0
00022752  660f6cda                 punpcklqdq xmm3, xmm2
00022756  f30f70c3d8               pshufhw xmm0, xmm3, 0xd8
0002275B  f20f70c8d8               pshuflw xmm1, xmm0, 0xd8
00022760  660f70d1d8               pshufd xmm2, xmm1, 0xd8
00022765  66420fd6944d18040000     movq qword ptr [rbp + r9*2 + 0x418], xmm2
0002276F  4181f800040000           cmp r8d, 0x400
00022776  0f8cf5feffff             jl 0x22671
0002277C  41b9ff030000             mov r9d, 0x3ff
00022782  41b88486888a             mov r8d, 0x8a888684
00022788  458bd1                   mov r10d, r9d
0002278B  0f1f440000               nop dword ptr [rax + rax]
00022790  420fb7bc5520040000       movzx edi, word ptr [rbp + r10*2 + 0x420]
00022799  418d4901                 lea ecx, [r9 + 1]
0002279D  4569c06d4ec641           imul r8d, r8d, 0x41c64e6d
000227A4  4d8d52fd                 lea r10, [r10 - 3]
000227A8  33d2                     xor edx, edx
000227AA  4181c039300000           add r8d, 0x3039
000227B1  418bc0                   mov eax, r8d
000227B4  4569c06d4ec641           imul r8d, r8d, 0x41c64e6d
000227BB  c1e810                   shr eax, 0x10
000227BE  25ff7f0000               and eax, 0x7fff
000227C3  f7f1                     div ecx
000227C5  4181c039300000           add r8d, 0x3039
000227CC  488d8d20040000           lea rcx, [rbp + 0x420]
000227D3  4863c2                   movsxd rax, edx
000227D6  33d2                     xor edx, edx
000227D8  488d0c41                 lea rcx, [rcx + rax*2]
000227DC  0fb701                   movzx eax, word ptr [rcx]
000227DF  664289845526040000       mov word ptr [rbp + r10*2 + 0x426], ax
000227E8  418bc0                   mov eax, r8d
000227EB  c1e810                   shr eax, 0x10
000227EE  668939                   mov word ptr [rcx], di
000227F1  25ff7f0000               and eax, 0x7fff
000227F6  420fb7bc5524040000       movzx edi, word ptr [rbp + r10*2 + 0x424]
000227FF  488d8d20040000           lea rcx, [rbp + 0x420]
00022806  41f7f1                   div r9d
00022809  4569c06d4ec641           imul r8d, r8d, 0x41c64e6d
00022810  4863c2                   movsxd rax, edx
00022813  33d2                     xor edx, edx
00022815  488d0c41                 lea rcx, [rcx + rax*2]
00022819  0fb701                   movzx eax, word ptr [rcx]
0002281C  664289845524040000       mov word ptr [rbp + r10*2 + 0x424], ax
00022825  668939                   mov word ptr [rcx], di
00022828  4181c039300000           add r8d, 0x3039
0002282F  420fb7bc5522040000       movzx edi, word ptr [rbp + r10*2 + 0x422]
00022838  418d49ff                 lea ecx, [r9 - 1]
0002283C  418bc0                   mov eax, r8d
0002283F  4183e903                 sub r9d, 3
00022843  c1e810                   shr eax, 0x10
00022846  25ff7f0000               and eax, 0x7fff
0002284B  f7f1                     div ecx
0002284D  488d8d20040000           lea rcx, [rbp + 0x420]
00022854  4863c2                   movsxd rax, edx
00022857  488d0c41                 lea rcx, [rcx + rax*2]
0002285B  0fb701                   movzx eax, word ptr [rcx]
0002285E  664289845522040000       mov word ptr [rbp + r10*2 + 0x422], ax
00022867  668939                   mov word ptr [rcx], di
0002286A  4585c9                   test r9d, r9d
0002286D  0f8f1dffffff             jg 0x22790
00022873  448b3516e80300           mov r14d, dword ptr [rip + 0x3e816]   ; -> 0x61090
0002287A  33db                     xor ebx, ebx
0002287C  660f6f1decaffeff         movdqa xmm3, xmmword ptr [rip - 0x15014]   ; -> 0xd870
00022884  33d2                     xor edx, edx
00022886  0fb6441520               movzx eax, byte ptr [rbp + rdx + 0x20]
0002288B  0fb64c0420               movzx ecx, byte ptr [rsp + rax + 0x20]
00022890  0fb7845520040000         movzx eax, word ptr [rbp + rdx*2 + 0x420]
00022898  884c1520                 mov byte ptr [rbp + rdx + 0x20], cl
0002289C  888c05200c0000           mov byte ptr [rbp + rax + 0xc20], cl
000228A3  0fb6441521               movzx eax, byte ptr [rbp + rdx + 0x21]
000228A8  0fb64c0420               movzx ecx, byte ptr [rsp + rax + 0x20]
000228AD  0fb7845522040000         movzx eax, word ptr [rbp + rdx*2 + 0x422]
000228B5  884c1521                 mov byte ptr [rbp + rdx + 0x21], cl
000228B9  888c05200c0000           mov byte ptr [rbp + rax + 0xc20], cl
000228C0  0fb6441522               movzx eax, byte ptr [rbp + rdx + 0x22]
000228C5  0fb64c0420               movzx ecx, byte ptr [rsp + rax + 0x20]
000228CA  0fb7845524040000         movzx eax, word ptr [rbp + rdx*2 + 0x424]
000228D2  884c1522                 mov byte ptr [rbp + rdx + 0x22], cl
000228D6  888c05200c0000           mov byte ptr [rbp + rax + 0xc20], cl
000228DD  0fb6441523               movzx eax, byte ptr [rbp + rdx + 0x23]
000228E2  0fb64c0420               movzx ecx, byte ptr [rsp + rax + 0x20]
000228E7  0fb7845526040000         movzx eax, word ptr [rbp + rdx*2 + 0x426]
000228EF  884c1523                 mov byte ptr [rbp + rdx + 0x23], cl
000228F3  4883c204                 add rdx, 4
000228F7  888c05200c0000           mov byte ptr [rbp + rax + 0xc20], cl
000228FE  4881fa00040000           cmp rdx, 0x400
00022905  0f857bffffff             jne 0x22886
0002290B  488d4d20                 lea rcx, [rbp + 0x20]
0002290F  ba08000000               mov edx, 8
00022914  488d85200c0000           lea rax, [rbp + 0xc20]
0002291B  0f1f440000               nop dword ptr [rax + rax]
00022920  488d8980000000           lea rcx, [rcx + 0x80]
00022927  0f1000                   movups xmm0, xmmword ptr [rax]
0002292A  0f104810                 movups xmm1, xmmword ptr [rax + 0x10]
0002292E  488d8080000000           lea rax, [rax + 0x80]
00022935  0f114180                 movups xmmword ptr [rcx - 0x80], xmm0
00022939  0f1040a0                 movups xmm0, xmmword ptr [rax - 0x60]
0002293D  0f114990                 movups xmmword ptr [rcx - 0x70], xmm1
00022941  0f1048b0                 movups xmm1, xmmword ptr [rax - 0x50]
00022945  0f1141a0                 movups xmmword ptr [rcx - 0x60], xmm0
00022949  0f1040c0                 movups xmm0, xmmword ptr [rax - 0x40]
0002294D  0f1149b0                 movups xmmword ptr [rcx - 0x50], xmm1
00022951  0f1048d0                 movups xmm1, xmmword ptr [rax - 0x30]
00022955  0f1141c0                 movups xmmword ptr [rcx - 0x40], xmm0
00022959  0f1040e0                 movups xmm0, xmmword ptr [rax - 0x20]
0002295D  0f1149d0                 movups xmmword ptr [rcx - 0x30], xmm1
00022961  0f1048f0                 movups xmm1, xmmword ptr [rax - 0x10]
00022965  0f1141e0                 movups xmmword ptr [rcx - 0x20], xmm0
00022969  0f1149f0                 movups xmmword ptr [rcx - 0x10], xmm1
0002296D  4883ea01                 sub rdx, 1
00022971  75ad                     jne 0x22920
00022973  488d4d20                 lea rcx, [rbp + 0x20]
00022977  e844efffff               call 0x218c0
0002297C  4183fe02                 cmp r14d, 2
00022980  0f8c0c010000             jl 0x22a92
00022986  69c34786c861             imul eax, ebx, 0x61c88647
0002298C  33c9                     xor ecx, ecx
0002298E  33d2                     xor edx, edx
00022990  660f6ed0                 movd xmm2, eax
00022994  660f70d200               pshufd xmm2, xmm2, 0
00022999  0f1f8000000000           nop dword ptr [rax]
000229A0  660f6e441520             movd xmm0, dword ptr [rbp + rdx + 0x20]
000229A6  8d4104                   lea eax, [rcx + 4]
000229A9  660f6ec9                 movd xmm1, ecx
000229AD  488d5210                 lea rdx, [rdx + 0x10]
000229B1  660f70c900               pshufd xmm1, xmm1, 0
000229B6  660ffecd                 paddd xmm1, xmm5
000229BA  660f3840cb               pmulld xmm1, xmm3
000229BF  660ffaca                 psubd xmm1, xmm2
000229C3  660f72d110               psrld xmm1, 0x10
000229C8  0f54cc                   andps xmm1, xmm4
000229CB  660f67c9                 packuswb xmm1, xmm1
000229CF  660f67c9                 packuswb xmm1, xmm1
000229D3  0f57c8                   xorps xmm1, xmm0
000229D6  660f7e4c1510             movd dword ptr [rbp + rdx + 0x10], xmm1
000229DC  660f6e441514             movd xmm0, dword ptr [rbp + rdx + 0x14]
000229E2  660f6ec8                 movd xmm1, eax
000229E6  8d4108                   lea eax, [rcx + 8]
000229E9  660f70c900               pshufd xmm1, xmm1, 0
000229EE  660ffecd                 paddd xmm1, xmm5
000229F2  660f3840cb               pmulld xmm1, xmm3
000229F7  660ffaca                 psubd xmm1, xmm2
000229FB  660f72d110               psrld xmm1, 0x10
00022A00  0f54cc                   andps xmm1, xmm4
00022A03  660f67c9                 packuswb xmm1, xmm1
00022A07  660f67c9                 packuswb xmm1, xmm1
00022A0B  0f57c8                   xorps xmm1, xmm0
00022A0E  660f7e4c1514             movd dword ptr [rbp + rdx + 0x14], xmm1
00022A14  660f6e441518             movd xmm0, dword ptr [rbp + rdx + 0x18]
00022A1A  660f6ec8                 movd xmm1, eax
00022A1E  8d410c                   lea eax, [rcx + 0xc]
00022A21  660f70c900               pshufd xmm1, xmm1, 0
00022A26  83c110                   add ecx, 0x10
00022A29  660ffecd                 paddd xmm1, xmm5
00022A2D  660f3840cb               pmulld xmm1, xmm3
00022A32  660ffaca                 psubd xmm1, xmm2
00022A36  660f72d110               psrld xmm1, 0x10
00022A3B  0f54cc                   andps xmm1, xmm4
00022A3E  660f67c9                 packuswb xmm1, xmm1
00022A42  660f67c9                 packuswb xmm1, xmm1
00022A46  0f57c8                   xorps xmm1, xmm0
00022A49  660f7e4c1518             movd dword ptr [rbp + rdx + 0x18], xmm1
00022A4F  660f6e44151c             movd xmm0, dword ptr [rbp + rdx + 0x1c]
00022A55  660f6ec8                 movd xmm1, eax
00022A59  660f70c900               pshufd xmm1, xmm1, 0
00022A5E  660ffecd                 paddd xmm1, xmm5
00022A62  660f3840cb               pmulld xmm1, xmm3
00022A67  660ffaca                 psubd xmm1, xmm2
00022A6B  660f72d110               psrld xmm1, 0x10
00022A70  0f54cc                   andps xmm1, xmm4
00022A73  660f67c9                 packuswb xmm1, xmm1
00022A77  660f67c9                 packuswb xmm1, xmm1
00022A7B  0f57c8                   xorps xmm1, xmm0
00022A7E  660f7e4c151c             movd dword ptr [rbp + rdx + 0x1c], xmm1
00022A84  81f900040000             cmp ecx, 0x400
00022A8A  0f8c10ffffff             jl 0x229a0
00022A90  eb2e                     jmp 0x22ac0
00022A92  33d2                     xor edx, edx
00022A94  69fb4786c861             imul edi, ebx, 0x61c88647
00022A9A  660f1f440000             nop word ptr [rax + rax]
00022AA0  8bc2                     mov eax, edx
00022AA2  488d4d20                 lea rcx, [rbp + 0x20]
00022AA6  4803c8                   add rcx, rax
00022AA9  69c2b7c17c51             imul eax, edx, 0x517cc1b7
00022AAF  ffc2                     inc edx
00022AB1  2bc7                     sub eax, edi
00022AB3  c1e810                   shr eax, 0x10
00022AB6  3001                     xor byte ptr [rcx], al
00022AB8  81fa00040000             cmp edx, 0x400
00022ABE  7ce0                     jl 0x22aa0
00022AC0  ffc3                     inc ebx
00022AC2  83fb30                   cmp ebx, 0x30
00022AC5  0f8cb9fdffff             jl 0x22884
00022ACB  4533d2                   xor r10d, r10d
00022ACE  4533db                   xor r11d, r11d
00022AD1  4533c9                   xor r9d, r9d
00022AD4  4d63c3                   movsxd r8, r11d
00022AD7  4d8d4904                 lea r9, [r9 + 4]
00022ADB  4183c308                 add r11d, 8
00022ADF  420fb64c0521             movzx ecx, byte ptr [rbp + r8 + 0x21]
00022AE5  420fb6440520             movzx eax, byte ptr [rbp + r8 + 0x20]
00022AEB  c1e108                   shl ecx, 8
00022AEE  0bc8                     or ecx, eax
00022AF0  b80100ffff               mov eax, 0xffff0001
00022AF5  f7e1                     mul ecx
00022AF7  c1ea10                   shr edx, 0x10
00022AFA  69c201000100             imul eax, edx, 0x10001
00022B00  2bc8                     sub ecx, eax
00022B02  420fb6440522             movzx eax, byte ptr [rbp + r8 + 0x22]
00022B08  42894c8ef0               mov dword ptr [rsi + r9*4 - 0x10], ecx
00022B0D  420fb64c0523             movzx ecx, byte ptr [rbp + r8 + 0x23]
00022B13  c1e108                   shl ecx, 8
00022B16  0bc8                     or ecx, eax
00022B18  b80100ffff               mov eax, 0xffff0001
00022B1D  f7e1                     mul ecx
00022B1F  c1ea10                   shr edx, 0x10
00022B22  69c201000100             imul eax, edx, 0x10001
00022B28  2bc8                     sub ecx, eax
00022B2A  428d045504000000         lea eax, [r10*2 + 4]
00022B32  42894c8ef4               mov dword ptr [rsi + r9*4 - 0xc], ecx
00022B37  4863c8                   movsxd rcx, eax
00022B3A  420fb6440525             movzx eax, byte ptr [rbp + r8 + 0x25]
00022B40  c1e008                   shl eax, 8
00022B43  0fb64c0d20               movzx ecx, byte ptr [rbp + rcx + 0x20]
00022B48  0bc8                     or ecx, eax
00022B4A  b80100ffff               mov eax, 0xffff0001
00022B4F  f7e1                     mul ecx
00022B51  c1ea10                   shr edx, 0x10
00022B54  69c201000100             imul eax, edx, 0x10001
00022B5A  2bc8                     sub ecx, eax
00022B5C  428d045506000000         lea eax, [r10*2 + 6]
00022B64  42894c8ef8               mov dword ptr [rsi + r9*4 - 8], ecx
00022B69  4183c204                 add r10d, 4
00022B6D  4863c8                   movsxd rcx, eax
00022B70  420fb6440527             movzx eax, byte ptr [rbp + r8 + 0x27]
00022B76  c1e008                   shl eax, 8
00022B79  0fb67c0d20               movzx edi, byte ptr [rbp + rcx + 0x20]
00022B7E  0bf8                     or edi, eax
00022B80  b80100ffff               mov eax, 0xffff0001
00022B85  f7e7                     mul edi
00022B87  c1ea10                   shr edx, 0x10
00022B8A  69c201000100             imul eax, edx, 0x10001
00022B90  2bf8                     sub edi, eax
00022B92  42897c8efc               mov dword ptr [rsi + r9*4 - 4], edi
00022B97  4181fa00020000           cmp r10d, 0x200
00022B9E  0f8c30ffffff             jl 0x22ad4
00022BA4  488d7d20                 lea rdi, [rbp + 0x20]
00022BA8  33c0                     xor eax, eax
00022BAA  b900040000               mov ecx, 0x400
00022BAF  f3aa                     rep stosb byte ptr [rdi], al
00022BB1  4881c420110000           add rsp, 0x1120
00022BB8  415e                     pop r14
00022BBA  5f                       pop rdi
00022BBB  5e                       pop rsi
00022BBC  5b                       pop rbx
00022BBD  5d                       pop rbp
00022BBE  c3                       ret 
00022BBF  cc                       int3 
