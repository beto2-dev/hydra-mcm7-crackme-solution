0001FDB0  48895c2408             mov qword ptr [rsp + 8], rbx
0001FDB5  55                     push rbp
0001FDB6  56                     push rsi
0001FDB7  57                     push rdi
0001FDB8  4154                   push r12
0001FDBA  4155                   push r13
0001FDBC  4156                   push r14
0001FDBE  4157                   push r15
0001FDC0  4883ec20               sub rsp, 0x20
0001FDC4  458bf0                 mov r14d, r8d
0001FDC7  4c8bca                 mov r9, rdx
0001FDCA  4c8bf9                 mov r15, rcx
0001FDCD  0f31                   rdtsc 
0001FDCF  48c1e220               shl rdx, 0x20
0001FDD3  4533db                 xor r11d, r11d
0001FDD6  480bc2                 or rax, rdx
0001FDD9  44895c2478             mov dword ptr [rsp + 0x78], r11d
0001FDDE  33c9                   xor ecx, ecx
0001FDE0  4889442418             mov qword ptr [rsp + 0x18], rax
0001FDE5  33d2                   xor edx, edx
0001FDE7  41c70100000000         mov dword ptr [r9], 0
0001FDEE  4533e4                 xor r12d, r12d
0001FDF1  89542468               mov dword ptr [rsp + 0x68], edx
0001FDF5  33ed                   xor ebp, ebp
0001FDF7  48894c2408             mov qword ptr [rsp + 8], rcx
0001FDFC  33ff                   xor edi, edi
0001FDFE  4533ed                 xor r13d, r13d
0001FE01  33db                   xor ebx, ebx
0001FE03  41b201                 mov r10b, 1
0001FE06  48895c2410             mov qword ptr [rsp + 0x10], rbx
0001FE0B  41b8937e0000           mov r8d, 0x7e93
0001FE11  418bf6                 mov esi, r14d
0001FE14  4488542470             mov byte ptr [rsp + 0x70], r10b
0001FE19  b800200000             mov eax, 0x2000
0001FE1E  448bd9                 mov r11d, ecx
0001FE21  85c0                   test eax, eax
0001FE23  0f8470020000           je 0x20099
0001FE29  ffc8                   dec eax
0001FE2B  890424                 mov dword ptr [rsp], eax
0001FE2E  4181f8bca10000         cmp r8d, 0xa1bc
0001FE35  0f8796050000           ja 0x203d1
0001FE3B  0f84dc040000           je 0x2031d
0001FE41  4181f848190000         cmp r8d, 0x1948
0001FE48  0f84b3050000           je 0x20401
0001FE4E  4181f8452a0000         cmp r8d, 0x2a45
0001FE55  0f84cb030000           je 0x20226
0001FE5B  4181f8685c0000         cmp r8d, 0x5c68
0001FE62  0f8486020000           je 0x200ee
0001FE68  4181f8937e0000         cmp r8d, 0x7e93
0001FE6F  0f8467010000           je 0x1ffdc
0001FE75  4181f87a8e0000         cmp r8d, 0x8e7a
0001FE7C  0f857f050000           jne 0x20401
0001FE82  418bc4                 mov eax, r12d
0001FE85  418bd4                 mov edx, r12d
0001FE88  25000f0000             and eax, 0xf00
0001FE8D  c1fa1f                 sar edx, 0x1f
0001FE90  81e200100000           and edx, 0x1000
0001FE96  418bcc                 mov ecx, r12d
0001FE99  c1e90d                 shr ecx, 0xd
0001FE9C  81e100f00300           and ecx, 0x3f000
0001FEA2  0bc8                   or ecx, eax
0001FEA4  418bc4                 mov eax, r12d
0001FEA7  2580000000             and eax, 0x80
0001FEAC  c1e907                 shr ecx, 7
0001FEAF  c1e004                 shl eax, 4
0001FEB2  0bc8                   or ecx, eax
0001FEB4  418bc3                 mov eax, r11d
0001FEB7  0bca                   or ecx, edx
0001FEB9  4d8d1c81               lea r11, [r9 + rax*4]
0001FEBD  448bd1                 mov r10d, ecx
0001FEC0  4181ca00e0ffff         or r10d, 0xffffe000
0001FEC7  85d2                   test edx, edx
0001FEC9  8b542468               mov edx, dword ptr [rsp + 0x68]
0001FECD  418b0491               mov eax, dword ptr [r9 + rdx*4]
0001FED1  498d1c91               lea rbx, [r9 + rdx*4]
0001FED5  440f44d1               cmove r10d, ecx
0001FED9  418b0b                 mov ecx, dword ptr [r11]
0001FEDC  85ff                   test edi, edi
0001FEDE  7508                   jne 0x1fee8
0001FEE0  3bc8                   cmp ecx, eax
0001FEE2  410f94c0               sete r8b
0001FEE6  eb42                   jmp 0x1ff2a
0001FEE8  83ff01                 cmp edi, 1
0001FEEB  7508                   jne 0x1fef5
0001FEED  3bc8                   cmp ecx, eax
0001FEEF  410f95c0               setne r8b
0001FEF3  eb35                   jmp 0x1ff2a
0001FEF5  83ff04                 cmp edi, 4
0001FEF8  7508                   jne 0x1ff02
0001FEFA  3bc8                   cmp ecx, eax
0001FEFC  410f9cc0               setl r8b
0001FF00  eb28                   jmp 0x1ff2a
0001FF02  83ff05                 cmp edi, 5
0001FF05  7508                   jne 0x1ff0f
0001FF07  3bc8                   cmp ecx, eax
0001FF09  410f9dc0               setge r8b
0001FF0D  eb1b                   jmp 0x1ff2a
0001FF0F  83ff06                 cmp edi, 6
0001FF12  7508                   jne 0x1ff1c
0001FF14  3bc8                   cmp ecx, eax
0001FF16  410f92c0               setb r8b
0001FF1A  eb0e                   jmp 0x1ff2a
0001FF1C  4532c0                 xor r8b, r8b
0001FF1F  83ff07                 cmp edi, 7
0001FF22  7506                   jne 0x1ff2a
0001FF24  3bc8                   cmp ecx, eax
0001FF26  410f93c0               setae r8b
0001FF2A  418b8180000000         mov eax, dword ptr [r9 + 0x80]
0001FF31  4584c0                 test r8b, r8b
0001FF34  7405                   je 0x1ff3b
0001FF36  4103c2                 add eax, r10d
0001FF39  eb03                   jmp 0x1ff3e
0001FF3B  83c004                 add eax, 4
0001FF3E  41898180000000         mov dword ptr [r9 + 0x80], eax
0001FF45  4585f6                 test r14d, r14d
0001FF48  7477                   je 0x1ffc1
0001FF4A  0f31                   rdtsc 
0001FF4C  440fb6542470           movzx r10d, byte ptr [rsp + 0x70]
0001FF52  48c1e220               shl rdx, 0x20
0001FF56  480bc2                 or rax, rdx
0001FF59  488b542408             mov rdx, qword ptr [rsp + 8]
0001FF5E  2bc2                   sub eax, edx
0001FF60  baefbe0000             mov edx, 0xbeef
0001FF65  c1e81c                 shr eax, 0x1c
0001FF68  33c6                   xor eax, esi
0001FF6A  69c893010001           imul ecx, eax, 0x1000193
0001FF70  b8feca0000             mov eax, 0xcafe
0001FF75  4584c0                 test r8b, r8b
0001FF78  41b8937e0000           mov r8d, 0x7e93
0001FF7E  0f45c2                 cmovne eax, edx
0001FF81  33c8                   xor ecx, eax
0001FF83  41330b                 xor ecx, dword ptr [r11]
0001FF86  330b                   xor ecx, dword ptr [rbx]
0001FF88  488b5c2410             mov rbx, qword ptr [rsp + 0x10]
0001FF8D  448b5c2478             mov r11d, dword ptr [rsp + 0x78]
0001FF92  69f193010001           imul esi, ecx, 0x1000193
0001FF98  8bd3                   mov edx, ebx
0001FF9A  490317                 add rdx, qword ptr [r15]
0001FF9D  8bc6                   mov eax, esi
0001FF9F  403032                 xor byte ptr [rdx], sil
0001FFA2  c1e808                 shr eax, 8
0001FFA5  304201                 xor byte ptr [rdx + 1], al
0001FFA8  8bc6                   mov eax, esi
0001FFAA  c1e810                 shr eax, 0x10
0001FFAD  304202                 xor byte ptr [rdx + 2], al
0001FFB0  8bc6                   mov eax, esi
0001FFB2  c1e818                 shr eax, 0x18
0001FFB5  304203                 xor byte ptr [rdx + 3], al
0001FFB8  8b542468               mov edx, dword ptr [rsp + 0x68]
0001FFBC  e99e000000             jmp 0x2005f
0001FFC1  488b5c2410             mov rbx, qword ptr [rsp + 0x10]
0001FFC6  41b8937e0000           mov r8d, 0x7e93
0001FFCC  448b5c2478             mov r11d, dword ptr [rsp + 0x78]
0001FFD1  440fb6542470           movzx r10d, byte ptr [rsp + 0x70]
0001FFD7  e983000000             jmp 0x2005f
0001FFDC  4d8b17                 mov r10, qword ptr [r15]
0001FFDF  498b5708               mov rdx, qword ptr [r15 + 8]
0001FFE3  458b8180000000         mov r8d, dword ptr [r9 + 0x80]
0001FFEA  492bd2                 sub rdx, r10
0001FFED  4c3bc2                 cmp r8, rdx
0001FFF0  0f83ed000000           jae 0x200e3
0001FFF6  418d4804               lea ecx, [r8 + 4]
0001FFFA  483bca                 cmp rcx, rdx
0001FFFD  0f87e0000000           ja 0x200e3
00020003  4585f6                 test r14d, r14d
00020006  7434                   je 0x2003c
00020008  0f31                   rdtsc 
0002000A  48c1e220               shl rdx, 0x20
0002000E  480bc2                 or rax, rdx
00020011  4889442408             mov qword ptr [rsp + 8], rax
00020016  85f6                   test esi, esi
00020018  7422                   je 0x2003c
0002001A  43303410               xor byte ptr [r8 + r10], sil
0002001E  8bce                   mov ecx, esi
00020020  c1e908                 shr ecx, 8
00020023  8bc6                   mov eax, esi
00020025  43304c1001             xor byte ptr [r8 + r10 + 1], cl
0002002A  8bce                   mov ecx, esi
0002002C  c1e910                 shr ecx, 0x10
0002002F  43304c1002             xor byte ptr [r8 + r10 + 2], cl
00020034  c1e818                 shr eax, 0x18
00020037  4330441003             xor byte ptr [r8 + r10 + 3], al
0002003C  418b9980000000         mov ebx, dword ptr [r9 + 0x80]
00020043  41b8d6b40000           mov r8d, 0xb4d6
00020049  498b07                 mov rax, qword ptr [r15]
0002004C  48895c2410             mov qword ptr [rsp + 0x10], rbx
00020051  448b2403               mov r12d, dword ptr [rbx + rax]
00020055  440fb6542470           movzx r10d, byte ptr [rsp + 0x70]
0002005B  8b542468               mov edx, dword ptr [rsp + 0x68]
0002005F  4585f6                 test r14d, r14d
00020062  741d                   je 0x20081
00020064  40f6c601               test sil, 1
00020068  7417                   je 0x20081
0002006A  8bc6                   mov eax, esi
0002006C  c1e803                 shr eax, 3
0002006F  83e003                 and eax, 3
00020072  83c01c                 add eax, 0x1c
00020075  498d0c81               lea rcx, [r9 + rax*4]
00020079  69c6b979379e           imul eax, esi, 0x9e3779b9
0002007F  3101                   xor dword ptr [rcx], eax
00020081  488b4c2408             mov rcx, qword ptr [rsp + 8]
00020086  8b0424                 mov eax, dword ptr [rsp]
00020089  41c70100000000         mov dword ptr [r9], 0
00020090  4584d2                 test r10b, r10b
00020093  0f8588fdffff           jne 0x1fe21
00020099  0f31                   rdtsc 
0002009B  48c1e220               shl rdx, 0x20
0002009F  480bc2                 or rax, rdx
000200A2  482b442418             sub rax, qword ptr [rsp + 0x18]
000200A7  483d0065cd1d           cmp rax, 0x1dcd6500
000200AD  7610                   jbe 0x200bf
000200AF  41817138efbeadde       xor dword ptr [r9 + 0x38], 0xdeadbeef
000200B7  4181713cdec03713       xor dword ptr [r9 + 0x3c], 0x1337c0de
000200BF  418b413c               mov eax, dword ptr [r9 + 0x3c]
000200C3  418b4938               mov ecx, dword ptr [r9 + 0x38]
000200C7  488b5c2460             mov rbx, qword ptr [rsp + 0x60]
000200CC  48c1e020               shl rax, 0x20
000200D0  480bc1                 or rax, rcx
000200D3  4883c420               add rsp, 0x20
000200D7  415f                   pop r15
000200D9  415e                   pop r14
000200DB  415d                   pop r13
000200DD  415c                   pop r12
000200DF  5f                     pop rdi
000200E0  5e                     pop rsi
000200E1  5d                     pop rbp
000200E2  c3                     ret 
000200E3  41b848190000           mov r8d, 0x1948
000200E9  e967ffffff             jmp 0x20055
000200EE  418bc3                 mov eax, r11d
000200F1  458b0481               mov r8d, dword ptr [r9 + rax*4]
000200F5  4d8d1481               lea r10, [r9 + rax*4]
000200F9  8bc2                   mov eax, edx
000200FB  418b1481               mov edx, dword ptr [r9 + rax*4]
000200FF  4d8d1c81               lea r11, [r9 + rax*4]
00020103  85ff                   test edi, edi
00020105  7534                   jne 0x2013b
00020107  41f6c520               test r13b, 0x20
0002010B  7420                   je 0x2012d
0002010D  f7d2                   not edx
0002010F  418bc0                 mov eax, r8d
00020112  8bca                   mov ecx, edx
00020114  83f201                 xor edx, 1
00020117  83c901                 or ecx, 1
0002011A  03c9                   add ecx, ecx
0002011C  2bca                   sub ecx, edx
0002011E  0bc1                   or eax, ecx
00020120  4433c1                 xor r8d, ecx
00020123  03c0                   add eax, eax
00020125  412bc0                 sub eax, r8d
00020128  e989000000             jmp 0x201b6
0002012D  8bc2                   mov eax, edx
0002012F  4133d0                 xor edx, r8d
00020132  410bc0                 or eax, r8d
00020135  03c0                   add eax, eax
00020137  2bc2                   sub eax, edx
00020139  eb7b                   jmp 0x201b6
0002013B  83ff01                 cmp edi, 1
0002013E  750d                   jne 0x2014d
00020140  83e21f                 and edx, 0x1f
00020143  418bc0                 mov eax, r8d
00020146  0fb6ca                 movzx ecx, dl
00020149  d3e0                   shl eax, cl
0002014B  eb69                   jmp 0x201b6
0002014D  83ff02                 cmp edi, 2
00020150  750a                   jne 0x2015c
00020152  33c0                   xor eax, eax
00020154  443bc2                 cmp r8d, edx
00020157  0f9cc0                 setl al
0002015A  eb5a                   jmp 0x201b6
0002015C  83ff03                 cmp edi, 3
0002015F  750a                   jne 0x2016b
00020161  33c0                   xor eax, eax
00020163  443bc2                 cmp r8d, edx
00020166  0f92c0                 setb al
00020169  eb4b                   jmp 0x201b6
0002016B  83ff04                 cmp edi, 4
0002016E  750c                   jne 0x2017c
00020170  8bc2                   mov eax, edx
00020172  4123d0                 and edx, r8d
00020175  410bc0                 or eax, r8d
00020178  2bc2                   sub eax, edx
0002017A  eb3a                   jmp 0x201b6
0002017C  83ff05                 cmp edi, 5
0002017F  7516                   jne 0x20197
00020181  83e21f                 and edx, 0x1f
00020184  418bc0                 mov eax, r8d
00020187  8bca                   mov ecx, edx
00020189  41f6c520               test r13b, 0x20
0002018D  7404                   je 0x20193
0002018F  d3f8                   sar eax, cl
00020191  eb23                   jmp 0x201b6
00020193  d3e8                   shr eax, cl
00020195  eb1f                   jmp 0x201b6
00020197  83ff06                 cmp edi, 6
0002019A  7507                   jne 0x201a3
0002019C  8bca                   mov ecx, edx
0002019E  4123c8                 and ecx, r8d
000201A1  eb0c                   jmp 0x201af
000201A3  33c0                   xor eax, eax
000201A5  83ff07                 cmp edi, 7
000201A8  750c                   jne 0x201b6
000201AA  8bca                   mov ecx, edx
000201AC  410bc8                 or ecx, r8d
000201AF  8bc2                   mov eax, edx
000201B1  2bc1                   sub eax, ecx
000201B3  4103c0                 add eax, r8d
000201B6  85ed                   test ebp, ebp
000201B8  7404                   je 0x201be
000201BA  418904a9               mov dword ptr [r9 + rbp*4], eax
000201BE  4183818000000004       add dword ptr [r9 + 0x80], 4
000201C6  4585f6                 test r14d, r14d
000201C9  744b                   je 0x20216
000201CB  0f31                   rdtsc 
000201CD  48c1e220               shl rdx, 0x20
000201D1  480bc2                 or rax, rdx
000201D4  488b542408             mov rdx, qword ptr [rsp + 8]
000201D9  2bc2                   sub eax, edx
000201DB  c1e81c                 shr eax, 0x1c
000201DE  33c6                   xor eax, esi
000201E0  69c893010001           imul ecx, eax, 0x1000193
000201E6  41330ca9               xor ecx, dword ptr [r9 + rbp*4]
000201EA  41330a                 xor ecx, dword ptr [r10]
000201ED  41330b                 xor ecx, dword ptr [r11]
000201F0  69f193010001           imul esi, ecx, 0x1000193
000201F6  8bd3                   mov edx, ebx
000201F8  8bc6                   mov eax, esi
000201FA  490317                 add rdx, qword ptr [r15]
000201FD  c1e808                 shr eax, 8
00020200  403032                 xor byte ptr [rdx], sil
00020203  304201                 xor byte ptr [rdx + 1], al
00020206  8bc6                   mov eax, esi
00020208  c1e810                 shr eax, 0x10
0002020B  304202                 xor byte ptr [rdx + 2], al
0002020E  8bc6                   mov eax, esi
00020210  c1e818                 shr eax, 0x18
00020213  304203                 xor byte ptr [rdx + 3], al
00020216  448b5c2478             mov r11d, dword ptr [rsp + 0x78]
0002021B  41b8937e0000           mov r8d, 0x7e93
00020221  e92ffeffff             jmp 0x20055
00020226  418bcc                 mov ecx, r12d
00020229  c1e914                 shr ecx, 0x14
0002022C  8bc1                   mov eax, ecx
0002022E  0d00f0ffff             or eax, 0xfffff000
00020233  0fbae10b               bt ecx, 0xb
00020237  0f42c8                 cmovb ecx, eax
0002023A  418bc3                 mov eax, r11d
0002023D  458b0481               mov r8d, dword ptr [r9 + rax*4]
00020241  4d8d1481               lea r10, [r9 + rax*4]
00020245  85ff                   test edi, edi
00020247  750f                   jne 0x20258
00020249  418bd0                 mov edx, r8d
0002024C  4433c1                 xor r8d, ecx
0002024F  0bd1                   or edx, ecx
00020251  03d2                   add edx, edx
00020253  412bd0                 sub edx, r8d
00020256  eb5d                   jmp 0x202b5
00020258  83ff04                 cmp edi, 4
0002025B  750d                   jne 0x2026a
0002025D  418bd0                 mov edx, r8d
00020260  4423c1                 and r8d, ecx
00020263  0bd1                   or edx, ecx
00020265  412bd0                 sub edx, r8d
00020268  eb4b                   jmp 0x202b5
0002026A  83ff06                 cmp edi, 6
0002026D  750e                   jne 0x2027d
0002026F  418bc0                 mov eax, r8d
00020272  418bd0                 mov edx, r8d
00020275  23c1                   and eax, ecx
00020277  2bd0                   sub edx, eax
00020279  03d1                   add edx, ecx
0002027B  eb38                   jmp 0x202b5
0002027D  83ff07                 cmp edi, 7
00020280  750e                   jne 0x20290
00020282  418bc0                 mov eax, r8d
00020285  418bd0                 mov edx, r8d
00020288  0bc1                   or eax, ecx
0002028A  2bd0                   sub edx, eax
0002028C  03d1                   add edx, ecx
0002028E  eb25                   jmp 0x202b5
00020290  83ff01                 cmp edi, 1
00020293  7507                   jne 0x2029c
00020295  418bd0                 mov edx, r8d
00020298  d3e2                   shl edx, cl
0002029A  eb19                   jmp 0x202b5
0002029C  33d2                   xor edx, edx
0002029E  83ff05                 cmp edi, 5
000202A1  7512                   jne 0x202b5
000202A3  83e11f                 and ecx, 0x1f
000202A6  418bd0                 mov edx, r8d
000202A9  41f6c520               test r13b, 0x20
000202AD  7404                   je 0x202b3
000202AF  d3fa                   sar edx, cl
000202B1  eb02                   jmp 0x202b5
000202B3  d3ea                   shr edx, cl
000202B5  85ed                   test ebp, ebp
000202B7  7404                   je 0x202bd
000202B9  418914a9               mov dword ptr [r9 + rbp*4], edx
000202BD  4183818000000004       add dword ptr [r9 + 0x80], 4
000202C5  4585f6                 test r14d, r14d
000202C8  7448                   je 0x20312
000202CA  0f31                   rdtsc 
000202CC  48c1e220               shl rdx, 0x20
000202D0  480bc2                 or rax, rdx
000202D3  488b542408             mov rdx, qword ptr [rsp + 8]
000202D8  2bc2                   sub eax, edx
000202DA  8bd3                   mov edx, ebx
000202DC  490317                 add rdx, qword ptr [r15]
000202DF  c1e81c                 shr eax, 0x1c
000202E2  33c6                   xor eax, esi
000202E4  69c893010001           imul ecx, eax, 0x1000193
000202EA  41330ca9               xor ecx, dword ptr [r9 + rbp*4]
000202EE  41330a                 xor ecx, dword ptr [r10]
000202F1  69f193010001           imul esi, ecx, 0x1000193
000202F7  403032                 xor byte ptr [rdx], sil
000202FA  8bc6                   mov eax, esi
000202FC  c1e808                 shr eax, 8
000202FF  304201                 xor byte ptr [rdx + 1], al
00020302  8bc6                   mov eax, esi
00020304  c1e810                 shr eax, 0x10
00020307  304202                 xor byte ptr [rdx + 2], al
0002030A  8bc6                   mov eax, esi
0002030C  c1e818                 shr eax, 0x18
0002030F  304203                 xor byte ptr [rdx + 3], al
00020312  41b8937e0000           mov r8d, 0x7e93
00020318  e938fdffff             jmp 0x20055
0002031D  418bcc                 mov ecx, r12d
00020320  418bc4                 mov eax, r12d
00020323  c1e90b                 shr ecx, 0xb
00020326  2500001000             and eax, 0x100000
0002032B  81e100fc0f00           and ecx, 0xffc00
00020331  418bd4                 mov edx, r12d
00020334  0bc8                   or ecx, eax
00020336  c1fa1f                 sar edx, 0x1f
00020339  c1e909                 shr ecx, 9
0002033C  81e200001000           and edx, 0x100000
00020342  418bc4                 mov eax, r12d
00020345  2500f00f00             and eax, 0xff000
0002034A  0bc8                   or ecx, eax
0002034C  0bca                   or ecx, edx
0002034E  448bc1                 mov r8d, ecx
00020351  4181c80000e0ff         or r8d, 0xffe00000
00020358  85d2                   test edx, edx
0002035A  440f44c1               cmove r8d, ecx
0002035E  8bcd                   mov ecx, ebp
00020360  85ed                   test ebp, ebp
00020362  740e                   je 0x20372
00020364  418b8180000000         mov eax, dword ptr [r9 + 0x80]
0002036B  83c004                 add eax, 4
0002036E  418904a9               mov dword ptr [r9 + rbp*4], eax
00020372  45018180000000         add dword ptr [r9 + 0x80], r8d
00020379  4585f6                 test r14d, r14d
0002037C  7448                   je 0x203c6
0002037E  0f31                   rdtsc 
00020380  48c1e220               shl rdx, 0x20
00020384  480bc2                 or rax, rdx
00020387  488b542408             mov rdx, qword ptr [rsp + 8]
0002038C  2bc2                   sub eax, edx
0002038E  8bd3                   mov edx, ebx
00020390  490317                 add rdx, qword ptr [r15]
00020393  c1e81c                 shr eax, 0x1c
00020396  33c6                   xor eax, esi
00020398  69c093010001           imul eax, eax, 0x1000193
0002039E  41330489               xor eax, dword ptr [r9 + rcx*4]
000203A2  4133c0                 xor eax, r8d
000203A5  69f093010001           imul esi, eax, 0x1000193
000203AB  403032                 xor byte ptr [rdx], sil
000203AE  8bc6                   mov eax, esi
000203B0  c1e808                 shr eax, 8
000203B3  304201                 xor byte ptr [rdx + 1], al
000203B6  8bc6                   mov eax, esi
000203B8  c1e810                 shr eax, 0x10
000203BB  304202                 xor byte ptr [rdx + 2], al
000203BE  8bc6                   mov eax, esi
000203C0  c1e818                 shr eax, 0x18
000203C3  304203                 xor byte ptr [rdx + 3], al
000203C6  41b8937e0000           mov r8d, 0x7e93
000203CC  e98afcffff             jmp 0x2005b
000203D1  4181f8d6b40000         cmp r8d, 0xb4d6
000203D8  0f8442020000           je 0x20620
000203DE  4181f8dec30000         cmp r8d, 0xc3de
000203E5  0f8427010000           je 0x20512
000203EB  4181f8f2d50000         cmp r8d, 0xd5f2
000203F2  0f84a1000000           je 0x20499
000203F8  4181f814e70000         cmp r8d, 0xe714
000203FF  740d                   je 0x2040e
00020401  4532d2                 xor r10b, r10b
00020404  4488542470             mov byte ptr [rsp + 0x70], r10b
00020409  e951fcffff             jmp 0x2005f
0002040E  418bd4                 mov edx, r12d
00020411  418bc4                 mov eax, r12d
00020414  c1ea0d                 shr edx, 0xd
00020417  25800f0000             and eax, 0xf80
0002041C  81e200f00700           and edx, 0x7f000
00020422  0bd0                   or edx, eax
00020424  c1ea07                 shr edx, 7
00020427  0fbae20b               bt edx, 0xb
0002042B  7306                   jae 0x20433
0002042D  81ca00f0ffff           or edx, 0xfffff000
00020433  498b4f08               mov rcx, qword ptr [r15 + 8]
00020437  418bc3                 mov eax, r11d
0002043A  458b1c81               mov r11d, dword ptr [r9 + rax*4]
0002043E  8b442468               mov eax, dword ptr [rsp + 0x68]
00020442  4403da                 add r11d, edx
00020445  498b17                 mov rdx, qword ptr [r15]
00020448  482bca                 sub rcx, rdx
0002044B  458b1481               mov r10d, dword ptr [r9 + rax*4]
0002044F  498d4304               lea rax, [r11 + 4]
00020453  483bc1                 cmp rax, rcx
00020456  7704                   ja 0x2045c
00020458  45891413               mov dword ptr [r11 + rdx], r10d
0002045C  4183818000000004       add dword ptr [r9 + 0x80], 4
00020464  4585f6                 test r14d, r14d
00020467  0f84a9fdffff           je 0x20216
0002046D  0f31                   rdtsc 
0002046F  48c1e220               shl rdx, 0x20
00020473  480bc2                 or rax, rdx
00020476  488b542408             mov rdx, qword ptr [rsp + 8]
0002047B  2bc2                   sub eax, edx
0002047D  c1e81c                 shr eax, 0x1c
00020480  33c6                   xor eax, esi
00020482  69c093010001           imul eax, eax, 0x1000193
00020488  4133c2                 xor eax, r10d
0002048B  4133c3                 xor eax, r11d
0002048E  69f093010001           imul esi, eax, 0x1000193
00020494  e95dfdffff             jmp 0x201f6
00020499  418bd4                 mov edx, r12d
0002049C  c1ea14                 shr edx, 0x14
0002049F  0fbae20b               bt edx, 0xb
000204A3  7306                   jae 0x204ab
000204A5  81ca00f0ffff           or edx, 0xfffff000
000204AB  498b4f08               mov rcx, qword ptr [r15 + 8]
000204AF  41baaddeadde           mov r10d, 0xdeaddead
000204B5  418bc3                 mov eax, r11d
000204B8  458b1c81               mov r11d, dword ptr [r9 + rax*4]
000204BC  4403da                 add r11d, edx
000204BF  498b17                 mov rdx, qword ptr [r15]
000204C2  482bca                 sub rcx, rdx
000204C5  498d4304               lea rax, [r11 + 4]
000204C9  483bc1                 cmp rax, rcx
000204CC  7704                   ja 0x204d2
000204CE  458b1413               mov r10d, dword ptr [r11 + rdx]
000204D2  85ed                   test ebp, ebp
000204D4  7404                   je 0x204da
000204D6  458914a9               mov dword ptr [r9 + rbp*4], r10d
000204DA  4183818000000004       add dword ptr [r9 + 0x80], 4
000204E2  4585f6                 test r14d, r14d
000204E5  0f842bfdffff           je 0x20216
000204EB  0f31                   rdtsc 
000204ED  48c1e220               shl rdx, 0x20
000204F1  480bc2                 or rax, rdx
000204F4  488b542408             mov rdx, qword ptr [rsp + 8]
000204F9  2bc2                   sub eax, edx
000204FB  c1e81c                 shr eax, 0x1c
000204FE  33c6                   xor eax, esi
00020500  69c893010001           imul ecx, eax, 0x1000193
00020506  41330ca9               xor ecx, dword ptr [r9 + rbp*4]
0002050A  4133cb                 xor ecx, r11d
0002050D  e9defcffff             jmp 0x201f0
00020512  418bc4                 mov eax, r12d
00020515  c1e814                 shr eax, 0x14
00020518  0fbae00b               bt eax, 0xb
0002051C  7305                   jae 0x20523
0002051E  0d00f0ffff             or eax, 0xfffff000
00020523  85ff                   test edi, edi
00020525  757c                   jne 0x205a3
00020527  83f801                 cmp eax, 1
0002052A  0f86dd000000           jbe 0x2060d
00020530  83f802                 cmp eax, 2
00020533  0f8593000000           jne 0x205cc
00020539  0f31                   rdtsc 
0002053B  48c1e220               shl rdx, 0x20
0002053F  480bc2                 or rax, rdx
00020542  85ed                   test ebp, ebp
00020544  7409                   je 0x2054f
00020546  488b4c2408             mov rcx, qword ptr [rsp + 8]
0002054B  418904a9               mov dword ptr [r9 + rbp*4], eax
0002054F  4183818000000004       add dword ptr [r9 + 0x80], 4
00020557  4585f6                 test r14d, r14d
0002055A  7441                   je 0x2059d
0002055C  0f31                   rdtsc 
0002055E  48c1e220               shl rdx, 0x20
00020562  480bc2                 or rax, rdx
00020565  2bc1                   sub eax, ecx
00020567  c1e81c                 shr eax, 0x1c
0002056A  33c6                   xor eax, esi
0002056C  69c093010001           imul eax, eax, 0x1000193
00020572  353412cdab             xor eax, 0xabcd1234
00020577  69f093010001           imul esi, eax, 0x1000193
0002057D  8bd3                   mov edx, ebx
0002057F  490317                 add rdx, qword ptr [r15]
00020582  8bc6                   mov eax, esi
00020584  403032                 xor byte ptr [rdx], sil
00020587  c1e808                 shr eax, 8
0002058A  304201                 xor byte ptr [rdx + 1], al
0002058D  8bc6                   mov eax, esi
0002058F  c1e810                 shr eax, 0x10
00020592  304202                 xor byte ptr [rdx + 2], al
00020595  8bc6                   mov eax, esi
00020597  c1e818                 shr eax, 0x18
0002059A  304203                 xor byte ptr [rdx + 3], al
0002059D  41b8937e0000           mov r8d, 0x7e93
000205A3  4584d2                 test r10b, r10b
000205A6  0f84affaffff           je 0x2005b
000205AC  4181f8937e0000         cmp r8d, 0x7e93
000205B3  0f84a2faffff           je 0x2005b
000205B9  4183818000000004       add dword ptr [r9 + 0x80], 4
000205C1  41b8937e0000           mov r8d, 0x7e93
000205C7  e98ffaffff             jmp 0x2005b
000205CC  83f803                 cmp eax, 3
000205CF  7532                   jne 0x20603
000205D1  85ed                   test ebp, ebp
000205D3  7404                   je 0x205d9
000205D5  418934a9               mov dword ptr [r9 + rbp*4], esi
000205D9  4183818000000004       add dword ptr [r9 + 0x80], 4
000205E1  4585f6                 test r14d, r14d
000205E4  74b7                   je 0x2059d
000205E6  0f31                   rdtsc 
000205E8  48c1e220               shl rdx, 0x20
000205EC  480bc2                 or rax, rdx
000205EF  2bc1                   sub eax, ecx
000205F1  c1e81c                 shr eax, 0x1c
000205F4  33c6                   xor eax, esi
000205F6  69c093010001           imul eax, eax, 0x1000193
000205FC  33c6                   xor eax, esi
000205FE  e974ffffff             jmp 0x20577
00020603  4183818000000004       add dword ptr [r9 + 0x80], 4
0002060B  eb90                   jmp 0x2059d
0002060D  4532d2                 xor r10b, r10b
00020610  41b848190000           mov r8d, 0x1948
00020616  4488542470             mov byte ptr [rsp + 0x70], r10b
0002061B  e93ffaffff             jmp 0x2005f
00020620  440fb62d80370400       movzx r13d, byte ptr [rip + 0x43780]   ; -> 0x63da8
00020628  4533ec                 xor r13d, r12d
0002062B  410fb6cd               movzx ecx, r13b
0002062F  418bed                 mov ebp, r13d
00020632  418bfd                 mov edi, r13d
00020635  c1ed07                 shr ebp, 7
00020638  458bdd                 mov r11d, r13d
0002063B  c1ef0c                 shr edi, 0xc
0002063E  418bd5                 mov edx, r13d
00020641  41c1eb0f               shr r11d, 0xf
00020645  c1ea14                 shr edx, 0x14
00020648  8d41c6                 lea eax, [rcx - 0x3a]
0002064B  4183e31f               and r11d, 0x1f
0002064F  41c1ed19               shr r13d, 0x19
00020653  83e21f                 and edx, 0x1f
00020656  44895c2478             mov dword ptr [rsp + 0x78], r11d
0002065B  83e51f                 and ebp, 0x1f
0002065E  89542468               mov dword ptr [rsp + 0x68], edx
00020662  83e707                 and edi, 7
00020665  83f833                 cmp eax, 0x33
00020668  771b                   ja 0x20685
0002066A  49b80100020000000800   movabs r8, 0x8000000020001
00020674  490fa3c0               bt r8, rax
00020678  730b                   jae 0x20685
0002067A  41b8452a0000           mov r8d, 0x2a45
00020680  e9daf9ffff             jmp 0x2005f
00020685  81f9a3000000           cmp ecx, 0xa3
0002068B  0f848b000000           je 0x2071c
00020691  83f95c                 cmp ecx, 0x5c
00020694  0f8482000000           je 0x2071c
0002069A  83f96e                 cmp ecx, 0x6e
0002069D  747d                   je 0x2071c
0002069F  81f9c8000000           cmp ecx, 0xc8
000206A5  746a                   je 0x20711
000206A7  83f97f                 cmp ecx, 0x7f
000206AA  7465                   je 0x20711
000206AC  81f9d7000000           cmp ecx, 0xd7
000206B2  7452                   je 0x20706
000206B4  81f98d000000           cmp ecx, 0x8d
000206BA  744a                   je 0x20706
000206BC  83f92e                 cmp ecx, 0x2e
000206BF  743a                   je 0x206fb
000206C1  81f992000000           cmp ecx, 0x92
000206C7  7432                   je 0x206fb
000206C9  81f9a1000000           cmp ecx, 0xa1
000206CF  742a                   je 0x206fb
000206D1  83f951                 cmp ecx, 0x51
000206D4  750b                   jne 0x206e1
000206D6  41b8f2d50000           mov r8d, 0xd5f2
000206DC  e97ef9ffff             jmp 0x2005f
000206E1  41b848190000           mov r8d, 0x1948
000206E7  83f973                 cmp ecx, 0x73
000206EA  0f856ff9ffff           jne 0x2005f
000206F0  41b814e70000           mov r8d, 0xe714
000206F6  e964f9ffff             jmp 0x2005f
000206FB  41b8dec30000           mov r8d, 0xc3de
00020701  e959f9ffff             jmp 0x2005f
00020706  41b8bca10000           mov r8d, 0xa1bc
0002070C  e94ef9ffff             jmp 0x2005f
00020711  41b87a8e0000           mov r8d, 0x8e7a
00020717  e943f9ffff             jmp 0x2005f
0002071C  41b8685c0000           mov r8d, 0x5c68
00020722  e938f9ffff             jmp 0x2005f
00020727  cc                     int3 
00020728  cc                     int3 
00020729  cc                     int3 
0002072A  cc                     int3 
0002072B  cc                     int3 
0002072C  cc                     int3 
0002072D  cc                     int3 
0002072E  cc                     int3 
0002072F  cc                     int3 
00020730  48894c2408             mov qword ptr [rsp + 8], rcx
00020735  55                     push rbp
00020736  53                     push rbx
00020737  56                     push rsi
00020738  57                     push rdi
00020739  4154                   push r12
0002073B  4155                   push r13
0002073D  4156                   push r14
0002073F  4157                   push r15
00020741  488dac24f8feffff       lea rbp, [rsp - 0x108]
00020749  4881ec08020000         sub rsp, 0x208
00020750  0fb64201               movzx eax, byte ptr [rdx + 1]
00020754  4c8bca                 mov r9, rdx
00020757  440fb602               movzx r8d, byte ptr [rdx]
0002075B  41c1e008               shl r8d, 8
0002075F  440bc0                 or r8d, eax
00020762  0fb64202               movzx eax, byte ptr [rdx + 2]
00020766  41c1e008               shl r8d, 8
0002076A  440bc0                 or r8d, eax
0002076D  0fb64203               movzx eax, byte ptr [rdx + 3]
00020771  0fb65204               movzx edx, byte ptr [rdx + 4]
00020775  c1e208                 shl edx, 8
00020778  41c1e008               shl r8d, 8
0002077C  440bc0                 or r8d, eax
0002077F  410fb64105             movzx eax, byte ptr [r9 + 5]
00020784  0bd0                   or edx, eax
00020786  44894500               mov dword ptr [rbp], r8d
0002078A  c1e208                 shl edx, 8
0002078D  410fb64106             movzx eax, byte ptr [r9 + 6]
00020792  0bd0                   or edx, eax
00020794  410fb64107             movzx eax, byte ptr [r9 + 7]
00020799  c1e208                 shl edx, 8
0002079C  0bd0                   or edx, eax
0002079E  410fb64109             movzx eax, byte ptr [r9 + 9]
000207A3  895504                 mov dword ptr [rbp + 4], edx
000207A6  410fb65108             movzx edx, byte ptr [r9 + 8]
000207AB  c1e208                 shl edx, 8
000207AE  0bd0                   or edx, eax
000207B0  410fb6410a             movzx eax, byte ptr [r9 + 0xa]
000207B5  c1e208                 shl edx, 8
000207B8  0bd0                   or edx, eax
000207BA  410fb6410b             movzx eax, byte ptr [r9 + 0xb]
000207BF  c1e208                 shl edx, 8
000207C2  0bd0                   or edx, eax
000207C4  410fb6410d             movzx eax, byte ptr [r9 + 0xd]
000207C9  895508                 mov dword ptr [rbp + 8], edx
000207CC  410fb6510c             movzx edx, byte ptr [r9 + 0xc]
000207D1  c1e208                 shl edx, 8
000207D4  0bd0                   or edx, eax
000207D6  410fb6410e             movzx eax, byte ptr [r9 + 0xe]
000207DB  c1e208                 shl edx, 8
000207DE  0bd0                   or edx, eax
000207E0  410fb6410f             movzx eax, byte ptr [r9 + 0xf]
000207E5  c1e208                 shl edx, 8
000207E8  0bd0                   or edx, eax
000207EA  410fb64111             movzx eax, byte ptr [r9 + 0x11]
000207EF  89550c                 mov dword ptr [rbp + 0xc], edx
000207F2  410fb65110             movzx edx, byte ptr [r9 + 0x10]
000207F7  c1e208                 shl edx, 8
000207FA  0bd0                   or edx, eax
000207FC  410fb64112             movzx eax, byte ptr [r9 + 0x12]
00020801  c1e208                 shl edx, 8
00020804  0bd0                   or edx, eax
00020806  410fb64113             movzx eax, byte ptr [r9 + 0x13]
0002080B  c1e208                 shl edx, 8
0002080E  0bd0                   or edx, eax
00020810  410fb64115             movzx eax, byte ptr [r9 + 0x15]
00020815  895510                 mov dword ptr [rbp + 0x10], edx
00020818  410fb65114             movzx edx, byte ptr [r9 + 0x14]
0002081D  c1e208                 shl edx, 8
00020820  0bd0                   or edx, eax
00020822  410fb64116             movzx eax, byte ptr [r9 + 0x16]
00020827  c1e208                 shl edx, 8
0002082A  0bd0                   or edx, eax
0002082C  410fb64117             movzx eax, byte ptr [r9 + 0x17]
00020831  c1e208                 shl edx, 8
00020834  0bd0                   or edx, eax
00020836  410fb64119             movzx eax, byte ptr [r9 + 0x19]
0002083B  895514                 mov dword ptr [rbp + 0x14], edx
0002083E  410fb65118             movzx edx, byte ptr [r9 + 0x18]
00020843  c1e208                 shl edx, 8
00020846  0bd0                   or edx, eax
00020848  410fb6411a             movzx eax, byte ptr [r9 + 0x1a]
0002084D  c1e208                 shl edx, 8
00020850  0bd0                   or edx, eax
00020852  410fb6411b             movzx eax, byte ptr [r9 + 0x1b]
00020857  c1e208                 shl edx, 8
0002085A  0bd0                   or edx, eax
0002085C  410fb6411d             movzx eax, byte ptr [r9 + 0x1d]
00020861  895518                 mov dword ptr [rbp + 0x18], edx
00020864  410fb6511c             movzx edx, byte ptr [r9 + 0x1c]
00020869  c1e208                 shl edx, 8
0002086C  0bd0                   or edx, eax
0002086E  410fb6411e             movzx eax, byte ptr [r9 + 0x1e]
00020873  c1e208                 shl edx, 8
00020876  0bd0                   or edx, eax
00020878  410fb6411f             movzx eax, byte ptr [r9 + 0x1f]
0002087D  c1e208                 shl edx, 8
00020880  0bd0                   or edx, eax
00020882  410fb64121             movzx eax, byte ptr [r9 + 0x21]
00020887  89551c                 mov dword ptr [rbp + 0x1c], edx
0002088A  410fb65120             movzx edx, byte ptr [r9 + 0x20]
0002088F  c1e208                 shl edx, 8
00020892  0bd0                   or edx, eax
00020894  410fb64122             movzx eax, byte ptr [r9 + 0x22]
00020899  c1e208                 shl edx, 8
0002089C  0bd0                   or edx, eax
0002089E  410fb64123             movzx eax, byte ptr [r9 + 0x23]
000208A3  c1e208                 shl edx, 8
000208A6  0bd0                   or edx, eax
000208A8  410fb64125             movzx eax, byte ptr [r9 + 0x25]
000208AD  895520                 mov dword ptr [rbp + 0x20], edx
000208B0  410fb65124             movzx edx, byte ptr [r9 + 0x24]
000208B5  c1e208                 shl edx, 8
000208B8  0bd0                   or edx, eax
000208BA  410fb64126             movzx eax, byte ptr [r9 + 0x26]
000208BF  c1e208                 shl edx, 8
000208C2  0bd0                   or edx, eax
000208C4  410fb64127             movzx eax, byte ptr [r9 + 0x27]
000208C9  c1e208                 shl edx, 8
000208CC  0bd0                   or edx, eax
000208CE  410fb64129             movzx eax, byte ptr [r9 + 0x29]
000208D3  895524                 mov dword ptr [rbp + 0x24], edx
000208D6  410fb65128             movzx edx, byte ptr [r9 + 0x28]
000208DB  c1e208                 shl edx, 8
000208DE  0bd0                   or edx, eax
000208E0  410fb6412a             movzx eax, byte ptr [r9 + 0x2a]
000208E5  c1e208                 shl edx, 8
000208E8  0bd0                   or edx, eax
000208EA  410fb6412b             movzx eax, byte ptr [r9 + 0x2b]
000208EF  c1e208                 shl edx, 8
000208F2  0bd0                   or edx, eax
000208F4  410fb6412d             movzx eax, byte ptr [r9 + 0x2d]
000208F9  895528                 mov dword ptr [rbp + 0x28], edx
000208FC  410fb6512c             movzx edx, byte ptr [r9 + 0x2c]
00020901  c1e208                 shl edx, 8
00020904  0bd0                   or edx, eax
00020906  410fb6412e             movzx eax, byte ptr [r9 + 0x2e]
0002090B  c1e208                 shl edx, 8
0002090E  0bd0                   or edx, eax
00020910  410fb6412f             movzx eax, byte ptr [r9 + 0x2f]
00020915  c1e208                 shl edx, 8
00020918  0bd0                   or edx, eax
0002091A  410fb64131             movzx eax, byte ptr [r9 + 0x31]
0002091F  89552c                 mov dword ptr [rbp + 0x2c], edx
00020922  410fb65130             movzx edx, byte ptr [r9 + 0x30]
00020927  c1e208                 shl edx, 8
0002092A  0bd0                   or edx, eax
0002092C  410fb64132             movzx eax, byte ptr [r9 + 0x32]
00020931  c1e208                 shl edx, 8
00020934  0bd0                   or edx, eax
00020936  410fb64133             movzx eax, byte ptr [r9 + 0x33]
0002093B  c1e208                 shl edx, 8
0002093E  0bd0                   or edx, eax
00020940  410fb64135             movzx eax, byte ptr [r9 + 0x35]
00020945  895530                 mov dword ptr [rbp + 0x30], edx
00020948  410fb65134             movzx edx, byte ptr [r9 + 0x34]
0002094D  c1e208                 shl edx, 8
00020950  0bd0                   or edx, eax
00020952  410fb64136             movzx eax, byte ptr [r9 + 0x36]
00020957  c1e208                 shl edx, 8
0002095A  0bd0                   or edx, eax
0002095C  410fb64137             movzx eax, byte ptr [r9 + 0x37]
00020961  c1e208                 shl edx, 8
00020964  0bd0                   or edx, eax
00020966  410fb64139             movzx eax, byte ptr [r9 + 0x39]
0002096B  895534                 mov dword ptr [rbp + 0x34], edx
0002096E  410fb65138             movzx edx, byte ptr [r9 + 0x38]
00020973  c1e208                 shl edx, 8
00020976  0bd0                   or edx, eax
00020978  410fb6413a             movzx eax, byte ptr [r9 + 0x3a]
0002097D  c1e208                 shl edx, 8
00020980  0bd0                   or edx, eax
00020982  410fb6413b             movzx eax, byte ptr [r9 + 0x3b]
00020987  b910000000             mov ecx, 0x10
0002098C  c1e208                 shl edx, 8
0002098F  0bd0                   or edx, eax
00020991  410fb6413d             movzx eax, byte ptr [r9 + 0x3d]
00020996  895538                 mov dword ptr [rbp + 0x38], edx
00020999  410fb6513c             movzx edx, byte ptr [r9 + 0x3c]
0002099E  c1e208                 shl edx, 8
000209A1  0bd0                   or edx, eax
000209A3  410fb6413e             movzx eax, byte ptr [r9 + 0x3e]
000209A8  c1e208                 shl edx, 8
000209AB  0bd0                   or edx, eax
000209AD  410fb6413f             movzx eax, byte ptr [r9 + 0x3f]
000209B2  c1e208                 shl edx, 8
000209B5  0bd0                   or edx, eax
000209B7  89553c                 mov dword ptr [rbp + 0x3c], edx
000209BA  660f1f440000           nop word ptr [rax + rax]
000209C0  448b548dc4             mov r10d, dword ptr [rbp + rcx*4 - 0x3c]
000209C5  458bea                 mov r13d, r10d
000209C8  448b4c8dc8             mov r9d, dword ptr [rbp + rcx*4 - 0x38]
000209CD  418bc2                 mov eax, r10d
000209D0  8b5c8df8               mov ebx, dword ptr [rbp + rcx*4 - 8]
000209D4  458bc1                 mov r8d, r9d
000209D7  8b7c8dfc               mov edi, dword ptr [rbp + rcx*4 - 4]
000209DB  8bd3                   mov edx, ebx
000209DD  448b5c8de8             mov r11d, dword ptr [rbp + rcx*4 - 0x18]
000209E2  448be7                 mov r12d, edi
000209E5  c1c807                 ror eax, 7
000209E8  41c1c812               ror r8d, 0x12
000209EC  41c1cd12               ror r13d, 0x12
000209F0  4433e8                 xor r13d, eax
000209F3  41c1cc13               ror r12d, 0x13
000209F7  c1ca13                 ror edx, 0x13
000209FA  418bc2                 mov eax, r10d
000209FD  c1e803                 shr eax, 3
00020A00  4433e8                 xor r13d, eax
00020A03  8bc3                   mov eax, ebx
00020A05  c1c811                 ror eax, 0x11
00020A08  33d0                   xor edx, eax
00020A0A  8bc3                   mov eax, ebx
00020A0C  c1e80a                 shr eax, 0xa
00020A0F  33d0                   xor edx, eax
00020A11  418bc1                 mov eax, r9d
00020A14  c1c807                 ror eax, 7
00020A17  4403ea                 add r13d, edx
00020A1A  44036c8dc0             add r13d, dword ptr [rbp + rcx*4 - 0x40]
00020A1F  4433c0                 xor r8d, eax
00020A22  44036c8de4             add r13d, dword ptr [rbp + rcx*4 - 0x1c]
00020A27  418bc1                 mov eax, r9d
00020A2A  c1e803                 shr eax, 3
00020A2D  458bfd                 mov r15d, r13d
00020A30  4433c0                 xor r8d, eax
00020A33  41c1cf13               ror r15d, 0x13
00020A37  8bc7                   mov eax, edi
00020A39  44896c8d00             mov dword ptr [rbp + rcx*4], r13d
00020A3E  c1c811                 ror eax, 0x11
00020A41  4433e0                 xor r12d, eax
00020A44  8bc7                   mov eax, edi
00020A46  c1e80a                 shr eax, 0xa
00020A49  4433e0                 xor r12d, eax
00020A4C  438d0403               lea eax, [r11 + r8]
00020A50  448b5c8dec             mov r11d, dword ptr [rbp + rcx*4 - 0x14]
00020A55  4403e0                 add r12d, eax
00020A58  4503e2                 add r12d, r10d
00020A5B  448b548dcc             mov r10d, dword ptr [rbp + rcx*4 - 0x34]
00020A60  458bc2                 mov r8d, r10d
00020A63  4489648d04             mov dword ptr [rbp + rcx*4 + 4], r12d
00020A68  41c1c812               ror r8d, 0x12
00020A6C  418bc2                 mov eax, r10d
00020A6F  c1c807                 ror eax, 7
00020A72  458bf4                 mov r14d, r12d
00020A75  4433c0                 xor r8d, eax
00020A78  41c1ce13               ror r14d, 0x13
00020A7C  418bc2                 mov eax, r10d
00020A7F  c1e803                 shr eax, 3
00020A82  4433c0                 xor r8d, eax
00020A85  418bc5                 mov eax, r13d
00020A88  c1c811                 ror eax, 0x11
00020A8B  4433f8                 xor r15d, eax
00020A8E  418bc5                 mov eax, r13d
00020A91  c1e80a                 shr eax, 0xa
00020A94  4433f8                 xor r15d, eax
00020A97  438d0403               lea eax, [r11 + r8]
00020A9B  448b5c8dd0             mov r11d, dword ptr [rbp + rcx*4 - 0x30]
00020AA0  4403f8                 add r15d, eax
00020AA3  4503f9                 add r15d, r9d
00020AA6  418bc3                 mov eax, r11d
00020AA9  448b4c8df0             mov r9d, dword ptr [rbp + rcx*4 - 0x10]
00020AAE  458bc3                 mov r8d, r11d
00020AB1  c1c807                 ror eax, 7
00020AB4  41c1c812               ror r8d, 0x12
00020AB8  4433c0                 xor r8d, eax
00020ABB  44897c8d08             mov dword ptr [rbp + rcx*4 + 8], r15d
00020AC0  418bc3                 mov eax, r11d
00020AC3  c1e803                 shr eax, 3
00020AC6  4433c0                 xor r8d, eax
00020AC9  418bc4                 mov eax, r12d
00020ACC  c1c811                 ror eax, 0x11
00020ACF  4433f0                 xor r14d, eax
00020AD2  418bd7                 mov edx, r15d
00020AD5  c1ca13                 ror edx, 0x13
00020AD8  418bc4                 mov eax, r12d
00020ADB  c1e80a                 shr eax, 0xa
00020ADE  4433f0                 xor r14d, eax
00020AE1  438d0401               lea eax, [r9 + r8]
00020AE5  448b4c8dd4             mov r9d, dword ptr [rbp + rcx*4 - 0x2c]
00020AEA  4403f0                 add r14d, eax
00020AED  4503f2                 add r14d, r10d
00020AF0  418bc1                 mov eax, r9d
00020AF3  448b548dd8             mov r10d, dword ptr [rbp + rcx*4 - 0x28]
00020AF8  418bf1                 mov esi, r9d
00020AFB  c1c807                 ror eax, 7
00020AFE  458bc2                 mov r8d, r10d
00020B01  41c1c812               ror r8d, 0x12
00020B05  c1ce12                 ror esi, 0x12
00020B08  33f0                   xor esi, eax
00020B0A  4489748d0c             mov dword ptr [rbp + rcx*4 + 0xc], r14d
00020B0F  418bc1                 mov eax, r9d
00020B12  c1e803                 shr eax, 3
00020B15  33f0                   xor esi, eax
00020B17  418bc7                 mov eax, r15d
00020B1A  c1c811                 ror eax, 0x11
00020B1D  33d0                   xor edx, eax
00020B1F  418bc7                 mov eax, r15d
00020B22  c1e80a                 shr eax, 0xa
00020B25  33d0                   xor edx, eax
00020B27  418bc2                 mov eax, r10d
00020B2A  c1c807                 ror eax, 7
00020B2D  03f2                   add esi, edx
00020B2F  03748df4               add esi, dword ptr [rbp + rcx*4 - 0xc]
00020B33  4433c0                 xor r8d, eax
00020B36  4103f3                 add esi, r11d
00020B39  418bc2                 mov eax, r10d
00020B3C  448b5c8de0             mov r11d, dword ptr [rbp + rcx*4 - 0x20]
00020B41  418bd6                 mov edx, r14d
00020B44  c1e803                 shr eax, 3
00020B47  4433c0                 xor r8d, eax
00020B4A  c1ca13                 ror edx, 0x13
00020B4D  4503c8                 add r9d, r8d
00020B50  89748d10               mov dword ptr [rbp + rcx*4 + 0x10], esi
00020B54  418bc6                 mov eax, r14d
00020B57  448bc6                 mov r8d, esi
00020B5A  c1c811                 ror eax, 0x11
00020B5D  33d0                   xor edx, eax
00020B5F  41c1c813               ror r8d, 0x13
00020B63  418bc6                 mov eax, r14d
00020B66  c1e80a                 shr eax, 0xa
00020B69  33d0                   xor edx, eax
00020B6B  8bc6                   mov eax, esi
00020B6D  c1c811                 ror eax, 0x11
00020B70  4403ca                 add r9d, edx
00020B73  4433c0                 xor r8d, eax
00020B76  4403cb                 add r9d, ebx
00020B79  8b5c8ddc               mov ebx, dword ptr [rbp + rcx*4 - 0x24]
00020B7D  8bc6                   mov eax, esi
00020B7F  c1e80a                 shr eax, 0xa
00020B82  8bd3                   mov edx, ebx
00020B84  4433c0                 xor r8d, eax
00020B87  c1ca12                 ror edx, 0x12
00020B8A  4503d0                 add r10d, r8d
00020B8D  44894c8d14             mov dword ptr [rbp + rcx*4 + 0x14], r9d
00020B92  458bc1                 mov r8d, r9d
00020B95  8bc3                   mov eax, ebx
00020B97  c1c807                 ror eax, 7
00020B9A  33d0                   xor edx, eax
00020B9C  41c1c813               ror r8d, 0x13
00020BA0  8bc3                   mov eax, ebx
00020BA2  c1e803                 shr eax, 3
00020BA5  33d0                   xor edx, eax
00020BA7  418bc1                 mov eax, r9d
00020BAA  41c1e90a               shr r9d, 0xa
00020BAE  4403d2                 add r10d, edx
00020BB1  c1c811                 ror eax, 0x11
00020BB4  4403d7                 add r10d, edi
00020BB7  4433c0                 xor r8d, eax
00020BBA  4489548d18             mov dword ptr [rbp + rcx*4 + 0x18], r10d
00020BBF  4533c1                 xor r8d, r9d
00020BC2  458bcb                 mov r9d, r11d
00020BC5  41c1c912               ror r9d, 0x12
00020BC9  8b7c8de4               mov edi, dword ptr [rbp + rcx*4 - 0x1c]
00020BCD  418bc3                 mov eax, r11d
00020BD0  c1c807                 ror eax, 7
00020BD3  4433c8                 xor r9d, eax
00020BD6  418bc3                 mov eax, r11d
00020BD9  c1e803                 shr eax, 3
00020BDC  4433c8                 xor r9d, eax
00020BDF  428d0403               lea eax, [rbx + r8]
00020BE3  8b5c8de8               mov ebx, dword ptr [rbp + rcx*4 - 0x18]
00020BE7  4403c8                 add r9d, eax
00020BEA  4503cd                 add r9d, r13d
00020BED  418bc2                 mov eax, r10d
00020BF0  c1c811                 ror eax, 0x11
00020BF3  458bc2                 mov r8d, r10d
00020BF6  41c1c813               ror r8d, 0x13
00020BFA  4433c0                 xor r8d, eax
00020BFD  41c1ea0a               shr r10d, 0xa
00020C01  4533c2                 xor r8d, r10d
00020C04  44894c8d1c             mov dword ptr [rbp + rcx*4 + 0x1c], r9d
00020C09  448bd7                 mov r10d, edi
00020C0C  8bc7                   mov eax, edi
00020C0E  c1c807                 ror eax, 7
00020C11  41c1ca12               ror r10d, 0x12
00020C15  4433d0                 xor r10d, eax
00020C18  8bc7                   mov eax, edi
00020C1A  c1e803                 shr eax, 3
00020C1D  4433d0                 xor r10d, eax
00020C20  438d0403               lea eax, [r11 + r8]
00020C24  448b5c8dec             mov r11d, dword ptr [rbp + rcx*4 - 0x14]
00020C29  4403d0                 add r10d, eax
00020C2C  418bc1                 mov eax, r9d
00020C2F  458bc1                 mov r8d, r9d
00020C32  c1c811                 ror eax, 0x11
00020C35  4503d4                 add r10d, r12d
00020C38  41c1c813               ror r8d, 0x13
00020C3C  418bd2                 mov edx, r10d
00020C3F  4433c0                 xor r8d, eax
00020C42  41c1e90a               shr r9d, 0xa
00020C46  4533c1                 xor r8d, r9d
00020C49  c1ca13                 ror edx, 0x13
00020C4C  448bcb                 mov r9d, ebx
00020C4F  4489548d20             mov dword ptr [rbp + rcx*4 + 0x20], r10d
00020C54  41c1c912               ror r9d, 0x12
00020C58  8bc3                   mov eax, ebx
00020C5A  c1c807                 ror eax, 7
00020C5D  4433c8                 xor r9d, eax
00020C60  8bc3                   mov eax, ebx
00020C62  c1e803                 shr eax, 3
00020C65  4433c8                 xor r9d, eax
00020C68  438d0407               lea eax, [r15 + r8]
00020C6C  4403c8                 add r9d, eax
00020C6F  458bc3                 mov r8d, r11d
00020C72  41c1c812               ror r8d, 0x12
00020C76  4403cf                 add r9d, edi
00020C79  418bc3                 mov eax, r11d
00020C7C  44894c8d24             mov dword ptr [rbp + rcx*4 + 0x24], r9d
00020C81  c1c807                 ror eax, 7
00020C84  4433c0                 xor r8d, eax
00020C87  418bc3                 mov eax, r11d
00020C8A  c1e803                 shr eax, 3
00020C8D  4433c0                 xor r8d, eax
00020C90  418bc2                 mov eax, r10d
00020C93  c1c811                 ror eax, 0x11
00020C96  33d0                   xor edx, eax
00020C98  41c1ea0a               shr r10d, 0xa
00020C9C  4133d2                 xor edx, r10d
00020C9F  438d0406               lea eax, [r14 + r8]
00020CA3  03d0                   add edx, eax
00020CA5  03d3                   add edx, ebx
00020CA7  89548d28               mov dword ptr [rbp + rcx*4 + 0x28], edx
00020CAB  8b548df0               mov edx, dword ptr [rbp + rcx*4 - 0x10]
00020CAF  448bc2                 mov r8d, edx
00020CB2  8bc2                   mov eax, edx
00020CB4  41c1c812               ror r8d, 0x12
00020CB8  c1c807                 ror eax, 7
00020CBB  4433c0                 xor r8d, eax
00020CBE  c1ea03                 shr edx, 3
00020CC1  4433c2                 xor r8d, edx
00020CC4  418bc1                 mov eax, r9d
00020CC7  418bd1                 mov edx, r9d
00020CCA  c1ca13                 ror edx, 0x13
00020CCD  c1c811                 ror eax, 0x11
00020CD0  33d0                   xor edx, eax
00020CD2  41c1e90a               shr r9d, 0xa
00020CD6  4133d1                 xor edx, r9d
00020CD9  428d0406               lea eax, [rsi + r8]
00020CDD  03d0                   add edx, eax
00020CDF  4103d3                 add edx, r11d
00020CE2  89548d2c               mov dword ptr [rbp + rcx*4 + 0x2c], edx
00020CE6  4883c10c               add rcx, 0xc
00020CEA  4883f940               cmp rcx, 0x40
00020CEE  0f85ccfcffff           jne 0x209c0
00020CF4  488b8d50010000         mov rcx, qword ptr [rbp + 0x150]
00020CFB  4533ed                 xor r13d, r13d
00020CFE  c70424982f8a42         mov dword ptr [rsp], 0x428a2f98
00020D05  c744240491443771       mov dword ptr [rsp + 4], 0x71374491
00020D0D  c7442408cffbc0b5       mov dword ptr [rsp + 8], 0xb5c0fbcf
00020D15  448b11                 mov r10d, dword ptr [rcx]
00020D18  8b7904                 mov edi, dword ptr [rcx + 4]
00020D1B  448b5908               mov r11d, dword ptr [rcx + 8]
00020D1F  8b590c                 mov ebx, dword ptr [rcx + 0xc]
00020D22  8b7110                 mov esi, dword ptr [rcx + 0x10]
00020D25  448b6114               mov r12d, dword ptr [rcx + 0x14]
00020D29  448b7118               mov r14d, dword ptr [rcx + 0x18]
00020D2D  448b791c               mov r15d, dword ptr [rcx + 0x1c]
00020D31  c744240ca5dbb5e9       mov dword ptr [rsp + 0xc], 0xe9b5dba5
00020D39  c74424105bc25639       mov dword ptr [rsp + 0x10], 0x3956c25b
00020D41  c7442414f111f159       mov dword ptr [rsp + 0x14], 0x59f111f1
00020D49  c7442418a4823f92       mov dword ptr [rsp + 0x18], 0x923f82a4
00020D51  c744241cd55e1cab       mov dword ptr [rsp + 0x1c], 0xab1c5ed5
00020D59  c744242098aa07d8       mov dword ptr [rsp + 0x20], 0xd807aa98
00020D61  c7442424015b8312       mov dword ptr [rsp + 0x24], 0x12835b01
00020D69  c7442428be853124       mov dword ptr [rsp + 0x28], 0x243185be
00020D71  c744242cc37d0c55       mov dword ptr [rsp + 0x2c], 0x550c7dc3
00020D79  c7442430745dbe72       mov dword ptr [rsp + 0x30], 0x72be5d74
00020D81  c7442434feb1de80       mov dword ptr [rsp + 0x34], 0x80deb1fe
00020D89  c7442438a706dc9b       mov dword ptr [rsp + 0x38], 0x9bdc06a7
00020D91  c744243c74f19bc1       mov dword ptr [rsp + 0x3c], 0xc19bf174
00020D99  c7442440c1699be4       mov dword ptr [rsp + 0x40], 0xe49b69c1
00020DA1  c74424448647beef       mov dword ptr [rsp + 0x44], 0xefbe4786
00020DA9  c7442448c69dc10f       mov dword ptr [rsp + 0x48], 0xfc19dc6
00020DB1  c744244ccca10c24       mov dword ptr [rsp + 0x4c], 0x240ca1cc
00020DB9  c74424506f2ce92d       mov dword ptr [rsp + 0x50], 0x2de92c6f
00020DC1  c7442454aa84744a       mov dword ptr [rsp + 0x54], 0x4a7484aa
00020DC9  c7442458dca9b05c       mov dword ptr [rsp + 0x58], 0x5cb0a9dc
00020DD1  c744245cda88f976       mov dword ptr [rsp + 0x5c], 0x76f988da
00020DD9  c744246052513e98       mov dword ptr [rsp + 0x60], 0x983e5152
00020DE1  c74424646dc631a8       mov dword ptr [rsp + 0x64], 0xa831c66d
00020DE9  c7442468c82703b0       mov dword ptr [rsp + 0x68], 0xb00327c8
00020DF1  c744246cc77f59bf       mov dword ptr [rsp + 0x6c], 0xbf597fc7
00020DF9  c7442470f30be0c6       mov dword ptr [rsp + 0x70], 0xc6e00bf3
00020E01  c74424744791a7d5       mov dword ptr [rsp + 0x74], 0xd5a79147
00020E09  c74424785163ca06       mov dword ptr [rsp + 0x78], 0x6ca6351
00020E11  c744247c67292914       mov dword ptr [rsp + 0x7c], 0x14292967
00020E19  c74580850ab727         mov dword ptr [rbp - 0x80], 0x27b70a85
00020E20  c7458438211b2e         mov dword ptr [rbp - 0x7c], 0x2e1b2138
00020E27  c74588fc6d2c4d         mov dword ptr [rbp - 0x78], 0x4d2c6dfc
00020E2E  c7458c130d3853         mov dword ptr [rbp - 0x74], 0x53380d13
00020E35  c7459054730a65         mov dword ptr [rbp - 0x70], 0x650a7354
00020E3C  c74594bb0a6a76         mov dword ptr [rbp - 0x6c], 0x766a0abb
00020E43  c745982ec9c281         mov dword ptr [rbp - 0x68], 0x81c2c92e
00020E4A  c7459c852c7292         mov dword ptr [rbp - 0x64], 0x92722c85
00020E51  c745a0a1e8bfa2         mov dword ptr [rbp - 0x60], 0xa2bfe8a1
00020E58  c745a44b661aa8         mov dword ptr [rbp - 0x5c], 0xa81a664b
00020E5F  c745a8708b4bc2         mov dword ptr [rbp - 0x58], 0xc24b8b70
00020E66  c745aca3516cc7         mov dword ptr [rbp - 0x54], 0xc76c51a3
00020E6D  c745b019e892d1         mov dword ptr [rbp - 0x50], 0xd192e819
00020E74  c745b4240699d6         mov dword ptr [rbp - 0x4c], 0xd6990624
00020E7B  c745b885350ef4         mov dword ptr [rbp - 0x48], 0xf40e3585
00020E82  c745bc70a06a10         mov dword ptr [rbp - 0x44], 0x106aa070
00020E89  c745c016c1a419         mov dword ptr [rbp - 0x40], 0x19a4c116
00020E90  c745c4086c371e         mov dword ptr [rbp - 0x3c], 0x1e376c08
00020E97  c745c84c774827         mov dword ptr [rbp - 0x38], 0x2748774c
00020E9E  c745ccb5bcb034         mov dword ptr [rbp - 0x34], 0x34b0bcb5
00020EA5  c745d0b30c1c39         mov dword ptr [rbp - 0x30], 0x391c0cb3
00020EAC  c745d44aaad84e         mov dword ptr [rbp - 0x2c], 0x4ed8aa4a
00020EB3  c745d84fca9c5b         mov dword ptr [rbp - 0x28], 0x5b9cca4f
00020EBA  c745dcf36f2e68         mov dword ptr [rbp - 0x24], 0x682e6ff3
00020EC1  c745e0ee828f74         mov dword ptr [rbp - 0x20], 0x748f82ee
00020EC8  c745e46f63a578         mov dword ptr [rbp - 0x1c], 0x78a5636f
00020ECF  c745e81478c884         mov dword ptr [rbp - 0x18], 0x84c87814
00020ED6  c745ec0802c78c         mov dword ptr [rbp - 0x14], 0x8cc70208
00020EDD  c745f0faffbe90         mov dword ptr [rbp - 0x10], 0x90befffa
00020EE4  c745f4eb6c50a4         mov dword ptr [rbp - 0xc], 0xa4506ceb
00020EEB  c745f8f7a3f9be         mov dword ptr [rbp - 8], 0xbef9a3f7
00020EF2  c745fcf27871c6         mov dword ptr [rbp - 4], 0xc67178f2
00020EF9  0f1f8000000000         nop dword ptr [rax]
00020F00  448bce                 mov r9d, esi
00020F03  8bc6                   mov eax, esi
00020F05  c1c80b                 ror eax, 0xb
00020F08  8bd6                   mov edx, esi
00020F0A  41c1c919               ror r9d, 0x19
00020F0E  f7d2                   not edx
00020F10  4433c8                 xor r9d, eax
00020F13  4123d6                 and edx, r14d
00020F16  8bc6                   mov eax, esi
00020F18  458bc2                 mov r8d, r10d
00020F1B  c1c806                 ror eax, 6
00020F1E  4433c8                 xor r9d, eax
00020F21  41c1c816               ror r8d, 0x16
00020F25  418bc4                 mov eax, r12d
00020F28  23c6                   and eax, esi
00020F2A  33d0                   xor edx, eax
00020F2C  418bc2                 mov eax, r10d
00020F2F  4403ca                 add r9d, edx
00020F32  c1c80d                 ror eax, 0xd
00020F35  46030cac               add r9d, dword ptr [rsp + r13*4]
00020F39  4433c0                 xor r8d, eax
00020F3C  46034cad00             add r9d, dword ptr [rbp + r13*4]
00020F41  418bc2                 mov eax, r10d
00020F44  c1c802                 ror eax, 2
00020F47  4503cf                 add r9d, r15d
00020F4A  4433c0                 xor r8d, eax
00020F4D  8bc7                   mov eax, edi
00020F4F  4123c2                 and eax, r10d
00020F52  458d3c19               lea r15d, [r9 + rbx]
00020F56  8bdf                   mov ebx, edi
00020F58  4133da                 xor ebx, r10d
00020F5B  418bd7                 mov edx, r15d
00020F5E  f7d2                   not edx
00020F60  4123db                 and ebx, r11d
00020F63  33d8                   xor ebx, eax
00020F65  4123d4                 and edx, r12d
00020F68  438d0401               lea eax, [r9 + r8]
00020F6C  458bcf                 mov r9d, r15d
00020F6F  03d8                   add ebx, eax
00020F71  41c1c919               ror r9d, 0x19
00020F75  418bc7                 mov eax, r15d
00020F78  448bc3                 mov r8d, ebx
00020F7B  c1c80b                 ror eax, 0xb
00020F7E  4433c8                 xor r9d, eax
00020F81  41c1c816               ror r8d, 0x16
00020F85  418bc7                 mov eax, r15d
00020F88  c1c806                 ror eax, 6
00020F8B  4433c8                 xor r9d, eax
00020F8E  418bc7                 mov eax, r15d
00020F91  23c6                   and eax, esi
00020F93  33d0                   xor edx, eax
00020F95  8bc3                   mov eax, ebx
00020F97  4403ca                 add r9d, edx
00020F9A  c1c80d                 ror eax, 0xd
00020F9D  46034cac04             add r9d, dword ptr [rsp + r13*4 + 4]
00020FA2  4433c0                 xor r8d, eax
00020FA5  46034cad04             add r9d, dword ptr [rbp + r13*4 + 4]
00020FAA  8bc3                   mov eax, ebx
00020FAC  c1c802                 ror eax, 2
00020FAF  4503ce                 add r9d, r14d
00020FB2  4433c0                 xor r8d, eax
00020FB5  8bd3                   mov edx, ebx
00020FB7  4133d2                 xor edx, r10d
00020FBA  8bc3                   mov eax, ebx
00020FBC  4123c2                 and eax, r10d
00020FBF  23d7                   and edx, edi
00020FC1  33c2                   xor eax, edx
00020FC3  478d3419               lea r14d, [r9 + r11]
00020FC7  4103c0                 add eax, r8d
00020FCA  418bd6                 mov edx, r14d
00020FCD  f7d2                   not edx
00020FCF  458d1c01               lea r11d, [r9 + rax]
00020FD3  458bce                 mov r9d, r14d
00020FD6  41c1c919               ror r9d, 0x19
00020FDA  418bc6                 mov eax, r14d
00020FDD  c1c80b                 ror eax, 0xb
00020FE0  4433c8                 xor r9d, eax
00020FE3  418bc6                 mov eax, r14d
00020FE6  c1c806                 ror eax, 6
00020FE9  4433c8                 xor r9d, eax
00020FEC  23d6                   and edx, esi
00020FEE  418bc6                 mov eax, r14d
00020FF1  458bc3                 mov r8d, r11d
00020FF4  4123c7                 and eax, r15d
00020FF7  41c1c816               ror r8d, 0x16
00020FFB  33d0                   xor edx, eax
00020FFD  418bc3                 mov eax, r11d
00021000  c1c80d                 ror eax, 0xd
00021003  4403ca                 add r9d, edx
00021006  46034cac08             add r9d, dword ptr [rsp + r13*4 + 8]
0002100B  4433c0                 xor r8d, eax
0002100E  46034cad08             add r9d, dword ptr [rbp + r13*4 + 8]
00021013  418bc3                 mov eax, r11d
00021016  c1c802                 ror eax, 2
00021019  4503cc                 add r9d, r12d
0002101C  4433c0                 xor r8d, eax
0002101F  418bd3                 mov edx, r11d
00021022  33d3                   xor edx, ebx
00021024  418bc3                 mov eax, r11d
00021027  23c3                   and eax, ebx
00021029  4123d2                 and edx, r10d
0002102C  33c2                   xor eax, edx
0002102E  458d2439               lea r12d, [r9 + rdi]
00021032  4103c0                 add eax, r8d
00021035  418bd4                 mov edx, r12d
00021038  f7d2                   not edx
0002103A  4123d7                 and edx, r15d
0002103D  418d3c01               lea edi, [r9 + rax]
00021041  458bcc                 mov r9d, r12d
00021044  41c1c919               ror r9d, 0x19
00021048  418bc4                 mov eax, r12d
0002104B  c1c80b                 ror eax, 0xb
0002104E  448bc7                 mov r8d, edi
00021051  4433c8                 xor r9d, eax
00021054  41c1c816               ror r8d, 0x16
00021058  418bc4                 mov eax, r12d
0002105B  c1c806                 ror eax, 6
0002105E  4433c8                 xor r9d, eax
00021061  418bc4                 mov eax, r12d
00021064  4123c6                 and eax, r14d
00021067  33d0                   xor edx, eax
00021069  8bc7                   mov eax, edi
0002106B  c1c80d                 ror eax, 0xd
0002106E  4403ca                 add r9d, edx
00021071  46034cac0c             add r9d, dword ptr [rsp + r13*4 + 0xc]
00021076  4433c0                 xor r8d, eax
00021079  46034cad0c             add r9d, dword ptr [rbp + r13*4 + 0xc]
0002107E  8bc7                   mov eax, edi
00021080  c1c802                 ror eax, 2
00021083  4403ce                 add r9d, esi
00021086  4433c0                 xor r8d, eax
00021089  8bd7                   mov edx, edi
0002108B  4133d3                 xor edx, r11d
0002108E  8bc7                   mov eax, edi
00021090  4123c3                 and eax, r11d
00021093  23d3                   and edx, ebx
00021095  33c2                   xor eax, edx
00021097  438d3411               lea esi, [r9 + r10]
0002109B  4103c0                 add eax, r8d
0002109E  4983c504               add r13, 4
000210A2  468d1408               lea r10d, [rax + r9]
000210A6  4983fd40               cmp r13, 0x40
000210AA  0f8550feffff           jne 0x20f00
000210B0  440111                 add dword ptr [rcx], r10d
000210B3  017904                 add dword ptr [rcx + 4], edi
000210B6  44015908               add dword ptr [rcx + 8], r11d
000210BA  01590c                 add dword ptr [rcx + 0xc], ebx
000210BD  017110                 add dword ptr [rcx + 0x10], esi
000210C0  44016114               add dword ptr [rcx + 0x14], r12d
000210C4  44017118               add dword ptr [rcx + 0x18], r14d
000210C8  4401791c               add dword ptr [rcx + 0x1c], r15d
000210CC  4881c408020000         add rsp, 0x208
000210D3  415f                   pop r15
000210D5  415e                   pop r14
000210D7  415d                   pop r13
000210D9  415c                   pop r12
000210DB  5f                     pop rdi
000210DC  5e                     pop rsi
000210DD  5b                     pop rbx
000210DE  5d                     pop rbp
000210DF  c3                     ret 
000210E0  4053                   push rbx
000210E2  55                     push rbp
000210E3  56                     push rsi
000210E4  57                     push rdi
000210E5  4883ec28               sub rsp, 0x28
000210E9  8b4120                 mov eax, dword ptr [rcx + 0x20]
000210EC  498bf8                 mov rdi, r8
000210EF  448bc0                 mov r8d, eax
000210F2  488bea                 mov rbp, rdx
000210F5  41c1e803               shr r8d, 3
000210F9  488bf1                 mov rsi, rcx
000210FC  4183e03f               and r8d, 0x3f
00021100  448d0cfd00000000       lea r9d, [rdi*8]
00021108  4103c1                 add eax, r9d
0002110B  894120                 mov dword ptr [rcx + 0x20], eax
0002110E  413bc1                 cmp eax, r9d
00021111  7303                   jae 0x21116
00021113  ff4124                 inc dword ptr [rcx + 0x24]
00021116  bb40000000             mov ebx, 0x40
0002111B  8bc7                   mov eax, edi
0002111D  c1e81d                 shr eax, 0x1d
00021120  412bd8                 sub ebx, r8d
00021123  014124                 add dword ptr [rcx + 0x24], eax
00021126  483bfb                 cmp rdi, rbx
00021129  7243                   jb 0x2116e
0002112B  418bc8                 mov ecx, r8d
0002112E  448bc3                 mov r8d, ebx
00021131  4883c128               add rcx, 0x28
00021135  4803ce                 add rcx, rsi
00021138  e8a36a0300             call 0x57be0
0002113D  488d5628               lea rdx, [rsi + 0x28]
00021141  488bce                 mov rcx, rsi
00021144  e8e7f5ffff             call 0x20730
00021149  8d4b3f                 lea ecx, [rbx + 0x3f]
0002114C  483bcf                 cmp rcx, rdi
0002114F  7318                   jae 0x21169
00021151  8bd3                   mov edx, ebx
00021153  488bce                 mov rcx, rsi
00021156  4803d5                 add rdx, rbp
00021159  e8d2f5ffff             call 0x20730
0002115E  83c340                 add ebx, 0x40
00021161  8d4b3f                 lea ecx, [rbx + 0x3f]
00021164  483bcf                 cmp rcx, rdi
00021167  72e8                   jb 0x21151
00021169  4533c0                 xor r8d, r8d
0002116C  eb02                   jmp 0x21170
0002116E  33db                   xor ebx, ebx
00021170  418bc8                 mov ecx, r8d
00021173  488d142b               lea rdx, [rbx + rbp]
00021177  8bc3                   mov eax, ebx
00021179  4883c628               add rsi, 0x28
0002117D  482bf8                 sub rdi, rax
00021180  4803ce                 add rcx, rsi
00021183  4c8bc7                 mov r8, rdi
00021186  4883c428               add rsp, 0x28
0002118A  5f                     pop rdi
0002118B  5e                     pop rsi
0002118C  5d                     pop rbp
0002118D  5b                     pop rbx
0002118E  e94d6a0300             jmp 0x57be0
00021193  cc                     int3 
00021194  cc                     int3 
00021195  cc                     int3 
00021196  cc                     int3 
00021197  cc                     int3 
00021198  cc                     int3 
00021199  cc                     int3 
0002119A  cc                     int3 
0002119B  cc                     int3 
0002119C  cc                     int3 
0002119D  cc                     int3 
0002119E  cc                     int3 
0002119F  cc                     int3 
000211A0  4c8bdc                 mov r11, rsp
000211A3  53                     push rbx
000211A4  55                     push rbp
000211A5  56                     push rsi
000211A6  57                     push rdi
000211A7  4154                   push r12
000211A9  4155                   push r13
000211AB  4156                   push r14
000211AD  4157                   push r15
000211AF  4883ec68               sub rsp, 0x68
000211B3  448b4920               mov r9d, dword ptr [rcx + 0x20]
000211B7  4c8bfa                 mov r15, rdx
000211BA  448b4124               mov r8d, dword ptr [rcx + 0x24]
000211BE  418be9                 mov ebp, r9d
000211C1  c1ed03                 shr ebp, 3
000211C4  418bc0                 mov eax, r8d
000211C7  c1e818                 shr eax, 0x18
000211CA  83e53f                 and ebp, 0x3f
000211CD  41884308               mov byte ptr [r11 + 8], al
000211D1  488bf1                 mov rsi, rcx
000211D4  418bc1                 mov eax, r9d
000211D7  4588430b               mov byte ptr [r11 + 0xb], r8b
000211DB  c1e818                 shr eax, 0x18
000211DE  4188430c               mov byte ptr [r11 + 0xc], al
000211E2  418bc0                 mov eax, r8d
000211E5  c1e810                 shr eax, 0x10
000211E8  41884309               mov byte ptr [r11 + 9], al
000211EC  418bc1                 mov eax, r9d
000211EF  c1e810                 shr eax, 0x10
000211F2  4188430d               mov byte ptr [r11 + 0xd], al
000211F6  418bc0                 mov eax, r8d
000211F9  c1e808                 shr eax, 8
000211FC  4188430a               mov byte ptr [r11 + 0xa], al
00021200  418bc1                 mov eax, r9d
00021203  c1e808                 shr eax, 8
00021206  4188430e               mov byte ptr [r11 + 0xe], al
0002120A  418d4108               lea eax, [r9 + 8]
0002120E  45884b0f               mov byte ptr [r11 + 0xf], r9b
00021212  894120                 mov dword ptr [rcx + 0x20], eax
00021215  83f808                 cmp eax, 8
00021218  7303                   jae 0x2121d
0002121A  ff4124                 inc dword ptr [rcx + 0x24]
0002121D  bb40000000             mov ebx, 0x40
00021222  8bcd                   mov ecx, ebp
00021224  8bfb                   mov edi, ebx
00021226  4c8d2d53c5feff         lea r13, [rip - 0x13aad]   ; -> 0xd780
0002122D  2bfd                   sub edi, ebp
0002122F  83ff01                 cmp edi, 1
00021232  7747                   ja 0x2127b
00021234  4883c128               add rcx, 0x28
00021238  448bc7                 mov r8d, edi
0002123B  4803ce                 add rcx, rsi
0002123E  498bd5                 mov rdx, r13
00021241  e89a690300             call 0x57be0
00021246  488d5628               lea rdx, [rsi + 0x28]
0002124A  488bce                 mov rcx, rsi
0002124D  e8def4ffff             call 0x20730
00021252  8d473f                 lea eax, [rdi + 0x3f]
00021255  83f801                 cmp eax, 1
00021258  731d                   jae 0x21277
0002125A  660f1f440000           nop word ptr [rax + rax]
00021260  8bd7                   mov edx, edi
00021262  488bce                 mov rcx, rsi
00021265  4903d5                 add rdx, r13
00021268  e8c3f4ffff             call 0x20730
0002126D  03fb                   add edi, ebx
0002126F  8d473f                 lea eax, [rdi + 0x3f]
00021272  83f801                 cmp eax, 1
00021275  72e9                   jb 0x21260
00021277  33c9                   xor ecx, ecx
00021279  eb02                   jmp 0x2127d
0002127B  33ff                   xor edi, edi
0002127D  8bc7                   mov eax, edi
0002127F  4a8d142f               lea rdx, [rdi + r13]
00021283  4883c128               add rcx, 0x28
00021287  41b801000000           mov r8d, 1
0002128D  4c2bc0                 sub r8, rax
00021290  4803ce                 add rcx, rsi
00021293  e848690300             call 0x57be0
00021298  0f57c0                 xorps xmm0, xmm0
0002129B  488d542420             lea rdx, [rsp + 0x20]
000212A0  b977000000             mov ecx, 0x77
000212A5  41b837000000           mov r8d, 0x37
000212AB  2bcd                   sub ecx, ebp
000212AD  442bc5                 sub r8d, ebp
000212B0  83fd38                 cmp ebp, 0x38
000212B3  0f11442420             movups xmmword ptr [rsp + 0x20], xmm0
000212B8  440f43c1               cmovae r8d, ecx
000212BC  488bce                 mov rcx, rsi
000212BF  0f11442430             movups xmmword ptr [rsp + 0x30], xmm0
000212C4  0f11442440             movups xmmword ptr [rsp + 0x40], xmm0
000212C9  0f11442450             movups xmmword ptr [rsp + 0x50], xmm0
000212CE  e80dfeffff             call 0x210e0
000212D3  8b4620                 mov eax, dword ptr [rsi + 0x20]
000212D6  8bc8                   mov ecx, eax
000212D8  c1e903                 shr ecx, 3
000212DB  03c3                   add eax, ebx
000212DD  83e13f                 and ecx, 0x3f
000212E0  894620                 mov dword ptr [rsi + 0x20], eax
000212E3  3bc3                   cmp eax, ebx
000212E5  7303                   jae 0x212ea
000212E7  ff4624                 inc dword ptr [rsi + 0x24]
000212EA  2bd9                   sub ebx, ecx
000212EC  83fb08                 cmp ebx, 8
000212EF  7753                   ja 0x21344
000212F1  4883c128               add rcx, 0x28
000212F5  448bc3                 mov r8d, ebx
000212F8  4803ce                 add rcx, rsi
000212FB  488d9424b0000000       lea rdx, [rsp + 0xb0]
00021303  e8d8680300             call 0x57be0
00021308  488d5628               lea rdx, [rsi + 0x28]
0002130C  488bce                 mov rcx, rsi
0002130F  e81cf4ffff             call 0x20730
00021314  8d433f                 lea eax, [rbx + 0x3f]
00021317  83f808                 cmp eax, 8
0002131A  7324                   jae 0x21340
0002131C  0f1f4000               nop dword ptr [rax]
00021320  8bc3                   mov eax, ebx
00021322  488d9424b0000000       lea rdx, [rsp + 0xb0]
0002132A  4803d0                 add rdx, rax
0002132D  488bce                 mov rcx, rsi
00021330  e8fbf3ffff             call 0x20730
00021335  83c340                 add ebx, 0x40
00021338  8d433f                 lea eax, [rbx + 0x3f]
0002133B  83f808                 cmp eax, 8
0002133E  72e0                   jb 0x21320
00021340  33c9                   xor ecx, ecx
00021342  eb02                   jmp 0x21346
00021344  33db                   xor ebx, ebx
00021346  8bc3                   mov eax, ebx
00021348  488d9424b0000000       lea rdx, [rsp + 0xb0]
00021350  4883c128               add rcx, 0x28
00021354  41b808000000           mov r8d, 8
0002135A  4c2bc0                 sub r8, rax
0002135D  4803d0                 add rdx, rax
00021360  4803ce                 add rcx, rsi
00021363  e878680300             call 0x57be0
00021368  0fb64603               movzx eax, byte ptr [rsi + 3]
0002136C  418807                 mov byte ptr [r15], al
0002136F  0fb64607               movzx eax, byte ptr [rsi + 7]
00021373  41884704               mov byte ptr [r15 + 4], al
00021377  0fb6460b               movzx eax, byte ptr [rsi + 0xb]
0002137B  41884708               mov byte ptr [r15 + 8], al
0002137F  0fb6460f               movzx eax, byte ptr [rsi + 0xf]
00021383  4188470c               mov byte ptr [r15 + 0xc], al
00021387  0fb64613               movzx eax, byte ptr [rsi + 0x13]
0002138B  41884710               mov byte ptr [r15 + 0x10], al
0002138F  0fb64617               movzx eax, byte ptr [rsi + 0x17]
00021393  41884714               mov byte ptr [r15 + 0x14], al
00021397  0fb6461b               movzx eax, byte ptr [rsi + 0x1b]
0002139B  41884718               mov byte ptr [r15 + 0x18], al
0002139F  0fb6461f               movzx eax, byte ptr [rsi + 0x1f]
000213A3  4188471c               mov byte ptr [r15 + 0x1c], al
000213A7  0fb64602               movzx eax, byte ptr [rsi + 2]
000213AB  41884701               mov byte ptr [r15 + 1], al
000213AF  0fb64606               movzx eax, byte ptr [rsi + 6]
000213B3  41884705               mov byte ptr [r15 + 5], al
000213B7  0fb6460a               movzx eax, byte ptr [rsi + 0xa]
000213BB  41884709               mov byte ptr [r15 + 9], al
000213BF  0fb6460e               movzx eax, byte ptr [rsi + 0xe]
000213C3  4188470d               mov byte ptr [r15 + 0xd], al
000213C7  0fb64612               movzx eax, byte ptr [rsi + 0x12]
000213CB  41884711               mov byte ptr [r15 + 0x11], al
000213CF  0fb64616               movzx eax, byte ptr [rsi + 0x16]
000213D3  41884715               mov byte ptr [r15 + 0x15], al
000213D7  0fb6461a               movzx eax, byte ptr [rsi + 0x1a]
000213DB  41884719               mov byte ptr [r15 + 0x19], al
000213DF  0fb6461e               movzx eax, byte ptr [rsi + 0x1e]
000213E3  4188471d               mov byte ptr [r15 + 0x1d], al
000213E7  8b06                   mov eax, dword ptr [rsi]
000213E9  c1e808                 shr eax, 8
000213EC  41884702               mov byte ptr [r15 + 2], al
000213F0  8b4604                 mov eax, dword ptr [rsi + 4]
000213F3  c1e808                 shr eax, 8
000213F6  41884706               mov byte ptr [r15 + 6], al
000213FA  8b4608                 mov eax, dword ptr [rsi + 8]
000213FD  c1e808                 shr eax, 8
00021400  4188470a               mov byte ptr [r15 + 0xa], al
00021404  8b460c                 mov eax, dword ptr [rsi + 0xc]
00021407  c1e808                 shr eax, 8
0002140A  4188470e               mov byte ptr [r15 + 0xe], al
0002140E  8b4610                 mov eax, dword ptr [rsi + 0x10]
00021411  c1e808                 shr eax, 8
00021414  41884712               mov byte ptr [r15 + 0x12], al
00021418  8b4614                 mov eax, dword ptr [rsi + 0x14]
0002141B  c1e808                 shr eax, 8
0002141E  41884716               mov byte ptr [r15 + 0x16], al
00021422  8b4618                 mov eax, dword ptr [rsi + 0x18]
00021425  c1e808                 shr eax, 8
00021428  4188471a               mov byte ptr [r15 + 0x1a], al
0002142C  8b461c                 mov eax, dword ptr [rsi + 0x1c]
0002142F  c1e808                 shr eax, 8
00021432  4188471e               mov byte ptr [r15 + 0x1e], al
00021436  0fb606                 movzx eax, byte ptr [rsi]
00021439  41884703               mov byte ptr [r15 + 3], al
0002143D  0fb64604               movzx eax, byte ptr [rsi + 4]
00021441  41884707               mov byte ptr [r15 + 7], al
00021445  0fb64608               movzx eax, byte ptr [rsi + 8]
00021449  4188470b               mov byte ptr [r15 + 0xb], al
0002144D  0fb6460c               movzx eax, byte ptr [rsi + 0xc]
00021451  4188470f               mov byte ptr [r15 + 0xf], al
00021455  0fb64610               movzx eax, byte ptr [rsi + 0x10]
00021459  41884713               mov byte ptr [r15 + 0x13], al
0002145D  0fb64614               movzx eax, byte ptr [rsi + 0x14]
00021461  41884717               mov byte ptr [r15 + 0x17], al
00021465  0fb64618               movzx eax, byte ptr [rsi + 0x18]
00021469  4188471b               mov byte ptr [r15 + 0x1b], al
0002146D  0fb6461c               movzx eax, byte ptr [rsi + 0x1c]
00021471  4188471f               mov byte ptr [r15 + 0x1f], al
00021475  4883c468               add rsp, 0x68
00021479  415f                   pop r15
0002147B  415e                   pop r14
0002147D  415d                   pop r13
0002147F  415c                   pop r12
00021481  5f                     pop rdi
00021482  5e                     pop rsi
00021483  5d                     pop rbp
00021484  5b                     pop rbx
00021485  c3                     ret 
00021486  cc                     int3 
00021487  cc                     int3 
00021488  cc                     int3 
00021489  cc                     int3 
0002148A  cc                     int3 
0002148B  cc                     int3 
0002148C  cc                     int3 
0002148D  cc                     int3 
0002148E  cc                     int3 
0002148F  cc                     int3 
