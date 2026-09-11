00022BC0  48895c2410               mov qword ptr [rsp + 0x10], rbx
00022BC5  4c89442418               mov qword ptr [rsp + 0x18], r8
00022BCA  48894c2408               mov qword ptr [rsp + 8], rcx
00022BCF  55                       push rbp
00022BD0  56                       push rsi
00022BD1  57                       push rdi
00022BD2  4154                     push r12
00022BD4  4155                     push r13
00022BD6  4156                     push r14
00022BD8  4157                     push r15
00022BDA  4881ec40080000           sub rsp, 0x840
00022BE1  418bf9                   mov edi, r9d
00022BE4  488bea                   mov rbp, rdx
00022BE7  488bd9                   mov rbx, rcx
00022BEA  4533ed                   xor r13d, r13d
00022BED  44896c2420               mov dword ptr [rsp + 0x20], r13d
00022BF2  0f57c0                   xorps xmm0, xmm0
00022BF5  f30f7f442428             movdqu xmmword ptr [rsp + 0x28], xmm0
00022BFB  4c896c2438               mov qword ptr [rsp + 0x38], r13
00022C00  b927001000               mov ecx, 0x100027
00022C05  e8525d0100               call 0x3895c
00022C0A  4885c0                   test rax, rax
00022C0D  0f8420020000             je 0x22e33
00022C13  488d7027                 lea rsi, [rax + 0x27]
00022C17  4883e6e0                 and rsi, 0xffffffffffffffe0
00022C1B  488946f8                 mov qword ptr [rsi - 8], rax
00022C1F  4889742428               mov qword ptr [rsp + 0x28], rsi
00022C24  4c8da600001000           lea r12, [rsi + 0x100000]
00022C2B  4c89642438               mov qword ptr [rsp + 0x38], r12
00022C30  33d2                     xor edx, edx
00022C32  41b800001000             mov r8d, 0x100000
00022C38  488bce                   mov rcx, rsi
00022C3B  e850560300               call 0x58290
00022C40  4c89642430               mov qword ptr [rsp + 0x30], r12
00022C45  8bd7                     mov edx, edi
00022C47  488bce                   mov rcx, rsi
00022C4A  e841e8ffff               call 0x21490
00022C4F  488d542440               lea rdx, [rsp + 0x40]
00022C54  488bcd                   mov rcx, rbp
00022C57  e834f8ffff               call 0x22490
00022C5C  4c892b                   mov qword ptr [rbx], r13
00022C5F  4c896b08                 mov qword ptr [rbx + 8], r13
00022C63  4c896b10                 mov qword ptr [rbx + 0x10], r13
00022C67  c744242001000000         mov dword ptr [rsp + 0x20], 1
00022C6F  418bed                   mov ebp, r13d
00022C72  458bf5                   mov r14d, r13d
00022C75  4c8d2524f10300           lea r12, [rip + 0x3f124]   ; -> 0x61da0
00022C7C  0f1f4000                 nop dword ptr [rax]
00022C80  458bd5                   mov r10d, r13d
00022C83  458bdd                   mov r11d, r13d
00022C86  4d8bfe                   mov r15, r14
00022C89  49c1e70b                 shl r15, 0xb
00022C8D  4c03fe                   add r15, rsi
00022C90  418bc3                   mov eax, r11d
00022C93  488d0c8500000000         lea rcx, [rax*4]
00022C9B  418bc3                   mov eax, r11d
00022C9E  488d3c8504000000         lea rdi, [rax*4 + 4]
00022CA6  418bc3                   mov eax, r11d
00022CA9  4c8d048508000000         lea r8, [rax*4 + 8]
00022CB1  418bc3                   mov eax, r11d
00022CB4  4c8d0c850c000000         lea r9, [rax*4 + 0xc]
00022CBC  418b040f                 mov eax, dword ptr [r15 + rcx]
00022CC0  0faf440c40               imul eax, dword ptr [rsp + rcx + 0x40]
00022CC5  4403d0                   add r10d, eax
00022CC8  b80100ffff               mov eax, 0xffff0001
00022CCD  41f7e2                   mul r10d
00022CD0  c1ea10                   shr edx, 0x10
00022CD3  69c201000100             imul eax, edx, 0x10001
00022CD9  442bd0                   sub r10d, eax
00022CDC  418b043f                 mov eax, dword ptr [r15 + rdi]
00022CE0  0faf443c40               imul eax, dword ptr [rsp + rdi + 0x40]
00022CE5  4403d0                   add r10d, eax
00022CE8  b80100ffff               mov eax, 0xffff0001
00022CED  41f7e2                   mul r10d
00022CF0  c1ea10                   shr edx, 0x10
00022CF3  69c201000100             imul eax, edx, 0x10001
00022CF9  442bd0                   sub r10d, eax
00022CFC  438b0407                 mov eax, dword ptr [r15 + r8]
00022D00  420faf440440             imul eax, dword ptr [rsp + r8 + 0x40]
00022D06  4403d0                   add r10d, eax
00022D09  b80100ffff               mov eax, 0xffff0001
00022D0E  41f7e2                   mul r10d
00022D11  c1ea10                   shr edx, 0x10
00022D14  69c201000100             imul eax, edx, 0x10001
00022D1A  442bd0                   sub r10d, eax
00022D1D  438b040f                 mov eax, dword ptr [r15 + r9]
00022D21  420faf440c40             imul eax, dword ptr [rsp + r9 + 0x40]
00022D27  4403d0                   add r10d, eax
00022D2A  b80100ffff               mov eax, 0xffff0001
00022D2F  41f7e2                   mul r10d
00022D32  c1ea10                   shr edx, 0x10
00022D35  69c201000100             imul eax, edx, 0x10001
00022D3B  442bd0                   sub r10d, eax
00022D3E  4183c304                 add r11d, 4
00022D42  4181fb00020000           cmp r11d, 0x200
00022D49  0f8c41ffffff             jl 0x22c90
00022D4F  438b0cb4                 mov ecx, dword ptr [r12 + r14*4]
00022D53  412bca                   sub ecx, r10d
00022D56  81c101000100             add ecx, 0x10001
00022D5C  b80100ffff               mov eax, 0xffff0001
00022D61  f7e1                     mul ecx
00022D63  c1ea10                   shr edx, 0x10
00022D66  69c201000100             imul eax, edx, 0x10001
00022D6C  2bc8                     sub ecx, eax
00022D6E  8bc5                     mov eax, ebp
00022D70  c1e802                   shr eax, 2
00022D73  32c8                     xor cl, al
00022D75  b801000000               mov eax, 1
00022D7A  402ac5                   sub al, bpl
00022D7D  0fb6c0                   movzx eax, al
00022D80  6bd03b                   imul edx, eax, 0x3b
00022D83  32ca                     xor cl, dl
00022D85  888c2490080000           mov byte ptr [rsp + 0x890], cl
00022D8C  488b5308                 mov rdx, qword ptr [rbx + 8]
00022D90  483b5310                 cmp rdx, qword ptr [rbx + 0x10]
00022D94  7408                     je 0x22d9e
00022D96  880a                     mov byte ptr [rdx], cl
00022D98  48ff4308                 inc qword ptr [rbx + 8]
00022D9C  eb10                     jmp 0x22dae
00022D9E  4c8d842490080000         lea r8, [rsp + 0x890]
00022DA6  488bcb                   mov rcx, rbx
00022DA9  e862290100               call 0x35710
00022DAE  ffc5                     inc ebp
00022DB0  49ffc6                   inc r14
00022DB3  81fd00020000             cmp ebp, 0x200
00022DB9  0f8cc1feffff             jl 0x22c80
00022DBF  488bfe                   mov rdi, rsi
00022DC2  33c0                     xor eax, eax
00022DC4  b900001000               mov ecx, 0x100000
00022DC9  f3aa                     rep stosb byte ptr [rdi], al
00022DCB  488d7c2440               lea rdi, [rsp + 0x40]
00022DD0  b900080000               mov ecx, 0x800
00022DD5  f3aa                     rep stosb byte ptr [rdi], al
00022DD7  4c8da600001000           lea r12, [rsi + 0x100000]
00022DDE  4c2be6                   sub r12, rsi
00022DE1  49c1fc02                 sar r12, 2
00022DE5  4a8d14a500000000         lea rdx, [r12*4]
00022DED  4881fa00100000           cmp rdx, 0x1000
00022DF4  7217                     jb 0x22e0d
00022DF6  488b4ef8                 mov rcx, qword ptr [rsi - 8]
00022DFA  482bf1                   sub rsi, rcx
00022DFD  4883ee08                 sub rsi, 8
00022E01  4883fe1f                 cmp rsi, 0x1f
00022E05  772c                     ja 0x22e33
00022E07  4883c227                 add rdx, 0x27
00022E0B  eb03                     jmp 0x22e10
00022E0D  488bce                   mov rcx, rsi
00022E10  e8575a0100               call 0x3886c
00022E15  488bc3                   mov rax, rbx
00022E18  488b9c2488080000         mov rbx, qword ptr [rsp + 0x888]
00022E20  4881c440080000           add rsp, 0x840
00022E27  415f                     pop r15
00022E29  415e                     pop r14
00022E2B  415d                     pop r13
00022E2D  415c                     pop r12
00022E2F  5f                       pop rdi
00022E30  5e                       pop rsi
00022E31  5d                       pop rbp
00022E32  c3                       ret 
00022E33  b905000000               mov ecx, 5
00022E38  cd29                     int 0x29
00022E3A  cc                       int3 
00022E3B  cc                       int3 
00022E3C  cc                       int3 
00022E3D  cc                       int3 
00022E3E  cc                       int3 
00022E3F  cc                       int3 
00022E40  4053                     push rbx
00022E42  55                       push rbp
00022E43  56                       push rsi
00022E44  57                       push rdi
00022E45  4154                     push r12
00022E47  4155                     push r13
00022E49  4156                     push r14
00022E4B  4157                     push r15
00022E4D  4883ec28                 sub rsp, 0x28
00022E51  65488b042560000000       mov rax, qword ptr gs:[0x60]
00022E5A  8bf1                     mov esi, ecx
00022E5C  488b7818                 mov rdi, qword ptr [rax + 0x18]
00022E60  4883c710                 add rdi, 0x10
00022E64  4c8b1f                   mov r11, qword ptr [rdi]
00022E67  4c3bdf                   cmp r11, rdi
00022E6A  0f84b7000000             je 0x22f27
00022E70  498b5b30                 mov rbx, qword ptr [r11 + 0x30]
00022E74  33c9                     xor ecx, ecx
00022E76  c7042414000e00           mov dword ptr [rsp], 0xe0014
00022E7D  c74424041e001600         mov dword ptr [rsp + 4], 0x16001e
00022E85  c744240816005400         mov dword ptr [rsp + 8], 0x540016
00022E8D  c744240c1e001600         mov dword ptr [rsp + 0xc], 0x16001e
00022E95  c744241016000000         mov dword ptr [rsp + 0x10], 0x16
00022E9D  0f1f00                   nop dword ptr [rax]
00022EA0  4863c1                   movsxd rax, ecx
00022EA3  ffc1                     inc ecx
00022EA5  668334447a               xor word ptr [rsp + rax*2], 0x7a
00022EAA  4863c1                   movsxd rax, ecx
00022EAD  66833c4400               cmp word ptr [rsp + rax*2], 0
00022EB2  75ec                     jne 0x22ea0
00022EB4  4885db                   test rbx, rbx
00022EB7  7462                     je 0x22f1b
00022EB9  498b4360                 mov rax, qword ptr [r11 + 0x60]
00022EBD  4885c0                   test rax, rax
00022EC0  7459                     je 0x22f1b
00022EC2  66833800                 cmp word ptr [rax], 0
00022EC6  4c8d1424                 lea r10, [rsp]
00022ECA  7446                     je 0x22f12
00022ECC  0f1f4000                 nop dword ptr [rax]
00022ED0  410fb712                 movzx edx, word ptr [r10]
00022ED4  6685d2                   test dx, dx
00022ED7  7439                     je 0x22f12
00022ED9  440fb708                 movzx r9d, word ptr [rax]
00022EDD  8d4abf                   lea ecx, [rdx - 0x41]
00022EE0  6683f919                 cmp cx, 0x19
00022EE4  448d4220                 lea r8d, [rdx + 0x20]
00022EE8  66440f47c2               cmova r8w, dx
00022EED  418d49bf                 lea ecx, [r9 - 0x41]
00022EF1  6683f919                 cmp cx, 0x19
00022EF5  418d5120                 lea edx, [r9 + 0x20]
00022EF9  66410f47d1               cmova dx, r9w
00022EFE  66413bd0                 cmp dx, r8w
00022F02  7517                     jne 0x22f1b
00022F04  4883c002                 add rax, 2
00022F08  4983c202                 add r10, 2
00022F0C  66833800                 cmp word ptr [rax], 0
00022F10  75be                     jne 0x22ed0
00022F12  410fb70a                 movzx ecx, word ptr [r10]
00022F16  663908                   cmp word ptr [rax], cx
00022F19  741f                     je 0x22f3a
00022F1B  4d8b1b                   mov r11, qword ptr [r11]
00022F1E  4c3bdf                   cmp r11, rdi
00022F21  0f8549ffffff             jne 0x22e70
00022F27  33c0                     xor eax, eax
00022F29  4883c428                 add rsp, 0x28
00022F2D  415f                     pop r15
00022F2F  415e                     pop r14
00022F31  415d                     pop r13
00022F33  415c                     pop r12
00022F35  5f                       pop rdi
00022F36  5e                       pop rsi
00022F37  5d                       pop rbp
00022F38  5b                       pop rbx
00022F39  c3                       ret 
00022F3A  4863433c                 movsxd rax, dword ptr [rbx + 0x3c]
00022F3E  83bc188c00000000         cmp dword ptr [rax + rbx + 0x8c], 0
00022F46  74df                     je 0x22f27
00022F48  8bbc1888000000           mov edi, dword ptr [rax + rbx + 0x88]
00022F4F  4533c0                   xor r8d, r8d
00022F52  4803fb                   add rdi, rbx
00022F55  448b5f20                 mov r11d, dword ptr [rdi + 0x20]
00022F59  448b5718                 mov r10d, dword ptr [rdi + 0x18]
00022F5D  4c03db                   add r11, rbx
00022F60  4585d2                   test r10d, r10d
00022F63  74c2                     je 0x22f27
00022F65  6666660f1f840000000000   nop word ptr [rax + rax]
00022F70  438b1483                 mov edx, dword ptr [r11 + r8*4]
00022F74  b905150000               mov ecx, 0x1505
00022F79  4803d3                   add rdx, rbx
00022F7C  0fb602                   movzx eax, byte ptr [rdx]
00022F7F  84c0                     test al, al
00022F81  7420                     je 0x22fa3
00022F83  0f1f4000                 nop dword ptr [rax]
00022F87  660f1f840000000000       nop word ptr [rax + rax]
00022F90  6bc921                   imul ecx, ecx, 0x21
00022F93  488d5201                 lea rdx, [rdx + 1]
00022F97  0fb6c0                   movzx eax, al
00022F9A  03c8                     add ecx, eax
00022F9C  0fb602                   movzx eax, byte ptr [rdx]
00022F9F  84c0                     test al, al
00022FA1  75ed                     jne 0x22f90
00022FA3  3bce                     cmp ecx, esi
00022FA5  740d                     je 0x22fb4
00022FA7  41ffc0                   inc r8d
00022FAA  453bc2                   cmp r8d, r10d
00022FAD  72c1                     jb 0x22f70
00022FAF  e973ffffff               jmp 0x22f27
00022FB4  8b4f24                   mov ecx, dword ptr [rdi + 0x24]
00022FB7  4803cb                   add rcx, rbx
00022FBA  420fb71441               movzx edx, word ptr [rcx + r8*2]
00022FBF  8b4f1c                   mov ecx, dword ptr [rdi + 0x1c]
00022FC2  4803cb                   add rcx, rbx
00022FC5  8b0491                   mov eax, dword ptr [rcx + rdx*4]
00022FC8  4803c3                   add rax, rbx
00022FCB  e959ffffff               jmp 0x22f29
00022FD0  83fa01                   cmp edx, 1
00022FD3  0f850f120000             jne 0x241e8
00022FD9  48895c2408               mov qword ptr [rsp + 8], rbx
00022FDE  55                       push rbp
00022FDF  56                       push rsi
00022FE0  57                       push rdi
00022FE1  4154                     push r12
00022FE3  4155                     push r13
00022FE5  4156                     push r14
00022FE7  4157                     push r15
00022FE9  488dac2400fbffff         lea rbp, [rsp - 0x500]
00022FF1  4881ec00060000           sub rsp, 0x600
00022FF8  c7854805000000000000     mov dword ptr [rbp + 0x548], 0
00023002  0f57c0                   xorps xmm0, xmm0
00023005  0f11442440               movups xmmword ptr [rsp + 0x40], xmm0
0002300A  48c744245000000000       mov qword ptr [rsp + 0x50], 0
00023013  48c74424580f000000       mov qword ptr [rsp + 0x58], 0xf
0002301C  c644244000               mov byte ptr [rsp + 0x40], 0
00023021  c7854805000002000000     mov dword ptr [rbp + 0x548], 2
0002302B  4533c0                   xor r8d, r8d
0002302E  ba09000000               mov edx, 9
00023033  488d4c2440               lea rcx, [rsp + 0x40]
00023038  e883180100               call 0x348c0
0002303D  488d442440               lea rax, [rsp + 0x40]
00023042  48837c24580f             cmp qword ptr [rsp + 0x58], 0xf
00023048  480f47442440             cmova rax, qword ptr [rsp + 0x40]
0002304E  c6006e                   mov byte ptr [rax], 0x6e
00023051  488d442440               lea rax, [rsp + 0x40]
00023056  48837c24580f             cmp qword ptr [rsp + 0x58], 0xf
0002305C  480f47442440             cmova rax, qword ptr [rsp + 0x40]
00023062  c6400174                 mov byte ptr [rax + 1], 0x74
00023066  488d442440               lea rax, [rsp + 0x40]
0002306B  48837c24580f             cmp qword ptr [rsp + 0x58], 0xf
00023071  480f47442440             cmova rax, qword ptr [rsp + 0x40]
00023077  c6400264                 mov byte ptr [rax + 2], 0x64
0002307B  488d442440               lea rax, [rsp + 0x40]
00023080  48837c24580f             cmp qword ptr [rsp + 0x58], 0xf
00023086  480f47442440             cmova rax, qword ptr [rsp + 0x40]
0002308C  c640036c                 mov byte ptr [rax + 3], 0x6c
00023090  488d442440               lea rax, [rsp + 0x40]
00023095  48837c24580f             cmp qword ptr [rsp + 0x58], 0xf
0002309B  480f47442440             cmova rax, qword ptr [rsp + 0x40]
000230A1  c640046c                 mov byte ptr [rax + 4], 0x6c
000230A5  488d442440               lea rax, [rsp + 0x40]
000230AA  48837c24580f             cmp qword ptr [rsp + 0x58], 0xf
000230B0  480f47442440             cmova rax, qword ptr [rsp + 0x40]
000230B6  c640052e                 mov byte ptr [rax + 5], 0x2e
000230BA  488d442440               lea rax, [rsp + 0x40]
000230BF  48837c24580f             cmp qword ptr [rsp + 0x58], 0xf
000230C5  480f47442440             cmova rax, qword ptr [rsp + 0x40]
000230CB  c6400664                 mov byte ptr [rax + 6], 0x64
000230CF  488d442440               lea rax, [rsp + 0x40]
000230D4  48837c24580f             cmp qword ptr [rsp + 0x58], 0xf
000230DA  480f47442440             cmova rax, qword ptr [rsp + 0x40]
000230E0  c640076c                 mov byte ptr [rax + 7], 0x6c
000230E4  488d442440               lea rax, [rsp + 0x40]
000230E9  48837c24580f             cmp qword ptr [rsp + 0x58], 0xf
000230EF  480f47442440             cmova rax, qword ptr [rsp + 0x40]
000230F5  c640086c                 mov byte ptr [rax + 8], 0x6c
000230F9  488d45a0                 lea rax, [rbp - 0x60]
000230FD  b90a000000               mov ecx, 0xa
00023102  c60000                   mov byte ptr [rax], 0
00023105  488d4001                 lea rax, [rax + 1]
00023109  4883e901                 sub rcx, 1
0002310D  75f3                     jne 0x23102
0002310F  0f57c0                   xorps xmm0, xmm0
00023112  0f11442420               movups xmmword ptr [rsp + 0x20], xmm0
00023117  48894c2430               mov qword ptr [rsp + 0x30], rcx
0002311C  48c74424380f000000       mov qword ptr [rsp + 0x38], 0xf
00023125  884c2420                 mov byte ptr [rsp + 0x20], cl
00023129  c7854805000009000000     mov dword ptr [rbp + 0x548], 9
00023133  4533c0                   xor r8d, r8d
00023136  ba0d000000               mov edx, 0xd
0002313B  488d4c2420               lea rcx, [rsp + 0x20]
00023140  e87b170100               call 0x348c0
00023145  488d442420               lea rax, [rsp + 0x20]
0002314A  48837c24380f             cmp qword ptr [rsp + 0x38], 0xf
00023150  480f47442420             cmova rax, qword ptr [rsp + 0x20]
00023156  c60045                   mov byte ptr [rax], 0x45
00023159  488d442420               lea rax, [rsp + 0x20]
0002315E  48837c24380f             cmp qword ptr [rsp + 0x38], 0xf
00023164  480f47442420             cmova rax, qword ptr [rsp + 0x20]
0002316A  c6400174                 mov byte ptr [rax + 1], 0x74
0002316E  488d442420               lea rax, [rsp + 0x20]
00023173  48837c24380f             cmp qword ptr [rsp + 0x38], 0xf
00023179  480f47442420             cmova rax, qword ptr [rsp + 0x20]
0002317F  c6400277                 mov byte ptr [rax + 2], 0x77
00023183  488d442420               lea rax, [rsp + 0x20]
00023188  48837c24380f             cmp qword ptr [rsp + 0x38], 0xf
0002318E  480f47442420             cmova rax, qword ptr [rsp + 0x20]
00023194  c6400345                 mov byte ptr [rax + 3], 0x45
00023198  488d442420               lea rax, [rsp + 0x20]
0002319D  48837c24380f             cmp qword ptr [rsp + 0x38], 0xf
000231A3  480f47442420             cmova rax, qword ptr [rsp + 0x20]
000231A9  c6400476                 mov byte ptr [rax + 4], 0x76
000231AD  488d442420               lea rax, [rsp + 0x20]
000231B2  48837c24380f             cmp qword ptr [rsp + 0x38], 0xf
000231B8  480f47442420             cmova rax, qword ptr [rsp + 0x20]
000231BE  c6400565                 mov byte ptr [rax + 5], 0x65
000231C2  488d442420               lea rax, [rsp + 0x20]
000231C7  48837c24380f             cmp qword ptr [rsp + 0x38], 0xf
000231CD  480f47442420             cmova rax, qword ptr [rsp + 0x20]
000231D3  c640066e                 mov byte ptr [rax + 6], 0x6e
000231D7  488d442420               lea rax, [rsp + 0x20]
000231DC  48837c24380f             cmp qword ptr [rsp + 0x38], 0xf
000231E2  480f47442420             cmova rax, qword ptr [rsp + 0x20]
000231E8  c6400774                 mov byte ptr [rax + 7], 0x74
000231EC  488d442420               lea rax, [rsp + 0x20]
000231F1  48837c24380f             cmp qword ptr [rsp + 0x38], 0xf
000231F7  480f47442420             cmova rax, qword ptr [rsp + 0x20]
000231FD  c6400857                 mov byte ptr [rax + 8], 0x57
00023201  488d442420               lea rax, [rsp + 0x20]
00023206  48837c24380f             cmp qword ptr [rsp + 0x38], 0xf
0002320C  480f47442420             cmova rax, qword ptr [rsp + 0x20]
00023212  c6400972                 mov byte ptr [rax + 9], 0x72
00023216  488d442420               lea rax, [rsp + 0x20]
0002321B  48837c24380f             cmp qword ptr [rsp + 0x38], 0xf
00023221  480f47442420             cmova rax, qword ptr [rsp + 0x20]
00023227  c6400a69                 mov byte ptr [rax + 0xa], 0x69
0002322B  488d442420               lea rax, [rsp + 0x20]
00023230  48837c24380f             cmp qword ptr [rsp + 0x38], 0xf
00023236  480f47442420             cmova rax, qword ptr [rsp + 0x20]
0002323C  c6400b74                 mov byte ptr [rax + 0xb], 0x74
00023240  488d442420               lea rax, [rsp + 0x20]
00023245  48837c24380f             cmp qword ptr [rsp + 0x38], 0xf
0002324B  480f47442420             cmova rax, qword ptr [rsp + 0x20]
00023251  c6400c65                 mov byte ptr [rax + 0xc], 0x65
00023255  488d45a0                 lea rax, [rbp - 0x60]
00023259  b90e000000               mov ecx, 0xe
0002325E  6690                     nop 
00023260  c60000                   mov byte ptr [rax], 0
00023263  488d4001                 lea rax, [rax + 1]
00023267  4883e901                 sub rcx, 1
0002326B  75f3                     jne 0x23260
0002326D  65488b042560000000       mov rax, qword ptr gs:[0x60]
00023276  488b7818                 mov rdi, qword ptr [rax + 0x18]
0002327A  4883c720                 add rdi, 0x20
0002327E  4c8b1f                   mov r11, qword ptr [rdi]
00023281  bbc59d1c81               mov ebx, 0x811c9dc5
00023286  4c3bdf                   cmp r11, rdi
00023289  7468                     je 0x232f3
0002328B  0f1f440000               nop dword ptr [rax + rax]
00023290  4d8b4b50                 mov r9, qword ptr [r11 + 0x50]
00023294  4d85c9                   test r9, r9
00023297  7452                     je 0x232eb
00023299  448bd3                   mov r10d, ebx
0002329C  410fb701                 movzx eax, word ptr [r9]
000232A0  6685c0                   test ax, ax
000232A3  7446                     je 0x232eb
000232A5  6666660f1f840000000000   nop word ptr [rax + rax]
000232B0  4d8d4902                 lea r9, [r9 + 2]
000232B4  448d409f                 lea r8d, [rax - 0x61]
000232B8  0fb6d0                   movzx edx, al
000232BB  2c20                     sub al, 0x20
000232BD  0fb6c8                   movzx ecx, al
000232C0  664183f819               cmp r8w, 0x19
000232C5  0f47ca                   cmova ecx, edx
000232C8  0fbec1                   movsx eax, cl
000232CB  4133c2                   xor eax, r10d
000232CE  4469d093010001           imul r10d, eax, 0x1000193
000232D5  410fb701                 movzx eax, word ptr [r9]
000232D9  6685c0                   test ax, ax
000232DC  75d2                     jne 0x232b0
000232DE  4181fa63d4cd29           cmp r10d, 0x29cdd463
000232E5  0f8441020000             je 0x2352c
000232EB  4d8b1b                   mov r11, qword ptr [r11]
000232EE  4c3bdf                   cmp r11, rdi
000232F1  759d                     jne 0x23290
000232F3  48c7855805000000000000   mov qword ptr [rbp + 0x558], 0
