0002CCD0  4055                   push rbp
0002CCD2  53                     push rbx
0002CCD3  56                     push rsi
0002CCD4  57                     push rdi
0002CCD5  4154                   push r12
0002CCD7  4155                   push r13
0002CCD9  4156                   push r14
0002CCDB  4157                   push r15
0002CCDD  4881ece8070000         sub rsp, 0x7e8
0002CCE4  488d6c2440             lea rbp, [rsp + 0x40]
0002CCE9  4533ff                 xor r15d, r15d
0002CCEC  4489bdf0070000         mov dword ptr [rbp + 0x7f0], r15d
0002CCF3  e8a8450000             call 0x312a0
0002CCF8  488d0dd109feff         lea rcx, [rip - 0x1f62f]   ; -> 0xd6d0
0002CCFF  ffd0                   call rax
0002CD01  e83a490000             call 0x31640
0002CD06  41b804010000           mov r8d, 0x104
0002CD0C  488d9590060000         lea rdx, [rbp + 0x690]
0002CD13  33c9                   xor ecx, ecx
0002CD15  ffd0                   call rax
0002CD17  41b9c59d1c81           mov r9d, 0x811c9dc5
0002CD1D  418bd7                 mov edx, r15d
0002CD20  4438bd90060000         cmp byte ptr [rbp + 0x690], r15b
0002CD27  742b                   je 0x2cd54
0002CD29  0f1f8000000000         nop dword ptr [rax]
0002CD30  4863c2                 movsxd rax, edx
0002CD33  0fb68c0590060000       movzx ecx, byte ptr [rbp + rax + 0x690]
0002CD3B  4133c9                 xor ecx, r9d
0002CD3E  4469c993010001         imul r9d, ecx, 0x1000193
0002CD45  ffc2                   inc edx
0002CD47  4863c2                 movsxd rax, edx
0002CD4A  4438bc0590060000       cmp byte ptr [rbp + rax + 0x690], r15b
0002CD52  75dc                   jne 0x2cd30
0002CD54  c785b0000000476c6f62   mov dword ptr [rbp + 0xb0], 0x626f6c47
0002CD5E  c785b4000000616c5c4d   mov dword ptr [rbp + 0xb4], 0x4d5c6c61
0002CD68  c785b8000000375f2530   mov dword ptr [rbp + 0xb8], 0x30255f37
0002CD72  66c785bc0000003858     mov word ptr [rbp + 0xbc], 0x5838
0002CD7B  4488bdbe000000         mov byte ptr [rbp + 0xbe], r15b
0002CD82  4c8d85b0000000         lea r8, [rbp + 0xb0]
0002CD89  ba20000000             mov edx, 0x20
0002CD8E  488d8da0010000         lea rcx, [rbp + 0x1a0]
0002CD95  e8467efeff             call 0x14be0
0002CD9A  e8414c0000             call 0x319e0
0002CD9F  488d8da0010000         lea rcx, [rbp + 0x1a0]
0002CDA6  48894c2428             mov qword ptr [rsp + 0x28], rcx
0002CDAB  c744242010000000       mov dword ptr [rsp + 0x20], 0x10
0002CDB3  4533c9                 xor r9d, r9d
0002CDB6  33d2                   xor edx, edx
0002CDB8  48c7c1ffffffff         mov rcx, 0xffffffffffffffff
0002CDBF  41b804000000           mov r8d, 4
0002CDC5  ffd0                   call rax
0002CDC7  488bd8                 mov rbx, rax
0002CDCA  4885c0                 test rax, rax
0002CDCD  0f84ba000000           je 0x2ce8d
0002CDD3  e8a84f0000             call 0x31d80
0002CDD8  48c744242010000000     mov qword ptr [rsp + 0x20], 0x10
0002CDE1  4533c9                 xor r9d, r9d
0002CDE4  4533c0                 xor r8d, r8d
0002CDE7  ba1f000f00             mov edx, 0xf001f
0002CDEC  488bcb                 mov rcx, rbx
0002CDEF  ffd0                   call rax
0002CDF1  4c8bf8                 mov r15, rax
0002CDF4  4885c0                 test rax, rax
0002CDF7  0f848d000000           je 0x2ce8a
0002CDFD  e86e98ffff             call 0x26670
0002CE02  ffd0                   call rax
0002CE04  488bf8                 mov rdi, rax
0002CE07  492b3f                 sub rdi, qword ptr [r15]
0002CE0A  4881ff60ea0000         cmp rdi, 0xea60
0002CE11  7608                   jbe 0x2ce1b
0002CE13  41c7470800000000       mov dword ptr [r15 + 8], 0
0002CE1B  458b7708               mov r14d, dword ptr [r15 + 8]
0002CE1F  4183fe06               cmp r14d, 6
0002CE23  7207                   jb 0x2ce2c
0002CE25  bb50c30000             mov ebx, 0xc350
0002CE2A  eb15                   jmp 0x2ce41
0002CE2C  4183fe01               cmp r14d, 1
0002CE30  724a                   jb 0x2ce7c
0002CE32  418d4eff               lea ecx, [r14 - 1]
0002CE36  bbe8030000             mov ebx, 0x3e8
0002CE3B  d3e3                   shl ebx, cl
0002CE3D  85db                   test ebx, ebx
0002CE3F  743b                   je 0x2ce7c
0002CE41  8bc3                   mov eax, ebx
0002CE43  483bf8                 cmp rdi, rax
0002CE46  730b                   jae 0x2ce53
0002CE48  e82328ffff             call 0x1f670
0002CE4D  2bdf                   sub ebx, edi
0002CE4F  8bcb                   mov ecx, ebx
0002CE51  ffd0                   call rax
0002CE53  4183fe0a               cmp r14d, 0xa
0002CE57  7223                   jb 0x2ce7c
0002CE59  488b0d706f0300         mov rcx, qword ptr [rip + 0x36f70]   ; -> 0x63dd0
0002CE60  488b3d616f0300         mov rdi, qword ptr [rip + 0x36f61]   ; -> 0x63dc8
0002CE67  482bcf                 sub rcx, rdi
0002CE6A  33c0                   xor eax, eax
0002CE6C  f3aa                   rep stosb byte ptr [rdi], al
0002CE6E  488d3d2b4f0300         lea rdi, [rip + 0x34f2b]   ; -> 0x61da0
0002CE75  b900080000             mov ecx, 0x800
0002CE7A  f3aa                   rep stosb byte ptr [rdi], al
0002CE7C  e8ef97ffff             call 0x26670
0002CE81  ffd0                   call rax
0002CE83  498907                 mov qword ptr [r15], rax
0002CE86  41ff4708               inc dword ptr [r15 + 8]
0002CE8A  4533ff                 xor r15d, r15d
0002CE8D  65488b042560000000     mov rax, qword ptr gs:[0x60]
0002CE96  488b4810               mov rcx, qword ptr [rax + 0x10]
0002CE9A  4885c9                 test rcx, rcx
0002CE9D  0f84883c0000           je 0x30b2b
0002CEA3  8b4128                 mov eax, dword ptr [rcx + 0x28]
0002CEA6  85c0                   test eax, eax
0002CEA8  0f847d3c0000           je 0x30b2b
0002CEAE  3526594131             xor eax, 0x31415926
0002CEB3  3b412c                 cmp eax, dword ptr [rcx + 0x2c]
0002CEB6  0f856f3c0000           jne 0x30b2b
0002CEBC  e87fd1feff             call 0x1a040
0002CEC1  41b804010000           mov r8d, 0x104
0002CEC7  488d95c0010000         lea rdx, [rbp + 0x1c0]
0002CECE  33c9                   xor ecx, ecx
0002CED0  ffd0                   call rax
0002CED2  e829a7feff             call 0x17600
0002CED7  4c897c2430             mov qword ptr [rsp + 0x30], r15
0002CEDC  44897c2428             mov dword ptr [rsp + 0x28], r15d
0002CEE1  41bd03000000           mov r13d, 3
0002CEE7  44896c2420             mov dword ptr [rsp + 0x20], r13d
0002CEEC  4533c9                 xor r9d, r9d
0002CEEF  41bc01000000           mov r12d, 1
0002CEF5  458bc4                 mov r8d, r12d
0002CEF8  ba00000080             mov edx, 0x80000000
0002CEFD  488d8dc0010000         lea rcx, [rbp + 0x1c0]
0002CF04  ffd0                   call rax
0002CF06  e895eafeff             call 0x1b9a0
0002CF0B  488d5518               lea rdx, [rbp + 0x18]
0002CF0F  e8ac90feff             call 0x15fc0
0002CF14  90                     nop 
0002CF15  e8a691feff             call 0x160c0
0002CF1A  488d4d18               lea rcx, [rbp + 0x18]
0002CF1E  48837d300f             cmp qword ptr [rbp + 0x30], 0xf
0002CF23  480f474d18             cmova rcx, qword ptr [rbp + 0x18]
0002CF28  ffd0                   call rax
0002CF2A  488bf8                 mov rdi, rax
0002CF2D  4885c0                 test rax, rax
0002CF30  7505                   jne 0x2cf37
0002CF32  e911020000             jmp 0x2d148
0002CF37  488d5540               lea rdx, [rbp + 0x40]
0002CF3B  e82095feff             call 0x16460
0002CF40  90                     nop 
0002CF41  488d95e8000000         lea rdx, [rbp + 0xe8]
0002CF48  e87398feff             call 0x167c0
0002CF4D  90                     nop 
0002CF4E  488d9588000000         lea rdx, [rbp + 0x88]
0002CF55  e8b699feff             call 0x16910
0002CF5A  90                     nop 
0002CF5B  488d95b0000000         lea rdx, [rbp + 0xb0]
0002CF62  e8999afeff             call 0x16a00
0002CF67  90                     nop 
0002CF68  488d5d40               lea rbx, [rbp + 0x40]
0002CF6C  48837d580f             cmp qword ptr [rbp + 0x58], 0xf
0002CF71  480f475d40             cmova rbx, qword ptr [rbp + 0x40]
0002CF76  488db5e8000000         lea rsi, [rbp + 0xe8]
0002CF7D  4883bd000100000f       cmp qword ptr [rbp + 0x100], 0xf
0002CF85  480f47b5e8000000       cmova rsi, qword ptr [rbp + 0xe8]
0002CF8D  4c8db588000000         lea r14, [rbp + 0x88]
0002CF94  4883bda00000000f       cmp qword ptr [rbp + 0xa0], 0xf
0002CF9C  4c0f47b588000000       cmova r14, qword ptr [rbp + 0x88]
0002CFA4  4c8dbdb0000000         lea r15, [rbp + 0xb0]
0002CFAB  4883bdc80000000f       cmp qword ptr [rbp + 0xc8], 0xf
0002CFB3  4c0f47bdb0000000       cmova r15, qword ptr [rbp + 0xb0]
0002CFBB  e8609bfeff             call 0x16b20
0002CFC0  488bd3                 mov rdx, rbx
0002CFC3  488bcf                 mov rcx, rdi
0002CFC6  ffd0                   call rax
0002CFC8  488bd8                 mov rbx, rax
0002CFCB  4885c0                 test rax, rax
0002CFCE  7441                   je 0x2d011
0002CFD0  e8eb9efeff             call 0x16ec0
0002CFD5  4c8d8df0070000         lea r9, [rbp + 0x7f0]
0002CFDC  41b840000000           mov r8d, 0x40
0002CFE2  498bd4                 mov rdx, r12
0002CFE5  488bcb                 mov rcx, rbx
0002CFE8  ffd0                   call rax
0002CFEA  85c0                   test eax, eax
0002CFEC  7423                   je 0x2d011
0002CFEE  803bc3                 cmp byte ptr [rbx], 0xc3
0002CFF1  7403                   je 0x2cff6
0002CFF3  c603c3                 mov byte ptr [rbx], 0xc3
0002CFF6  e8c59efeff             call 0x16ec0
0002CFFB  4c8d8df0070000         lea r9, [rbp + 0x7f0]
0002D002  448b85f0070000         mov r8d, dword ptr [rbp + 0x7f0]
0002D009  498bd4                 mov rdx, r12
0002D00C  488bcb                 mov rcx, rbx
0002D00F  ffd0                   call rax
0002D011  e80a9bfeff             call 0x16b20
0002D016  488bd6                 mov rdx, rsi
0002D019  488bcf                 mov rcx, rdi
0002D01C  ffd0                   call rax
0002D01E  488bd8                 mov rbx, rax
0002D021  4885c0                 test rax, rax
0002D024  7441                   je 0x2d067
0002D026  e8959efeff             call 0x16ec0
0002D02B  4c8d8df0070000         lea r9, [rbp + 0x7f0]
0002D032  41b840000000           mov r8d, 0x40
0002D038  498bd4                 mov rdx, r12
0002D03B  488bcb                 mov rcx, rbx
0002D03E  ffd0                   call rax
0002D040  85c0                   test eax, eax
0002D042  7423                   je 0x2d067
0002D044  803bc3                 cmp byte ptr [rbx], 0xc3
0002D047  7403                   je 0x2d04c
0002D049  c603c3                 mov byte ptr [rbx], 0xc3
0002D04C  e86f9efeff             call 0x16ec0
0002D051  4c8d8df0070000         lea r9, [rbp + 0x7f0]
0002D058  448b85f0070000         mov r8d, dword ptr [rbp + 0x7f0]
0002D05F  498bd4                 mov rdx, r12
0002D062  488bcb                 mov rcx, rbx
0002D065  ffd0                   call rax
0002D067  e8b49afeff             call 0x16b20
0002D06C  498bd6                 mov rdx, r14
0002D06F  488bcf                 mov rcx, rdi
0002D072  ffd0                   call rax
0002D074  488bd8                 mov rbx, rax
0002D077  4885c0                 test rax, rax
0002D07A  7441                   je 0x2d0bd
0002D07C  e83f9efeff             call 0x16ec0
0002D081  4c8d8df0070000         lea r9, [rbp + 0x7f0]
0002D088  41b840000000           mov r8d, 0x40
0002D08E  498bd4                 mov rdx, r12
0002D091  488bcb                 mov rcx, rbx
0002D094  ffd0                   call rax
0002D096  85c0                   test eax, eax
0002D098  7423                   je 0x2d0bd
0002D09A  803bc3                 cmp byte ptr [rbx], 0xc3
0002D09D  7403                   je 0x2d0a2
0002D09F  c603c3                 mov byte ptr [rbx], 0xc3
0002D0A2  e8199efeff             call 0x16ec0
0002D0A7  4c8d8df0070000         lea r9, [rbp + 0x7f0]
0002D0AE  448b85f0070000         mov r8d, dword ptr [rbp + 0x7f0]
0002D0B5  498bd4                 mov rdx, r12
0002D0B8  488bcb                 mov rcx, rbx
0002D0BB  ffd0                   call rax
0002D0BD  e85e9afeff             call 0x16b20
0002D0C2  498bd7                 mov rdx, r15
0002D0C5  488bcf                 mov rcx, rdi
0002D0C8  ffd0                   call rax
0002D0CA  488bd8                 mov rbx, rax
0002D0CD  4885c0                 test rax, rax
0002D0D0  7442                   je 0x2d114
0002D0D2  e8e99dfeff             call 0x16ec0
0002D0D7  4c8d8df0070000         lea r9, [rbp + 0x7f0]
0002D0DE  41b840000000           mov r8d, 0x40
0002D0E4  498bd4                 mov rdx, r12
0002D0E7  488bcb                 mov rcx, rbx
0002D0EA  ffd0                   call rax
0002D0EC  85c0                   test eax, eax
0002D0EE  7424                   je 0x2d114
0002D0F0  803bc3                 cmp byte ptr [rbx], 0xc3
0002D0F3  7403                   je 0x2d0f8
0002D0F5  c603c3                 mov byte ptr [rbx], 0xc3
0002D0F8  e8c39dfeff             call 0x16ec0
0002D0FD  4c8d8df0070000         lea r9, [rbp + 0x7f0]
0002D104  448b85f0070000         mov r8d, dword ptr [rbp + 0x7f0]
0002D10B  498bd4                 mov rdx, r12
0002D10E  488bcb                 mov rcx, rbx
0002D111  ffd0                   call rax
0002D113  90                     nop 
0002D114  488d8db0000000         lea rcx, [rbp + 0xb0]
0002D11B  e870790000             call 0x34a90
0002D120  90                     nop 
0002D121  488d8d88000000         lea rcx, [rbp + 0x88]
0002D128  e863790000             call 0x34a90
0002D12D  90                     nop 
0002D12E  488d8de8000000         lea rcx, [rbp + 0xe8]
0002D135  e856790000             call 0x34a90
0002D13A  90                     nop 
0002D13B  488d4d40               lea rcx, [rbp + 0x40]
0002D13F  e84c790000             call 0x34a90
0002D144  90                     nop 
0002D145  4533ff                 xor r15d, r15d
0002D148  488d4d18               lea rcx, [rbp + 0x18]
0002D14C  e83f790000             call 0x34a90
0002D151  beffffffff             mov esi, 0xffffffff
0002D156  8bce                   mov ecx, esi
0002D158  498bdf                 mov rbx, r15
0002D15B  4c8d353e4c0300         lea r14, [rip + 0x34c3e]   ; -> 0x61da0
0002D162  420fb60433             movzx eax, byte ptr [rbx + r14]
0002D167  33c1                   xor eax, ecx
0002D169  8bc8                   mov ecx, eax
0002D16B  83e101                 and ecx, 1
0002D16E  f7d9                   neg ecx
0002D170  81e12083b8ed           and ecx, 0xedb88320
0002D176  d1e8                   shr eax, 1
0002D178  33c8                   xor ecx, eax
0002D17A  8bc1                   mov eax, ecx
0002D17C  83e001                 and eax, 1
0002D17F  f7d8                   neg eax
0002D181  252083b8ed             and eax, 0xedb88320
0002D186  d1e9                   shr ecx, 1
0002D188  33c1                   xor eax, ecx
0002D18A  8bc8                   mov ecx, eax
0002D18C  83e101                 and ecx, 1
0002D18F  f7d9                   neg ecx
0002D191  81e12083b8ed           and ecx, 0xedb88320
0002D197  d1e8                   shr eax, 1
0002D199  33c8                   xor ecx, eax
0002D19B  8bc1                   mov eax, ecx
0002D19D  83e001                 and eax, 1
0002D1A0  f7d8                   neg eax
0002D1A2  252083b8ed             and eax, 0xedb88320
0002D1A7  d1e9                   shr ecx, 1
0002D1A9  33c1                   xor eax, ecx
0002D1AB  8bc8                   mov ecx, eax
0002D1AD  83e101                 and ecx, 1
0002D1B0  f7d9                   neg ecx
0002D1B2  81e12083b8ed           and ecx, 0xedb88320
0002D1B8  d1e8                   shr eax, 1
0002D1BA  33c8                   xor ecx, eax
0002D1BC  8bc1                   mov eax, ecx
0002D1BE  83e001                 and eax, 1
0002D1C1  f7d8                   neg eax
0002D1C3  252083b8ed             and eax, 0xedb88320
0002D1C8  d1e9                   shr ecx, 1
0002D1CA  33c1                   xor eax, ecx
0002D1CC  8bd0                   mov edx, eax
0002D1CE  83e201                 and edx, 1
0002D1D1  f7da                   neg edx
0002D1D3  81e22083b8ed           and edx, 0xedb88320
0002D1D9  d1e8                   shr eax, 1
0002D1DB  33d0                   xor edx, eax
0002D1DD  420fb64c3301           movzx ecx, byte ptr [rbx + r14 + 1]
0002D1E3  8bc2                   mov eax, edx
0002D1E5  83e001                 and eax, 1
0002D1E8  f7d8                   neg eax
0002D1EA  252083b8ed             and eax, 0xedb88320
0002D1EF  33c8                   xor ecx, eax
0002D1F1  d1ea                   shr edx, 1
0002D1F3  33ca                   xor ecx, edx
0002D1F5  8bc1                   mov eax, ecx
0002D1F7  83e001                 and eax, 1
0002D1FA  f7d8                   neg eax
0002D1FC  252083b8ed             and eax, 0xedb88320
0002D201  d1e9                   shr ecx, 1
0002D203  33c1                   xor eax, ecx
0002D205  8bc8                   mov ecx, eax
0002D207  83e101                 and ecx, 1
0002D20A  f7d9                   neg ecx
0002D20C  81e12083b8ed           and ecx, 0xedb88320
0002D212  d1e8                   shr eax, 1
0002D214  33c8                   xor ecx, eax
0002D216  8bc1                   mov eax, ecx
0002D218  83e001                 and eax, 1
0002D21B  f7d8                   neg eax
0002D21D  252083b8ed             and eax, 0xedb88320
0002D222  d1e9                   shr ecx, 1
0002D224  33c1                   xor eax, ecx
0002D226  8bc8                   mov ecx, eax
0002D228  83e101                 and ecx, 1
0002D22B  f7d9                   neg ecx
0002D22D  81e12083b8ed           and ecx, 0xedb88320
0002D233  d1e8                   shr eax, 1
0002D235  33c8                   xor ecx, eax
0002D237  8bc1                   mov eax, ecx
0002D239  83e001                 and eax, 1
0002D23C  f7d8                   neg eax
0002D23E  252083b8ed             and eax, 0xedb88320
0002D243  d1e9                   shr ecx, 1
0002D245  33c1                   xor eax, ecx
0002D247  8bc8                   mov ecx, eax
0002D249  83e101                 and ecx, 1
0002D24C  f7d9                   neg ecx
0002D24E  81e12083b8ed           and ecx, 0xedb88320
0002D254  d1e8                   shr eax, 1
0002D256  33c8                   xor ecx, eax
0002D258  8bd1                   mov edx, ecx
0002D25A  83e201                 and edx, 1
0002D25D  f7da                   neg edx
0002D25F  81e22083b8ed           and edx, 0xedb88320
0002D265  d1e9                   shr ecx, 1
0002D267  33d1                   xor edx, ecx
0002D269  420fb64c3302           movzx ecx, byte ptr [rbx + r14 + 2]
0002D26F  8bc2                   mov eax, edx
0002D271  83e001                 and eax, 1
0002D274  f7d8                   neg eax
0002D276  252083b8ed             and eax, 0xedb88320
0002D27B  33c8                   xor ecx, eax
0002D27D  d1ea                   shr edx, 1
0002D27F  33ca                   xor ecx, edx
0002D281  8bc1                   mov eax, ecx
0002D283  83e001                 and eax, 1
0002D286  f7d8                   neg eax
0002D288  252083b8ed             and eax, 0xedb88320
0002D28D  d1e9                   shr ecx, 1
0002D28F  33c1                   xor eax, ecx
0002D291  8bc8                   mov ecx, eax
0002D293  83e101                 and ecx, 1
0002D296  f7d9                   neg ecx
0002D298  81e12083b8ed           and ecx, 0xedb88320
0002D29E  d1e8                   shr eax, 1
0002D2A0  33c8                   xor ecx, eax
0002D2A2  8bc1                   mov eax, ecx
0002D2A4  83e001                 and eax, 1
0002D2A7  f7d8                   neg eax
0002D2A9  252083b8ed             and eax, 0xedb88320
0002D2AE  d1e9                   shr ecx, 1
0002D2B0  33c1                   xor eax, ecx
0002D2B2  8bc8                   mov ecx, eax
0002D2B4  83e101                 and ecx, 1
0002D2B7  f7d9                   neg ecx
0002D2B9  81e12083b8ed           and ecx, 0xedb88320
0002D2BF  d1e8                   shr eax, 1
0002D2C1  33c8                   xor ecx, eax
0002D2C3  8bc1                   mov eax, ecx
0002D2C5  83e001                 and eax, 1
0002D2C8  f7d8                   neg eax
0002D2CA  252083b8ed             and eax, 0xedb88320
0002D2CF  d1e9                   shr ecx, 1
0002D2D1  33c1                   xor eax, ecx
0002D2D3  8bc8                   mov ecx, eax
0002D2D5  83e101                 and ecx, 1
0002D2D8  f7d9                   neg ecx
0002D2DA  81e12083b8ed           and ecx, 0xedb88320
0002D2E0  d1e8                   shr eax, 1
0002D2E2  33c8                   xor ecx, eax
0002D2E4  8bd1                   mov edx, ecx
0002D2E6  83e201                 and edx, 1
0002D2E9  f7da                   neg edx
0002D2EB  81e22083b8ed           and edx, 0xedb88320
0002D2F1  d1e9                   shr ecx, 1
0002D2F3  33d1                   xor edx, ecx
0002D2F5  420fb64c3303           movzx ecx, byte ptr [rbx + r14 + 3]
0002D2FB  8bc2                   mov eax, edx
0002D2FD  83e001                 and eax, 1
0002D300  f7d8                   neg eax
0002D302  252083b8ed             and eax, 0xedb88320
0002D307  33c8                   xor ecx, eax
0002D309  d1ea                   shr edx, 1
0002D30B  33ca                   xor ecx, edx
0002D30D  8bc1                   mov eax, ecx
0002D30F  83e001                 and eax, 1
0002D312  f7d8                   neg eax
0002D314  252083b8ed             and eax, 0xedb88320
0002D319  d1e9                   shr ecx, 1
0002D31B  33c1                   xor eax, ecx
0002D31D  8bc8                   mov ecx, eax
0002D31F  83e101                 and ecx, 1
0002D322  f7d9                   neg ecx
0002D324  81e12083b8ed           and ecx, 0xedb88320
0002D32A  d1e8                   shr eax, 1
0002D32C  33c8                   xor ecx, eax
0002D32E  8bc1                   mov eax, ecx
0002D330  83e001                 and eax, 1
0002D333  f7d8                   neg eax
0002D335  252083b8ed             and eax, 0xedb88320
0002D33A  d1e9                   shr ecx, 1
0002D33C  33c1                   xor eax, ecx
0002D33E  8bc8                   mov ecx, eax
0002D340  83e101                 and ecx, 1
0002D343  f7d9                   neg ecx
0002D345  81e12083b8ed           and ecx, 0xedb88320
0002D34B  d1e8                   shr eax, 1
0002D34D  33c8                   xor ecx, eax
0002D34F  8bc1                   mov eax, ecx
0002D351  83e001                 and eax, 1
0002D354  f7d8                   neg eax
0002D356  252083b8ed             and eax, 0xedb88320
0002D35B  d1e9                   shr ecx, 1
0002D35D  33c1                   xor eax, ecx
0002D35F  8bc8                   mov ecx, eax
0002D361  83e101                 and ecx, 1
0002D364  f7d9                   neg ecx
0002D366  81e12083b8ed           and ecx, 0xedb88320
0002D36C  d1e8                   shr eax, 1
0002D36E  33c8                   xor ecx, eax
0002D370  8bc1                   mov eax, ecx
0002D372  83e001                 and eax, 1
0002D375  f7d8                   neg eax
0002D377  252083b8ed             and eax, 0xedb88320
0002D37C  d1e9                   shr ecx, 1
0002D37E  33c1                   xor eax, ecx
0002D380  8bc8                   mov ecx, eax
0002D382  83e101                 and ecx, 1
0002D385  f7d9                   neg ecx
0002D387  81e12083b8ed           and ecx, 0xedb88320
0002D38D  d1e8                   shr eax, 1
0002D38F  33c8                   xor ecx, eax
0002D391  4883c304               add rbx, 4
0002D395  4881fb00080000         cmp rbx, 0x800
0002D39C  0f82c0fdffff           jb 0x2d162
0002D3A2  f7d1                   not ecx
0002D3A4  890d666a0300           mov dword ptr [rip + 0x36a66], ecx   ; -> 0x63e10
0002D3AA  4c8b1d776a0300         mov r11, qword ptr [rip + 0x36a77]   ; -> 0x63e28
0002D3B1  4d85db                 test r11, r11
0002D3B4  0f84fd000000           je 0x2d4b7
0002D3BA  4c8b056f6a0300         mov r8, qword ptr [rip + 0x36a6f]   ; -> 0x63e30
0002D3C1  4981f800040000         cmp r8, 0x400
0002D3C8  0f82e9000000           jb 0x2d4b7
0002D3CE  49c1e802               shr r8, 2
0002D3D2  458bcf                 mov r9d, r15d
0002D3D5  4c8d35746a0300         lea r14, [rip + 0x36a74]   ; -> 0x63e50
0002D3DC  0f1f4000               nop dword ptr [rax]
0002D3E0  458bd1                 mov r10d, r9d
0002D3E3  418bf9                 mov edi, r9d
0002D3E6  490faff8               imul rdi, r8
0002D3EA  4903fb                 add rdi, r11
0002D3ED  8bc6                   mov eax, esi
0002D3EF  498bdf                 mov rbx, r15
0002D3F2  4d85c0                 test r8, r8
0002D3F5  0f849b000000           je 0x2d496
0002D3FB  0f1f440000             nop dword ptr [rax + rax]
0002D400  0fb60c3b               movzx ecx, byte ptr [rbx + rdi]
0002D404  33c8                   xor ecx, eax
0002D406  8bc1                   mov eax, ecx
0002D408  83e001                 and eax, 1
0002D40B  f7d8                   neg eax
0002D40D  252083b8ed             and eax, 0xedb88320
0002D412  d1e9                   shr ecx, 1
0002D414  33c1                   xor eax, ecx
0002D416  8bc8                   mov ecx, eax
0002D418  83e101                 and ecx, 1
0002D41B  f7d9                   neg ecx
0002D41D  81e12083b8ed           and ecx, 0xedb88320
0002D423  d1e8                   shr eax, 1
0002D425  33c8                   xor ecx, eax
0002D427  8bc1                   mov eax, ecx
0002D429  83e001                 and eax, 1
0002D42C  f7d8                   neg eax
0002D42E  252083b8ed             and eax, 0xedb88320
0002D433  d1e9                   shr ecx, 1
0002D435  33c1                   xor eax, ecx
0002D437  8bc8                   mov ecx, eax
0002D439  83e101                 and ecx, 1
0002D43C  f7d9                   neg ecx
0002D43E  81e12083b8ed           and ecx, 0xedb88320
0002D444  d1e8                   shr eax, 1
0002D446  33c8                   xor ecx, eax
0002D448  8bc1                   mov eax, ecx
0002D44A  83e001                 and eax, 1
0002D44D  f7d8                   neg eax
0002D44F  252083b8ed             and eax, 0xedb88320
0002D454  d1e9                   shr ecx, 1
0002D456  33c1                   xor eax, ecx
0002D458  8bc8                   mov ecx, eax
0002D45A  83e101                 and ecx, 1
0002D45D  f7d9                   neg ecx
0002D45F  81e12083b8ed           and ecx, 0xedb88320
0002D465  d1e8                   shr eax, 1
0002D467  33c8                   xor ecx, eax
0002D469  8bd1                   mov edx, ecx
0002D46B  83e201                 and edx, 1
0002D46E  f7da                   neg edx
0002D470  81e22083b8ed           and edx, 0xedb88320
0002D476  d1e9                   shr ecx, 1
0002D478  33d1                   xor edx, ecx
0002D47A  8bc2                   mov eax, edx
0002D47C  83e001                 and eax, 1
0002D47F  f7d8                   neg eax
0002D481  252083b8ed             and eax, 0xedb88320
0002D486  d1ea                   shr edx, 1
0002D488  33c2                   xor eax, edx
0002D48A  48ffc3                 inc rbx
0002D48D  493bd8                 cmp rbx, r8
0002D490  0f826affffff           jb 0x2d400
0002D496  f7d0                   not eax
0002D498  43890496               mov dword ptr [r14 + r10*4], eax
0002D49C  41ffc1                 inc r9d
0002D49F  4183f904               cmp r9d, 4
0002D4A3  0f8c37ffffff           jl 0x2d3e0
0002D4A9  c605b069030001         mov byte ptr [rip + 0x369b0], 1   ; -> 0x63e60
0002D4B0  4c8d35e9480300         lea r14, [rip + 0x348e9]   ; -> 0x61da0
0002D4B7  8bce                   mov ecx, esi
0002D4B9  498bdf                 mov rbx, r15
0002D4BC  0f1f4000               nop dword ptr [rax]
0002D4C0  420fb68433e0070000     movzx eax, byte ptr [rbx + r14 + 0x7e0]
0002D4C9  33c1                   xor eax, ecx
0002D4CB  8bc8                   mov ecx, eax
0002D4CD  83e101                 and ecx, 1
0002D4D0  f7d9                   neg ecx
0002D4D2  81e12083b8ed           and ecx, 0xedb88320
0002D4D8  d1e8                   shr eax, 1
0002D4DA  33c8                   xor ecx, eax
0002D4DC  8bc1                   mov eax, ecx
0002D4DE  83e001                 and eax, 1
0002D4E1  f7d8                   neg eax
0002D4E3  252083b8ed             and eax, 0xedb88320
0002D4E8  d1e9                   shr ecx, 1
0002D4EA  33c1                   xor eax, ecx
0002D4EC  8bc8                   mov ecx, eax
0002D4EE  83e101                 and ecx, 1
0002D4F1  f7d9                   neg ecx
0002D4F3  81e12083b8ed           and ecx, 0xedb88320
0002D4F9  d1e8                   shr eax, 1
0002D4FB  33c8                   xor ecx, eax
0002D4FD  8bc1                   mov eax, ecx
0002D4FF  83e001                 and eax, 1
0002D502  f7d8                   neg eax
0002D504  252083b8ed             and eax, 0xedb88320
0002D509  d1e9                   shr ecx, 1
0002D50B  33c1                   xor eax, ecx
0002D50D  8bc8                   mov ecx, eax
0002D50F  83e101                 and ecx, 1
0002D512  f7d9                   neg ecx
0002D514  81e12083b8ed           and ecx, 0xedb88320
0002D51A  d1e8                   shr eax, 1
0002D51C  33c8                   xor ecx, eax
0002D51E  8bc1                   mov eax, ecx
0002D520  83e001                 and eax, 1
0002D523  f7d8                   neg eax
0002D525  252083b8ed             and eax, 0xedb88320
0002D52A  d1e9                   shr ecx, 1
0002D52C  33c1                   xor eax, ecx
0002D52E  8bc8                   mov ecx, eax
0002D530  83e101                 and ecx, 1
0002D533  f7d9                   neg ecx
0002D535  81e12083b8ed           and ecx, 0xedb88320
0002D53B  d1e8                   shr eax, 1
0002D53D  33c8                   xor ecx, eax
0002D53F  8bd1                   mov edx, ecx
0002D541  83e201                 and edx, 1
0002D544  f7da                   neg edx
0002D546  81e22083b8ed           and edx, 0xedb88320
0002D54C  420fb68433e1070000     movzx eax, byte ptr [rbx + r14 + 0x7e1]
0002D555  33d0                   xor edx, eax
0002D557  d1e9                   shr ecx, 1
0002D559  33d1                   xor edx, ecx
0002D55B  8bc2                   mov eax, edx
0002D55D  83e001                 and eax, 1
0002D560  f7d8                   neg eax
0002D562  252083b8ed             and eax, 0xedb88320
0002D567  d1ea                   shr edx, 1
0002D569  33c2                   xor eax, edx
0002D56B  8bc8                   mov ecx, eax
0002D56D  83e101                 and ecx, 1
0002D570  f7d9                   neg ecx
0002D572  81e12083b8ed           and ecx, 0xedb88320
0002D578  d1e8                   shr eax, 1
0002D57A  33c8                   xor ecx, eax
0002D57C  8bc1                   mov eax, ecx
0002D57E  83e001                 and eax, 1
0002D581  f7d8                   neg eax
0002D583  252083b8ed             and eax, 0xedb88320
0002D588  d1e9                   shr ecx, 1
0002D58A  33c1                   xor eax, ecx
0002D58C  8bc8                   mov ecx, eax
0002D58E  83e101                 and ecx, 1
0002D591  f7d9                   neg ecx
0002D593  81e12083b8ed           and ecx, 0xedb88320
0002D599  d1e8                   shr eax, 1
0002D59B  33c8                   xor ecx, eax
0002D59D  8bc1                   mov eax, ecx
0002D59F  83e001                 and eax, 1
0002D5A2  f7d8                   neg eax
0002D5A4  252083b8ed             and eax, 0xedb88320
0002D5A9  d1e9                   shr ecx, 1
0002D5AB  33c1                   xor eax, ecx
0002D5AD  8bc8                   mov ecx, eax
0002D5AF  83e101                 and ecx, 1
0002D5B2  f7d9                   neg ecx
0002D5B4  81e12083b8ed           and ecx, 0xedb88320
0002D5BA  d1e8                   shr eax, 1
0002D5BC  33c8                   xor ecx, eax
0002D5BE  8bd1                   mov edx, ecx
0002D5C0  83e201                 and edx, 1
0002D5C3  f7da                   neg edx
0002D5C5  81e22083b8ed           and edx, 0xedb88320
0002D5CB  d1e9                   shr ecx, 1
0002D5CD  33d1                   xor edx, ecx
0002D5CF  410fb68c1ee2070000     movzx ecx, byte ptr [r14 + rbx + 0x7e2]
0002D5D8  8bc2                   mov eax, edx
0002D5DA  83e001                 and eax, 1
0002D5DD  f7d8                   neg eax
0002D5DF  252083b8ed             and eax, 0xedb88320
0002D5E4  33c8                   xor ecx, eax
0002D5E6  d1ea                   shr edx, 1
0002D5E8  33ca                   xor ecx, edx
0002D5EA  8bc1                   mov eax, ecx
0002D5EC  83e001                 and eax, 1
0002D5EF  f7d8                   neg eax
0002D5F1  252083b8ed             and eax, 0xedb88320
0002D5F6  d1e9                   shr ecx, 1
0002D5F8  33c1                   xor eax, ecx
0002D5FA  8bc8                   mov ecx, eax
0002D5FC  83e101                 and ecx, 1
0002D5FF  f7d9                   neg ecx
0002D601  81e12083b8ed           and ecx, 0xedb88320
0002D607  d1e8                   shr eax, 1
0002D609  33c8                   xor ecx, eax
0002D60B  8bc1                   mov eax, ecx
0002D60D  83e001                 and eax, 1
0002D610  f7d8                   neg eax
0002D612  252083b8ed             and eax, 0xedb88320
0002D617  d1e9                   shr ecx, 1
0002D619  33c1                   xor eax, ecx
0002D61B  8bc8                   mov ecx, eax
0002D61D  83e101                 and ecx, 1
0002D620  f7d9                   neg ecx
0002D622  81e12083b8ed           and ecx, 0xedb88320
0002D628  d1e8                   shr eax, 1
0002D62A  33c8                   xor ecx, eax
0002D62C  8bc1                   mov eax, ecx
0002D62E  83e001                 and eax, 1
0002D631  f7d8                   neg eax
0002D633  252083b8ed             and eax, 0xedb88320
0002D638  d1e9                   shr ecx, 1
0002D63A  33c1                   xor eax, ecx
0002D63C  8bc8                   mov ecx, eax
0002D63E  83e101                 and ecx, 1
0002D641  f7d9                   neg ecx
0002D643  81e12083b8ed           and ecx, 0xedb88320
0002D649  d1e8                   shr eax, 1
0002D64B  33c8                   xor ecx, eax
0002D64D  8bd1                   mov edx, ecx
0002D64F  83e201                 and edx, 1
0002D652  f7da                   neg edx
0002D654  81e22083b8ed           and edx, 0xedb88320
0002D65A  d1e9                   shr ecx, 1
0002D65C  33d1                   xor edx, ecx
0002D65E  410fb68c1ee3070000     movzx ecx, byte ptr [r14 + rbx + 0x7e3]
0002D667  8bc2                   mov eax, edx
0002D669  83e001                 and eax, 1
0002D66C  f7d8                   neg eax
0002D66E  252083b8ed             and eax, 0xedb88320
0002D673  33c8                   xor ecx, eax
0002D675  d1ea                   shr edx, 1
0002D677  33ca                   xor ecx, edx
0002D679  8bc1                   mov eax, ecx
0002D67B  83e001                 and eax, 1
0002D67E  f7d8                   neg eax
0002D680  252083b8ed             and eax, 0xedb88320
0002D685  d1e9                   shr ecx, 1
0002D687  33c1                   xor eax, ecx
0002D689  8bc8                   mov ecx, eax
0002D68B  83e101                 and ecx, 1
0002D68E  f7d9                   neg ecx
0002D690  81e12083b8ed           and ecx, 0xedb88320
0002D696  d1e8                   shr eax, 1
0002D698  33c8                   xor ecx, eax
0002D69A  8bc1                   mov eax, ecx
0002D69C  83e001                 and eax, 1
0002D69F  f7d8                   neg eax
0002D6A1  252083b8ed             and eax, 0xedb88320
0002D6A6  d1e9                   shr ecx, 1
0002D6A8  33c1                   xor eax, ecx
0002D6AA  8bc8                   mov ecx, eax
0002D6AC  83e101                 and ecx, 1
0002D6AF  f7d9                   neg ecx
0002D6B1  81e12083b8ed           and ecx, 0xedb88320
0002D6B7  d1e8                   shr eax, 1
0002D6B9  33c8                   xor ecx, eax
0002D6BB  8bc1                   mov eax, ecx
0002D6BD  83e001                 and eax, 1
0002D6C0  f7d8                   neg eax
0002D6C2  252083b8ed             and eax, 0xedb88320
0002D6C7  d1e9                   shr ecx, 1
0002D6C9  33c1                   xor eax, ecx
0002D6CB  8bc8                   mov ecx, eax
0002D6CD  83e101                 and ecx, 1
0002D6D0  f7d9                   neg ecx
0002D6D2  81e12083b8ed           and ecx, 0xedb88320
0002D6D8  d1e8                   shr eax, 1
0002D6DA  33c8                   xor ecx, eax
0002D6DC  8bc1                   mov eax, ecx
0002D6DE  83e001                 and eax, 1
0002D6E1  f7d8                   neg eax
0002D6E3  252083b8ed             and eax, 0xedb88320
0002D6E8  d1e9                   shr ecx, 1
0002D6EA  33c1                   xor eax, ecx
0002D6EC  8bc8                   mov ecx, eax
0002D6EE  83e101                 and ecx, 1
0002D6F1  f7d9                   neg ecx
0002D6F3  81e12083b8ed           and ecx, 0xedb88320
0002D6F9  d1e8                   shr eax, 1
0002D6FB  33c8                   xor ecx, eax
0002D6FD  4883c304               add rbx, 4
0002D701  4883fb20               cmp rbx, 0x20
0002D705  0f82b5fdffff           jb 0x2d4c0
0002D70B  f7d1                   not ecx
0002D70D  890d01670300           mov dword ptr [rip + 0x36701], ecx   ; -> 0x63e14
0002D713  c685f807000000         mov byte ptr [rbp + 0x7f8], 0
0002D71A  488d8df8070000         lea rcx, [rbp + 0x7f8]
0002D721  e89ab5feff             call 0x18cc0
0002D726  4c897c2428             mov qword ptr [rsp + 0x28], r15
0002D72B  44897c2420             mov dword ptr [rsp + 0x20], r15d
0002D730  4533c9                 xor r9d, r9d
0002D733  4c8d05e6edfeff         lea r8, [rip - 0x1121a]   ; -> 0x1c520
0002D73A  33d2                   xor edx, edx
0002D73C  33c9                   xor ecx, ecx
0002D73E  ffd0                   call rax
0002D740  48894508               mov qword ptr [rbp + 8], rax
0002D744  4885c0                 test rax, rax
0002D747  0f8464070000           je 0x2deb1
0002D74D  48833dc366030000       cmp qword ptr [rip + 0x366c3], 0   ; -> 0x63e18
0002D755  0f85ae010000           jne 0x2d909
0002D75B  c6850008000000         mov byte ptr [rbp + 0x800], 0
0002D762  488d8d00080000         lea rcx, [rbp + 0x800]
0002D769  e8f29afeff             call 0x17260
0002D76E  ba04010000             mov edx, 0x104
0002D773  488d8dc0010000         lea rcx, [rbp + 0x1c0]
0002D77A  ffd0                   call rax
0002D77C  85c0                   test eax, eax
0002D77E  0f8485010000           je 0x2d909
0002D784  418bcf                 mov ecx, r15d
0002D787  80bdc001000000         cmp byte ptr [rbp + 0x1c0], 0
0002D78E  740f                   je 0x2d79f
0002D790  ffc1                   inc ecx
0002D792  4863c1                 movsxd rax, ecx
0002D795  80bc05c001000000       cmp byte ptr [rbp + rax + 0x1c0], 0
0002D79D  75f1                   jne 0x2d790
0002D79F  4863d1                 movsxd rdx, ecx
0002D7A2  488d420b               lea rax, [rdx + 0xb]
0002D7A6  483d04010000           cmp rax, 0x104
0002D7AC  0f8357010000           jae 0x2d909
0002D7B2  c68415c00100005c       mov byte ptr [rbp + rdx + 0x1c0], 0x5c
0002D7BA  4863c1                 movsxd rax, ecx
0002D7BD  c68405c10100006e       mov byte ptr [rbp + rax + 0x1c1], 0x6e
0002D7C5  4863c1                 movsxd rax, ecx
0002D7C8  c68405c201000074       mov byte ptr [rbp + rax + 0x1c2], 0x74
0002D7D0  4863c1                 movsxd rax, ecx
0002D7D3  c68405c301000064       mov byte ptr [rbp + rax + 0x1c3], 0x64
0002D7DB  4863c1                 movsxd rax, ecx
0002D7DE  c68405c40100006c       mov byte ptr [rbp + rax + 0x1c4], 0x6c
0002D7E6  4863c1                 movsxd rax, ecx
0002D7E9  c68405c50100006c       mov byte ptr [rbp + rax + 0x1c5], 0x6c
0002D7F1  4863c1                 movsxd rax, ecx
0002D7F4  c68405c60100002e       mov byte ptr [rbp + rax + 0x1c6], 0x2e
0002D7FC  4863c1                 movsxd rax, ecx
0002D7FF  c68405c701000064       mov byte ptr [rbp + rax + 0x1c7], 0x64
0002D807  4863c1                 movsxd rax, ecx
0002D80A  c68405c80100006c       mov byte ptr [rbp + rax + 0x1c8], 0x6c
0002D812  4863c1                 movsxd rax, ecx
0002D815  c68405c90100006c       mov byte ptr [rbp + rax + 0x1c9], 0x6c
0002D81D  4863c1                 movsxd rax, ecx
0002D820  c68405ca01000000       mov byte ptr [rbp + rax + 0x1ca], 0
0002D828  c6850808000000         mov byte ptr [rbp + 0x808], 0
0002D82F  488d8d08080000         lea rcx, [rbp + 0x808]
0002D836  e8c59dfeff             call 0x17600
0002D83B  4c897c2430             mov qword ptr [rsp + 0x30], r15
0002D840  44897c2428             mov dword ptr [rsp + 0x28], r15d
0002D845  44896c2420             mov dword ptr [rsp + 0x20], r13d
0002D84A  4533c9                 xor r9d, r9d
0002D84D  458bc4                 mov r8d, r12d
0002D850  ba00000080             mov edx, 0x80000000
0002D855  488d8dc0010000         lea rcx, [rbp + 0x1c0]
0002D85C  ffd0                   call rax
0002D85E  488bd8                 mov rbx, rax
0002D861  4883f8ff               cmp rax, -1
0002D865  0f849e000000           je 0x2d909
0002D86B  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
0002D872  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002D879  e822a1feff             call 0x179a0
0002D87E  33d2                   xor edx, edx
0002D880  488bcb                 mov rcx, rbx
0002D883  ffd0                   call rax
0002D885  8bf8                   mov edi, eax
0002D887  3bc6                   cmp eax, esi
0002D889  750f                   jne 0x2d89a
0002D88B  c6450000               mov byte ptr [rbp], 0
0002D88F  488d4d00               lea rcx, [rbp]
0002D893  e8a8a4feff             call 0x17d40
0002D898  eb6a                   jmp 0x2d904
0002D89A  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
0002D8A1  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002D8A8  e833a8feff             call 0x180e0
0002D8AD  488bd7                 mov rdx, rdi
0002D8B0  33c9                   xor ecx, ecx
0002D8B2  41b904000000           mov r9d, 4
0002D8B8  41b800300000           mov r8d, 0x3000
0002D8BE  ffd0                   call rax
0002D8C0  48890551650300         mov qword ptr [rip + 0x36551], rax   ; -> 0x63e18
0002D8C7  4885c0                 test rax, rax
0002D8CA  742b                   je 0x2d8f7
0002D8CC  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
0002D8D3  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002D8DA  e8a1abfeff             call 0x18480
0002D8DF  4c897c2420             mov qword ptr [rsp + 0x20], r15
0002D8E4  4c8d4d78               lea r9, [rbp + 0x78]
0002D8E8  448bc7                 mov r8d, edi
0002D8EB  488b1526650300         mov rdx, qword ptr [rip + 0x36526]   ; -> 0x63e18
0002D8F2  488bcb                 mov rcx, rbx
0002D8F5  ffd0                   call rax
0002D8F7  c6450000               mov byte ptr [rbp], 0
0002D8FB  488d4d00               lea rcx, [rbp]
0002D8FF  e83ca4feff             call 0x17d40
0002D904  488bcb                 mov rcx, rbx
0002D907  ffd0                   call rax
0002D909  65488b042560000000     mov rax, qword ptr gs:[0x60]
0002D912  4c8b4818               mov r9, qword ptr [rax + 0x18]
0002D916  4983c120               add r9, 0x20
0002D91A  498b31                 mov rsi, qword ptr [r9]
0002D91D  493bf1                 cmp rsi, r9
0002D920  0f84a1000000           je 0x2d9c7
0002D926  440fb7158afcfdff       movzx r10d, word ptr [rip - 0x20376]   ; -> 0xd5b8
0002D92E  6690                   nop 
0002D930  488b5e50               mov rbx, qword ptr [rsi + 0x50]
0002D934  4885db                 test rbx, rbx
0002D937  0f847e000000           je 0x2d9bb
0002D93D  41b8c59d1c81           mov r8d, 0x811c9dc5
0002D943  0fb703                 movzx eax, word ptr [rbx]
0002D946  6685c0                 test ax, ax
0002D949  742d                   je 0x2d978
0002D94B  0f1f440000             nop dword ptr [rax + rax]
0002D950  488d5b02               lea rbx, [rbx + 2]
0002D954  8d509f                 lea edx, [rax - 0x61]
0002D957  0fb6c8                 movzx ecx, al
0002D95A  2c20                   sub al, 0x20
0002D95C  6683fa19               cmp dx, 0x19
0002D960  0f47c1                 cmova eax, ecx
0002D963  0fbec0                 movsx eax, al
0002D966  4133c0                 xor eax, r8d
0002D969  4469c093010001         imul r8d, eax, 0x1000193
0002D970  0fb703                 movzx eax, word ptr [rbx]
0002D973  6685c0                 test ax, ax
0002D976  75d8                   jne 0x2d950
0002D978  488d1d39fcfdff         lea rbx, [rip - 0x203c7]   ; -> 0xd5b8
0002D97F  bfc59d1c81             mov edi, 0x811c9dc5
0002D984  410fb7c2               movzx eax, r10w
0002D988  0f1f840000000000       nop dword ptr [rax + rax]
0002D990  488d5b02               lea rbx, [rbx + 2]
0002D994  8d509f                 lea edx, [rax - 0x61]
0002D997  0fb6c8                 movzx ecx, al
0002D99A  2c20                   sub al, 0x20
0002D99C  6683fa19               cmp dx, 0x19
0002D9A0  0f47c1                 cmova eax, ecx
0002D9A3  0fbec0                 movsx eax, al
0002D9A6  33c7                   xor eax, edi
0002D9A8  69f893010001           imul edi, eax, 0x1000193
0002D9AE  0fb703                 movzx eax, word ptr [rbx]
0002D9B1  6685c0                 test ax, ax
0002D9B4  75da                   jne 0x2d990
0002D9B6  443bc7                 cmp r8d, edi
0002D9B9  7415                   je 0x2d9d0
0002D9BB  488b36                 mov rsi, qword ptr [rsi]
0002D9BE  493bf1                 cmp rsi, r9
0002D9C1  0f8569ffffff           jne 0x2d930
0002D9C7  488b5d08               mov rbx, qword ptr [rbp + 8]
0002D9CB  e9c4040000             jmp 0x2de94
0002D9D0  488b7620               mov rsi, qword ptr [rsi + 0x20]
0002D9D4  4885f6                 test rsi, rsi
0002D9D7  74ee                   je 0x2d9c7
0002D9D9  4c8b15c0630300         mov r10, qword ptr [rip + 0x363c0]   ; -> 0x63da0
0002D9E0  4d85d2                 test r10, r10
0002D9E3  0f8593000000           jne 0x2da7c
0002D9E9  48634e3c               movsxd rcx, dword ptr [rsi + 0x3c]
0002D9ED  4803ce                 add rcx, rsi
0002D9F0  440fb74914             movzx r9d, word ptr [rcx + 0x14]
0002D9F5  4c03c9                 add r9, rcx
0002D9F8  458bc7                 mov r8d, r15d
0002D9FB  440fb75906             movzx r11d, word ptr [rcx + 6]
0002DA00  4585db                 test r11d, r11d
0002DA03  74c2                   je 0x2d9c7
0002DA05  6666660f1f840000000000 nop word ptr [rax + rax]
0002DA10  418bc0                 mov eax, r8d
0002DA13  488d0c80               lea rcx, [rax + rax*4]
0002DA17  418b44c93c             mov eax, dword ptr [r9 + rcx*8 + 0x3c]
0002DA1C  2520000020             and eax, 0x20000020
0002DA21  3d20000020             cmp eax, 0x20000020
0002DA26  753c                   jne 0x2da64
0002DA28  418b5cc924             mov ebx, dword ptr [r9 + rcx*8 + 0x24]
0002DA2D  4803de                 add rbx, rsi
0002DA30  418bd7                 mov edx, r15d
0002DA33  418b7cc920             mov edi, dword ptr [r9 + rcx*8 + 0x20]
0002DA38  83ef02                 sub edi, 2
0002DA3B  7427                   je 0x2da64
0002DA3D  0f1f00                 nop dword ptr [rax]
0002DA40  448bd2                 mov r10d, edx
0002DA43  4c03d3                 add r10, rbx
0002DA46  41803a0f               cmp byte ptr [r10], 0xf
0002DA4A  7512                   jne 0x2da5e
0002DA4C  8d4201                 lea eax, [rdx + 1]
0002DA4F  803c1805               cmp byte ptr [rax + rbx], 5
0002DA53  7509                   jne 0x2da5e
0002DA55  8d4202                 lea eax, [rdx + 2]
0002DA58  803c18c3               cmp byte ptr [rax + rbx], 0xc3
0002DA5C  7417                   je 0x2da75
0002DA5E  ffc2                   inc edx
0002DA60  3bd7                   cmp edx, edi
0002DA62  72dc                   jb 0x2da40
0002DA64  41ffc0                 inc r8d
0002DA67  453bc3                 cmp r8d, r11d
0002DA6A  7ca4                   jl 0x2da10
0002DA6C  488b5d08               mov rbx, qword ptr [rbp + 8]
0002DA70  e91f040000             jmp 0x2de94
0002DA75  4c891524630300         mov qword ptr [rip + 0x36324], r10   ; -> 0x63da0
0002DA7C  488b0595630300         mov rax, qword ptr [rip + 0x36395]   ; -> 0x63e18
0002DA83  4885c0                 test rax, rax
0002DA86  0f95c2                 setne dl
0002DA89  8895f0070000           mov byte ptr [rbp + 0x7f0], dl
0002DA8F  4885c0                 test rax, rax
0002DA92  480f45f0               cmovne rsi, rax
0002DA96  4c63763c               movsxd r14, dword ptr [rsi + 0x3c]
0002DA9A  4c03f6                 add r14, rsi
0002DA9D  4183be8c00000000       cmp dword ptr [r14 + 0x8c], 0
0002DAA5  0f84c9030000           je 0x2de74
0002DAAB  458b8e88000000         mov r9d, dword ptr [r14 + 0x88]
0002DAB2  498d4614               lea rax, [r14 + 0x14]
0002DAB6  488985a8000000         mov qword ptr [rbp + 0xa8], rax
0002DABD  498d4e06               lea rcx, [r14 + 6]
0002DAC1  48898d88000000         mov qword ptr [rbp + 0x88], rcx
0002DAC8  84d2                   test dl, dl
0002DACA  7525                   jne 0x2daf1
0002DACC  4e8d1c0e               lea r11, [rsi + r9]
0002DAD0  418b431c               mov eax, dword ptr [r11 + 0x1c]
0002DAD4  894510                 mov dword ptr [rbp + 0x10], eax
0002DAD7  458b6324               mov r12d, dword ptr [r11 + 0x24]
0002DADB  4c03e6                 add r12, rsi
0002DADE  458b6b20               mov r13d, dword ptr [r11 + 0x20]
0002DAE2  4c03ee                 add r13, rsi
0002DAE5  488bc1                 mov rax, rcx
0002DAE8  48894d78               mov qword ptr [rbp + 0x78], rcx
0002DAEC  e96e010000             jmp 0x2dc5f
0002DAF1  4c8be0                 mov r12, rax
0002DAF4  440fb700               movzx r8d, word ptr [rax]
0002DAF8  4d03c6                 add r8, r14
0002DAFB  418bd7                 mov edx, r15d
0002DAFE  4c8bf9                 mov r15, rcx
0002DB01  440fb719               movzx r11d, word ptr [rcx]
0002DB05  4585db                 test r11d, r11d
0002DB08  7435                   je 0x2db3f
0002DB0A  660f1f440000           nop word ptr [rax + rax]
0002DB10  8bc2                   mov eax, edx
0002DB12  488d0c80               lea rcx, [rax + rax*4]
0002DB16  488d1ccd00000000       lea rbx, [rcx*8]
0002DB1E  418b7c1824             mov edi, dword ptr [r8 + rbx + 0x24]
0002DB23  443bcf                 cmp r9d, edi
0002DB26  7210                   jb 0x2db38
0002DB28  418b4c1820             mov ecx, dword ptr [r8 + rbx + 0x20]
0002DB2D  03cf                   add ecx, edi
0002DB2F  443bc9                 cmp r9d, ecx
0002DB32  0f829a010000           jb 0x2dcd2
0002DB38  ffc2                   inc edx
0002DB3A  413bd3                 cmp edx, r11d
0002DB3D  7cd1                   jl 0x2db10
0002DB3F  4e8d1c0e               lea r11, [rsi + r9]
0002DB43  4c89bd88000000         mov qword ptr [rbp + 0x88], r15
0002DB4A  4c89a5a8000000         mov qword ptr [rbp + 0xa8], r12
0002DB51  4c897d78               mov qword ptr [rbp + 0x78], r15
0002DB55  4c89a580000000         mov qword ptr [rbp + 0x80], r12
0002DB5C  498bc3                 mov rax, r11
0002DB5F  458b4b20               mov r9d, dword ptr [r11 + 0x20]
0002DB63  410fb73c24             movzx edi, word ptr [r12]
0002DB68  4903fe                 add rdi, r14
0002DB6B  33db                   xor ebx, ebx
0002DB6D  450fb72f               movzx r13d, word ptr [r15]
0002DB71  4585ed                 test r13d, r13d
0002DB74  743a                   je 0x2dbb0
0002DB76  66660f1f840000000000   nop word ptr [rax + rax]
0002DB80  488d0c9b               lea rcx, [rbx + rbx*4]
0002DB84  488d14cd00000000       lea rdx, [rcx*8]
0002DB8C  448b441724             mov r8d, dword ptr [rdi + rdx + 0x24]
0002DB91  453bc8                 cmp r9d, r8d
0002DB94  7210                   jb 0x2dba6
0002DB96  8b4c1720               mov ecx, dword ptr [rdi + rdx + 0x20]
0002DB9A  4103c8                 add ecx, r8d
0002DB9D  443bc9                 cmp r9d, ecx
0002DBA0  0f826a010000           jb 0x2dd10
0002DBA6  ffc3                   inc ebx
0002DBA8  413bdd                 cmp ebx, r13d
0002DBAB  7cd3                   jl 0x2db80
0002DBAD  498bc3                 mov rax, r11
0002DBB0  458be9                 mov r13d, r9d
0002DBB3  448b4824               mov r9d, dword ptr [rax + 0x24]
0002DBB7  4c03ee                 add r13, rsi
0002DBBA  450fb70424             movzx r8d, word ptr [r12]
0002DBBF  4d03c6                 add r8, r14
0002DBC2  33d2                   xor edx, edx
0002DBC4  450fb73f               movzx r15d, word ptr [r15]
0002DBC8  4585ff                 test r15d, r15d
0002DBCB  7430                   je 0x2dbfd
0002DBCD  0f1f00                 nop dword ptr [rax]
0002DBD0  488d0c92               lea rcx, [rdx + rdx*4]
0002DBD4  488d1ccd00000000       lea rbx, [rcx*8]
0002DBDC  418b7c1824             mov edi, dword ptr [r8 + rbx + 0x24]
0002DBE1  443bcf                 cmp r9d, edi
0002DBE4  7210                   jb 0x2dbf6
0002DBE6  418b4c1820             mov ecx, dword ptr [r8 + rbx + 0x20]
0002DBEB  03cf                   add ecx, edi
0002DBED  443bc9                 cmp r9d, ecx
0002DBF0  0f822e010000           jb 0x2dd24
0002DBF6  ffc2                   inc edx
0002DBF8  413bd7                 cmp edx, r15d
0002DBFB  7cd3                   jl 0x2dbd0
0002DBFD  458be1                 mov r12d, r9d
0002DC00  458b4b1c               mov r9d, dword ptr [r11 + 0x1c]
0002DC04  4c03e6                 add r12, rsi
0002DC07  488b8580000000         mov rax, qword ptr [rbp + 0x80]
0002DC0E  440fb700               movzx r8d, word ptr [rax]
0002DC12  4d03c6                 add r8, r14
0002DC15  33d2                   xor edx, edx
0002DC17  488b4578               mov rax, qword ptr [rbp + 0x78]
0002DC1B  440fb738               movzx r15d, word ptr [rax]
0002DC1F  4585ff                 test r15d, r15d
0002DC22  742d                   je 0x2dc51
0002DC24  488d0c92               lea rcx, [rdx + rdx*4]
0002DC28  488d1ccd00000000       lea rbx, [rcx*8]
0002DC30  428b7c0324             mov edi, dword ptr [rbx + r8 + 0x24]
0002DC35  443bcf                 cmp r9d, edi
0002DC38  7210                   jb 0x2dc4a
0002DC3A  428b4c0320             mov ecx, dword ptr [rbx + r8 + 0x20]
0002DC3F  03cf                   add ecx, edi
0002DC41  443bc9                 cmp r9d, ecx
0002DC44  0f82ea000000           jb 0x2dd34
0002DC4A  ffc2                   inc edx
0002DC4C  413bd7                 cmp edx, r15d
0002DC4F  7cd3                   jl 0x2dc24
0002DC51  44894d10               mov dword ptr [rbp + 0x10], r9d
0002DC55  4533ff                 xor r15d, r15d
0002DC58  0fb695f0070000         movzx edx, byte ptr [rbp + 0x7f0]
0002DC5F  458b5b18               mov r11d, dword ptr [r11 + 0x18]
0002DC63  44895d38               mov dword ptr [rbp + 0x38], r11d
0002DC67  4585db                 test r11d, r11d
0002DC6A  0f840d020000           je 0x2de7d
0002DC70  458bcf                 mov r9d, r15d
0002DC73  438b5c8d00             mov ebx, dword ptr [r13 + r9*4]
0002DC78  84d2                   test dl, dl
0002DC7A  0f84db000000           je 0x2dd5b
0002DC80  450fb74e14             movzx r9d, word ptr [r14 + 0x14]
0002DC85  4d03ce                 add r9, r14
0002DC88  33d2                   xor edx, edx
0002DC8A  440fb718               movzx r11d, word ptr [rax]
0002DC8E  4585db                 test r11d, r11d
0002DC91  0f84bd000000           je 0x2dd54
0002DC97  660f1f840000000000     nop word ptr [rax + rax]
0002DCA0  488d0c92               lea rcx, [rdx + rdx*4]
0002DCA4  488d3ccd00000000       lea rdi, [rcx*8]
0002DCAC  458b443924             mov r8d, dword ptr [r9 + rdi + 0x24]
0002DCB1  413bd8                 cmp ebx, r8d
0002DCB4  7210                   jb 0x2dcc6
0002DCB6  418b4c3920             mov ecx, dword ptr [r9 + rdi + 0x20]
0002DCBB  4103c8                 add ecx, r8d
0002DCBE  3bd9                   cmp ebx, ecx
0002DCC0  0f8284000000           jb 0x2dd4a
0002DCC6  ffc2                   inc edx
0002DCC8  413bd3                 cmp edx, r11d
0002DCCB  7cd3                   jl 0x2dca0
0002DCCD  e982000000             jmp 0x2dd54
0002DCD2  458b5c182c             mov r11d, dword ptr [r8 + rbx + 0x2c]
0002DCD7  442bdf                 sub r11d, edi
0002DCDA  4503d9                 add r11d, r9d
0002DCDD  4c03de                 add r11, rsi
0002DCE0  4c89bd88000000         mov qword ptr [rbp + 0x88], r15
0002DCE7  4c89a5a8000000         mov qword ptr [rbp + 0xa8], r12
0002DCEE  4c897d78               mov qword ptr [rbp + 0x78], r15
0002DCF2  4c89a580000000         mov qword ptr [rbp + 0x80], r12
0002DCF9  458b4b20               mov r9d, dword ptr [r11 + 0x20]
0002DCFD  410fb73c24             movzx edi, word ptr [r12]
0002DD02  4903fe                 add rdi, r14
0002DD05  33db                   xor ebx, ebx
0002DD07  450fb72f               movzx r13d, word ptr [r15]
0002DD0B  e970feffff             jmp 0x2db80
0002DD10  448b6c172c             mov r13d, dword ptr [rdi + rdx + 0x2c]
0002DD15  452be8                 sub r13d, r8d
0002DD18  4503e9                 add r13d, r9d
0002DD1B  458b4b24               mov r9d, dword ptr [r11 + 0x24]
0002DD1F  e993feffff             jmp 0x2dbb7
0002DD24  458b64182c             mov r12d, dword ptr [r8 + rbx + 0x2c]
0002DD29  442be7                 sub r12d, edi
0002DD2C  4503e1                 add r12d, r9d
0002DD2F  e9ccfeffff             jmp 0x2dc00
0002DD34  428b44032c             mov eax, dword ptr [rbx + r8 + 0x2c]
0002DD39  2bc7                   sub eax, edi
0002DD3B  4103c1                 add eax, r9d
0002DD3E  894510                 mov dword ptr [rbp + 0x10], eax
0002DD41  488b4578               mov rax, qword ptr [rbp + 0x78]
0002DD45  e90bffffff             jmp 0x2dc55
0002DD4A  418b44392c             mov eax, dword ptr [r9 + rdi + 0x2c]
0002DD4F  412bc0                 sub eax, r8d
0002DD52  03d8                   add ebx, eax
0002DD54  448b5d38               mov r11d, dword ptr [rbp + 0x38]
0002DD58  458bcf                 mov r9d, r15d
0002DD5B  8bd3                   mov edx, ebx
0002DD5D  4803d6                 add rdx, rsi
0002DD60  bbc59d1c81             mov ebx, 0x811c9dc5
0002DD65  0fb60a                 movzx ecx, byte ptr [rdx]
0002DD68  84c9                   test cl, cl
0002DD6A  742c                   je 0x2dd98
0002DD6C  0f1f4000               nop dword ptr [rax]
0002DD70  488d5201               lea rdx, [rdx + 1]
0002DD74  8d419f                 lea eax, [rcx - 0x61]
0002DD77  3c19                   cmp al, 0x19
0002DD79  7703                   ja 0x2dd7e
0002DD7B  80e920                 sub cl, 0x20
0002DD7E  0fbec1                 movsx eax, cl
0002DD81  33c3                   xor eax, ebx
0002DD83  69d893010001           imul ebx, eax, 0x1000193
0002DD89  0fb60a                 movzx ecx, byte ptr [rdx]
0002DD8C  84c9                   test cl, cl
0002DD8E  75e0                   jne 0x2dd70
0002DD90  81fb21328f45           cmp ebx, 0x458f3221
0002DD96  741c                   je 0x2ddb4
0002DD98  41ffc7                 inc r15d
0002DD9B  453bfb                 cmp r15d, r11d
0002DD9E  0f83d6000000           jae 0x2de7a
0002DDA4  488b4578               mov rax, qword ptr [rbp + 0x78]
0002DDA8  0fb695f0070000         movzx edx, byte ptr [rbp + 0x7f0]
0002DDAF  e9bcfeffff             jmp 0x2dc70
0002DDB4  430fb7144c             movzx edx, word ptr [r12 + r9*2]
0002DDB9  8b4d10                 mov ecx, dword ptr [rbp + 0x10]
0002DDBC  4803ce                 add rcx, rsi
0002DDBF  8b1c91                 mov ebx, dword ptr [rcx + rdx*4]
0002DDC2  4533ff                 xor r15d, r15d
0002DDC5  4438bdf0070000         cmp byte ptr [rbp + 0x7f0], r15b
0002DDCC  7459                   je 0x2de27
0002DDCE  488b85a8000000         mov rax, qword ptr [rbp + 0xa8]
0002DDD5  440fb708               movzx r9d, word ptr [rax]
0002DDD9  4d03ce                 add r9, r14
0002DDDC  418bd7                 mov edx, r15d
0002DDDF  488b8588000000         mov rax, qword ptr [rbp + 0x88]
0002DDE6  440fb718               movzx r11d, word ptr [rax]
0002DDEA  4585db                 test r11d, r11d
0002DDED  7438                   je 0x2de27
0002DDEF  90                     nop 
0002DDF0  8bc2                   mov eax, edx
0002DDF2  488d0c80               lea rcx, [rax + rax*4]
0002DDF6  488d3ccd00000000       lea rdi, [rcx*8]
0002DDFE  458b443924             mov r8d, dword ptr [r9 + rdi + 0x24]
0002DE03  413bd8                 cmp ebx, r8d
0002DE06  720c                   jb 0x2de14
0002DE08  418b4c3920             mov ecx, dword ptr [r9 + rdi + 0x20]
0002DE0D  4103c8                 add ecx, r8d
0002DE10  3bd9                   cmp ebx, ecx
0002DE12  7209                   jb 0x2de1d
0002DE14  ffc2                   inc edx
0002DE16  413bd3                 cmp edx, r11d
0002DE19  7cd5                   jl 0x2ddf0
0002DE1B  eb0a                   jmp 0x2de27
0002DE1D  418b44392c             mov eax, dword ptr [r9 + rdi + 0x2c]
0002DE22  412bc0                 sub eax, r8d
0002DE25  03d8                   add ebx, eax
0002DE27  4803de                 add rbx, rsi
0002DE2A  418bcf                 mov ecx, r15d
0002DE2D  0f1f00                 nop dword ptr [rax]
0002DE30  8bd1                   mov edx, ecx
0002DE32  0fb6041a               movzx eax, byte ptr [rdx + rbx]
0002DE36  3cb8                   cmp al, 0xb8
0002DE38  7411                   je 0x2de4b
0002DE3A  3cc3                   cmp al, 0xc3
0002DE3C  743f                   je 0x2de7d
0002DE3E  3ccc                   cmp al, 0xcc
0002DE40  743b                   je 0x2de7d
0002DE42  ffc1                   inc ecx
0002DE44  83f920                 cmp ecx, 0x20
0002DE47  7ce7                   jl 0x2de30
0002DE49  eb32                   jmp 0x2de7d
0002DE4B  8b4c1a01               mov ecx, dword ptr [rdx + rbx + 1]
0002DE4F  488b5d08               mov rbx, qword ptr [rbp + 8]
0002DE53  85c9                   test ecx, ecx
0002DE55  742a                   je 0x2de81
0002DE57  4c897c2428             mov qword ptr [rsp + 0x28], r15
0002DE5C  4c897c2420             mov qword ptr [rsp + 0x20], r15
0002DE61  41b911000000           mov r9d, 0x11
0002DE67  4c8bc3                 mov r8, rbx
0002DE6A  498bd2                 mov rdx, r10
0002DE6D  e8e6820000             call 0x36158
0002DE72  eb0d                   jmp 0x2de81
0002DE74  488b5d08               mov rbx, qword ptr [rbp + 8]
0002DE78  eb13                   jmp 0x2de8d
0002DE7A  4533ff                 xor r15d, r15d
0002DE7D  488b5d08               mov rbx, qword ptr [rbp + 8]
0002DE81  41bc01000000           mov r12d, 1
0002DE87  41bd03000000           mov r13d, 3
0002DE8D  4c8d350c3f0300         lea r14, [rip + 0x33f0c]   ; -> 0x61da0
0002DE94  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
0002DE9B  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002DEA2  e8999efeff             call 0x17d40
0002DEA7  488bcb                 mov rcx, rbx
0002DEAA  ffd0                   call rax
0002DEAC  beffffffff             mov esi, 0xffffffff
0002DEB1  488d0558aafeff         lea rax, [rip - 0x155a8]   ; -> 0x18910
0002DEB8  488d3d61a9feff         lea rdi, [rip - 0x1569f]   ; -> 0x18820
0002DEBF  482bc7                 sub rax, rdi
0002DEC2  4889059f5f0300         mov qword ptr [rip + 0x35f9f], rax   ; -> 0x63e68
0002DEC9  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
0002DED0  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002DED7  e804a2feff             call 0x180e0
0002DEDC  ba00100000             mov edx, 0x1000
0002DEE1  33c9                   xor ecx, ecx
0002DEE3  41b940000000           mov r9d, 0x40
0002DEE9  41b800302000           mov r8d, 0x203000
0002DEEF  ffd0                   call rax
0002DEF1  488bd0                 mov rdx, rax
0002DEF4  4889050d5f0300         mov qword ptr [rip + 0x35f0d], rax   ; -> 0x63e08
0002DEFB  4885c0                 test rax, rax
0002DEFE  0f841f030000           je 0x2e223
0002DF04  498bcf                 mov rcx, r15
0002DF07  488b1d5a5f0300         mov rbx, qword ptr [rip + 0x35f5a]   ; -> 0x63e68
0002DF0E  4885db                 test rbx, rbx
0002DF11  741c                   je 0x2df2f
0002DF13  0f1f4000               nop dword ptr [rax]
0002DF17  660f1f840000000000     nop word ptr [rax + rax]
0002DF20  0fb60439               movzx eax, byte ptr [rcx + rdi]
0002DF24  880411                 mov byte ptr [rcx + rdx], al
0002DF27  48ffc1                 inc rcx
0002DF2A  483bcb                 cmp rcx, rbx
0002DF2D  72f1                   jb 0x2df20
0002DF2F  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
0002DF36  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002DF3D  e8dea9feff             call 0x18920
0002DF42  ba00100000             mov edx, 0x1000
0002DF47  488b0dba5e0300         mov rcx, qword ptr [rip + 0x35eba]   ; -> 0x63e08
0002DF4E  ffd0                   call rax
0002DF50  c685f807000000         mov byte ptr [rbp + 0x7f8], 0
0002DF57  488d8df8070000         lea rcx, [rbp + 0x7f8]
0002DF5E  e85dadfeff             call 0x18cc0
0002DF63  4c897c2428             mov qword ptr [rsp + 0x28], r15
0002DF68  44897c2420             mov dword ptr [rsp + 0x20], r15d
0002DF6D  4d8bce                 mov r9, r14
0002DF70  4c8b05915e0300         mov r8, qword ptr [rip + 0x35e91]   ; -> 0x63e08
0002DF77  33d2                   xor edx, edx
0002DF79  33c9                   xor ecx, ecx
0002DF7B  ffd0                   call rax
0002DF7D  48894508               mov qword ptr [rbp + 8], rax
0002DF81  4885c0                 test rax, rax
0002DF84  0f8499020000           je 0x2e223
0002DF8A  48833d865e030000       cmp qword ptr [rip + 0x35e86], 0   ; -> 0x63e18
0002DF92  0f85b1010000           jne 0x2e149
0002DF98  c6850008000000         mov byte ptr [rbp + 0x800], 0
0002DF9F  488d8d00080000         lea rcx, [rbp + 0x800]
0002DFA6  e8b592feff             call 0x17260
0002DFAB  ba04010000             mov edx, 0x104
0002DFB0  488d8dc0010000         lea rcx, [rbp + 0x1c0]
0002DFB7  ffd0                   call rax
0002DFB9  85c0                   test eax, eax
0002DFBB  0f8488010000           je 0x2e149
0002DFC1  418bcf                 mov ecx, r15d
0002DFC4  80bdc001000000         cmp byte ptr [rbp + 0x1c0], 0
0002DFCB  7412                   je 0x2dfdf
0002DFCD  0f1f00                 nop dword ptr [rax]
0002DFD0  ffc1                   inc ecx
0002DFD2  4863c1                 movsxd rax, ecx
0002DFD5  80bc05c001000000       cmp byte ptr [rbp + rax + 0x1c0], 0
0002DFDD  75f1                   jne 0x2dfd0
0002DFDF  4863d1                 movsxd rdx, ecx
0002DFE2  488d420b               lea rax, [rdx + 0xb]
0002DFE6  483d04010000           cmp rax, 0x104
0002DFEC  0f8357010000           jae 0x2e149
0002DFF2  c68415c00100005c       mov byte ptr [rbp + rdx + 0x1c0], 0x5c
0002DFFA  4863c1                 movsxd rax, ecx
0002DFFD  c68405c10100006e       mov byte ptr [rbp + rax + 0x1c1], 0x6e
0002E005  4863c1                 movsxd rax, ecx
0002E008  c68405c201000074       mov byte ptr [rbp + rax + 0x1c2], 0x74
0002E010  4863c1                 movsxd rax, ecx
0002E013  c68405c301000064       mov byte ptr [rbp + rax + 0x1c3], 0x64
0002E01B  4863c1                 movsxd rax, ecx
0002E01E  c68405c40100006c       mov byte ptr [rbp + rax + 0x1c4], 0x6c
0002E026  4863c1                 movsxd rax, ecx
0002E029  c68405c50100006c       mov byte ptr [rbp + rax + 0x1c5], 0x6c
0002E031  4863c1                 movsxd rax, ecx
0002E034  c68405c60100002e       mov byte ptr [rbp + rax + 0x1c6], 0x2e
0002E03C  4863c1                 movsxd rax, ecx
0002E03F  c68405c701000064       mov byte ptr [rbp + rax + 0x1c7], 0x64
0002E047  4863c1                 movsxd rax, ecx
0002E04A  c68405c80100006c       mov byte ptr [rbp + rax + 0x1c8], 0x6c
0002E052  4863c1                 movsxd rax, ecx
0002E055  c68405c90100006c       mov byte ptr [rbp + rax + 0x1c9], 0x6c
0002E05D  4863c1                 movsxd rax, ecx
0002E060  c68405ca01000000       mov byte ptr [rbp + rax + 0x1ca], 0
0002E068  c6850808000000         mov byte ptr [rbp + 0x808], 0
0002E06F  488d8d08080000         lea rcx, [rbp + 0x808]
0002E076  e88595feff             call 0x17600
0002E07B  4c897c2430             mov qword ptr [rsp + 0x30], r15
0002E080  44897c2428             mov dword ptr [rsp + 0x28], r15d
0002E085  44896c2420             mov dword ptr [rsp + 0x20], r13d
0002E08A  4533c9                 xor r9d, r9d
0002E08D  458bc4                 mov r8d, r12d
0002E090  ba00000080             mov edx, 0x80000000
0002E095  488d8dc0010000         lea rcx, [rbp + 0x1c0]
0002E09C  ffd0                   call rax
0002E09E  488bd8                 mov rbx, rax
0002E0A1  4883f8ff               cmp rax, -1
0002E0A5  0f849e000000           je 0x2e149
0002E0AB  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
0002E0B2  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002E0B9  e8e298feff             call 0x179a0
0002E0BE  33d2                   xor edx, edx
0002E0C0  488bcb                 mov rcx, rbx
0002E0C3  ffd0                   call rax
0002E0C5  8bf8                   mov edi, eax
0002E0C7  3bc6                   cmp eax, esi
0002E0C9  750f                   jne 0x2e0da
0002E0CB  c6450000               mov byte ptr [rbp], 0
0002E0CF  488d4d00               lea rcx, [rbp]
0002E0D3  e8689cfeff             call 0x17d40
0002E0D8  eb6a                   jmp 0x2e144
0002E0DA  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
0002E0E1  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002E0E8  e8f39ffeff             call 0x180e0
0002E0ED  488bd7                 mov rdx, rdi
0002E0F0  33c9                   xor ecx, ecx
0002E0F2  41b904000000           mov r9d, 4
0002E0F8  41b800300000           mov r8d, 0x3000
0002E0FE  ffd0                   call rax
0002E100  488905115d0300         mov qword ptr [rip + 0x35d11], rax   ; -> 0x63e18
0002E107  4885c0                 test rax, rax
0002E10A  742b                   je 0x2e137
0002E10C  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
0002E113  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002E11A  e861a3feff             call 0x18480
0002E11F  4c897c2420             mov qword ptr [rsp + 0x20], r15
0002E124  4c8d4d78               lea r9, [rbp + 0x78]
0002E128  448bc7                 mov r8d, edi
0002E12B  488b15e65c0300         mov rdx, qword ptr [rip + 0x35ce6]   ; -> 0x63e18
0002E132  488bcb                 mov rcx, rbx
0002E135  ffd0                   call rax
0002E137  c6450000               mov byte ptr [rbp], 0
0002E13B  488d4d00               lea rcx, [rbp]
0002E13F  e8fc9bfeff             call 0x17d40
0002E144  488bcb                 mov rcx, rbx
0002E147  ffd0                   call rax
0002E149  65488b042560000000     mov rax, qword ptr gs:[0x60]
0002E152  4c8b4818               mov r9, qword ptr [rax + 0x18]
0002E156  4983c120               add r9, 0x20
0002E15A  4d8b31                 mov r14, qword ptr [r9]
0002E15D  4d3bf1                 cmp r14, r9
0002E160  0f84a1000000           je 0x2e207
0002E166  440fb7154af4fdff       movzx r10d, word ptr [rip - 0x20bb6]   ; -> 0xd5b8
0002E16E  6690                   nop 
0002E170  498b5e50               mov rbx, qword ptr [r14 + 0x50]
0002E174  4885db                 test rbx, rbx
0002E177  0f847e000000           je 0x2e1fb
0002E17D  41b8c59d1c81           mov r8d, 0x811c9dc5
0002E183  0fb703                 movzx eax, word ptr [rbx]
0002E186  6685c0                 test ax, ax
0002E189  742d                   je 0x2e1b8
0002E18B  0f1f440000             nop dword ptr [rax + rax]
0002E190  488d5b02               lea rbx, [rbx + 2]
0002E194  8d509f                 lea edx, [rax - 0x61]
0002E197  0fb6c8                 movzx ecx, al
0002E19A  2c20                   sub al, 0x20
0002E19C  6683fa19               cmp dx, 0x19
0002E1A0  0f47c1                 cmova eax, ecx
0002E1A3  0fbec0                 movsx eax, al
0002E1A6  4133c0                 xor eax, r8d
0002E1A9  4469c093010001         imul r8d, eax, 0x1000193
0002E1B0  0fb703                 movzx eax, word ptr [rbx]
0002E1B3  6685c0                 test ax, ax
0002E1B6  75d8                   jne 0x2e190
0002E1B8  488d1df9f3fdff         lea rbx, [rip - 0x20c07]   ; -> 0xd5b8
0002E1BF  bfc59d1c81             mov edi, 0x811c9dc5
0002E1C4  410fb7c2               movzx eax, r10w
0002E1C8  0f1f840000000000       nop dword ptr [rax + rax]
0002E1D0  488d5b02               lea rbx, [rbx + 2]
0002E1D4  8d509f                 lea edx, [rax - 0x61]
0002E1D7  0fb6c8                 movzx ecx, al
0002E1DA  2c20                   sub al, 0x20
0002E1DC  6683fa19               cmp dx, 0x19
0002E1E0  0f47c1                 cmova eax, ecx
0002E1E3  0fbec0                 movsx eax, al
0002E1E6  33c7                   xor eax, edi
0002E1E8  69f893010001           imul edi, eax, 0x1000193
0002E1EE  0fb703                 movzx eax, word ptr [rbx]
0002E1F1  6685c0                 test ax, ax
0002E1F4  75da                   jne 0x2e1d0
0002E1F6  443bc7                 cmp r8d, edi
0002E1F9  7461                   je 0x2e25c
0002E1FB  4d8b36                 mov r14, qword ptr [r14]
0002E1FE  4d3bf1                 cmp r14, r9
0002E201  0f8569ffffff           jne 0x2e170
0002E207  488b5d08               mov rbx, qword ptr [rbp + 8]
0002E20B  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
0002E212  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002E219  e8229bfeff             call 0x17d40
0002E21E  488bcb                 mov rcx, rbx
0002E221  ffd0                   call rax
0002E223  488d1d947f0000         lea rbx, [rip + 0x7f94]   ; -> 0x361be
0002E22A  4c8d05cf7e0000         lea r8, [rip + 0x7ecf]   ; -> 0x36100
0002E231  bfc59d1c81             mov edi, 0x811c9dc5
0002E236  4533ed                 xor r13d, r13d
0002E239  418bd5                 mov edx, r13d
0002E23C  493bd8                 cmp rbx, r8
0002E23F  0f869b040000           jbe 0x2e6e0
0002E245  492bd8                 sub rbx, r8
0002E248  4883fb40               cmp rbx, 0x40
0002E24C  0f8684040000           jbe 0x2e6d6
0002E252  bb40000000             mov ebx, 0x40
0002E257  e994040000             jmp 0x2e6f0
0002E25C  4d8b7620               mov r14, qword ptr [r14 + 0x20]
0002E260  4d85f6                 test r14, r14
0002E263  74a2                   je 0x2e207
0002E265  4c8b1d345b0300         mov r11, qword ptr [rip + 0x35b34]   ; -> 0x63da0
0002E26C  4d85db                 test r11, r11
0002E26F  0f8593000000           jne 0x2e308
0002E275  49634e3c               movsxd rcx, dword ptr [r14 + 0x3c]
0002E279  4903ce                 add rcx, r14
0002E27C  440fb74914             movzx r9d, word ptr [rcx + 0x14]
0002E281  4c03c9                 add r9, rcx
0002E284  458bc7                 mov r8d, r15d
0002E287  440fb75106             movzx r10d, word ptr [rcx + 6]
0002E28C  4585d2                 test r10d, r10d
0002E28F  0f8472ffffff           je 0x2e207
0002E295  6666660f1f840000000000 nop word ptr [rax + rax]
0002E2A0  418bc0                 mov eax, r8d
0002E2A3  488d0c80               lea rcx, [rax + rax*4]
0002E2A7  418b44c93c             mov eax, dword ptr [r9 + rcx*8 + 0x3c]
0002E2AC  2520000020             and eax, 0x20000020
0002E2B1  3d20000020             cmp eax, 0x20000020
0002E2B6  753c                   jne 0x2e2f4
0002E2B8  418b5cc924             mov ebx, dword ptr [r9 + rcx*8 + 0x24]
0002E2BD  4903de                 add rbx, r14
0002E2C0  418bd7                 mov edx, r15d
0002E2C3  418b7cc920             mov edi, dword ptr [r9 + rcx*8 + 0x20]
0002E2C8  83ef02                 sub edi, 2
0002E2CB  7427                   je 0x2e2f4
0002E2CD  0f1f00                 nop dword ptr [rax]
0002E2D0  448bda                 mov r11d, edx
0002E2D3  4c03db                 add r11, rbx
0002E2D6  41803b0f               cmp byte ptr [r11], 0xf
0002E2DA  7512                   jne 0x2e2ee
0002E2DC  8d4201                 lea eax, [rdx + 1]
0002E2DF  803c1805               cmp byte ptr [rax + rbx], 5
0002E2E3  7509                   jne 0x2e2ee
0002E2E5  8d4202                 lea eax, [rdx + 2]
0002E2E8  803c18c3               cmp byte ptr [rax + rbx], 0xc3
0002E2EC  7413                   je 0x2e301
0002E2EE  ffc2                   inc edx
0002E2F0  3bd7                   cmp edx, edi
0002E2F2  72dc                   jb 0x2e2d0
0002E2F4  41ffc0                 inc r8d
0002E2F7  453bc2                 cmp r8d, r10d
0002E2FA  7ca4                   jl 0x2e2a0
0002E2FC  e906ffffff             jmp 0x2e207
0002E301  4c891d985a0300         mov qword ptr [rip + 0x35a98], r11   ; -> 0x63da0
0002E308  488b05095b0300         mov rax, qword ptr [rip + 0x35b09]   ; -> 0x63e18
0002E30F  4885c0                 test rax, rax
0002E312  0f95c1                 setne cl
0002E315  888df0070000           mov byte ptr [rbp + 0x7f0], cl
0002E31B  4885c0                 test rax, rax
0002E31E  4c0f45f0               cmovne r14, rax
0002E322  4d63563c               movsxd r10, dword ptr [r14 + 0x3c]
0002E326  4d03d6                 add r10, r14
0002E329  4183ba8c00000000       cmp dword ptr [r10 + 0x8c], 0
0002E331  0f84d0feffff           je 0x2e207
0002E337  458b8a88000000         mov r9d, dword ptr [r10 + 0x88]
0002E33E  84c9                   test cl, cl
0002E340  751d                   jne 0x2e35f
0002E342  4b8d340e               lea rsi, [r14 + r9]
0002E346  8b461c                 mov eax, dword ptr [rsi + 0x1c]
0002E349  894510                 mov dword ptr [rbp + 0x10], eax
0002E34C  448b6e24               mov r13d, dword ptr [rsi + 0x24]
0002E350  4d03ee                 add r13, r14
0002E353  448b6620               mov r12d, dword ptr [rsi + 0x20]
0002E357  4d03e6                 add r12, r14
0002E35A  e94c010000             jmp 0x2e4ab
0002E35F  450fb74214             movzx r8d, word ptr [r10 + 0x14]
0002E364  4d03c2                 add r8, r10
0002E367  418bd7                 mov edx, r15d
0002E36A  410fb77206             movzx esi, word ptr [r10 + 6]
0002E36F  85f6                   test esi, esi
0002E371  743b                   je 0x2e3ae
0002E373  0f1f4000               nop dword ptr [rax]
0002E377  660f1f840000000000     nop word ptr [rax + rax]
0002E380  8bc2                   mov eax, edx
0002E382  488d0c80               lea rcx, [rax + rax*4]
0002E386  488d1ccd00000000       lea rbx, [rcx*8]
0002E38E  428b7c0324             mov edi, dword ptr [rbx + r8 + 0x24]
0002E393  443bcf                 cmp r9d, edi
0002E396  7210                   jb 0x2e3a8
0002E398  428b4c0320             mov ecx, dword ptr [rbx + r8 + 0x20]
0002E39D  03cf                   add ecx, edi
0002E39F  443bc9                 cmp r9d, ecx
0002E3A2  0f8279010000           jb 0x2e521
0002E3A8  ffc2                   inc edx
0002E3AA  3bd6                   cmp edx, esi
0002E3AC  7cd2                   jl 0x2e380
0002E3AE  4b8d340e               lea rsi, [r14 + r9]
0002E3B2  4c8bee                 mov r13, rsi
0002E3B5  448b4e20               mov r9d, dword ptr [rsi + 0x20]
0002E3B9  410fb75a14             movzx ebx, word ptr [r10 + 0x14]
0002E3BE  4903da                 add rbx, r10
0002E3C1  418bd7                 mov edx, r15d
0002E3C4  450fb77a06             movzx r15d, word ptr [r10 + 6]
0002E3C9  4585ff                 test r15d, r15d
0002E3CC  7431                   je 0x2e3ff
0002E3CE  6690                   nop 
0002E3D0  8bc2                   mov eax, edx
0002E3D2  488d0c80               lea rcx, [rax + rax*4]
0002E3D6  488d3ccd00000000       lea rdi, [rcx*8]
0002E3DE  448b441f24             mov r8d, dword ptr [rdi + rbx + 0x24]
0002E3E3  453bc8                 cmp r9d, r8d
0002E3E6  7210                   jb 0x2e3f8
0002E3E8  8b4c1f20               mov ecx, dword ptr [rdi + rbx + 0x20]
0002E3EC  4103c8                 add ecx, r8d
0002E3EF  443bc9                 cmp r9d, ecx
0002E3F2  0f8252010000           jb 0x2e54a
0002E3F8  ffc2                   inc edx
0002E3FA  413bd7                 cmp edx, r15d
0002E3FD  7cd1                   jl 0x2e3d0
0002E3FF  458be1                 mov r12d, r9d
0002E402  4d03e6                 add r12, r14
0002E405  458b4d24               mov r9d, dword ptr [r13 + 0x24]
0002E409  410fb75a14             movzx ebx, word ptr [r10 + 0x14]
0002E40E  4903da                 add rbx, r10
0002E411  33d2                   xor edx, edx
0002E413  450fb77a06             movzx r15d, word ptr [r10 + 6]
0002E418  4585ff                 test r15d, r15d
0002E41B  7430                   je 0x2e44d
0002E41D  0f1f00                 nop dword ptr [rax]
0002E420  488d0c92               lea rcx, [rdx + rdx*4]
0002E424  488d3ccd00000000       lea rdi, [rcx*8]
0002E42C  448b443b24             mov r8d, dword ptr [rbx + rdi + 0x24]
0002E431  453bc8                 cmp r9d, r8d
0002E434  7210                   jb 0x2e446
0002E436  8b4c3b20               mov ecx, dword ptr [rbx + rdi + 0x20]
0002E43A  4103c8                 add ecx, r8d
0002E43D  443bc9                 cmp r9d, ecx
0002E440  0f822a010000           jb 0x2e570
0002E446  ffc2                   inc edx
0002E448  413bd7                 cmp edx, r15d
0002E44B  7cd3                   jl 0x2e420
0002E44D  458be9                 mov r13d, r9d
0002E450  4d03ee                 add r13, r14
0002E453  448b4e1c               mov r9d, dword ptr [rsi + 0x1c]
0002E457  410fb75a14             movzx ebx, word ptr [r10 + 0x14]
0002E45C  4903da                 add rbx, r10
0002E45F  33d2                   xor edx, edx
0002E461  450fb77a06             movzx r15d, word ptr [r10 + 6]
0002E466  4585ff                 test r15d, r15d
0002E469  7432                   je 0x2e49d
0002E46B  0f1f440000             nop dword ptr [rax + rax]
0002E470  488d0c92               lea rcx, [rdx + rdx*4]
0002E474  488d3ccd00000000       lea rdi, [rcx*8]
0002E47C  448b441f24             mov r8d, dword ptr [rdi + rbx + 0x24]
0002E481  453bc8                 cmp r9d, r8d
0002E484  7210                   jb 0x2e496
0002E486  8b4c1f20               mov ecx, dword ptr [rdi + rbx + 0x20]
0002E48A  4103c8                 add ecx, r8d
0002E48D  443bc9                 cmp r9d, ecx
0002E490  0f8200010000           jb 0x2e596
0002E496  ffc2                   inc edx
0002E498  413bd7                 cmp edx, r15d
0002E49B  7cd3                   jl 0x2e470
0002E49D  44894d10               mov dword ptr [rbp + 0x10], r9d
0002E4A1  4533ff                 xor r15d, r15d
0002E4A4  0fb68df0070000         movzx ecx, byte ptr [rbp + 0x7f0]
0002E4AB  448b4e18               mov r9d, dword ptr [rsi + 0x18]
0002E4AF  44894d38               mov dword ptr [rbp + 0x38], r9d
0002E4B3  4585c9                 test r9d, r9d
0002E4B6  0f844bfdffff           je 0x2e207
0002E4BC  0f1f4000               nop dword ptr [rax]
0002E4C0  418bc7                 mov eax, r15d
0002E4C3  418b1c84               mov ebx, dword ptr [r12 + rax*4]
0002E4C7  84c9                   test cl, cl
0002E4C9  0f84e7000000           je 0x2e5b6
0002E4CF  450fb74a14             movzx r9d, word ptr [r10 + 0x14]
0002E4D4  4d03ca                 add r9, r10
0002E4D7  33d2                   xor edx, edx
0002E4D9  410fb77206             movzx esi, word ptr [r10 + 6]
0002E4DE  85f6                   test esi, esi
0002E4E0  0f84cc000000           je 0x2e5b2
0002E4E6  66660f1f840000000000   nop word ptr [rax + rax]
0002E4F0  488d0c92               lea rcx, [rdx + rdx*4]
0002E4F4  488d3ccd00000000       lea rdi, [rcx*8]
0002E4FC  458b443924             mov r8d, dword ptr [r9 + rdi + 0x24]
0002E501  413bd8                 cmp ebx, r8d
0002E504  7210                   jb 0x2e516
0002E506  418b4c3920             mov ecx, dword ptr [r9 + rdi + 0x20]
0002E50B  4103c8                 add ecx, r8d
0002E50E  3bd9                   cmp ebx, ecx
0002E510  0f8292000000           jb 0x2e5a8
0002E516  ffc2                   inc edx
0002E518  3bd6                   cmp edx, esi
0002E51A  7cd4                   jl 0x2e4f0
0002E51C  e991000000             jmp 0x2e5b2
0002E521  428b74032c             mov esi, dword ptr [rbx + r8 + 0x2c]
0002E526  2bf7                   sub esi, edi
0002E528  4103f1                 add esi, r9d
0002E52B  4903f6                 add rsi, r14
0002E52E  4c8bee                 mov r13, rsi
0002E531  448b4e20               mov r9d, dword ptr [rsi + 0x20]
0002E535  410fb75a14             movzx ebx, word ptr [r10 + 0x14]
0002E53A  4903da                 add rbx, r10
0002E53D  418bd7                 mov edx, r15d
0002E540  450fb77a06             movzx r15d, word ptr [r10 + 6]
0002E545  e986feffff             jmp 0x2e3d0
0002E54A  448b641f2c             mov r12d, dword ptr [rdi + rbx + 0x2c]
0002E54F  452be0                 sub r12d, r8d
0002E552  4503e1                 add r12d, r9d
0002E555  4d03e6                 add r12, r14
0002E558  458b4d24               mov r9d, dword ptr [r13 + 0x24]
0002E55C  410fb75a14             movzx ebx, word ptr [r10 + 0x14]
0002E561  4903da                 add rbx, r10
0002E564  33d2                   xor edx, edx
0002E566  450fb77a06             movzx r15d, word ptr [r10 + 6]
0002E56B  e9b0feffff             jmp 0x2e420
0002E570  448b6c3b2c             mov r13d, dword ptr [rbx + rdi + 0x2c]
0002E575  452be8                 sub r13d, r8d
0002E578  4503e9                 add r13d, r9d
0002E57B  4d03ee                 add r13, r14
0002E57E  448b4e1c               mov r9d, dword ptr [rsi + 0x1c]
0002E582  410fb75a14             movzx ebx, word ptr [r10 + 0x14]
0002E587  4903da                 add rbx, r10
0002E58A  33d2                   xor edx, edx
0002E58C  450fb77a06             movzx r15d, word ptr [r10 + 6]
0002E591  e9dafeffff             jmp 0x2e470
0002E596  8b441f2c               mov eax, dword ptr [rdi + rbx + 0x2c]
0002E59A  412bc0                 sub eax, r8d
0002E59D  4103c1                 add eax, r9d
0002E5A0  894510                 mov dword ptr [rbp + 0x10], eax
0002E5A3  e9f9feffff             jmp 0x2e4a1
0002E5A8  418b44392c             mov eax, dword ptr [r9 + rdi + 0x2c]
0002E5AD  412bc0                 sub eax, r8d
0002E5B0  03d8                   add ebx, eax
0002E5B2  448b4d38               mov r9d, dword ptr [rbp + 0x38]
0002E5B6  8bd3                   mov edx, ebx
0002E5B8  4903d6                 add rdx, r14
0002E5BB  bbc59d1c81             mov ebx, 0x811c9dc5
0002E5C0  0fb60a                 movzx ecx, byte ptr [rdx]
0002E5C3  84c9                   test cl, cl
0002E5C5  7431                   je 0x2e5f8
0002E5C7  660f1f840000000000     nop word ptr [rax + rax]
0002E5D0  488d5201               lea rdx, [rdx + 1]
0002E5D4  8d419f                 lea eax, [rcx - 0x61]
0002E5D7  3c19                   cmp al, 0x19
0002E5D9  7703                   ja 0x2e5de
0002E5DB  80e920                 sub cl, 0x20
0002E5DE  0fbec1                 movsx eax, cl
0002E5E1  33c3                   xor eax, ebx
0002E5E3  69d893010001           imul ebx, eax, 0x1000193
0002E5E9  0fb60a                 movzx ecx, byte ptr [rdx]
0002E5EC  84c9                   test cl, cl
0002E5EE  75e0                   jne 0x2e5d0
0002E5F0  81fb21328f45           cmp ebx, 0x458f3221
0002E5F6  7418                   je 0x2e610
0002E5F8  41ffc7                 inc r15d
0002E5FB  453bf9                 cmp r15d, r9d
0002E5FE  0f8303fcffff           jae 0x2e207
0002E604  0fb68df0070000         movzx ecx, byte ptr [rbp + 0x7f0]
0002E60B  e9b0feffff             jmp 0x2e4c0
0002E610  418bc7                 mov eax, r15d
0002E613  410fb7544500           movzx edx, word ptr [r13 + rax*2]
0002E619  8b4d10                 mov ecx, dword ptr [rbp + 0x10]
0002E61C  4903ce                 add rcx, r14
0002E61F  8b1c91                 mov ebx, dword ptr [rcx + rdx*4]
0002E622  80bdf007000000         cmp byte ptr [rbp + 0x7f0], 0
0002E629  744a                   je 0x2e675
0002E62B  450fb74a14             movzx r9d, word ptr [r10 + 0x14]
0002E630  4d03ca                 add r9, r10
0002E633  33d2                   xor edx, edx
0002E635  450fb75206             movzx r10d, word ptr [r10 + 6]
0002E63A  4585d2                 test r10d, r10d
0002E63D  7436                   je 0x2e675
0002E63F  90                     nop 
0002E640  488d0c92               lea rcx, [rdx + rdx*4]
0002E644  488d3ccd00000000       lea rdi, [rcx*8]
0002E64C  458b443924             mov r8d, dword ptr [r9 + rdi + 0x24]
0002E651  413bd8                 cmp ebx, r8d
0002E654  720c                   jb 0x2e662
0002E656  418b4c3920             mov ecx, dword ptr [r9 + rdi + 0x20]
0002E65B  4103c8                 add ecx, r8d
0002E65E  3bd9                   cmp ebx, ecx
0002E660  7209                   jb 0x2e66b
0002E662  ffc2                   inc edx
0002E664  413bd2                 cmp edx, r10d
0002E667  7cd7                   jl 0x2e640
0002E669  eb0a                   jmp 0x2e675
0002E66B  418b44392c             mov eax, dword ptr [r9 + rdi + 0x2c]
0002E670  412bc0                 sub eax, r8d
0002E673  03d8                   add ebx, eax
0002E675  4903de                 add rbx, r14
0002E678  33ff                   xor edi, edi
0002E67A  8bcf                   mov ecx, edi
0002E67C  0f1f4000               nop dword ptr [rax]
0002E680  8bd1                   mov edx, ecx
0002E682  0fb6041a               movzx eax, byte ptr [rdx + rbx]
0002E686  3cb8                   cmp al, 0xb8
0002E688  741c                   je 0x2e6a6
0002E68A  3cc3                   cmp al, 0xc3
0002E68C  0f8475fbffff           je 0x2e207
0002E692  3ccc                   cmp al, 0xcc
0002E694  0f846dfbffff           je 0x2e207
0002E69A  ffc1                   inc ecx
0002E69C  83f920                 cmp ecx, 0x20
0002E69F  7cdf                   jl 0x2e680
0002E6A1  e961fbffff             jmp 0x2e207
0002E6A6  8b4c1a01               mov ecx, dword ptr [rdx + rbx + 1]
0002E6AA  488b5d08               mov rbx, qword ptr [rbp + 8]
0002E6AE  85c9                   test ecx, ecx
0002E6B0  0f8455fbffff           je 0x2e20b
0002E6B6  48897c2428             mov qword ptr [rsp + 0x28], rdi
0002E6BB  48897c2420             mov qword ptr [rsp + 0x20], rdi
0002E6C0  41b911000000           mov r9d, 0x11
0002E6C6  4c8bc3                 mov r8, rbx
0002E6C9  498bd3                 mov rdx, r11
0002E6CC  e8877a0000             call 0x36158
0002E6D1  e935fbffff             jmp 0x2e20b
0002E6D6  897d78                 mov dword ptr [rbp + 0x78], edi
0002E6D9  4885db                 test rbx, rbx
0002E6DC  742a                   je 0x2e708
0002E6DE  eb10                   jmp 0x2e6f0
0002E6E0  bb10000000             mov ebx, 0x10
0002E6E5  6666660f1f840000000000 nop word ptr [rax + rax]
0002E6F0  420fb60c02             movzx ecx, byte ptr [rdx + r8]
0002E6F5  33cf                   xor ecx, edi
0002E6F7  69f993010001           imul edi, ecx, 0x1000193
0002E6FD  48ffc2                 inc rdx
0002E700  483bd3                 cmp rdx, rbx
0002E703  72eb                   jb 0x2e6f0
0002E705  897d78                 mov dword ptr [rbp + 0x78], edi
0002E708  e8138effff             call 0x27520
0002E70D  488905ac560300         mov qword ptr [rip + 0x356ac], rax   ; -> 0x63dc0
0002E714  49c7c0ffffffff         mov r8, 0xffffffffffffffff
0002E71B  41be03000000           mov r14d, 3
0002E721  458bce                 mov r9d, r14d
0002E724  0f1f4000               nop dword ptr [rax]
0002E728  0f1f840000000000       nop dword ptr [rax + rax]
0002E730  0f31                   rdtsc 
0002E732  48c1e220               shl rdx, 0x20
0002E736  480bc2                 or rax, rdx
0002E739  488bf8                 mov rdi, rax
0002E73C  33c0                   xor eax, eax
0002E73E  33c9                   xor ecx, ecx
0002E740  0fa2                   cpuid 
0002E742  8985b0000000           mov dword ptr [rbp + 0xb0], eax
0002E748  899db4000000           mov dword ptr [rbp + 0xb4], ebx
0002E74E  898db8000000           mov dword ptr [rbp + 0xb8], ecx
0002E754  8995bc000000           mov dword ptr [rbp + 0xbc], edx
0002E75A  0f31                   rdtsc 
0002E75C  48c1e220               shl rdx, 0x20
0002E760  480bc2                 or rax, rdx
0002E763  482bc7                 sub rax, rdi
0002E766  493bc0                 cmp rax, r8
0002E769  490f43c0               cmovae rax, r8
0002E76D  4c8bc0                 mov r8, rax
0002E770  4183e901               sub r9d, 1
0002E774  75ba                   jne 0x2e730
0002E776  65488b042560000000     mov rax, qword ptr gs:[0x60]
0002E77F  418bf5                 mov esi, r13d
0002E782  b9dec0adba             mov ecx, 0xbaadc0de
0002E787  44384802               cmp byte ptr [rax + 2], r9b
0002E78B  0f44f1                 cmove esi, ecx
0002E78E  49c1e814               shr r8, 0x14
0002E792  4133f0                 xor esi, r8d
0002E795  0f840f070000           je 0x2eeaa
0002E79B  0f31                   rdtsc 
0002E79D  48c1e220               shl rdx, 0x20
0002E7A1  480bc2                 or rax, rdx
0002E7A4  2407                   and al, 7
0002E7A6  3c02                   cmp al, 2
0002E7A8  0f83fc060000           jae 0x2eeaa
0002E7AE  0f31                   rdtsc 
0002E7B0  48c1e220               shl rdx, 0x20
0002E7B4  480bc2                 or rax, rdx
0002E7B7  488bd8                 mov rbx, rax
0002E7BA  48c1eb04               shr rbx, 4
0002E7BE  b8abaaaaaa             mov eax, 0xaaaaaaab
0002E7C3  f7e3                   mul ebx
0002E7C5  c1ea02                 shr edx, 2
0002E7C8  8d0c52                 lea ecx, [rdx + rdx*2]
0002E7CB  03c9                   add ecx, ecx
0002E7CD  2bd9                   sub ebx, ecx
0002E7CF  0f84c5050000           je 0x2ed9a
0002E7D5  83eb01                 sub ebx, 1
0002E7D8  0f841c040000           je 0x2ebfa
0002E7DE  83eb01                 sub ebx, 1
0002E7E1  0f8480000000           je 0x2e867
0002E7E7  83eb01                 sub ebx, 1
0002E7EA  488d5540               lea rdx, [rbp + 0x40]
0002E7EE  7451                   je 0x2e841
0002E7F0  83fb01                 cmp ebx, 1
0002E7F3  7426                   je 0x2e81b
0002E7F5  e876400000             call 0x32870
0002E7FA  90                     nop 
0002E7FB  4c8b4010               mov r8, qword ptr [rax + 0x10]
0002E7FF  488378180f             cmp qword ptr [rax + 0x18], 0xf
0002E804  7603                   jbe 0x2e809
0002E806  488b00                 mov rax, qword ptr [rax]
0002E809  488bd0                 mov rdx, rax
0002E80C  e8ff630000             call 0x34c10
0002E811  90                     nop 
0002E812  488d4d40               lea rcx, [rbp + 0x40]
0002E816  e97e060000             jmp 0x2ee99
0002E81B  e8203c0000             call 0x32440
0002E820  90                     nop 
0002E821  4c8b4010               mov r8, qword ptr [rax + 0x10]
0002E825  488378180f             cmp qword ptr [rax + 0x18], 0xf
0002E82A  7603                   jbe 0x2e82f
0002E82C  488b00                 mov rax, qword ptr [rax]
0002E82F  488bd0                 mov rdx, rax
0002E832  e8d9630000             call 0x34c10
0002E837  90                     nop 
0002E838  488d4d40               lea rcx, [rbp + 0x40]
0002E83C  e958060000             jmp 0x2ee99
0002E841  e8da380000             call 0x32120
0002E846  90                     nop 
0002E847  4c8b4010               mov r8, qword ptr [rax + 0x10]
0002E84B  488378180f             cmp qword ptr [rax + 0x18], 0xf
0002E850  7603                   jbe 0x2e855
0002E852  488b00                 mov rax, qword ptr [rax]
0002E855  488bd0                 mov rdx, rax
0002E858  e8b3630000             call 0x34c10
0002E85D  90                     nop 
0002E85E  488d4d40               lea rcx, [rbp + 0x40]
0002E862  e932060000             jmp 0x2ee99
0002E867  48bbc9994d59d22546a1   movabs rbx, 0xa14625d2594d99c9
0002E871  488bcb                 mov rcx, rbx
0002E874  e87776feff             call 0x15ef0
0002E879  340a                   xor al, 0xa
0002E87B  884540                 mov byte ptr [rbp + 0x40], al
0002E87E  48b9ca994d59d22546a1   movabs rcx, 0xa14625d2594d99ca
0002E888  e86376feff             call 0x15ef0
0002E88D  345b                   xor al, 0x5b
0002E88F  884541                 mov byte ptr [rbp + 0x41], al
0002E892  48b9cb994d59d22546a1   movabs rcx, 0xa14625d2594d99cb
0002E89C  e84f76feff             call 0x15ef0
0002E8A1  3421                   xor al, 0x21
0002E8A3  884542                 mov byte ptr [rbp + 0x42], al
0002E8A6  48b9cc994d59d22546a1   movabs rcx, 0xa14625d2594d99cc
0002E8B0  e83b76feff             call 0x15ef0
0002E8B5  345d                   xor al, 0x5d
0002E8B7  884543                 mov byte ptr [rbp + 0x43], al
0002E8BA  48b9cd994d59d22546a1   movabs rcx, 0xa14625d2594d99cd
0002E8C4  e82776feff             call 0x15ef0
0002E8C9  3420                   xor al, 0x20
0002E8CB  884544                 mov byte ptr [rbp + 0x44], al
0002E8CE  48b9ce994d59d22546a1   movabs rcx, 0xa14625d2594d99ce
0002E8D8  e81376feff             call 0x15ef0
0002E8DD  3449                   xor al, 0x49
0002E8DF  884545                 mov byte ptr [rbp + 0x45], al
0002E8E2  48b9cf994d59d22546a1   movabs rcx, 0xa14625d2594d99cf
0002E8EC  e8ff75feff             call 0x15ef0
0002E8F1  3473                   xor al, 0x73
0002E8F3  884546                 mov byte ptr [rbp + 0x46], al
0002E8F6  48b9d0994d59d22546a1   movabs rcx, 0xa14625d2594d99d0
0002E900  e8eb75feff             call 0x15ef0
0002E905  3420                   xor al, 0x20
0002E907  884547                 mov byte ptr [rbp + 0x47], al
0002E90A  48b9d1994d59d22546a1   movabs rcx, 0xa14625d2594d99d1
0002E914  e8d775feff             call 0x15ef0
0002E919  3474                   xor al, 0x74
0002E91B  884548                 mov byte ptr [rbp + 0x48], al
0002E91E  48b9d2994d59d22546a1   movabs rcx, 0xa14625d2594d99d2
0002E928  e8c375feff             call 0x15ef0
0002E92D  3468                   xor al, 0x68
0002E92F  884549                 mov byte ptr [rbp + 0x49], al
0002E932  48b9d3994d59d22546a1   movabs rcx, 0xa14625d2594d99d3
0002E93C  e8af75feff             call 0x15ef0
0002E941  3461                   xor al, 0x61
0002E943  88454a                 mov byte ptr [rbp + 0x4a], al
0002E946  48b9d4994d59d22546a1   movabs rcx, 0xa14625d2594d99d4
0002E950  e89b75feff             call 0x15ef0
0002E955  3474                   xor al, 0x74
0002E957  88454b                 mov byte ptr [rbp + 0x4b], al
0002E95A  48b9d5994d59d22546a1   movabs rcx, 0xa14625d2594d99d5
0002E964  e88775feff             call 0x15ef0
0002E969  3420                   xor al, 0x20
0002E96B  88454c                 mov byte ptr [rbp + 0x4c], al
0002E96E  48b9d6994d59d22546a1   movabs rcx, 0xa14625d2594d99d6
0002E978  e87375feff             call 0x15ef0
0002E97D  3449                   xor al, 0x49
0002E97F  88454d                 mov byte ptr [rbp + 0x4d], al
0002E982  48b9d7994d59d22546a1   movabs rcx, 0xa14625d2594d99d7
0002E98C  e85f75feff             call 0x15ef0
0002E991  3444                   xor al, 0x44
0002E993  88454e                 mov byte ptr [rbp + 0x4e], al
0002E996  48b9d8994d59d22546a1   movabs rcx, 0xa14625d2594d99d8
0002E9A0  e84b75feff             call 0x15ef0
0002E9A5  3441                   xor al, 0x41
0002E9A7  88454f                 mov byte ptr [rbp + 0x4f], al
0002E9AA  48b9d9994d59d22546a1   movabs rcx, 0xa14625d2594d99d9
0002E9B4  e83775feff             call 0x15ef0
0002E9B9  3420                   xor al, 0x20
0002E9BB  884550                 mov byte ptr [rbp + 0x50], al
0002E9BE  48b9da994d59d22546a1   movabs rcx, 0xa14625d2594d99da
0002E9C8  e82375feff             call 0x15ef0
0002E9CD  3450                   xor al, 0x50
0002E9CF  884551                 mov byte ptr [rbp + 0x51], al
0002E9D2  48b9db994d59d22546a1   movabs rcx, 0xa14625d2594d99db
0002E9DC  e80f75feff             call 0x15ef0
0002E9E1  3472                   xor al, 0x72
0002E9E3  884552                 mov byte ptr [rbp + 0x52], al
0002E9E6  48b9dc994d59d22546a1   movabs rcx, 0xa14625d2594d99dc
0002E9F0  e8fb74feff             call 0x15ef0
0002E9F5  346f                   xor al, 0x6f
0002E9F7  884553                 mov byte ptr [rbp + 0x53], al
0002E9FA  48b9dd994d59d22546a1   movabs rcx, 0xa14625d2594d99dd
0002EA04  e8e774feff             call 0x15ef0
0002EA09  3420                   xor al, 0x20
0002EA0B  884554                 mov byte ptr [rbp + 0x54], al
0002EA0E  48b9de994d59d22546a1   movabs rcx, 0xa14625d2594d99de
0002EA18  e8d374feff             call 0x15ef0
0002EA1D  346f                   xor al, 0x6f
0002EA1F  884555                 mov byte ptr [rbp + 0x55], al
0002EA22  48b9df994d59d22546a1   movabs rcx, 0xa14625d2594d99df
0002EA2C  e8bf74feff             call 0x15ef0
0002EA31  3472                   xor al, 0x72
0002EA33  884556                 mov byte ptr [rbp + 0x56], al
0002EA36  48b9e0994d59d22546a1   movabs rcx, 0xa14625d2594d99e0
0002EA40  e8ab74feff             call 0x15ef0
0002EA45  3420                   xor al, 0x20
0002EA47  884557                 mov byte ptr [rbp + 0x57], al
0002EA4A  48b9e1994d59d22546a1   movabs rcx, 0xa14625d2594d99e1
0002EA54  e89774feff             call 0x15ef0
0002EA59  3449                   xor al, 0x49
0002EA5B  884558                 mov byte ptr [rbp + 0x58], al
0002EA5E  48b9e2994d59d22546a1   movabs rcx, 0xa14625d2594d99e2
0002EA68  e88374feff             call 0x15ef0
0002EA6D  3444                   xor al, 0x44
0002EA6F  884559                 mov byte ptr [rbp + 0x59], al
0002EA72  48b9e3994d59d22546a1   movabs rcx, 0xa14625d2594d99e3
0002EA7C  e86f74feff             call 0x15ef0
0002EA81  3441                   xor al, 0x41
0002EA83  88455a                 mov byte ptr [rbp + 0x5a], al
0002EA86  48b9e4994d59d22546a1   movabs rcx, 0xa14625d2594d99e4
0002EA90  e85b74feff             call 0x15ef0
0002EA95  3420                   xor al, 0x20
0002EA97  88455b                 mov byte ptr [rbp + 0x5b], al
0002EA9A  48b9e5994d59d22546a1   movabs rcx, 0xa14625d2594d99e5
0002EAA4  e84774feff             call 0x15ef0
0002EAA9  3448                   xor al, 0x48
0002EAAB  88455c                 mov byte ptr [rbp + 0x5c], al
0002EAAE  48b9e6994d59d22546a1   movabs rcx, 0xa14625d2594d99e6
0002EAB8  e83374feff             call 0x15ef0
0002EABD  346f                   xor al, 0x6f
0002EABF  88455d                 mov byte ptr [rbp + 0x5d], al
0002EAC2  48b9e7994d59d22546a1   movabs rcx, 0xa14625d2594d99e7
0002EACC  e81f74feff             call 0x15ef0
0002EAD1  346d                   xor al, 0x6d
0002EAD3  88455e                 mov byte ptr [rbp + 0x5e], al
0002EAD6  48b9e8994d59d22546a1   movabs rcx, 0xa14625d2594d99e8
0002EAE0  e80b74feff             call 0x15ef0
0002EAE5  3465                   xor al, 0x65
0002EAE7  88455f                 mov byte ptr [rbp + 0x5f], al
0002EAEA  48b9e9994d59d22546a1   movabs rcx, 0xa14625d2594d99e9
0002EAF4  e8f773feff             call 0x15ef0
0002EAF9  343f                   xor al, 0x3f
0002EAFB  884560                 mov byte ptr [rbp + 0x60], al
0002EAFE  48b9ea994d59d22546a1   movabs rcx, 0xa14625d2594d99ea
0002EB08  e8e373feff             call 0x15ef0
0002EB0D  3420                   xor al, 0x20
0002EB0F  884561                 mov byte ptr [rbp + 0x61], al
0002EB12  48b9eb994d59d22546a1   movabs rcx, 0xa14625d2594d99eb
0002EB1C  e8cf73feff             call 0x15ef0
0002EB21  343b                   xor al, 0x3b
0002EB23  884562                 mov byte ptr [rbp + 0x62], al
0002EB26  48b9ec994d59d22546a1   movabs rcx, 0xa14625d2594d99ec
0002EB30  e8bb73feff             call 0x15ef0
0002EB35  3429                   xor al, 0x29
0002EB37  884563                 mov byte ptr [rbp + 0x63], al
0002EB3A  48b9ed994d59d22546a1   movabs rcx, 0xa14625d2594d99ed
0002EB44  e8a773feff             call 0x15ef0
0002EB49  340a                   xor al, 0xa
0002EB4B  884564                 mov byte ptr [rbp + 0x64], al
0002EB4E  48b9ee994d59d22546a1   movabs rcx, 0xa14625d2594d99ee
0002EB58  e89373feff             call 0x15ef0
0002EB5D  884565                 mov byte ptr [rbp + 0x65], al
0002EB60  0f57c0                 xorps xmm0, xmm0
0002EB63  0f114518               movups xmmword ptr [rbp + 0x18], xmm0
0002EB67  4c896d28               mov qword ptr [rbp + 0x28], r13
0002EB6B  48c745300f000000       mov qword ptr [rbp + 0x30], 0xf
0002EB73  c6451800               mov byte ptr [rbp + 0x18], 0
0002EB77  c785f007000080000000   mov dword ptr [rbp + 0x7f0], 0x80
0002EB81  4533c0                 xor r8d, r8d
0002EB84  ba25000000             mov edx, 0x25
0002EB89  488d4d18               lea rcx, [rbp + 0x18]
0002EB8D  e82e5d0000             call 0x348c0
0002EB92  498bd5                 mov rdx, r13
0002EB95  488d0c1a               lea rcx, [rdx + rbx]
0002EB99  e85273feff             call 0x15ef0
0002EB9E  32441540               xor al, byte ptr [rbp + rdx + 0x40]
0002EBA2  488d4d18               lea rcx, [rbp + 0x18]
0002EBA6  48837d300f             cmp qword ptr [rbp + 0x30], 0xf
0002EBAB  480f474d18             cmova rcx, qword ptr [rbp + 0x18]
0002EBB0  880411                 mov byte ptr [rcx + rdx], al
0002EBB3  48ffc2                 inc rdx
0002EBB6  4883fa25               cmp rdx, 0x25
0002EBBA  72d9                   jb 0x2eb95
0002EBBC  488d4d40               lea rcx, [rbp + 0x40]
0002EBC0  b826000000             mov eax, 0x26
0002EBC5  6666660f1f840000000000 nop word ptr [rax + rax]
0002EBD0  c60100                 mov byte ptr [rcx], 0
0002EBD3  488d4901               lea rcx, [rcx + 1]
0002EBD7  4883e801               sub rax, 1
0002EBDB  75f3                   jne 0x2ebd0
0002EBDD  488d5518               lea rdx, [rbp + 0x18]
0002EBE1  48837d300f             cmp qword ptr [rbp + 0x30], 0xf
0002EBE6  480f475518             cmova rdx, qword ptr [rbp + 0x18]
0002EBEB  4c8b4528               mov r8, qword ptr [rbp + 0x28]
0002EBEF  e81c600000             call 0x34c10
0002EBF4  90                     nop 
0002EBF5  e99b020000             jmp 0x2ee95
0002EBFA  660f6f05ceedfdff       movdqa xmm0, xmmword ptr [rip - 0x21232]   ; -> 0xd9d0
0002EC02  f30f7f4540             movdqu xmmword ptr [rbp + 0x40], xmm0
0002EC07  c74550cd02282c         mov dword ptr [rbp + 0x50], 0x2c2802cd
0002EC0E  c74554386197cd         mov dword ptr [rbp + 0x54], 0xcd976138
0002EC15  66c74558f7b1           mov word ptr [rbp + 0x58], 0xb1f7
0002EC1B  c6455aec               mov byte ptr [rbp + 0x5a], 0xec
0002EC1F  48b9d5743da1aa2287fd   movabs rcx, 0xfd8722aaa13d74d5
0002EC29  e8c272feff             call 0x15ef0
0002EC2E  3468                   xor al, 0x68
0002EC30  88455b                 mov byte ptr [rbp + 0x5b], al
0002EC33  48b9d6743da1aa2287fd   movabs rcx, 0xfd8722aaa13d74d6
0002EC3D  e8ae72feff             call 0x15ef0
0002EC42  346f                   xor al, 0x6f
0002EC44  88455c                 mov byte ptr [rbp + 0x5c], al
0002EC47  48b9d7743da1aa2287fd   movabs rcx, 0xfd8722aaa13d74d7
0002EC51  e89a72feff             call 0x15ef0
0002EC56  3477                   xor al, 0x77
0002EC58  88455d                 mov byte ptr [rbp + 0x5d], al
0002EC5B  48b9d8743da1aa2287fd   movabs rcx, 0xfd8722aaa13d74d8
0002EC65  e88672feff             call 0x15ef0
0002EC6A  3469                   xor al, 0x69
0002EC6C  88455e                 mov byte ptr [rbp + 0x5e], al
0002EC6F  48b9d9743da1aa2287fd   movabs rcx, 0xfd8722aaa13d74d9
0002EC79  e87272feff             call 0x15ef0
0002EC7E  346e                   xor al, 0x6e
0002EC80  88455f                 mov byte ptr [rbp + 0x5f], al
0002EC83  48b9da743da1aa2287fd   movabs rcx, 0xfd8722aaa13d74da
0002EC8D  e85e72feff             call 0x15ef0
0002EC92  3467                   xor al, 0x67
0002EC94  884560                 mov byte ptr [rbp + 0x60], al
0002EC97  48b9db743da1aa2287fd   movabs rcx, 0xfd8722aaa13d74db
0002ECA1  e84a72feff             call 0x15ef0
0002ECA6  342e                   xor al, 0x2e
0002ECA8  884561                 mov byte ptr [rbp + 0x61], al
0002ECAB  48b9dc743da1aa2287fd   movabs rcx, 0xfd8722aaa13d74dc
0002ECB5  e83672feff             call 0x15ef0
0002ECBA  342e                   xor al, 0x2e
0002ECBC  884562                 mov byte ptr [rbp + 0x62], al
0002ECBF  48b9dd743da1aa2287fd   movabs rcx, 0xfd8722aaa13d74dd
0002ECC9  e82272feff             call 0x15ef0
0002ECCE  342e                   xor al, 0x2e
0002ECD0  884563                 mov byte ptr [rbp + 0x63], al
0002ECD3  48b9de743da1aa2287fd   movabs rcx, 0xfd8722aaa13d74de
0002ECDD  e80e72feff             call 0x15ef0
0002ECE2  340a                   xor al, 0xa
0002ECE4  884564                 mov byte ptr [rbp + 0x64], al
0002ECE7  48b9df743da1aa2287fd   movabs rcx, 0xfd8722aaa13d74df
0002ECF1  e8fa71feff             call 0x15ef0
0002ECF6  884565                 mov byte ptr [rbp + 0x65], al
0002ECF9  0f57c0                 xorps xmm0, xmm0
0002ECFC  0f114518               movups xmmword ptr [rbp + 0x18], xmm0
0002ED00  4c896d28               mov qword ptr [rbp + 0x28], r13
0002ED04  48c745300f000000       mov qword ptr [rbp + 0x30], 0xf
0002ED0C  c6451800               mov byte ptr [rbp + 0x18], 0
0002ED10  c785f007000020000000   mov dword ptr [rbp + 0x7f0], 0x20
0002ED1A  4533c0                 xor r8d, r8d
0002ED1D  ba25000000             mov edx, 0x25
0002ED22  488d4d18               lea rcx, [rbp + 0x18]
0002ED26  e8955b0000             call 0x348c0
0002ED2B  498bd5                 mov rdx, r13
0002ED2E  48bbba743da1aa2287fd   movabs rbx, 0xfd8722aaa13d74ba
0002ED38  0f1f840000000000       nop dword ptr [rax + rax]
0002ED40  488d0c1a               lea rcx, [rdx + rbx]
0002ED44  e8a771feff             call 0x15ef0
0002ED49  32441540               xor al, byte ptr [rbp + rdx + 0x40]
0002ED4D  488d4d18               lea rcx, [rbp + 0x18]
0002ED51  48837d300f             cmp qword ptr [rbp + 0x30], 0xf
0002ED56  480f474d18             cmova rcx, qword ptr [rbp + 0x18]
0002ED5B  880411                 mov byte ptr [rcx + rdx], al
0002ED5E  48ffc2                 inc rdx
0002ED61  4883fa25               cmp rdx, 0x25
0002ED65  72d9                   jb 0x2ed40
0002ED67  488d4d40               lea rcx, [rbp + 0x40]
0002ED6B  b826000000             mov eax, 0x26
0002ED70  c60100                 mov byte ptr [rcx], 0
0002ED73  488d4901               lea rcx, [rcx + 1]
0002ED77  4883e801               sub rax, 1
0002ED7B  75f3                   jne 0x2ed70
0002ED7D  488d5518               lea rdx, [rbp + 0x18]
0002ED81  48837d300f             cmp qword ptr [rbp + 0x30], 0xf
0002ED86  480f475518             cmova rdx, qword ptr [rbp + 0x18]
0002ED8B  4c8b4528               mov r8, qword ptr [rbp + 0x28]
0002ED8F  e87c5e0000             call 0x34c10
0002ED94  90                     nop 
0002ED95  e9fb000000             jmp 0x2ee95
0002ED9A  660f6f05eeebfdff       movdqa xmm0, xmmword ptr [rip - 0x21412]   ; -> 0xd990
0002EDA2  f30f7f4540             movdqu xmmword ptr [rbp + 0x40], xmm0
0002EDA7  660f6f0d11ebfdff       movdqa xmm1, xmmword ptr [rip - 0x214ef]   ; -> 0xd8c0
0002EDAF  f30f7f4d50             movdqu xmmword ptr [rbp + 0x50], xmm1
0002EDB4  c745605d59f537         mov dword ptr [rbp + 0x60], 0x37f5595d
0002EDBB  c74564671b67a4         mov dword ptr [rbp + 0x64], 0xa4671b67
0002EDC2  c74568c95f3104         mov dword ptr [rbp + 0x68], 0x4315fc9
0002EDC9  0f57c0                 xorps xmm0, xmm0
0002EDCC  0f114518               movups xmmword ptr [rbp + 0x18], xmm0
0002EDD0  4c896d28               mov qword ptr [rbp + 0x28], r13
0002EDD4  48c745300f000000       mov qword ptr [rbp + 0x30], 0xf
0002EDDC  c6451800               mov byte ptr [rbp + 0x18], 0
0002EDE0  c785f007000008000000   mov dword ptr [rbp + 0x7f0], 8
0002EDEA  4533c0                 xor r8d, r8d
0002EDED  ba2b000000             mov edx, 0x2b
0002EDF2  488d4d18               lea rcx, [rbp + 0x18]
0002EDF6  e8c55a0000             call 0x348c0
0002EDFB  498bd5                 mov rdx, r13
0002EDFE  48bb94d1c887726c413c   movabs rbx, 0x3c416c7287c8d194
0002EE08  48bfb9e5e41c6d4758bf   movabs rdi, 0xbf58476d1ce4e5b9
0002EE12  49b8eb113113bb49d094   movabs r8, 0x94d049bb133111eb
0002EE1C  0f1f4000               nop dword ptr [rax]
0002EE20  488d041a               lea rax, [rdx + rbx]
0002EE24  488bc8                 mov rcx, rax
0002EE27  48c1e911               shr rcx, 0x11
0002EE2B  4833c8                 xor rcx, rax
0002EE2E  480fafcf               imul rcx, rdi
0002EE32  488bc1                 mov rax, rcx
0002EE35  48c1e81f               shr rax, 0x1f
0002EE39  4833c1                 xor rax, rcx
0002EE3C  490fafc0               imul rax, r8
0002EE40  488bc8                 mov rcx, rax
0002EE43  48c1e920               shr rcx, 0x20
0002EE47  324c1540               xor cl, byte ptr [rbp + rdx + 0x40]
0002EE4B  32c8                   xor cl, al
0002EE4D  488d4518               lea rax, [rbp + 0x18]
0002EE51  48837d300f             cmp qword ptr [rbp + 0x30], 0xf
0002EE56  480f474518             cmova rax, qword ptr [rbp + 0x18]
0002EE5B  880c10                 mov byte ptr [rax + rdx], cl
0002EE5E  48ffc2                 inc rdx
0002EE61  4883fa2b               cmp rdx, 0x2b
0002EE65  72b9                   jb 0x2ee20
0002EE67  488d4540               lea rax, [rbp + 0x40]
0002EE6B  b92c000000             mov ecx, 0x2c
0002EE70  c60000                 mov byte ptr [rax], 0
0002EE73  488d4001               lea rax, [rax + 1]
0002EE77  4883e901               sub rcx, 1
0002EE7B  75f3                   jne 0x2ee70
0002EE7D  488d5518               lea rdx, [rbp + 0x18]
0002EE81  48837d300f             cmp qword ptr [rbp + 0x30], 0xf
0002EE86  480f475518             cmova rdx, qword ptr [rbp + 0x18]
0002EE8B  4c8b4528               mov r8, qword ptr [rbp + 0x28]
0002EE8F  e87c5d0000             call 0x34c10
0002EE94  90                     nop 
0002EE95  488d4d18               lea rcx, [rbp + 0x18]
0002EE99  e8f25b0000             call 0x34a90
0002EE9E  e8cd07ffff             call 0x1f670
0002EEA3  b9d0070000             mov ecx, 0x7d0
0002EEA8  ffd0                   call rax
0002EEAA  c785f007000007000000   mov dword ptr [rbp + 0x7f0], 7
0002EEB4  8b8df0070000           mov ecx, dword ptr [rbp + 0x7f0]
0002EEBA  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002EEC0  0fafc1                 imul eax, ecx
0002EEC3  ffc0                   inc eax
0002EEC5  8b8df0070000           mov ecx, dword ptr [rbp + 0x7f0]
0002EECB  ffc1                   inc ecx
0002EECD  99                     cdq 
0002EECE  f7f9                   idiv ecx
0002EED0  85d2                   test edx, edx
0002EED2  7505                   jne 0x2eed9
0002EED4  e85770feff             call 0x15f30
0002EED9  4489b5f0070000         mov dword ptr [rbp + 0x7f0], r14d
0002EEE0  8b8df0070000           mov ecx, dword ptr [rbp + 0x7f0]
0002EEE6  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002EEEC  0fafc1                 imul eax, ecx
0002EEEF  ffc0                   inc eax
0002EEF1  8b8df0070000           mov ecx, dword ptr [rbp + 0x7f0]
0002EEF7  ffc1                   inc ecx
0002EEF9  99                     cdq 
0002EEFA  f7f9                   idiv ecx
0002EEFC  85d2                   test edx, edx
0002EEFE  7505                   jne 0x2ef05
0002EF00  e85b70feff             call 0x15f60
0002EF05  c785f007000005000000   mov dword ptr [rbp + 0x7f0], 5
0002EF0F  8b8df0070000           mov ecx, dword ptr [rbp + 0x7f0]
0002EF15  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002EF1B  0fafc1                 imul eax, ecx
0002EF1E  ffc0                   inc eax
0002EF20  8b8df0070000           mov ecx, dword ptr [rbp + 0x7f0]
0002EF26  ffc1                   inc ecx
0002EF28  99                     cdq 
0002EF29  f7f9                   idiv ecx
0002EF2B  85d2                   test edx, edx
0002EF2D  7505                   jne 0x2ef34
0002EF2F  e85c70feff             call 0x15f90
0002EF34  0f31                   rdtsc 
0002EF36  48c1e220               shl rdx, 0x20
0002EF3A  480bc2                 or rax, rdx
0002EF3D  0fb6c8                 movzx ecx, al
0002EF40  83c110                 add ecx, 0x10
0002EF43  898df0070000           mov dword ptr [rbp + 0x7f0], ecx
0002EF49  486385f0070000         movsxd rax, dword ptr [rbp + 0x7f0]
0002EF50  488bc8                 mov rcx, rax
0002EF53  4883c00f               add rax, 0xf
0002EF57  48baf0ffffffffffff0f   movabs rdx, 0xffffffffffffff0
0002EF61  483bc1                 cmp rax, rcx
0002EF64  7703                   ja 0x2ef69
0002EF66  488bc2                 mov rax, rdx
0002EF69  4883e0f0               and rax, 0xfffffffffffffff0
0002EF6D  e81ea10000             call 0x39090
0002EF72  482be0                 sub rsp, rax
0002EF75  488d7c2440             lea rdi, [rsp + 0x40]
0002EF7A  0f31                   rdtsc 
0002EF7C  48c1e220               shl rdx, 0x20
0002EF80  480bc2                 or rax, rdx
0002EF83  488bd8                 mov rbx, rax
0002EF86  418bd5                 mov edx, r13d
0002EF89  8b8df0070000           mov ecx, dword ptr [rbp + 0x7f0]
0002EF8F  85c9                   test ecx, ecx
0002EF91  7e27                   jle 0x2efba
0002EF93  69c36d4ec641           imul eax, ebx, 0x41c64e6d
0002EF99  8d9839300000           lea ebx, [rax + 0x3039]
0002EF9F  8d8839300000           lea ecx, [rax + 0x3039]
0002EFA5  c1e910                 shr ecx, 0x10
0002EFA8  4863c2                 movsxd rax, edx
0002EFAB  880c38                 mov byte ptr [rax + rdi], cl
0002EFAE  ffc2                   inc edx
0002EFB0  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002EFB6  3bd0                   cmp edx, eax
0002EFB8  7cd9                   jl 0x2ef93
0002EFBA  8b05f4350300           mov eax, dword ptr [rip + 0x335f4]   ; -> 0x625b4
0002EFC0  350110a1c5             xor eax, 0xc5a11001
0002EFC5  8905e9350300           mov dword ptr [rip + 0x335e9], eax   ; -> 0x625b4
0002EFCB  8b05e3350300           mov eax, dword ptr [rip + 0x335e3]   ; -> 0x625b4
0002EFD1  69c893010001           imul ecx, eax, 0x1000193
0002EFD7  890dd7350300           mov dword ptr [rip + 0x335d7], ecx   ; -> 0x625b4
0002EFDD  8b053d4e0300           mov eax, dword ptr [rip + 0x34e3d]   ; -> 0x63e20
0002EFE3  ffc0                   inc eax
0002EFE5  8905354e0300           mov dword ptr [rip + 0x34e35], eax   ; -> 0x63e20
0002EFEB  33d2                   xor edx, edx
0002EFED  b937130000             mov ecx, 0x1337
0002EFF2  e8a5710000             call 0x3619c
0002EFF7  488bd8                 mov rbx, rax
0002EFFA  8b0db4350300           mov ecx, dword ptr [rip + 0x335b4]   ; -> 0x625b4
0002F000  81f10210a1c5           xor ecx, 0xc5a11002
0002F006  890da8350300           mov dword ptr [rip + 0x335a8], ecx   ; -> 0x625b4
0002F00C  8b0da2350300           mov ecx, dword ptr [rip + 0x335a2]   ; -> 0x625b4
0002F012  69d193010001           imul edx, ecx, 0x1000193
0002F018  891596350300           mov dword ptr [rip + 0x33596], edx   ; -> 0x625b4
0002F01E  8b0dfc4d0300           mov ecx, dword ptr [rip + 0x34dfc]   ; -> 0x63e20
0002F024  ffc1                   inc ecx
0002F026  890df44d0300           mov dword ptr [rip + 0x34df4], ecx   ; -> 0x63e20
0002F02C  33c9                   xor ecx, ecx
0002F02E  e8f5700000             call 0x36128
0002F033  4c8bf8                 mov r15, rax
0002F036  8b0d78350300           mov ecx, dword ptr [rip + 0x33578]   ; -> 0x625b4
0002F03C  81f10310a1c5           xor ecx, 0xc5a11003
0002F042  890d6c350300           mov dword ptr [rip + 0x3356c], ecx   ; -> 0x625b4
0002F048  8b0d66350300           mov ecx, dword ptr [rip + 0x33566]   ; -> 0x625b4
0002F04E  69d193010001           imul edx, ecx, 0x1000193
0002F054  89155a350300           mov dword ptr [rip + 0x3355a], edx   ; -> 0x625b4
0002F05A  8b0dc04d0300           mov ecx, dword ptr [rip + 0x34dc0]   ; -> 0x63e20
0002F060  ffc1                   inc ecx
0002F062  890db84d0300           mov dword ptr [rip + 0x34db8], ecx   ; -> 0x63e20
0002F068  e8f39ffeff             call 0x19060
0002F06D  4d8bf7                 mov r14, r15
0002F070  4c0bf3                 or r14, rbx
0002F073  4c23fb                 and r15, rbx
0002F076  4c89adf0070000         mov qword ptr [rbp + 0x7f0], r13
0002F07D  4c89adf0070000         mov qword ptr [rbp + 0x7f0], r13
0002F084  e82b710000             call 0x361b4
0002F089  488b0d304d0300         mov rcx, qword ptr [rip + 0x34d30]   ; -> 0x63dc0
0002F090  4833c1                 xor rax, rcx
0002F093  488905264d0300         mov qword ptr [rip + 0x34d26], rax   ; -> 0x63dc0
0002F09A  33d2                   xor edx, edx
0002F09C  41b8d0040000           mov r8d, 0x4d0
0002F0A2  488d8dc0010000         lea rcx, [rbp + 0x1c0]
0002F0A9  e8e2910200             call 0x58290
0002F0AE  c785f001000010001000   mov dword ptr [rbp + 0x1f0], 0x100010
0002F0B8  e8f37cffff             call 0x26db0
0002F0BD  ffd0                   call rax
0002F0BF  488bd8                 mov rbx, rax
0002F0C2  e88980ffff             call 0x27150
0002F0C7  488d95c0010000         lea rdx, [rbp + 0x1c0]
0002F0CE  488bcb                 mov rcx, rbx
0002F0D1  ffd0                   call rax
0002F0D3  85c0                   test eax, eax
0002F0D5  0f84b8000000           je 0x2f193
0002F0DB  e840bafeff             call 0x1ab20
0002F0E0  ffd0                   call rax
0002F0E2  8bf8                   mov edi, eax
0002F0E4  8bd0                   mov edx, eax
0002F0E6  c1ea02                 shr edx, 2
0002F0E9  8bc8                   mov ecx, eax
0002F0EB  c1e106                 shl ecx, 6
0002F0EE  8bd9                   mov ebx, ecx
0002F0F0  0bda                   or ebx, edx
0002F0F2  23ca                   and ecx, edx
0002F0F4  2bd9                   sub ebx, ecx
0002F0F6  8bcb                   mov ecx, ebx
0002F0F8  0bc8                   or ecx, eax
0002F0FA  03c9                   add ecx, ecx
0002F0FC  33d8                   xor ebx, eax
0002F0FE  2bcb                   sub ecx, ebx
0002F100  8bd9                   mov ebx, ecx
0002F102  81cb418ce593           or ebx, 0x93e58c41
0002F108  81e1418ce593           and ecx, 0x93e58c41
0002F10E  2bd9                   sub ebx, ecx
0002F110  8bcb                   mov ecx, ebx
0002F112  c1e905                 shr ecx, 5
0002F115  8d04dd00000000         lea eax, [rbx*8]
0002F11C  8bd0                   mov edx, eax
0002F11E  0bd1                   or edx, ecx
0002F120  23c1                   and eax, ecx
0002F122  2bd0                   sub edx, eax
0002F124  8bc2                   mov eax, edx
0002F126  0bc3                   or eax, ebx
0002F128  03c0                   add eax, eax
0002F12A  33d3                   xor edx, ebx
0002F12C  2bc2                   sub eax, edx
0002F12E  48398518020000         cmp qword ptr [rbp + 0x218], rax
0002F135  755c                   jne 0x2f193
0002F137  8bcf                   mov ecx, edi
0002F139  c1e903                 shr ecx, 3
0002F13C  8bc7                   mov eax, edi
0002F13E  c1e005                 shl eax, 5
0002F141  8bd0                   mov edx, eax
0002F143  0bd1                   or edx, ecx
0002F145  03d2                   add edx, edx
0002F147  33c1                   xor eax, ecx
0002F149  2bd0                   sub edx, eax
0002F14B  8bc2                   mov eax, edx
0002F14D  0bc7                   or eax, edi
0002F14F  23d7                   and edx, edi
0002F151  2bc2                   sub eax, edx
0002F153  8bd8                   mov ebx, eax
0002F155  81cb9e1d7f2a           or ebx, 0x2a7f1d9e
0002F15B  03db                   add ebx, ebx
0002F15D  359e1d7f2a             xor eax, 0x2a7f1d9e
0002F162  2bd8                   sub ebx, eax
0002F164  8bcb                   mov ecx, ebx
0002F166  c1e904                 shr ecx, 4
0002F169  8bc3                   mov eax, ebx
0002F16B  c1e007                 shl eax, 7
0002F16E  8bd0                   mov edx, eax
0002F170  0bd1                   or edx, ecx
0002F172  03d2                   add edx, edx
0002F174  33c1                   xor eax, ecx
0002F176  2bd0                   sub edx, eax
0002F178  8bc2                   mov eax, edx
0002F17A  0bc3                   or eax, ebx
0002F17C  23d3                   and edx, ebx
0002F17E  2bc2                   sub eax, edx
0002F180  48398520020000         cmp qword ptr [rbp + 0x220], rax
0002F187  49bcf61daa0823f39d02   movabs r12, 0x29df32308aa1df6
0002F191  7406                   je 0x2f199
0002F193  41bc0df0ad0b           mov r12d, 0xbadf00d
0002F199  8b05814c0300           mov eax, dword ptr [rip + 0x34c81]   ; -> 0x63e20
0002F19F  4c89adf0070000         mov qword ptr [rbp + 0x7f0], r13
0002F1A6  4c89adf0070000         mov qword ptr [rbp + 0x7f0], r13
0002F1AD  e83e66ffff             call 0x257f0
0002F1B2  ffd0                   call rax
0002F1B4  0f57c0                 xorps xmm0, xmm0
0002F1B7  33c9                   xor ecx, ecx
0002F1B9  0f118510010000         movups xmmword ptr [rbp + 0x110], xmm0
0002F1C0  0f118520010000         movups xmmword ptr [rbp + 0x120], xmm0
0002F1C7  0f118530010000         movups xmmword ptr [rbp + 0x130], xmm0
0002F1CE  0f118540010000         movups xmmword ptr [rbp + 0x140], xmm0
0002F1D5  0f118550010000         movups xmmword ptr [rbp + 0x150], xmm0
0002F1DC  0f118560010000         movups xmmword ptr [rbp + 0x160], xmm0
0002F1E3  0f118570010000         movups xmmword ptr [rbp + 0x170], xmm0
0002F1EA  0f118580010000         movups xmmword ptr [rbp + 0x180], xmm0
0002F1F1  898d90010000           mov dword ptr [rbp + 0x190], ecx
0002F1F7  898538010000           mov dword ptr [rbp + 0x138], eax
0002F1FD  f30f7f85d0000000       movdqu xmmword ptr [rbp + 0xd0], xmm0
0002F205  4c89ade0000000         mov qword ptr [rbp + 0xe0], r13
0002F20C  488b15d54b0300         mov rdx, qword ptr [rip + 0x34bd5]   ; -> 0x63de8
0002F213  482b15c64b0300         sub rdx, qword ptr [rip + 0x34bc6]   ; -> 0x63de0
0002F21A  744e                   je 0x2f26a
0002F21C  488d8dd0000000         lea rcx, [rbp + 0xd0]
0002F223  e8f8660000             call 0x35920
0002F228  488bbdd0000000         mov rdi, qword ptr [rbp + 0xd0]
0002F22F  488b15aa4b0300         mov rdx, qword ptr [rip + 0x34baa]   ; -> 0x63de0
0002F236  488b1dab4b0300         mov rbx, qword ptr [rip + 0x34bab]   ; -> 0x63de8
0002F23D  482bda                 sub rbx, rdx
0002F240  4c8bc3                 mov r8, rbx
0002F243  488bcf                 mov rcx, rdi
0002F246  e895890200             call 0x57be0
0002F24B  488d041f               lea rax, [rdi + rbx]
0002F24F  488985d8000000         mov qword ptr [rbp + 0xd8], rax
0002F256  4c89adf0070000         mov qword ptr [rbp + 0x7f0], r13
0002F25D  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002F264  e857660000             call 0x358c0
0002F269  90                     nop 
0002F26A  4533c0                 xor r8d, r8d
0002F26D  488d9510010000         lea rdx, [rbp + 0x110]
0002F274  488d8dd0000000         lea rcx, [rbp + 0xd0]
0002F27B  e8300bffff             call 0x1fdb0
0002F280  488bd8                 mov rbx, rax
0002F283  e86882ffff             call 0x274f0
0002F288  84c0                   test al, al
0002F28A  7448                   je 0x2f2d4
0002F28C  4d2bf7                 sub r14, r15
0002F28F  48b8d501b847d501b847   movabs rax, 0x47b801d547b801d5
0002F299  498bce                 mov rcx, r14
0002F29C  480bc8                 or rcx, rax
0002F29F  4c23f0                 and r14, rax
0002F2A2  492bce                 sub rcx, r14
0002F2A5  48b8992831ef2ec818ef   movabs rax, 0xef18c82eef312899
0002F2AF  4803c1                 add rax, rcx
0002F2B2  48b92c5843dc79f19fd5   movabs rcx, 0xd59ff179dc43582c
0002F2BC  488bd0                 mov rdx, rax
0002F2BF  480bd1                 or rdx, rcx
0002F2C2  4823c1                 and rax, rcx
0002F2C5  482bd0                 sub rdx, rax
0002F2C8  4833d3                 xor rdx, rbx
0002F2CB  488995b0000000         mov qword ptr [rbp + 0xb0], rdx
0002F2D2  eb0c                   jmp 0x2f2e0
0002F2D4  e85782ffff             call 0x27530
0002F2D9  488985b0000000         mov qword ptr [rbp + 0xb0], rax
0002F2E0  4c8d15b56e0000         lea r10, [rip + 0x6eb5]   ; -> 0x3619c
0002F2E7  410fb60a               movzx ecx, byte ptr [r10]
0002F2EB  41be0df0adba           mov r14d, 0xbaadf00d
0002F2F1  4c89b5a8000000         mov qword ptr [rbp + 0xa8], r14
0002F2F8  80f9cc                 cmp cl, 0xcc
0002F2FB  0f8496000000           je 0x2f397
0002F301  80f990                 cmp cl, 0x90
0002F304  0f94c2                 sete dl
0002F307  80f966                 cmp cl, 0x66
0002F30A  7518                   jne 0x2f324
0002F30C  41807a0190             cmp byte ptr [r10 + 1], 0x90
0002F311  7502                   jne 0x2f315
0002F313  b201                   mov dl, 1
0002F315  498d4201               lea rax, [r10 + 1]
0002F319  84d2                   test dl, dl
0002F31B  7417                   je 0x2f334
0002F31D  b902000000             mov ecx, 2
0002F322  eb15                   jmp 0x2f339
0002F324  80f90f                 cmp cl, 0xf
0002F327  75ec                   jne 0x2f315
0002F329  498d4201               lea rax, [r10 + 1]
0002F32D  80381f                 cmp byte ptr [rax], 0x1f
0002F330  74eb                   je 0x2f31d
0002F332  ebe5                   jmp 0x2f319
0002F334  b901000000             mov ecx, 1
0002F339  0fb610                 movzx edx, byte ptr [rax]
0002F33C  80facc                 cmp dl, 0xcc
0002F33F  7456                   je 0x2f397
0002F341  80fa90                 cmp dl, 0x90
0002F344  0f94c3                 sete bl
0002F347  80fa66                 cmp dl, 0x66
0002F34A  7506                   jne 0x2f352
0002F34C  80780190               cmp byte ptr [rax + 1], 0x90
0002F350  eb09                   jmp 0x2f35b
0002F352  80fa0f                 cmp dl, 0xf
0002F355  7506                   jne 0x2f35d
0002F357  8078011f               cmp byte ptr [rax + 1], 0x1f
0002F35B  7407                   je 0x2f364
0002F35D  84db                   test bl, bl
0002F35F  7503                   jne 0x2f364
0002F361  418bcd                 mov ecx, r13d
0002F364  410fb65202             movzx edx, byte ptr [r10 + 2]
0002F369  80facc                 cmp dl, 0xcc
0002F36C  7429                   je 0x2f397
0002F36E  80fa90                 cmp dl, 0x90
0002F371  0f94c3                 sete bl
0002F374  80fa66                 cmp dl, 0x66
0002F377  7507                   jne 0x2f380
0002F379  41807a0390             cmp byte ptr [r10 + 3], 0x90
0002F37E  eb0a                   jmp 0x2f38a
0002F380  80fa0f                 cmp dl, 0xf
0002F383  7507                   jne 0x2f38c
0002F385  41807a031f             cmp byte ptr [r10 + 3], 0x1f
0002F38A  7404                   je 0x2f390
0002F38C  84db                   test bl, bl
0002F38E  744b                   je 0x2f3db
0002F390  ffc1                   inc ecx
0002F392  83f903                 cmp ecx, 3
0002F395  7247                   jb 0x2f3de
0002F397  4c89b580000000         mov qword ptr [rbp + 0x80], r14
0002F39E  458bc5                 mov r8d, r13d
0002F3A1  498bcd                 mov rcx, r13
0002F3A4  4c8d0d7d6d0000         lea r9, [rip + 0x6d7d]   ; -> 0x36128
0002F3AB  0f1f440000             nop dword ptr [rax + rax]
0002F3B0  420fb61c09             movzx ebx, byte ptr [rcx + r9]
0002F3B5  80fbcc                 cmp bl, 0xcc
0002F3B8  0f84a1000000           je 0x2f45f
0002F3BE  80fb90                 cmp bl, 0x90
0002F3C1  0f94c2                 sete dl
0002F3C4  488d4101               lea rax, [rcx + 1]
0002F3C8  4883f830               cmp rax, 0x30
0002F3CC  733d                   jae 0x2f40b
0002F3CE  80fb66                 cmp bl, 0x66
0002F3D1  752b                   jne 0x2f3fe
0002F3D3  42807c090190           cmp byte ptr [rcx + r9 + 1], 0x90
0002F3D9  eb2e                   jmp 0x2f409
0002F3DB  418bcd                 mov ecx, r13d
0002F3DE  410fb65203             movzx edx, byte ptr [r10 + 3]
0002F3E3  80facc                 cmp dl, 0xcc
0002F3E6  74af                   je 0x2f397
0002F3E8  80fa90                 cmp dl, 0x90
0002F3EB  7508                   jne 0x2f3f5
0002F3ED  8d4101                 lea eax, [rcx + 1]
0002F3F0  83f803                 cmp eax, 3
0002F3F3  73a2                   jae 0x2f397
0002F3F5  4c89ad80000000         mov qword ptr [rbp + 0x80], r13
0002F3FC  eba0                   jmp 0x2f39e
0002F3FE  80fb0f                 cmp bl, 0xf
0002F401  7508                   jne 0x2f40b
0002F403  42807c09011f           cmp byte ptr [rcx + r9 + 1], 0x1f
0002F409  7404                   je 0x2f40f
0002F40B  84d2                   test dl, dl
0002F40D  740b                   je 0x2f41a
0002F40F  41ffc0                 inc r8d
0002F412  4183f803               cmp r8d, 3
0002F416  734e                   jae 0x2f466
0002F418  eb03                   jmp 0x2f41d
0002F41A  458bc5                 mov r8d, r13d
0002F41D  48ffc1                 inc rcx
0002F420  4883f930               cmp rcx, 0x30
0002F424  728a                   jb 0x2f3b0
0002F426  498bcd                 mov rcx, r13
0002F429  0f1f8000000000         nop dword ptr [rax]
0002F430  42803c090f             cmp byte ptr [rcx + r9], 0xf
0002F435  7508                   jne 0x2f43f
0002F437  42807c09010b           cmp byte ptr [rcx + r9 + 1], 0xb
0002F43D  7417                   je 0x2f456
0002F43F  48ffc1                 inc rcx
0002F442  4883f92f               cmp rcx, 0x2f
0002F446  72e8                   jb 0x2f430
0002F448  b8efbeadde             mov eax, 0xdeadbeef
0002F44D  488985a8000000         mov qword ptr [rbp + 0xa8], rax
0002F454  eb10                   jmp 0x2f466
0002F456  4c89ada8000000         mov qword ptr [rbp + 0xa8], r13
0002F45D  eb07                   jmp 0x2f466
0002F45F  4c89b5a8000000         mov qword ptr [rbp + 0xa8], r14
0002F466  410fb64201             movzx eax, byte ptr [r10 + 1]
0002F46B  884573                 mov byte ptr [rbp + 0x73], al
0002F46E  410fb602               movzx eax, byte ptr [r10]
0002F472  884574                 mov byte ptr [rbp + 0x74], al
0002F475  410fb6410c             movzx eax, byte ptr [r9 + 0xc]
0002F47A  884500                 mov byte ptr [rbp], al
0002F47D  410fb64108             movzx eax, byte ptr [r9 + 8]
0002F482  884570                 mov byte ptr [rbp + 0x70], al
0002F485  410fb64104             movzx eax, byte ptr [r9 + 4]
0002F48A  884571                 mov byte ptr [rbp + 0x71], al
0002F48D  410fb601               movzx eax, byte ptr [r9]
0002F491  884572                 mov byte ptr [rbp + 0x72], al
0002F494  488b0d25490300         mov rcx, qword ptr [rip + 0x34925]   ; -> 0x63dc0
0002F49B  e89080ffff             call 0x27530
0002F4A0  4833c1                 xor rax, rcx
0002F4A3  48890516490300         mov qword ptr [rip + 0x34916], rax   ; -> 0x63dc0
0002F4AA  e8f1d6ffff             call 0x2cba0
0002F4AF  c785f0070000d5c1b3a7   mov dword ptr [rbp + 0x7f0], 0xa7b3c1d5
0002F4B9  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F4BF  90                     nop 
0002F4C0  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F4C6  3d0f9e8d7c             cmp eax, 0x7c8d9e0f
0002F4CB  0f8766010000           ja 0x2f637
0002F4D1  0f843e010000           je 0x2f615
0002F4D7  3d6b5a4f3e             cmp eax, 0x3e4f5a6b
0002F4DC  0f87ab000000           ja 0x2f58d
0002F4E2  0f8483000000           je 0x2f56b
0002F4E8  3d48372615             cmp eax, 0x15263748
0002F4ED  745a                   je 0x2f549
0002F4EF  3d4d3c2b1a             cmp eax, 0x1a2b3c4d
0002F4F4  7431                   je 0x2f527
0002F4F6  3d58473625             cmp eax, 0x25364758
0002F4FB  0f85f2010000           jne 0x2f6f3
0002F501  488b05c0490300         mov rax, qword ptr [rip + 0x349c0]   ; -> 0x63ec8
0002F508  483305f1480300         xor rax, qword ptr [rip + 0x348f1]   ; -> 0x63e00
0002F50F  ffd0                   call rax
0002F511  890531490300           mov dword ptr [rip + 0x34931], eax   ; -> 0x63e48
0002F517  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F51D  3597f99bb9             xor eax, 0xb99bf997
0002F522  e911020000             jmp 0x2f738
0002F527  488b055a490300         mov rax, qword ptr [rip + 0x3495a]   ; -> 0x63e88
0002F52E  483305cb480300         xor rax, qword ptr [rip + 0x348cb]   ; -> 0x63e00
0002F535  ffd0                   call rax
0002F537  33f0                   xor esi, eax
0002F539  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F53F  35157b1d3f             xor eax, 0x3f1d7b15
0002F544  e9ef010000             jmp 0x2f738
0002F549  488b0558490300         mov rax, qword ptr [rip + 0x34958]   ; -> 0x63ea8
0002F550  483305a9480300         xor rax, qword ptr [rip + 0x348a9]   ; -> 0x63e00
0002F557  ffd0                   call rax
0002F559  33f0                   xor esi, eax
0002F55B  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F561  35050b0d0f             xor eax, 0xf0d0b05
0002F566  e9cd010000             jmp 0x2f738
0002F56B  488b0506490300         mov rax, qword ptr [rip + 0x34906]   ; -> 0x63e78
0002F572  48330587480300         xor rax, qword ptr [rip + 0x34887]   ; -> 0x63e00
0002F579  ffd0                   call rax
0002F57B  33f0                   xor esi, eax
0002F57D  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F583  35bb95f193             xor eax, 0x93f195bb
0002F588  e9ab010000             jmp 0x2f738
0002F58D  3d8c7b6a59             cmp eax, 0x596a7b8c
0002F592  745c                   je 0x2f5f0
0002F594  3d8b7a6f5e             cmp eax, 0x5e6f7a8b
0002F599  7430                   je 0x2f5cb
0002F59B  3d9c8b7a69             cmp eax, 0x697a8b9c
0002F5A0  0f854d010000           jne 0x2f6f3
0002F5A6  488b0523490300         mov rax, qword ptr [rip + 0x34923]   ; -> 0x63ed0
0002F5AD  4833054c480300         xor rax, qword ptr [rip + 0x3484c]   ; -> 0x63e00
0002F5B4  ffd0                   call rax
0002F5B6  8bc0                   mov eax, eax
0002F5B8  4c33e0                 xor r12, rax
0002F5BB  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F5C1  359c8b7a69             xor eax, 0x697a8b9c
0002F5C6  e96d010000             jmp 0x2f738
0002F5CB  488b05be480300         mov rax, qword ptr [rip + 0x348be]   ; -> 0x63e90
0002F5D2  48330527480300         xor rax, qword ptr [rip + 0x34827]   ; -> 0x63e00
0002F5D9  ffd0                   call rax
0002F5DB  8bc0                   mov eax, eax
0002F5DD  4c33e0                 xor r12, rax
0002F5E0  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F5E6  359f799dbf             xor eax, 0xbf9d799f
0002F5EB  e948010000             jmp 0x2f738
0002F5F0  488b05b9480300         mov rax, qword ptr [rip + 0x348b9]   ; -> 0x63eb0
0002F5F7  48330502480300         xor rax, qword ptr [rip + 0x34802]   ; -> 0x63e00
0002F5FE  ffd0                   call rax
0002F600  8bc0                   mov eax, eax
0002F602  4c33e0                 xor r12, rax
0002F605  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F60B  3510f01030             xor eax, 0x3010f010
0002F610  e923010000             jmp 0x2f738
0002F615  488b0564480300         mov rax, qword ptr [rip + 0x34864]   ; -> 0x63e80
0002F61C  483305dd470300         xor rax, qword ptr [rip + 0x347dd]   ; -> 0x63e00
0002F623  ffd0                   call rax
0002F625  33f0                   xor esi, eax
0002F627  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F62D  3583e5e725             xor eax, 0x25e7e583
0002F632  e901010000             jmp 0x2f738
0002F637  3dd0cfbead             cmp eax, 0xadbecfd0
0002F63C  0f87a3000000           ja 0x2f6e5
0002F642  747f                   je 0x2f6c3
0002F644  3dcfbead9c             cmp eax, 0x9cadbecf
0002F649  7456                   je 0x2f6a1
0002F64B  3dc0bfae9d             cmp eax, 0x9daebfc0
0002F650  742d                   je 0x2f67f
0002F652  3dd5c1b3a7             cmp eax, 0xa7b3c1d5
0002F657  0f8596000000           jne 0x2f6f3
0002F65D  488b050c480300         mov rax, qword ptr [rip + 0x3480c]   ; -> 0x63e70
0002F664  48330595470300         xor rax, qword ptr [rip + 0x34795]   ; -> 0x63e00
0002F66B  ffd0                   call rax
0002F66D  33f0                   xor esi, eax
0002F66F  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F675  359df695b2             xor eax, 0xb295f69d
0002F67A  e9b9000000             jmp 0x2f738
0002F67F  488b0532480300         mov rax, qword ptr [rip + 0x34832]   ; -> 0x63eb8
0002F686  48330573470300         xor rax, qword ptr [rip + 0x34773]   ; -> 0x63e00
0002F68D  ffd0                   call rax
0002F68F  33f0                   xor esi, eax
0002F691  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F697  35abe5e1a3             xor eax, 0xa3e1e5ab
0002F69C  e997000000             jmp 0x2f738
0002F6A1  488b05f0470300         mov rax, qword ptr [rip + 0x347f0]   ; -> 0x63e98
0002F6A8  48330551470300         xor rax, qword ptr [rip + 0x34751]   ; -> 0x63e00
0002F6AF  ffd0                   call rax
0002F6B1  8bc0                   mov eax, eax
0002F6B3  4c33e0                 xor r12, rax
0002F6B6  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F6BC  350f010301             xor eax, 0x103010f
0002F6C1  eb75                   jmp 0x2f738
0002F6C3  488b050e480300         mov rax, qword ptr [rip + 0x3480e]   ; -> 0x63ed8
0002F6CA  4833052f470300         xor rax, qword ptr [rip + 0x3472f]   ; -> 0x63e00
0002F6D1  ffd0                   call rax
0002F6D3  8bc0                   mov eax, eax
0002F6D5  4c33e0                 xor r12, rax
0002F6D8  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F6DE  355bb5d1f3             xor eax, 0xf3d1b55b
0002F6E3  eb53                   jmp 0x2f738
0002F6E5  3d04f3e2d1             cmp eax, 0xd1e2f304
0002F6EA  742f                   je 0x2f71b
0002F6EC  3d1403f2e1             cmp eax, 0xe1f20314
0002F6F1  7409                   je 0x2f6fc
0002F6F3  4489adf0070000         mov dword ptr [rbp + 0x7f0], r13d
0002F6FA  eb42                   jmp 0x2f73e
0002F6FC  488b05bd470300         mov rax, qword ptr [rip + 0x347bd]   ; -> 0x63ec0
0002F703  483305f6460300         xor rax, qword ptr [rip + 0x346f6]   ; -> 0x63e00
0002F70A  ffd0                   call rax
0002F70C  33f0                   xor esi, eax
0002F70E  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F714  3510f01030             xor eax, 0x3010f010
0002F719  eb1d                   jmp 0x2f738
0002F71B  488b057e470300         mov rax, qword ptr [rip + 0x3477e]   ; -> 0x63ea0
0002F722  483305d7460300         xor rax, qword ptr [rip + 0x346d7]   ; -> 0x63e00
0002F729  ffd0                   call rax
0002F72B  33f0                   xor esi, eax
0002F72D  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F733  350b6d6fad             xor eax, 0xad6f6d0b
0002F738  8985f0070000           mov dword ptr [rbp + 0x7f0], eax
0002F73E  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F744  85c0                   test eax, eax
0002F746  0f8574fdffff           jne 0x2f4c0
0002F74C  0f31                   rdtsc 
0002F74E  48c1e220               shl rdx, 0x20
0002F752  480bc2                 or rax, rdx
0002F755  0fb6c8                 movzx ecx, al
0002F758  83c110                 add ecx, 0x10
0002F75B  898df0070000           mov dword ptr [rbp + 0x7f0], ecx
0002F761  486385f0070000         movsxd rax, dword ptr [rbp + 0x7f0]
0002F768  488bc8                 mov rcx, rax
0002F76B  4883c00f               add rax, 0xf
0002F76F  483bc1                 cmp rax, rcx
0002F772  770a                   ja 0x2f77e
0002F774  48b8f0ffffffffffff0f   movabs rax, 0xffffffffffffff0
0002F77E  4883e0f0               and rax, 0xfffffffffffffff0
0002F782  e809990000             call 0x39090
0002F787  482be0                 sub rsp, rax
0002F78A  488d7c2440             lea rdi, [rsp + 0x40]
0002F78F  0f31                   rdtsc 
0002F791  48c1e220               shl rdx, 0x20
0002F795  480bc2                 or rax, rdx
0002F798  488bd8                 mov rbx, rax
0002F79B  418bd5                 mov edx, r13d
0002F79E  8b8df0070000           mov ecx, dword ptr [rbp + 0x7f0]
0002F7A4  85c9                   test ecx, ecx
0002F7A6  7e2f                   jle 0x2f7d7
0002F7A8  0f1f840000000000       nop dword ptr [rax + rax]
0002F7B0  69c36d4ec641           imul eax, ebx, 0x41c64e6d
0002F7B6  8d9839300000           lea ebx, [rax + 0x3039]
0002F7BC  8d8839300000           lea ecx, [rax + 0x3039]
0002F7C2  c1e910                 shr ecx, 0x10
0002F7C5  4863c2                 movsxd rax, edx
0002F7C8  880c38                 mov byte ptr [rax + rdi], cl
0002F7CB  ffc2                   inc edx
0002F7CD  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
0002F7D3  3bd0                   cmp edx, eax
0002F7D5  7cd9                   jl 0x2f7b0
0002F7D7  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
0002F7DE  488d5518               lea rdx, [rbp + 0x18]
0002F7E2  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002F7E9  e8d2310000             call 0x329c0
0002F7EE  90                     nop 
0002F7EF  4c8b4010               mov r8, qword ptr [rax + 0x10]
0002F7F3  488378180f             cmp qword ptr [rax + 0x18], 0xf
0002F7F8  7603                   jbe 0x2f7fd
0002F7FA  488b00                 mov rax, qword ptr [rax]
0002F7FD  488bd0                 mov rdx, rax
0002F800  e80b540000             call 0x34c10
0002F805  90                     nop 
0002F806  488b5530               mov rdx, qword ptr [rbp + 0x30]
0002F80A  4883fa0f               cmp rdx, 0xf
0002F80E  7631                   jbe 0x2f841
0002F810  48ffc2                 inc rdx
0002F813  488b4d18               mov rcx, qword ptr [rbp + 0x18]
0002F817  4881fa00100000         cmp rdx, 0x1000
0002F81E  721c                   jb 0x2f83c
0002F820  488b41f8               mov rax, qword ptr [rcx - 8]
0002F824  482bc8                 sub rcx, rax
0002F827  4883e908               sub rcx, 8
0002F82B  4883f91f               cmp rcx, 0x1f
0002F82F  0f87e8120000           ja 0x30b1d
0002F835  4883c227               add rdx, 0x27
0002F839  488bc8                 mov rcx, rax
0002F83C  e82b900000             call 0x3886c
0002F841  4c896d28               mov qword ptr [rbp + 0x28], r13
0002F845  48c745300f000000       mov qword ptr [rbp + 0x30], 0xf
0002F84D  c6451800               mov byte ptr [rbp + 0x18], 0
0002F851  488d5518               lea rdx, [rbp + 0x18]
0002F855  e896340000             call 0x32cf0
0002F85A  90                     nop 
0002F85B  4c8b4010               mov r8, qword ptr [rax + 0x10]
0002F85F  488378180f             cmp qword ptr [rax + 0x18], 0xf
0002F864  7603                   jbe 0x2f869
0002F866  488b00                 mov rax, qword ptr [rax]
0002F869  488bd0                 mov rdx, rax
0002F86C  e89f530000             call 0x34c10
0002F871  90                     nop 
0002F872  488b5530               mov rdx, qword ptr [rbp + 0x30]
0002F876  4883fa0f               cmp rdx, 0xf
0002F87A  7631                   jbe 0x2f8ad
0002F87C  48ffc2                 inc rdx
0002F87F  488b4d18               mov rcx, qword ptr [rbp + 0x18]
0002F883  4881fa00100000         cmp rdx, 0x1000
0002F88A  721c                   jb 0x2f8a8
0002F88C  488b41f8               mov rax, qword ptr [rcx - 8]
0002F890  482bc8                 sub rcx, rax
0002F893  4883e908               sub rcx, 8
0002F897  4883f91f               cmp rcx, 0x1f
0002F89B  0f877c120000           ja 0x30b1d
0002F8A1  4883c227               add rdx, 0x27
0002F8A5  488bc8                 mov rcx, rax
0002F8A8  e8bf8f0000             call 0x3886c
0002F8AD  4c896d28               mov qword ptr [rbp + 0x28], r13
0002F8B1  48c745300f000000       mov qword ptr [rbp + 0x30], 0xf
0002F8B9  c6451800               mov byte ptr [rbp + 0x18], 0
0002F8BD  0f57c0                 xorps xmm0, xmm0
0002F8C0  0f114518               movups xmmword ptr [rbp + 0x18], xmm0
0002F8C4  4c896d28               mov qword ptr [rbp + 0x28], r13
0002F8C8  48c745300f000000       mov qword ptr [rbp + 0x30], 0xf
0002F8D0  c6451800               mov byte ptr [rbp + 0x18], 0
0002F8D4  488b0505360300         mov rax, qword ptr [rip + 0x33605]   ; -> 0x62ee0
0002F8DB  48634004               movsxd rax, dword ptr [rax + 4]
0002F8DF  4c8d3dfa350300         lea r15, [rip + 0x335fa]   ; -> 0x62ee0
0002F8E6  4a8b443840             mov rax, qword ptr [rax + r15 + 0x40]
0002F8EB  488b7808               mov rdi, qword ptr [rax + 8]
0002F8EF  4889bd90000000         mov qword ptr [rbp + 0x90], rdi
0002F8F6  488b07                 mov rax, qword ptr [rdi]
0002F8F9  488bcf                 mov rcx, rdi
0002F8FC  ff5008                 call qword ptr [rax + 8]
0002F8FF  90                     nop 
0002F900  488d8d88000000         lea rcx, [rbp + 0x88]
0002F907  e8644a0000             call 0x34370
0002F90C  488b18                 mov rbx, qword ptr [rax]
0002F90F  b20a                   mov dl, 0xa
0002F911  488bc8                 mov rcx, rax
0002F914  ff5340                 call qword ptr [rbx + 0x40]
0002F917  440fb6f0               movzx r14d, al
0002F91B  488b17                 mov rdx, qword ptr [rdi]
0002F91E  488bcf                 mov rcx, rdi
0002F921  ff5210                 call qword ptr [rdx + 0x10]
0002F924  4885c0                 test rax, rax
0002F927  740d                   je 0x2f936
0002F929  488b18                 mov rbx, qword ptr [rax]
0002F92C  ba01000000             mov edx, 1
0002F931  488bc8                 mov rcx, rax
0002F934  ff13                   call qword ptr [rbx]
0002F936  450fb6c6               movzx r8d, r14b
0002F93A  488d5518               lea rdx, [rbp + 0x18]
0002F93E  498bcf                 mov rcx, r15
0002F941  e8da550000             call 0x34f20
0002F946  4c8b6d28               mov r13, qword ptr [rbp + 0x28]
0002F94A  4983fd40               cmp r13, 0x40
0002F94E  7318                   jae 0x2f968
0002F950  ba40000000             mov edx, 0x40
0002F955  492bd5                 sub rdx, r13
0002F958  4533c0                 xor r8d, r8d
0002F95B  488d4d18               lea rcx, [rbp + 0x18]
0002F95F  e85c4f0000             call 0x348c0
0002F964  4c8b6d28               mov r13, qword ptr [rbp + 0x28]
0002F968  488d4d18               lea rcx, [rbp + 0x18]
0002F96C  48837d300f             cmp qword ptr [rbp + 0x30], 0xf
0002F971  480f474d18             cmova rcx, qword ptr [rbp + 0x18]
0002F976  4983fd12               cmp r13, 0x12
0002F97A  0f85c0090000           jne 0x30340
0002F980  4d8bc5                 mov r8, r13
0002F983  488d15beddfdff         lea rdx, [rip - 0x22242]   ; -> 0xd748
0002F98A  e8b18c0200             call 0x58640
0002F98F  85c0                   test eax, eax
0002F991  0f85a9090000           jne 0x30340
0002F997  e864360000             call 0x33000
0002F99C  b9f5ffffff             mov ecx, 0xfffffff5
0002F9A1  ffd0                   call rax
0002F9A3  488bd8                 mov rbx, rax
0002F9A6  e8f5390000             call 0x333a0
0002F9AB  ba0d000000             mov edx, 0xd
0002F9B0  488bcb                 mov rcx, rbx
0002F9B3  ffd0                   call rax
0002F9B5  488d9588000000         lea rdx, [rbp + 0x88]
0002F9BC  e87f3d0000             call 0x33740
0002F9C1  90                     nop 
0002F9C2  4c8b4010               mov r8, qword ptr [rax + 0x10]
0002F9C6  488378180f             cmp qword ptr [rax + 0x18], 0xf
0002F9CB  7603                   jbe 0x2f9d0
0002F9CD  488b00                 mov rax, qword ptr [rax]
0002F9D0  488bd0                 mov rdx, rax
0002F9D3  e838520000             call 0x34c10
0002F9D8  90                     nop 
0002F9D9  488b95a0000000         mov rdx, qword ptr [rbp + 0xa0]
0002F9E0  4883fa0f               cmp rdx, 0xf
0002F9E4  7634                   jbe 0x2fa1a
0002F9E6  48ffc2                 inc rdx
0002F9E9  488b8d88000000         mov rcx, qword ptr [rbp + 0x88]
0002F9F0  4881fa00100000         cmp rdx, 0x1000
0002F9F7  721c                   jb 0x2fa15
0002F9F9  488b41f8               mov rax, qword ptr [rcx - 8]
0002F9FD  482bc8                 sub rcx, rax
0002FA00  4883e908               sub rcx, 8
0002FA04  4883f91f               cmp rcx, 0x1f
0002FA08  0f8708110000           ja 0x30b16
0002FA0E  4883c227               add rdx, 0x27
0002FA12  488bc8                 mov rcx, rax
0002FA15  e8528e0000             call 0x3886c
0002FA1A  48c7859800000000000000 mov qword ptr [rbp + 0x98], 0
0002FA25  48c785a00000000f000000 mov qword ptr [rbp + 0xa0], 0xf
0002FA30  c6858800000000         mov byte ptr [rbp + 0x88], 0
0002FA37  e864390000             call 0x333a0
0002FA3C  ba07000000             mov edx, 7
0002FA41  488bcb                 mov rcx, rbx
0002FA44  ffd0                   call rax
0002FA46  e8b53f0000             call 0x33a00
0002FA4B  bac8000000             mov edx, 0xc8
0002FA50  b926010000             mov ecx, 0x126
0002FA55  ffd0                   call rax
0002FA57  e8a43f0000             call 0x33a00
0002FA5C  bac8000000             mov edx, 0xc8
0002FA61  b94a010000             mov ecx, 0x14a
0002FA66  ffd0                   call rax
0002FA68  e8933f0000             call 0x33a00
0002FA6D  bac8000000             mov edx, 0xc8
0002FA72  b988010000             mov ecx, 0x188
0002FA77  ffd0                   call rax
0002FA79  e8823f0000             call 0x33a00
0002FA7E  bac8000000             mov edx, 0xc8
0002FA83  b94a010000             mov ecx, 0x14a
0002FA88  ffd0                   call rax
0002FA8A  e8713f0000             call 0x33a00
0002FA8F  ba90010000             mov edx, 0x190
0002FA94  b9ee010000             mov ecx, 0x1ee
0002FA99  ffd0                   call rax
0002FA9B  e8603f0000             call 0x33a00
0002FAA0  bac8000000             mov edx, 0xc8
0002FAA5  b9ee010000             mov ecx, 0x1ee
0002FAAA  ffd0                   call rax
0002FAAC  e84f3f0000             call 0x33a00
0002FAB1  ba58020000             mov edx, 0x258
0002FAB6  b9b8010000             mov ecx, 0x1b8
0002FABB  ffd0                   call rax
0002FABD  e83e3f0000             call 0x33a00
0002FAC2  bac8000000             mov edx, 0xc8
0002FAC7  b926010000             mov ecx, 0x126
0002FACC  ffd0                   call rax
0002FACE  e82d3f0000             call 0x33a00
0002FAD3  bac8000000             mov edx, 0xc8
0002FAD8  b94a010000             mov ecx, 0x14a
0002FADD  ffd0                   call rax
0002FADF  e81c3f0000             call 0x33a00
0002FAE4  bac8000000             mov edx, 0xc8
0002FAE9  b988010000             mov ecx, 0x188
0002FAEE  ffd0                   call rax
0002FAF0  e80b3f0000             call 0x33a00
0002FAF5  bac8000000             mov edx, 0xc8
0002FAFA  b94a010000             mov ecx, 0x14a
0002FAFF  ffd0                   call rax
0002FB01  e8fa3e0000             call 0x33a00
0002FB06  ba90010000             mov edx, 0x190
0002FB0B  b9b8010000             mov ecx, 0x1b8
0002FB10  ffd0                   call rax
0002FB12  e8e93e0000             call 0x33a00
0002FB17  bac8000000             mov edx, 0xc8
0002FB1C  b9b8010000             mov ecx, 0x1b8
0002FB21  ffd0                   call rax
0002FB23  e8d83e0000             call 0x33a00
0002FB28  ba2c010000             mov edx, 0x12c
0002FB2D  b988010000             mov ecx, 0x188
0002FB32  ffd0                   call rax
0002FB34  e8c73e0000             call 0x33a00
0002FB39  bac8000000             mov edx, 0xc8
0002FB3E  b972010000             mov ecx, 0x172
0002FB43  ffd0                   call rax
0002FB45  e8b63e0000             call 0x33a00
0002FB4A  ba58020000             mov edx, 0x258
0002FB4F  b94a010000             mov ecx, 0x14a
0002FB54  ffd0                   call rax
0002FB56  e8a53e0000             call 0x33a00
0002FB5B  bac8000000             mov edx, 0xc8
0002FB60  b926010000             mov ecx, 0x126
0002FB65  ffd0                   call rax
0002FB67  e8943e0000             call 0x33a00
0002FB6C  bac8000000             mov edx, 0xc8
0002FB71  b94a010000             mov ecx, 0x14a
0002FB76  ffd0                   call rax
0002FB78  e8833e0000             call 0x33a00
0002FB7D  bac8000000             mov edx, 0xc8
0002FB82  b988010000             mov ecx, 0x188
0002FB87  ffd0                   call rax
0002FB89  e8723e0000             call 0x33a00
0002FB8E  bac8000000             mov edx, 0xc8
0002FB93  b94a010000             mov ecx, 0x14a
0002FB98  ffd0                   call rax
0002FB9A  e8613e0000             call 0x33a00
0002FB9F  ba2c010000             mov edx, 0x12c
0002FBA4  b988010000             mov ecx, 0x188
0002FBA9  ffd0                   call rax
0002FBAB  e8503e0000             call 0x33a00
0002FBB0  bac8000000             mov edx, 0xc8
0002FBB5  b9b8010000             mov ecx, 0x1b8
0002FBBA  ffd0                   call rax
0002FBBC  e83f3e0000             call 0x33a00
0002FBC1  ba2c010000             mov edx, 0x12c
0002FBC6  b972010000             mov ecx, 0x172
0002FBCB  ffd0                   call rax
0002FBCD  e82e3e0000             call 0x33a00
0002FBD2  bac8000000             mov edx, 0xc8
0002FBD7  b94a010000             mov ecx, 0x14a
0002FBDC  ffd0                   call rax
0002FBDE  e81d3e0000             call 0x33a00
0002FBE3  ba90010000             mov edx, 0x190
0002FBE8  b926010000             mov ecx, 0x126
0002FBED  ffd0                   call rax
0002FBEF  e80c3e0000             call 0x33a00
0002FBF4  bac8000000             mov edx, 0xc8
0002FBF9  b926010000             mov ecx, 0x126
0002FBFE  ffd0                   call rax
0002FC00  e8fb3d0000             call 0x33a00
0002FC05  ba90010000             mov edx, 0x190
0002FC0A  b9b8010000             mov ecx, 0x1b8
0002FC0F  ffd0                   call rax
0002FC11  e8ea3d0000             call 0x33a00
0002FC16  ba20030000             mov edx, 0x320
0002FC1B  b988010000             mov ecx, 0x188
0002FC20  ffd0                   call rax
0002FC22  e849fafeff             call 0x1f670
0002FC27  b9f4010000             mov ecx, 0x1f4
0002FC2C  ffd0                   call rax
0002FC2E  48833de241030000       cmp qword ptr [rip + 0x341e2], 0   ; -> 0x63e18
0002FC36  0f85d2010000           jne 0x2fe0e
0002FC3C  c685f807000000         mov byte ptr [rbp + 0x7f8], 0
0002FC43  488d8df8070000         lea rcx, [rbp + 0x7f8]
0002FC4A  e81176feff             call 0x17260
0002FC4F  ba04010000             mov edx, 0x104
0002FC54  488d8dc0010000         lea rcx, [rbp + 0x1c0]
0002FC5B  ffd0                   call rax
0002FC5D  85c0                   test eax, eax
0002FC5F  0f84a9010000           je 0x2fe0e
0002FC65  33c9                   xor ecx, ecx
0002FC67  388dc0010000           cmp byte ptr [rbp + 0x1c0], cl
0002FC6D  7410                   je 0x2fc7f
0002FC6F  90                     nop 
0002FC70  ffc1                   inc ecx
0002FC72  4863c1                 movsxd rax, ecx
0002FC75  80bc05c001000000       cmp byte ptr [rbp + rax + 0x1c0], 0
0002FC7D  75f1                   jne 0x2fc70
0002FC7F  4863d1                 movsxd rdx, ecx
0002FC82  488d420b               lea rax, [rdx + 0xb]
0002FC86  483d04010000           cmp rax, 0x104
0002FC8C  0f837c010000           jae 0x2fe0e
0002FC92  c68415c00100005c       mov byte ptr [rbp + rdx + 0x1c0], 0x5c
0002FC9A  4863c1                 movsxd rax, ecx
0002FC9D  c68405c10100006e       mov byte ptr [rbp + rax + 0x1c1], 0x6e
0002FCA5  4863c1                 movsxd rax, ecx
0002FCA8  c68405c201000074       mov byte ptr [rbp + rax + 0x1c2], 0x74
0002FCB0  4863c1                 movsxd rax, ecx
0002FCB3  c68405c301000064       mov byte ptr [rbp + rax + 0x1c3], 0x64
0002FCBB  4863c1                 movsxd rax, ecx
0002FCBE  c68405c40100006c       mov byte ptr [rbp + rax + 0x1c4], 0x6c
0002FCC6  4863c1                 movsxd rax, ecx
0002FCC9  c68405c50100006c       mov byte ptr [rbp + rax + 0x1c5], 0x6c
0002FCD1  4863c1                 movsxd rax, ecx
0002FCD4  c68405c60100002e       mov byte ptr [rbp + rax + 0x1c6], 0x2e
0002FCDC  4863c1                 movsxd rax, ecx
0002FCDF  c68405c701000064       mov byte ptr [rbp + rax + 0x1c7], 0x64
0002FCE7  4863c1                 movsxd rax, ecx
0002FCEA  c68405c80100006c       mov byte ptr [rbp + rax + 0x1c8], 0x6c
0002FCF2  4863c1                 movsxd rax, ecx
0002FCF5  c68405c90100006c       mov byte ptr [rbp + rax + 0x1c9], 0x6c
0002FCFD  4863c1                 movsxd rax, ecx
0002FD00  c68405ca01000000       mov byte ptr [rbp + rax + 0x1ca], 0
0002FD08  c6850008000000         mov byte ptr [rbp + 0x800], 0
0002FD0F  488d8d00080000         lea rcx, [rbp + 0x800]
0002FD16  e8e578feff             call 0x17600
0002FD1B  48c744243000000000     mov qword ptr [rsp + 0x30], 0
0002FD24  c744242800000000       mov dword ptr [rsp + 0x28], 0
0002FD2C  c744242003000000       mov dword ptr [rsp + 0x20], 3
0002FD34  4533c9                 xor r9d, r9d
0002FD37  ba00000080             mov edx, 0x80000000
0002FD3C  41b801000000           mov r8d, 1
0002FD42  488d8dc0010000         lea rcx, [rbp + 0x1c0]
0002FD49  ffd0                   call rax
0002FD4B  488bd8                 mov rbx, rax
0002FD4E  4883f8ff               cmp rax, -1
0002FD52  0f84b6000000           je 0x2fe0e
0002FD58  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
0002FD5F  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002FD66  e8357cfeff             call 0x179a0
0002FD6B  33d2                   xor edx, edx
0002FD6D  488bcb                 mov rcx, rbx
0002FD70  ffd0                   call rax
0002FD72  8bf8                   mov edi, eax
0002FD74  b8ffffffff             mov eax, 0xffffffff
0002FD79  3bf8                   cmp edi, eax
0002FD7B  7515                   jne 0x2fd92
0002FD7D  c6850808000000         mov byte ptr [rbp + 0x808], 0
0002FD84  488d8d08080000         lea rcx, [rbp + 0x808]
0002FD8B  e8b07ffeff             call 0x17d40
0002FD90  eb77                   jmp 0x2fe09
0002FD92  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
0002FD99  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002FDA0  e83b83feff             call 0x180e0
0002FDA5  488bd7                 mov rdx, rdi
0002FDA8  33c9                   xor ecx, ecx
0002FDAA  41b904000000           mov r9d, 4
0002FDB0  41b800300000           mov r8d, 0x3000
0002FDB6  ffd0                   call rax
0002FDB8  48890559400300         mov qword ptr [rip + 0x34059], rax   ; -> 0x63e18
0002FDBF  4885c0                 test rax, rax
0002FDC2  7432                   je 0x2fdf6
0002FDC4  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
0002FDCB  488d8df0070000         lea rcx, [rbp + 0x7f0]
0002FDD2  e8a986feff             call 0x18480
0002FDD7  48c744242000000000     mov qword ptr [rsp + 0x20], 0
0002FDE0  4c8d8d08080000         lea r9, [rbp + 0x808]
0002FDE7  448bc7                 mov r8d, edi
0002FDEA  488b1527400300         mov rdx, qword ptr [rip + 0x34027]   ; -> 0x63e18
0002FDF1  488bcb                 mov rcx, rbx
0002FDF4  ffd0                   call rax
0002FDF6  c6850808000000         mov byte ptr [rbp + 0x808], 0
0002FDFD  488d8d08080000         lea rcx, [rbp + 0x808]
0002FE04  e8377ffeff             call 0x17d40
0002FE09  488bcb                 mov rcx, rbx
0002FE0C  ffd0                   call rax
0002FE0E  65488b042560000000     mov rax, qword ptr gs:[0x60]
0002FE17  4c8b4818               mov r9, qword ptr [rax + 0x18]
0002FE1B  4983c120               add r9, 0x20
0002FE1F  4d8b39                 mov r15, qword ptr [r9]
0002FE22  4d3bf9                 cmp r15, r9
0002FE25  0f8415050000           je 0x30340
0002FE2B  440fb71585d7fdff       movzx r10d, word ptr [rip - 0x2287b]   ; -> 0xd5b8
0002FE33  498b5f50               mov rbx, qword ptr [r15 + 0x50]
0002FE37  4885db                 test rbx, rbx
0002FE3A  747f                   je 0x2febb
0002FE3C  41b8c59d1c81           mov r8d, 0x811c9dc5
0002FE42  0fb703                 movzx eax, word ptr [rbx]
0002FE45  6685c0                 test ax, ax
0002FE48  742e                   je 0x2fe78
0002FE4A  660f1f440000           nop word ptr [rax + rax]
0002FE50  488d5b02               lea rbx, [rbx + 2]
0002FE54  8d509f                 lea edx, [rax - 0x61]
0002FE57  0fb6c8                 movzx ecx, al
0002FE5A  2c20                   sub al, 0x20
0002FE5C  6683fa19               cmp dx, 0x19
0002FE60  0f47c1                 cmova eax, ecx
0002FE63  0fbec0                 movsx eax, al
0002FE66  4133c0                 xor eax, r8d
0002FE69  4469c093010001         imul r8d, eax, 0x1000193
0002FE70  0fb703                 movzx eax, word ptr [rbx]
0002FE73  6685c0                 test ax, ax
0002FE76  75d8                   jne 0x2fe50
0002FE78  488d1d39d7fdff         lea rbx, [rip - 0x228c7]   ; -> 0xd5b8
0002FE7F  bfc59d1c81             mov edi, 0x811c9dc5
0002FE84  410fb7c2               movzx eax, r10w
0002FE88  0f1f840000000000       nop dword ptr [rax + rax]
0002FE90  488d5b02               lea rbx, [rbx + 2]
0002FE94  8d509f                 lea edx, [rax - 0x61]
0002FE97  0fb6c8                 movzx ecx, al
0002FE9A  2c20                   sub al, 0x20
0002FE9C  6683fa19               cmp dx, 0x19
0002FEA0  0f47c1                 cmova eax, ecx
0002FEA3  0fbec0                 movsx eax, al
0002FEA6  33c7                   xor eax, edi
0002FEA8  69f893010001           imul edi, eax, 0x1000193
0002FEAE  0fb703                 movzx eax, word ptr [rbx]
0002FEB1  6685c0                 test ax, ax
0002FEB4  75da                   jne 0x2fe90
0002FEB6  443bc7                 cmp r8d, edi
0002FEB9  7411                   je 0x2fecc
0002FEBB  4d8b3f                 mov r15, qword ptr [r15]
0002FEBE  4d3bf9                 cmp r15, r9
0002FEC1  0f856cffffff           jne 0x2fe33
0002FEC7  e974040000             jmp 0x30340
0002FECC  4d8b7f20               mov r15, qword ptr [r15 + 0x20]
0002FED0  4d85ff                 test r15, r15
0002FED3  0f8467040000           je 0x30340
0002FED9  4c8b1dc03e0300         mov r11, qword ptr [rip + 0x33ec0]   ; -> 0x63da0
0002FEE0  4d85db                 test r11, r11
0002FEE3  0f858f000000           jne 0x2ff78
0002FEE9  49634f3c               movsxd rcx, dword ptr [r15 + 0x3c]
0002FEED  4903cf                 add rcx, r15
0002FEF0  440fb74914             movzx r9d, word ptr [rcx + 0x14]
0002FEF5  4c03c9                 add r9, rcx
0002FEF8  4533c0                 xor r8d, r8d
0002FEFB  440fb75106             movzx r10d, word ptr [rcx + 6]
0002FF00  4585d2                 test r10d, r10d
0002FF03  0f8437040000           je 0x30340
0002FF09  0f1f8000000000         nop dword ptr [rax]
0002FF10  4b8d0c80               lea rcx, [r8 + r8*4]
0002FF14  418b44c93c             mov eax, dword ptr [r9 + rcx*8 + 0x3c]
0002FF19  2520000020             and eax, 0x20000020
0002FF1E  3d20000020             cmp eax, 0x20000020
0002FF23  753f                   jne 0x2ff64
0002FF25  418b5cc924             mov ebx, dword ptr [r9 + rcx*8 + 0x24]
0002FF2A  4903df                 add rbx, r15
0002FF2D  33d2                   xor edx, edx
0002FF2F  418b7cc920             mov edi, dword ptr [r9 + rcx*8 + 0x20]
0002FF34  83ef02                 sub edi, 2
0002FF37  742b                   je 0x2ff64
0002FF39  0f1f8000000000         nop dword ptr [rax]
0002FF40  448bda                 mov r11d, edx
0002FF43  4c03db                 add r11, rbx
0002FF46  41803b0f               cmp byte ptr [r11], 0xf
0002FF4A  7512                   jne 0x2ff5e
0002FF4C  8d4201                 lea eax, [rdx + 1]
0002FF4F  803c1805               cmp byte ptr [rax + rbx], 5
0002FF53  7509                   jne 0x2ff5e
0002FF55  8d4202                 lea eax, [rdx + 2]
0002FF58  803c18c3               cmp byte ptr [rax + rbx], 0xc3
0002FF5C  7413                   je 0x2ff71
0002FF5E  ffc2                   inc edx
0002FF60  3bd7                   cmp edx, edi
0002FF62  72dc                   jb 0x2ff40
0002FF64  41ffc0                 inc r8d
0002FF67  453bc2                 cmp r8d, r10d
0002FF6A  7ca4                   jl 0x2ff10
0002FF6C  e9cf030000             jmp 0x30340
0002FF71  4c891d283e0300         mov qword ptr [rip + 0x33e28], r11   ; -> 0x63da0
0002FF78  488b05993e0300         mov rax, qword ptr [rip + 0x33e99]   ; -> 0x63e18
0002FF7F  4885c0                 test rax, rax
0002FF82  0f95c2                 setne dl
0002FF85  8895f0070000           mov byte ptr [rbp + 0x7f0], dl
0002FF8B  4885c0                 test rax, rax
0002FF8E  4c0f45f8               cmovne r15, rax
0002FF92  4d63573c               movsxd r10, dword ptr [r15 + 0x3c]
0002FF96  4d03d7                 add r10, r15
0002FF99  4183ba8c00000000       cmp dword ptr [r10 + 0x8c], 0
0002FFA1  0f8499030000           je 0x30340
0002FFA7  458b8a88000000         mov r9d, dword ptr [r10 + 0x88]
0002FFAE  84d2                   test dl, dl
0002FFB0  7529                   jne 0x2ffdb
0002FFB2  4f8d340f               lea r14, [r15 + r9]
0002FFB6  418b461c               mov eax, dword ptr [r14 + 0x1c]
0002FFBA  894510                 mov dword ptr [rbp + 0x10], eax
0002FFBD  418b7e24               mov edi, dword ptr [r14 + 0x24]
0002FFC1  4903ff                 add rdi, r15
0002FFC4  4889bd88000000         mov qword ptr [rbp + 0x88], rdi
0002FFCB  418b4e20               mov ecx, dword ptr [r14 + 0x20]
0002FFCF  4903cf                 add rcx, r15
0002FFD2  48894d08               mov qword ptr [rbp + 8], rcx
0002FFD6  e955010000             jmp 0x30130
0002FFDB  450fb74214             movzx r8d, word ptr [r10 + 0x14]
0002FFE0  4d03c2                 add r8, r10
0002FFE3  33d2                   xor edx, edx
0002FFE5  450fb77206             movzx r14d, word ptr [r10 + 6]
0002FFEA  4585f6                 test r14d, r14d
0002FFED  742e                   je 0x3001d
0002FFEF  90                     nop 
0002FFF0  488d0c92               lea rcx, [rdx + rdx*4]
0002FFF4  488d1ccd00000000       lea rbx, [rcx*8]
0002FFFC  418b7c1824             mov edi, dword ptr [r8 + rbx + 0x24]
00030001  443bcf                 cmp r9d, edi
00030004  7210                   jb 0x30016
00030006  418b4c1820             mov ecx, dword ptr [r8 + rbx + 0x20]
0003000B  03cf                   add ecx, edi
0003000D  443bc9                 cmp r9d, ecx
00030010  0f828c010000           jb 0x301a2
00030016  ffc2                   inc edx
00030018  413bd6                 cmp edx, r14d
0003001B  7cd3                   jl 0x2fff0
0003001D  4f8d340f               lea r14, [r15 + r9]
00030021  458b4e20               mov r9d, dword ptr [r14 + 0x20]
00030025  410fb75a14             movzx ebx, word ptr [r10 + 0x14]
0003002A  4903da                 add rbx, r10
0003002D  33d2                   xor edx, edx
0003002F  410fb74206             movzx eax, word ptr [r10 + 6]
00030034  85c0                   test eax, eax
00030036  7439                   je 0x30071
00030038  0f1f840000000000       nop dword ptr [rax + rax]
00030040  488d0c92               lea rcx, [rdx + rdx*4]
00030044  488d3ccd00000000       lea rdi, [rcx*8]
0003004C  448b443b24             mov r8d, dword ptr [rbx + rdi + 0x24]
00030051  453bc8                 cmp r9d, r8d
00030054  7210                   jb 0x30066
00030056  8b4c3b20               mov ecx, dword ptr [rbx + rdi + 0x20]
0003005A  4103c8                 add ecx, r8d
0003005D  443bc9                 cmp r9d, ecx
00030060  0f825d010000           jb 0x301c3
00030066  ffc2                   inc edx
00030068  410fb74206             movzx eax, word ptr [r10 + 6]
0003006D  3bd0                   cmp edx, eax
0003006F  7ccf                   jl 0x30040
00030071  418bc9                 mov ecx, r9d
00030074  4903cf                 add rcx, r15
00030077  48894d08               mov qword ptr [rbp + 8], rcx
0003007B  458b4e24               mov r9d, dword ptr [r14 + 0x24]
0003007F  410fb75a14             movzx ebx, word ptr [r10 + 0x14]
00030084  4903da                 add rbx, r10
00030087  33d2                   xor edx, edx
00030089  410fb74206             movzx eax, word ptr [r10 + 6]
0003008E  85c0                   test eax, eax
00030090  7431                   je 0x300c3
00030092  488d0c92               lea rcx, [rdx + rdx*4]
00030096  488d3ccd00000000       lea rdi, [rcx*8]
0003009E  448b443b24             mov r8d, dword ptr [rbx + rdi + 0x24]
000300A3  453bc8                 cmp r9d, r8d
000300A6  7210                   jb 0x300b8
000300A8  8b4c3b20               mov ecx, dword ptr [rbx + rdi + 0x20]
000300AC  4103c8                 add ecx, r8d
000300AF  443bc9                 cmp r9d, ecx
000300B2  0f822f010000           jb 0x301e7
000300B8  ffc2                   inc edx
000300BA  410fb74206             movzx eax, word ptr [r10 + 6]
000300BF  3bd0                   cmp edx, eax
000300C1  7ccf                   jl 0x30092
000300C3  418bc1                 mov eax, r9d
000300C6  4903c7                 add rax, r15
000300C9  48898588000000         mov qword ptr [rbp + 0x88], rax
000300D0  458b4e1c               mov r9d, dword ptr [r14 + 0x1c]
000300D4  410fb75a14             movzx ebx, word ptr [r10 + 0x14]
000300D9  4903da                 add rbx, r10
000300DC  33d2                   xor edx, edx
000300DE  410fb74206             movzx eax, word ptr [r10 + 6]
000300E3  85c0                   test eax, eax
000300E5  743a                   je 0x30121
000300E7  660f1f840000000000     nop word ptr [rax + rax]
000300F0  488d0c92               lea rcx, [rdx + rdx*4]
000300F4  488d3ccd00000000       lea rdi, [rcx*8]
000300FC  448b443b24             mov r8d, dword ptr [rbx + rdi + 0x24]
00030101  453bc8                 cmp r9d, r8d
00030104  7210                   jb 0x30116
00030106  8b4c3b20               mov ecx, dword ptr [rbx + rdi + 0x20]
0003010A  4103c8                 add ecx, r8d
0003010D  443bc9                 cmp r9d, ecx
00030110  0f82f8000000           jb 0x3020e
00030116  ffc2                   inc edx
00030118  410fb74206             movzx eax, word ptr [r10 + 6]
0003011D  3bd0                   cmp edx, eax
0003011F  7ccf                   jl 0x300f0
00030121  44894d10               mov dword ptr [rbp + 0x10], r9d
00030125  0fb695f0070000         movzx edx, byte ptr [rbp + 0x7f0]
0003012C  488b4d08               mov rcx, qword ptr [rbp + 8]
00030130  458b4e18               mov r9d, dword ptr [r14 + 0x18]
00030134  44894d38               mov dword ptr [rbp + 0x38], r9d
00030138  4585c9                 test r9d, r9d
0003013B  0f84ff010000           je 0x30340
00030141  4533ed                 xor r13d, r13d
00030144  428b1ca9               mov ebx, dword ptr [rcx + r13*4]
00030148  84d2                   test dl, dl
0003014A  0f84de000000           je 0x3022e
00030150  450fb74a14             movzx r9d, word ptr [r10 + 0x14]
00030155  4d03ca                 add r9, r10
00030158  33d2                   xor edx, edx
0003015A  450fb77206             movzx r14d, word ptr [r10 + 6]
0003015F  4585f6                 test r14d, r14d
00030162  0f84c2000000           je 0x3022a
00030168  0f1f840000000000       nop dword ptr [rax + rax]
00030170  488d0c92               lea rcx, [rdx + rdx*4]
00030174  488d3ccd00000000       lea rdi, [rcx*8]
0003017C  458b443924             mov r8d, dword ptr [r9 + rdi + 0x24]
00030181  413bd8                 cmp ebx, r8d
00030184  7210                   jb 0x30196
00030186  418b4c3920             mov ecx, dword ptr [r9 + rdi + 0x20]
0003018B  4103c8                 add ecx, r8d
0003018E  3bd9                   cmp ebx, ecx
00030190  0f828a000000           jb 0x30220
00030196  ffc2                   inc edx
00030198  413bd6                 cmp edx, r14d
0003019B  7cd3                   jl 0x30170
0003019D  e988000000             jmp 0x3022a
000301A2  458b74182c             mov r14d, dword ptr [r8 + rbx + 0x2c]
000301A7  442bf7                 sub r14d, edi
000301AA  4503f1                 add r14d, r9d
000301AD  4d03f7                 add r14, r15
000301B0  458b4e20               mov r9d, dword ptr [r14 + 0x20]
000301B4  410fb75a14             movzx ebx, word ptr [r10 + 0x14]
000301B9  4903da                 add rbx, r10
000301BC  33d2                   xor edx, edx
000301BE  e97dfeffff             jmp 0x30040
000301C3  8b4c3b2c               mov ecx, dword ptr [rbx + rdi + 0x2c]
000301C7  412bc8                 sub ecx, r8d
000301CA  4103c9                 add ecx, r9d
000301CD  4903cf                 add rcx, r15
000301D0  48894d08               mov qword ptr [rbp + 8], rcx
000301D4  458b4e24               mov r9d, dword ptr [r14 + 0x24]
000301D8  410fb75a14             movzx ebx, word ptr [r10 + 0x14]
000301DD  4903da                 add rbx, r10
000301E0  33d2                   xor edx, edx
000301E2  e9abfeffff             jmp 0x30092
000301E7  8b4c3b2c               mov ecx, dword ptr [rbx + rdi + 0x2c]
000301EB  412bc8                 sub ecx, r8d
000301EE  4103c9                 add ecx, r9d
000301F1  4903cf                 add rcx, r15
000301F4  48898d88000000         mov qword ptr [rbp + 0x88], rcx
000301FB  458b4e1c               mov r9d, dword ptr [r14 + 0x1c]
000301FF  410fb75a14             movzx ebx, word ptr [r10 + 0x14]
00030204  4903da                 add rbx, r10
00030207  33d2                   xor edx, edx
00030209  e9e2feffff             jmp 0x300f0
0003020E  8b443b2c               mov eax, dword ptr [rbx + rdi + 0x2c]
00030212  412bc0                 sub eax, r8d
00030215  4103c1                 add eax, r9d
00030218  894510                 mov dword ptr [rbp + 0x10], eax
0003021B  e905ffffff             jmp 0x30125
00030220  418b44392c             mov eax, dword ptr [r9 + rdi + 0x2c]
00030225  412bc0                 sub eax, r8d
00030228  03d8                   add ebx, eax
0003022A  448b4d38               mov r9d, dword ptr [rbp + 0x38]
0003022E  8bd3                   mov edx, ebx
00030230  4903d7                 add rdx, r15
00030233  bbc59d1c81             mov ebx, 0x811c9dc5
00030238  0fb60a                 movzx ecx, byte ptr [rdx]
0003023B  84c9                   test cl, cl
0003023D  7429                   je 0x30268
0003023F  90                     nop 
00030240  488d5201               lea rdx, [rdx + 1]
00030244  8d419f                 lea eax, [rcx - 0x61]
00030247  3c19                   cmp al, 0x19
00030249  7703                   ja 0x3024e
0003024B  80e920                 sub cl, 0x20
0003024E  0fbec1                 movsx eax, cl
00030251  33c3                   xor eax, ebx
00030253  69d893010001           imul ebx, eax, 0x1000193
00030259  0fb60a                 movzx ecx, byte ptr [rdx]
0003025C  84c9                   test cl, cl
0003025E  75e0                   jne 0x30240
00030260  81fbe7f231b9           cmp ebx, 0xb931f2e7
00030266  741c                   je 0x30284
00030268  41ffc5                 inc r13d
0003026B  453be9                 cmp r13d, r9d
0003026E  0f83c8000000           jae 0x3033c
00030274  488b4d08               mov rcx, qword ptr [rbp + 8]
00030278  0fb695f0070000         movzx edx, byte ptr [rbp + 0x7f0]
0003027F  e9c0feffff             jmp 0x30144
00030284  488b8d88000000         mov rcx, qword ptr [rbp + 0x88]
0003028B  420fb71469             movzx edx, word ptr [rcx + r13*2]
00030290  8b4d10                 mov ecx, dword ptr [rbp + 0x10]
00030293  4903cf                 add rcx, r15
00030296  8b1c91                 mov ebx, dword ptr [rcx + rdx*4]
00030299  80bdf007000000         cmp byte ptr [rbp + 0x7f0], 0
000302A0  7453                   je 0x302f5
000302A2  450fb74a14             movzx r9d, word ptr [r10 + 0x14]
000302A7  4d03ca                 add r9, r10
000302AA  33d2                   xor edx, edx
000302AC  450fb75206             movzx r10d, word ptr [r10 + 6]
000302B1  4585d2                 test r10d, r10d
000302B4  743f                   je 0x302f5
000302B6  66660f1f840000000000   nop word ptr [rax + rax]
000302C0  488d0c92               lea rcx, [rdx + rdx*4]
000302C4  488d3ccd00000000       lea rdi, [rcx*8]
000302CC  468b440f24             mov r8d, dword ptr [rdi + r9 + 0x24]
000302D1  413bd8                 cmp ebx, r8d
000302D4  720c                   jb 0x302e2
000302D6  428b4c0f20             mov ecx, dword ptr [rdi + r9 + 0x20]
000302DB  4103c8                 add ecx, r8d
000302DE  3bd9                   cmp ebx, ecx
000302E0  7209                   jb 0x302eb
000302E2  ffc2                   inc edx
000302E4  413bd2                 cmp edx, r10d
000302E7  7cd7                   jl 0x302c0
000302E9  eb0a                   jmp 0x302f5
000302EB  428b440f2c             mov eax, dword ptr [rdi + r9 + 0x2c]
000302F0  412bc0                 sub eax, r8d
000302F3  03d8                   add ebx, eax
000302F5  4903df                 add rbx, r15
000302F8  33c9                   xor ecx, ecx
000302FA  660f1f440000           nop word ptr [rax + rax]
00030300  0fb60419               movzx eax, byte ptr [rcx + rbx]
00030304  3cb8                   cmp al, 0xb8
00030306  7411                   je 0x30319
00030308  3cc3                   cmp al, 0xc3
0003030A  7430                   je 0x3033c
0003030C  3ccc                   cmp al, 0xcc
0003030E  742c                   je 0x3033c
00030310  ffc1                   inc ecx
00030312  83f920                 cmp ecx, 0x20
00030315  7ce9                   jl 0x30300
00030317  eb23                   jmp 0x3033c
00030319  8b4c1901               mov ecx, dword ptr [rcx + rbx + 1]
0003031D  85c9                   test ecx, ecx
0003031F  741b                   je 0x3033c
00030321  0f31                   rdtsc 
00030323  48c1e220               shl rdx, 0x20
00030327  480bc2                 or rax, rdx
0003032A  4c8bc8                 mov r9, rax
0003032D  49c7c0ffffffff         mov r8, 0xffffffffffffffff
00030334  498bd3                 mov rdx, r11
00030337  e81c5e0000             call 0x36158
0003033C  4c8b6d28               mov r13, qword ptr [rbp + 0x28]
00030340  32db                   xor bl, bl
00030342  488d4d18               lea rcx, [rbp + 0x18]
00030346  4c8b7d30               mov r15, qword ptr [rbp + 0x30]
0003034A  4983ff0f               cmp r15, 0xf
0003034E  488b7d18               mov rdi, qword ptr [rbp + 0x18]
00030352  480f47cf               cmova rcx, rdi
00030356  4983fd0c               cmp r13, 0xc
0003035A  7520                   jne 0x3037c
0003035C  4d8bc5                 mov r8, r13
0003035F  488d15d2d3fdff         lea rdx, [rip - 0x22c2e]   ; -> 0xd738
00030366  e8d5820200             call 0x58640
0003036B  0fb6db                 movzx ebx, bl
0003036E  85c0                   test eax, eax
00030370  41be01000000           mov r14d, 1
00030376  410f44de               cmove ebx, r14d
0003037A  eb06                   jmp 0x30382
0003037C  41be01000000           mov r14d, 1
00030382  488d4d18               lea rcx, [rbp + 0x18]
00030386  4983ff0f               cmp r15, 0xf
0003038A  480f47cf               cmova rcx, rdi
0003038E  4983fd08               cmp r13, 8
00030392  7518                   jne 0x303ac
00030394  4d8bc5                 mov r8, r13
00030397  488d156ad3fdff         lea rdx, [rip - 0x22c96]   ; -> 0xd708
0003039E  e89d820200             call 0x58640
000303A3  0fb6db                 movzx ebx, bl
000303A6  85c0                   test eax, eax
000303A8  410f44de               cmove ebx, r14d
000303AC  488d4d18               lea rcx, [rbp + 0x18]
000303B0  4983ff0f               cmp r15, 0xf
000303B4  480f47cf               cmova rcx, rdi
000303B8  4983fd1d               cmp r13, 0x1d
000303BC  7518                   jne 0x303d6
000303BE  4d8bc5                 mov r8, r13
000303C1  488d1550d3fdff         lea rdx, [rip - 0x22cb0]   ; -> 0xd718
000303C8  e873820200             call 0x58640
000303CD  0fb6db                 movzx ebx, bl
000303D0  85c0                   test eax, eax
000303D2  410f44de               cmove ebx, r14d
000303D6  488d4d18               lea rcx, [rbp + 0x18]
000303DA  4983ff0f               cmp r15, 0xf
000303DE  480f47cf               cmova rcx, rdi
000303E2  4983fd1b               cmp r13, 0x1b
000303E6  7513                   jne 0x303fb
000303E8  4d8bc5                 mov r8, r13
000303EB  488d15f6d2fdff         lea rdx, [rip - 0x22d0a]   ; -> 0xd6e8
000303F2  e849820200             call 0x58640
000303F7  85c0                   test eax, eax
000303F9  7404                   je 0x303ff
000303FB  84db                   test bl, bl
000303FD  7420                   je 0x3041f
000303FF  813597190300adde0000   xor dword ptr [rip + 0x31997], 0xdead   ; -> 0x61da0
00030409  8135a9190300efbe0000   xor dword ptr [rip + 0x319a9], 0xbeef   ; -> 0x61dbc
00030413  e858f2feff             call 0x1f670
00030418  b92c010000             mov ecx, 0x12c
0003041D  ffd0                   call rax
0003041F  49c7c0ffffffff         mov r8, 0xffffffffffffffff
00030426  41bf03000000           mov r15d, 3
0003042C  0f1f4000               nop dword ptr [rax]
00030430  0f31                   rdtsc 
00030432  48c1e220               shl rdx, 0x20
00030436  480bc2                 or rax, rdx
00030439  488bf8                 mov rdi, rax
0003043C  33c0                   xor eax, eax
0003043E  33c9                   xor ecx, ecx
00030440  0fa2                   cpuid 
00030442  898588000000           mov dword ptr [rbp + 0x88], eax
00030448  899d8c000000           mov dword ptr [rbp + 0x8c], ebx
0003044E  898d90000000           mov dword ptr [rbp + 0x90], ecx
00030454  899594000000           mov dword ptr [rbp + 0x94], edx
0003045A  0f31                   rdtsc 
0003045C  48c1e220               shl rdx, 0x20
00030460  480bc2                 or rax, rdx
00030463  482bc7                 sub rax, rdi
00030466  493bc0                 cmp rax, r8
00030469  490f43c0               cmovae rax, r8
0003046D  4c8bc0                 mov r8, rax
00030470  4183ef01               sub r15d, 1
00030474  75ba                   jne 0x30430
00030476  488b05c3390300         mov rax, qword ptr [rip + 0x339c3]   ; -> 0x63e40
0003047D  4885c0                 test rax, rax
00030480  7504                   jne 0x30486
00030482  33ff                   xor edi, edi
00030484  eb1a                   jmp 0x304a0
00030486  0f31                   rdtsc 
00030488  48c1e220               shl rdx, 0x20
0003048C  480bc2                 or rax, rdx
0003048F  488bf8                 mov rdi, rax
00030492  488b0da7390300         mov rcx, qword ptr [rip + 0x339a7]   ; -> 0x63e40
00030499  482bf9                 sub rdi, rcx
0003049C  48c1ef22               shr rdi, 0x22
000304A0  33db                   xor ebx, ebx
000304A2  4c8b7d30               mov r15, qword ptr [rbp + 0x30]
000304A6  b9ffffffff             mov ecx, 0xffffffff
000304AB  4c8d0dee180300         lea r9, [rip + 0x318ee]   ; -> 0x61da0
000304B2  420fb6040b             movzx eax, byte ptr [rbx + r9]
000304B7  33c1                   xor eax, ecx
000304B9  8bc8                   mov ecx, eax
000304BB  83e101                 and ecx, 1
000304BE  f7d9                   neg ecx
000304C0  81e12083b8ed           and ecx, 0xedb88320
000304C6  d1e8                   shr eax, 1
000304C8  33c8                   xor ecx, eax
000304CA  8bc1                   mov eax, ecx
000304CC  83e001                 and eax, 1
000304CF  f7d8                   neg eax
000304D1  252083b8ed             and eax, 0xedb88320
000304D6  d1e9                   shr ecx, 1
000304D8  33c1                   xor eax, ecx
000304DA  8bc8                   mov ecx, eax
000304DC  83e101                 and ecx, 1
000304DF  f7d9                   neg ecx
000304E1  81e12083b8ed           and ecx, 0xedb88320
000304E7  d1e8                   shr eax, 1
000304E9  33c8                   xor ecx, eax
000304EB  8bc1                   mov eax, ecx
000304ED  83e001                 and eax, 1
000304F0  f7d8                   neg eax
000304F2  252083b8ed             and eax, 0xedb88320
000304F7  d1e9                   shr ecx, 1
000304F9  33c1                   xor eax, ecx
000304FB  8bc8                   mov ecx, eax
000304FD  83e101                 and ecx, 1
00030500  f7d9                   neg ecx
00030502  81e12083b8ed           and ecx, 0xedb88320
00030508  d1e8                   shr eax, 1
0003050A  33c8                   xor ecx, eax
0003050C  8bc1                   mov eax, ecx
0003050E  83e001                 and eax, 1
00030511  f7d8                   neg eax
00030513  252083b8ed             and eax, 0xedb88320
00030518  d1e9                   shr ecx, 1
0003051A  33c1                   xor eax, ecx
0003051C  8bc8                   mov ecx, eax
0003051E  83e101                 and ecx, 1
00030521  f7d9                   neg ecx
00030523  81e12083b8ed           and ecx, 0xedb88320
00030529  d1e8                   shr eax, 1
0003052B  33c8                   xor ecx, eax
0003052D  8bd1                   mov edx, ecx
0003052F  83e201                 and edx, 1
00030532  f7da                   neg edx
00030534  81e22083b8ed           and edx, 0xedb88320
0003053A  420fb6440b01           movzx eax, byte ptr [rbx + r9 + 1]
00030540  33d0                   xor edx, eax
00030542  d1e9                   shr ecx, 1
00030544  33d1                   xor edx, ecx
00030546  8bc2                   mov eax, edx
00030548  83e001                 and eax, 1
0003054B  f7d8                   neg eax
0003054D  252083b8ed             and eax, 0xedb88320
00030552  d1ea                   shr edx, 1
00030554  33c2                   xor eax, edx
00030556  8bc8                   mov ecx, eax
00030558  83e101                 and ecx, 1
0003055B  f7d9                   neg ecx
0003055D  81e12083b8ed           and ecx, 0xedb88320
00030563  d1e8                   shr eax, 1
00030565  33c8                   xor ecx, eax
00030567  8bc1                   mov eax, ecx
00030569  83e001                 and eax, 1
0003056C  f7d8                   neg eax
0003056E  252083b8ed             and eax, 0xedb88320
00030573  d1e9                   shr ecx, 1
00030575  33c1                   xor eax, ecx
00030577  8bc8                   mov ecx, eax
00030579  83e101                 and ecx, 1
0003057C  f7d9                   neg ecx
0003057E  81e12083b8ed           and ecx, 0xedb88320
00030584  d1e8                   shr eax, 1
00030586  33c8                   xor ecx, eax
00030588  8bc1                   mov eax, ecx
0003058A  83e001                 and eax, 1
0003058D  f7d8                   neg eax
0003058F  252083b8ed             and eax, 0xedb88320
00030594  d1e9                   shr ecx, 1
00030596  33c1                   xor eax, ecx
00030598  8bc8                   mov ecx, eax
0003059A  83e101                 and ecx, 1
0003059D  f7d9                   neg ecx
0003059F  81e12083b8ed           and ecx, 0xedb88320
000305A5  d1e8                   shr eax, 1
000305A7  33c8                   xor ecx, eax
000305A9  8bd1                   mov edx, ecx
000305AB  83e201                 and edx, 1
000305AE  f7da                   neg edx
000305B0  81e22083b8ed           and edx, 0xedb88320
000305B6  d1e9                   shr ecx, 1
000305B8  33d1                   xor edx, ecx
000305BA  8bca                   mov ecx, edx
000305BC  83e101                 and ecx, 1
000305BF  f7d9                   neg ecx
000305C1  81e12083b8ed           and ecx, 0xedb88320
000305C7  420fb6440b02           movzx eax, byte ptr [rbx + r9 + 2]
000305CD  33c8                   xor ecx, eax
000305CF  d1ea                   shr edx, 1
000305D1  33ca                   xor ecx, edx
000305D3  8bc1                   mov eax, ecx
000305D5  83e001                 and eax, 1
000305D8  f7d8                   neg eax
000305DA  252083b8ed             and eax, 0xedb88320
000305DF  d1e9                   shr ecx, 1
000305E1  33c1                   xor eax, ecx
000305E3  8bc8                   mov ecx, eax
000305E5  83e101                 and ecx, 1
000305E8  f7d9                   neg ecx
000305EA  81e12083b8ed           and ecx, 0xedb88320
000305F0  d1e8                   shr eax, 1
000305F2  33c8                   xor ecx, eax
000305F4  8bc1                   mov eax, ecx
000305F6  83e001                 and eax, 1
000305F9  f7d8                   neg eax
000305FB  252083b8ed             and eax, 0xedb88320
00030600  d1e9                   shr ecx, 1
00030602  33c1                   xor eax, ecx
00030604  8bc8                   mov ecx, eax
00030606  83e101                 and ecx, 1
00030609  f7d9                   neg ecx
0003060B  81e12083b8ed           and ecx, 0xedb88320
00030611  d1e8                   shr eax, 1
00030613  33c8                   xor ecx, eax
00030615  8bc1                   mov eax, ecx
00030617  83e001                 and eax, 1
0003061A  f7d8                   neg eax
0003061C  252083b8ed             and eax, 0xedb88320
00030621  d1e9                   shr ecx, 1
00030623  33c1                   xor eax, ecx
00030625  8bc8                   mov ecx, eax
00030627  83e101                 and ecx, 1
0003062A  f7d9                   neg ecx
0003062C  81e12083b8ed           and ecx, 0xedb88320
00030632  d1e8                   shr eax, 1
00030634  33c8                   xor ecx, eax
00030636  8bd1                   mov edx, ecx
00030638  83e201                 and edx, 1
0003063B  f7da                   neg edx
0003063D  81e22083b8ed           and edx, 0xedb88320
00030643  d1e9                   shr ecx, 1
00030645  33d1                   xor edx, ecx
00030647  8bca                   mov ecx, edx
00030649  83e101                 and ecx, 1
0003064C  f7d9                   neg ecx
0003064E  81e12083b8ed           and ecx, 0xedb88320
00030654  420fb6440b03           movzx eax, byte ptr [rbx + r9 + 3]
0003065A  33c8                   xor ecx, eax
0003065C  d1ea                   shr edx, 1
0003065E  33ca                   xor ecx, edx
00030660  8bc1                   mov eax, ecx
00030662  83e001                 and eax, 1
00030665  f7d8                   neg eax
00030667  252083b8ed             and eax, 0xedb88320
0003066C  d1e9                   shr ecx, 1
0003066E  33c1                   xor eax, ecx
00030670  8bc8                   mov ecx, eax
00030672  83e101                 and ecx, 1
00030675  f7d9                   neg ecx
00030677  81e12083b8ed           and ecx, 0xedb88320
0003067D  d1e8                   shr eax, 1
0003067F  33c8                   xor ecx, eax
00030681  8bc1                   mov eax, ecx
00030683  83e001                 and eax, 1
00030686  f7d8                   neg eax
00030688  252083b8ed             and eax, 0xedb88320
0003068D  d1e9                   shr ecx, 1
0003068F  33c1                   xor eax, ecx
00030691  8bc8                   mov ecx, eax
00030693  83e101                 and ecx, 1
00030696  f7d9                   neg ecx
00030698  81e12083b8ed           and ecx, 0xedb88320
0003069E  d1e8                   shr eax, 1
000306A0  33c8                   xor ecx, eax
000306A2  8bc1                   mov eax, ecx
000306A4  83e001                 and eax, 1
000306A7  f7d8                   neg eax
000306A9  252083b8ed             and eax, 0xedb88320
000306AE  d1e9                   shr ecx, 1
000306B0  33c1                   xor eax, ecx
000306B2  8bc8                   mov ecx, eax
000306B4  83e101                 and ecx, 1
000306B7  f7d9                   neg ecx
000306B9  81e12083b8ed           and ecx, 0xedb88320
000306BF  d1e8                   shr eax, 1
000306C1  33c8                   xor ecx, eax
000306C3  8bc1                   mov eax, ecx
000306C5  83e001                 and eax, 1
000306C8  f7d8                   neg eax
000306CA  252083b8ed             and eax, 0xedb88320
000306CF  d1e9                   shr ecx, 1
000306D1  33c1                   xor eax, ecx
000306D3  8bc8                   mov ecx, eax
000306D5  83e101                 and ecx, 1
000306D8  f7d9                   neg ecx
000306DA  81e12083b8ed           and ecx, 0xedb88320
000306E0  d1e8                   shr eax, 1
000306E2  33c8                   xor ecx, eax
000306E4  4883c304               add rbx, 4
000306E8  4881fb00080000         cmp rbx, 0x800
000306EF  0f82bdfdffff           jb 0x304b2
000306F5  0f57c0                 xorps xmm0, xmm0
000306F8  0f118588000000         movups xmmword ptr [rbp + 0x88], xmm0
000306FF  48c7859800000000000000 mov qword ptr [rbp + 0x98], 0
0003070A  48c785a000000000000000 mov qword ptr [rbp + 0xa0], 0
00030715  4c8d7518               lea r14, [rbp + 0x18]
00030719  4983ff0f               cmp r15, 0xf
0003071D  4c8b7d18               mov r15, qword ptr [rbp + 0x18]
00030721  4d0f47f7               cmova r14, r15
00030725  48bbffffffffffffff7f   movabs rbx, 0x7fffffffffffffff
0003072F  4c3beb                 cmp r13, rbx
00030732  0f874d0b0000           ja 0x31285
00030738  49c1e814               shr r8, 0x14
0003073C  f7d1                   not ecx
0003073E  4433c1                 xor r8d, ecx
00030741  4433c7                 xor r8d, edi
00030744  4433c6                 xor r8d, esi
00030747  443305c2360300         xor r8d, dword ptr [rip + 0x336c2]   ; -> 0x63e10
0003074E  4c8985f8070000         mov qword ptr [rbp + 0x7f8], r8
00030755  4983fd0f               cmp r13, 0xf
00030759  7722                   ja 0x3077d
0003075B  4c89ad98000000         mov qword ptr [rbp + 0x98], r13
00030762  48c785a00000000f000000 mov qword ptr [rbp + 0xa0], 0xf
0003076D  410f1006               movups xmm0, xmmword ptr [r14]
00030771  0f118588000000         movups xmmword ptr [rbp + 0x88], xmm0
00030778  e996000000             jmp 0x30813
0003077D  498bc5                 mov rax, r13
00030780  4883c80f               or rax, 0xf
00030784  483bc3                 cmp rax, rbx
00030787  762c                   jbe 0x307b5
00030789  48b82700000000000080   movabs rax, 0x8000000000000027
00030793  488bc8                 mov rcx, rax
00030796  e8c1810000             call 0x3895c
0003079B  488bc8                 mov rcx, rax
0003079E  4885c0                 test rax, rax
000307A1  0f846f030000           je 0x30b16
000307A7  4883c027               add rax, 0x27
000307AB  4883e0e0               and rax, 0xffffffffffffffe0
000307AF  488948f8               mov qword ptr [rax - 8], rcx
000307B3  eb39                   jmp 0x307ee
000307B5  488bd8                 mov rbx, rax
000307B8  b916000000             mov ecx, 0x16
000307BD  483bc1                 cmp rax, rcx
000307C0  480f42d9               cmovb rbx, rcx
000307C4  488d4b01               lea rcx, [rbx + 1]
000307C8  4885c9                 test rcx, rcx
000307CB  7504                   jne 0x307d1
000307CD  33c0                   xor eax, eax
000307CF  eb1d                   jmp 0x307ee
000307D1  4881f900100000         cmp rcx, 0x1000
000307D8  720f                   jb 0x307e9
000307DA  488d4127               lea rax, [rcx + 0x27]
000307DE  483bc1                 cmp rax, rcx
000307E1  0f86a40a0000           jbe 0x3128b
000307E7  ebaa                   jmp 0x30793
000307E9  e86e810000             call 0x3895c
000307EE  48898588000000         mov qword ptr [rbp + 0x88], rax
000307F5  4c89ad98000000         mov qword ptr [rbp + 0x98], r13
000307FC  48899da0000000         mov qword ptr [rbp + 0xa0], rbx
00030803  4d8d4501               lea r8, [r13 + 1]
00030807  498bd6                 mov rdx, r14
0003080A  488bc8                 mov rcx, rax
0003080D  e8ce730200             call 0x57be0
00030812  90                     nop 
00030813  0fb65d00               movzx ebx, byte ptr [rbp]
00030817  48c1e308               shl rbx, 8
0003081B  0fb64570               movzx eax, byte ptr [rbp + 0x70]
0003081F  4833d8                 xor rbx, rax
00030822  48c1e308               shl rbx, 8
00030826  0fb64571               movzx eax, byte ptr [rbp + 0x71]
0003082A  4833d8                 xor rbx, rax
0003082D  48c1e308               shl rbx, 8
00030831  0fb64572               movzx eax, byte ptr [rbp + 0x72]
00030835  4833d8                 xor rbx, rax
00030838  48c1e318               shl rbx, 0x18
0003083C  0fb64573               movzx eax, byte ptr [rbp + 0x73]
00030840  4833d8                 xor rbx, rax
00030843  48c1e308               shl rbx, 8
00030847  0fb64574               movzx eax, byte ptr [rbp + 0x74]
0003084B  4833d8                 xor rbx, rax
0003084E  48339db0000000         xor rbx, qword ptr [rbp + 0xb0]
00030855  48339da8000000         xor rbx, qword ptr [rbp + 0xa8]
0003085C  48339d80000000         xor rbx, qword ptr [rbp + 0x80]
00030863  488d7d18               lea rdi, [rbp + 0x18]
00030867  48837d300f             cmp qword ptr [rbp + 0x30], 0xf
0003086C  490f47ff               cmova rdi, r15
00030870  33c0                   xor eax, eax
00030872  498bcd                 mov rcx, r13
00030875  f3aa                   rep stosb byte ptr [rdi], al
00030877  48894528               mov qword ptr [rbp + 0x28], rax
0003087B  488d4518               lea rax, [rbp + 0x18]
0003087F  48837d300f             cmp qword ptr [rbp + 0x30], 0xf
00030884  480f474518             cmova rax, qword ptr [rbp + 0x18]
00030889  c60000                 mov byte ptr [rax], 0
0003088C  0f31                   rdtsc 
0003088E  48c1e220               shl rdx, 0x20
00030892  480bc2                 or rax, rdx
00030895  0fb6c8                 movzx ecx, al
00030898  83c110                 add ecx, 0x10
0003089B  898df0070000           mov dword ptr [rbp + 0x7f0], ecx
000308A1  486385f0070000         movsxd rax, dword ptr [rbp + 0x7f0]
000308A8  488bc8                 mov rcx, rax
000308AB  4883c00f               add rax, 0xf
000308AF  483bc1                 cmp rax, rcx
000308B2  770a                   ja 0x308be
000308B4  48b8f0ffffffffffff0f   movabs rax, 0xffffffffffffff0
000308BE  4883e0f0               and rax, 0xfffffffffffffff0
000308C2  e8c9870000             call 0x39090
000308C7  482be0                 sub rsp, rax
000308CA  4c8d442440             lea r8, [rsp + 0x40]
000308CF  0f31                   rdtsc 
000308D1  48c1e220               shl rdx, 0x20
000308D5  480bc2                 or rax, rdx
000308D8  488bf8                 mov rdi, rax
000308DB  33d2                   xor edx, edx
000308DD  8b8df0070000           mov ecx, dword ptr [rbp + 0x7f0]
000308E3  85c9                   test ecx, ecx
000308E5  7e31                   jle 0x30918
000308E7  660f1f840000000000     nop word ptr [rax + rax]
000308F0  69c76d4ec641           imul eax, edi, 0x41c64e6d
000308F6  8db839300000           lea edi, [rax + 0x3039]
000308FC  8d8839300000           lea ecx, [rax + 0x3039]
00030902  c1e910                 shr ecx, 0x10
00030905  4863c2                 movsxd rax, edx
00030908  42880c00               mov byte ptr [rax + r8], cl
0003090C  ffc2                   inc edx
0003090E  8b85f0070000           mov eax, dword ptr [rbp + 0x7f0]
00030914  3bd0                   cmp edx, eax
00030916  7cd8                   jl 0x308f0
00030918  33c9                   xor ecx, ecx
0003091A  ff15e8660300           call qword ptr [rip + 0x366e8]   ; -> 0x67008
00030920  488bc8                 mov rcx, rax
00030923  e882580000             call 0x361aa
00030928  8b4578                 mov eax, dword ptr [rbp + 0x78]
0003092B  880577340300           mov byte ptr [rip + 0x33477], al   ; -> 0x63da8
00030931  488b95f8070000         mov rdx, qword ptr [rbp + 0x7f8]
00030938  8bd2                   mov edx, edx
0003093A  89442420               mov dword ptr [rsp + 0x20], eax
0003093E  4d8bcc                 mov r9, r12
00030941  4c8bc3                 mov r8, rbx
00030944  488d8d88000000         lea rcx, [rbp + 0x88]
0003094B  e8b0d60200             call 0x5e000
00030950  e83b3cffff             call 0x24590
00030955  33c9                   xor ecx, ecx
00030957  ffd0                   call rax
00030959  4863503c               movsxd rdx, dword ptr [rax + 0x3c]
0003095D  0fb74c0214             movzx ecx, word ptr [rdx + rax + 0x14]
00030962  4c8d4018               lea r8, [rax + 0x18]
00030966  4c03c2                 add r8, rdx
00030969  4c03c1                 add r8, rcx
0003096C  33db                   xor ebx, ebx
0003096E  0fb77c0206             movzx edi, word ptr [rdx + rax + 6]
00030973  85ff                   test edi, edi
00030975  7479                   je 0x309f0
00030977  660f1f840000000000     nop word ptr [rax + rax]
00030980  488d149b               lea rdx, [rbx + rbx*4]
00030984  498d0cd0               lea rcx, [r8 + rdx*8]
00030988  80392e                 cmp byte ptr [rcx], 0x2e
0003098B  7512                   jne 0x3099f
0003098D  80790173               cmp byte ptr [rcx + 1], 0x73
00030991  750c                   jne 0x3099f
00030993  8079026d               cmp byte ptr [rcx + 2], 0x6d
00030997  7506                   jne 0x3099f
00030999  80790363               cmp byte ptr [rcx + 3], 0x63
0003099D  7408                   je 0x309a7
0003099F  ffc3                   inc ebx
000309A1  3bdf                   cmp ebx, edi
000309A3  7cdb                   jl 0x30980
000309A5  eb49                   jmp 0x309f0
000309A7  8b590c                 mov ebx, dword ptr [rcx + 0xc]
000309AA  4803d8                 add rbx, rax
000309AD  8b7108                 mov esi, dword ptr [rcx + 8]
000309B0  e8eb330000             call 0x33da0
000309B5  4c8d8df0070000         lea r9, [rbp + 0x7f0]
000309BC  41b840000000           mov r8d, 0x40
000309C2  8bd6                   mov edx, esi
000309C4  488bcb                 mov rcx, rbx
000309C7  ffd0                   call rax
000309C9  85c0                   test eax, eax
000309CB  7423                   je 0x309f0
000309CD  488bfb                 mov rdi, rbx
000309D0  33c0                   xor eax, eax
000309D2  8bce                   mov ecx, esi
000309D4  f3aa                   rep stosb byte ptr [rdi], al
000309D6  e8c5330000             call 0x33da0
000309DB  4c8d8df0070000         lea r9, [rbp + 0x7f0]
000309E2  448b85f0070000         mov r8d, dword ptr [rbp + 0x7f0]
000309E9  8bd6                   mov edx, esi
000309EB  488bcb                 mov rcx, rbx
000309EE  ffd0                   call rax
000309F0  488d5540               lea rdx, [rbp + 0x40]
000309F4  e847370000             call 0x34140
000309F9  90                     nop 
000309FA  4c8b4010               mov r8, qword ptr [rax + 0x10]
000309FE  488378180f             cmp qword ptr [rax + 0x18], 0xf
00030A03  7603                   jbe 0x30a08
00030A05  488b00                 mov rax, qword ptr [rax]
00030A08  488bd0                 mov rdx, rax
00030A0B  e800420000             call 0x34c10
00030A10  90                     nop 
00030A11  488b5558               mov rdx, qword ptr [rbp + 0x58]
00030A15  4883fa0f               cmp rdx, 0xf
00030A19  7631                   jbe 0x30a4c
00030A1B  48ffc2                 inc rdx
00030A1E  488b4d40               mov rcx, qword ptr [rbp + 0x40]
00030A22  4881fa00100000         cmp rdx, 0x1000
00030A29  721c                   jb 0x30a47
00030A2B  488b41f8               mov rax, qword ptr [rcx - 8]
00030A2F  482bc8                 sub rcx, rax
00030A32  4883e908               sub rcx, 8
00030A36  4883f91f               cmp rcx, 0x1f
00030A3A  0f87cf000000           ja 0x30b0f
00030A40  4883c227               add rdx, 0x27
00030A44  488bc8                 mov rcx, rax
00030A47  e8207e0000             call 0x3886c
00030A4C  e8efd40000             call 0x3df40
00030A51  90                     nop 
00030A52  488b95a0000000         mov rdx, qword ptr [rbp + 0xa0]
00030A59  4883fa0f               cmp rdx, 0xf
00030A5D  7635                   jbe 0x30a94
00030A5F  48ffc2                 inc rdx
00030A62  488b8d88000000         mov rcx, qword ptr [rbp + 0x88]
00030A69  4881fa00100000         cmp rdx, 0x1000
00030A70  721c                   jb 0x30a8e
00030A72  488b41f8               mov rax, qword ptr [rcx - 8]
00030A76  482bc8                 sub rcx, rax
00030A79  4883e908               sub rcx, 8
00030A7D  4883f91f               cmp rcx, 0x1f
00030A81  0f878f000000           ja 0x30b16
00030A87  4883c227               add rdx, 0x27
00030A8B  488bc8                 mov rcx, rax
00030A8E  e8d97d0000             call 0x3886c
00030A93  90                     nop 
00030A94  488b5530               mov rdx, qword ptr [rbp + 0x30]
00030A98  4883fa0f               cmp rdx, 0xf
00030A9C  762e                   jbe 0x30acc
00030A9E  48ffc2                 inc rdx
00030AA1  488b4d18               mov rcx, qword ptr [rbp + 0x18]
00030AA5  4881fa00100000         cmp rdx, 0x1000
00030AAC  7218                   jb 0x30ac6
00030AAE  488b41f8               mov rax, qword ptr [rcx - 8]
00030AB2  482bc8                 sub rcx, rax
00030AB5  4883e908               sub rcx, 8
00030AB9  4883f91f               cmp rcx, 0x1f
00030ABD  775e                   ja 0x30b1d
00030ABF  4883c227               add rdx, 0x27
00030AC3  488bc8                 mov rcx, rax
00030AC6  e8a17d0000             call 0x3886c
00030ACB  90                     nop 
00030ACC  488b8dd0000000         mov rcx, qword ptr [rbp + 0xd0]
00030AD3  4885c9                 test rcx, rcx
00030AD6  7430                   je 0x30b08
00030AD8  488b95e0000000         mov rdx, qword ptr [rbp + 0xe0]
00030ADF  482bd1                 sub rdx, rcx
00030AE2  4881fa00100000         cmp rdx, 0x1000
00030AE9  7218                   jb 0x30b03
00030AEB  488b41f8               mov rax, qword ptr [rcx - 8]
00030AEF  482bc8                 sub rcx, rax
00030AF2  4883e908               sub rcx, 8
00030AF6  4883f91f               cmp rcx, 0x1f
00030AFA  7728                   ja 0x30b24
00030AFC  4883c227               add rdx, 0x27
00030B00  488bc8                 mov rcx, rax
00030B03  e8647d0000             call 0x3886c
00030B08  33c0                   xor eax, eax
00030B0A  e962070000             jmp 0x31271
00030B0F  b905000000             mov ecx, 5
00030B14  cd29                   int 0x29
00030B16  b905000000             mov ecx, 5
00030B1B  cd29                   int 0x29
00030B1D  b905000000             mov ecx, 5
00030B22  cd29                   int 0x29
00030B24  b905000000             mov ecx, 5
00030B29  cd29                   int 0x29
00030B2B  e83085feff             call 0x19060
00030B30  48833de032030000       cmp qword ptr [rip + 0x332e0], 0   ; -> 0x63e18
00030B38  0f85d5010000           jne 0x30d13
00030B3E  c685f807000000         mov byte ptr [rbp + 0x7f8], 0
00030B45  488d8df8070000         lea rcx, [rbp + 0x7f8]
00030B4C  e80f67feff             call 0x17260
00030B51  ba04010000             mov edx, 0x104
00030B56  488d8dc0010000         lea rcx, [rbp + 0x1c0]
00030B5D  ffd0                   call rax
00030B5F  85c0                   test eax, eax
00030B61  0f84ac010000           je 0x30d13
00030B67  418bcf                 mov ecx, r15d
00030B6A  80bdc001000000         cmp byte ptr [rbp + 0x1c0], 0
00030B71  741c                   je 0x30b8f
00030B73  0f1f4000               nop dword ptr [rax]
00030B77  660f1f840000000000     nop word ptr [rax + rax]
00030B80  ffc1                   inc ecx
00030B82  4863c1                 movsxd rax, ecx
00030B85  80bc05c001000000       cmp byte ptr [rbp + rax + 0x1c0], 0
00030B8D  75f1                   jne 0x30b80
00030B8F  4863d1                 movsxd rdx, ecx
00030B92  488d420b               lea rax, [rdx + 0xb]
00030B96  483d04010000           cmp rax, 0x104
00030B9C  0f8371010000           jae 0x30d13
00030BA2  c68415c00100005c       mov byte ptr [rbp + rdx + 0x1c0], 0x5c
00030BAA  4863c1                 movsxd rax, ecx
00030BAD  c68405c10100006e       mov byte ptr [rbp + rax + 0x1c1], 0x6e
00030BB5  4863c1                 movsxd rax, ecx
00030BB8  c68405c201000074       mov byte ptr [rbp + rax + 0x1c2], 0x74
00030BC0  4863c1                 movsxd rax, ecx
00030BC3  c68405c301000064       mov byte ptr [rbp + rax + 0x1c3], 0x64
00030BCB  4863c1                 movsxd rax, ecx
00030BCE  c68405c40100006c       mov byte ptr [rbp + rax + 0x1c4], 0x6c
00030BD6  4863c1                 movsxd rax, ecx
00030BD9  c68405c50100006c       mov byte ptr [rbp + rax + 0x1c5], 0x6c
00030BE1  4863c1                 movsxd rax, ecx
00030BE4  c68405c60100002e       mov byte ptr [rbp + rax + 0x1c6], 0x2e
00030BEC  4863c1                 movsxd rax, ecx
00030BEF  c68405c701000064       mov byte ptr [rbp + rax + 0x1c7], 0x64
00030BF7  4863c1                 movsxd rax, ecx
00030BFA  c68405c80100006c       mov byte ptr [rbp + rax + 0x1c8], 0x6c
00030C02  4863c1                 movsxd rax, ecx
00030C05  c68405c90100006c       mov byte ptr [rbp + rax + 0x1c9], 0x6c
00030C0D  4863c1                 movsxd rax, ecx
00030C10  c68405ca01000000       mov byte ptr [rbp + rax + 0x1ca], 0
00030C18  c6850008000000         mov byte ptr [rbp + 0x800], 0
00030C1F  488d8d00080000         lea rcx, [rbp + 0x800]
00030C26  e8d569feff             call 0x17600
00030C2B  4c897c2430             mov qword ptr [rsp + 0x30], r15
00030C30  44897c2428             mov dword ptr [rsp + 0x28], r15d
00030C35  c744242003000000       mov dword ptr [rsp + 0x20], 3
00030C3D  4533c9                 xor r9d, r9d
00030C40  ba00000080             mov edx, 0x80000000
00030C45  41b801000000           mov r8d, 1
00030C4B  488d8dc0010000         lea rcx, [rbp + 0x1c0]
00030C52  ffd0                   call rax
00030C54  488bd8                 mov rbx, rax
00030C57  4883f8ff               cmp rax, -1
00030C5B  0f84b2000000           je 0x30d13
00030C61  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
00030C68  488d8df0070000         lea rcx, [rbp + 0x7f0]
00030C6F  e82c6dfeff             call 0x179a0
00030C74  33d2                   xor edx, edx
00030C76  488bcb                 mov rcx, rbx
00030C79  ffd0                   call rax
00030C7B  8bf8                   mov edi, eax
00030C7D  b8ffffffff             mov eax, 0xffffffff
00030C82  3bf8                   cmp edi, eax
00030C84  7515                   jne 0x30c9b
00030C86  c6850808000000         mov byte ptr [rbp + 0x808], 0
00030C8D  488d8d08080000         lea rcx, [rbp + 0x808]
00030C94  e8a770feff             call 0x17d40
00030C99  eb73                   jmp 0x30d0e
00030C9B  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
00030CA2  488d8df0070000         lea rcx, [rbp + 0x7f0]
00030CA9  e83274feff             call 0x180e0
00030CAE  488bd7                 mov rdx, rdi
00030CB1  33c9                   xor ecx, ecx
00030CB3  41b904000000           mov r9d, 4
00030CB9  41b800300000           mov r8d, 0x3000
00030CBF  ffd0                   call rax
00030CC1  48890550310300         mov qword ptr [rip + 0x33150], rax   ; -> 0x63e18
00030CC8  4885c0                 test rax, rax
00030CCB  742e                   je 0x30cfb
00030CCD  c685f007000000         mov byte ptr [rbp + 0x7f0], 0
00030CD4  488d8df0070000         lea rcx, [rbp + 0x7f0]
00030CDB  e8a077feff             call 0x18480
00030CE0  4c897c2420             mov qword ptr [rsp + 0x20], r15
00030CE5  4c8d8d08080000         lea r9, [rbp + 0x808]
00030CEC  448bc7                 mov r8d, edi
00030CEF  488b1522310300         mov rdx, qword ptr [rip + 0x33122]   ; -> 0x63e18
00030CF6  488bcb                 mov rcx, rbx
00030CF9  ffd0                   call rax
00030CFB  c6850808000000         mov byte ptr [rbp + 0x808], 0
00030D02  488d8d08080000         lea rcx, [rbp + 0x808]
00030D09  e83270feff             call 0x17d40
00030D0E  488bcb                 mov rcx, rbx
00030D11  ffd0                   call rax
00030D13  65488b042560000000     mov rax, qword ptr gs:[0x60]
00030D1C  4c8b4818               mov r9, qword ptr [rax + 0x18]
00030D20  4983c120               add r9, 0x20
00030D24  4d8b19                 mov r11, qword ptr [r9]
00030D27  4d3bd9                 cmp r11, r9
00030D2A  0f843c050000           je 0x3126c
00030D30  440fb71580c8fdff       movzx r10d, word ptr [rip - 0x23780]   ; -> 0xd5b8
00030D38  0f1f840000000000       nop dword ptr [rax + rax]
00030D40  498b5b50               mov rbx, qword ptr [r11 + 0x50]
00030D44  4885db                 test rbx, rbx
00030D47  0f847e000000           je 0x30dcb
00030D4D  41b8c59d1c81           mov r8d, 0x811c9dc5
00030D53  0fb703                 movzx eax, word ptr [rbx]
00030D56  6685c0                 test ax, ax
00030D59  742d                   je 0x30d88
00030D5B  0f1f440000             nop dword ptr [rax + rax]
00030D60  488d5b02               lea rbx, [rbx + 2]
00030D64  8d509f                 lea edx, [rax - 0x61]
00030D67  0fb6c8                 movzx ecx, al
00030D6A  2c20                   sub al, 0x20
00030D6C  6683fa19               cmp dx, 0x19
00030D70  0f47c1                 cmova eax, ecx
00030D73  0fbec0                 movsx eax, al
00030D76  4133c0                 xor eax, r8d
00030D79  4469c093010001         imul r8d, eax, 0x1000193
00030D80  0fb703                 movzx eax, word ptr [rbx]
00030D83  6685c0                 test ax, ax
00030D86  75d8                   jne 0x30d60
00030D88  488d1d29c8fdff         lea rbx, [rip - 0x237d7]   ; -> 0xd5b8
00030D8F  bfc59d1c81             mov edi, 0x811c9dc5
00030D94  410fb7c2               movzx eax, r10w
00030D98  0f1f840000000000       nop dword ptr [rax + rax]
00030DA0  488d5b02               lea rbx, [rbx + 2]
00030DA4  8d509f                 lea edx, [rax - 0x61]
00030DA7  0fb6c8                 movzx ecx, al
00030DAA  2c20                   sub al, 0x20
00030DAC  6683fa19               cmp dx, 0x19
00030DB0  0f47c1                 cmova eax, ecx
00030DB3  0fbec0                 movsx eax, al
00030DB6  33c7                   xor eax, edi
00030DB8  69f893010001           imul edi, eax, 0x1000193
00030DBE  0fb703                 movzx eax, word ptr [rbx]
00030DC1  6685c0                 test ax, ax
00030DC4  75da                   jne 0x30da0
00030DC6  443bc7                 cmp r8d, edi
00030DC9  7411                   je 0x30ddc
00030DCB  4d8b1b                 mov r11, qword ptr [r11]
00030DCE  4d3bd9                 cmp r11, r9
00030DD1  0f8569ffffff           jne 0x30d40
00030DD7  e990040000             jmp 0x3126c
00030DDC  4d8b5b20               mov r11, qword ptr [r11 + 0x20]
00030DE0  4d85db                 test r11, r11
00030DE3  0f8483040000           je 0x3126c
00030DE9  4c8b15b02f0300         mov r10, qword ptr [rip + 0x32fb0]   ; -> 0x63da0
00030DF0  4d85d2                 test r10, r10
00030DF3  0f858f000000           jne 0x30e88
00030DF9  49634b3c               movsxd rcx, dword ptr [r11 + 0x3c]
00030DFD  4903cb                 add rcx, r11
00030E00  440fb74914             movzx r9d, word ptr [rcx + 0x14]
00030E05  4c03c9                 add r9, rcx
00030E08  458bc7                 mov r8d, r15d
00030E0B  0fb77106               movzx esi, word ptr [rcx + 6]
00030E0F  85f6                   test esi, esi
00030E11  0f8455040000           je 0x3126c
00030E17  660f1f840000000000     nop word ptr [rax + rax]
00030E20  418bc0                 mov eax, r8d
00030E23  488d0c80               lea rcx, [rax + rax*4]
00030E27  418b44c93c             mov eax, dword ptr [r9 + rcx*8 + 0x3c]
00030E2C  2520000020             and eax, 0x20000020
00030E31  3d20000020             cmp eax, 0x20000020
00030E36  753c                   jne 0x30e74
00030E38  418b5cc924             mov ebx, dword ptr [r9 + rcx*8 + 0x24]
00030E3D  4903db                 add rbx, r11
00030E40  418bd7                 mov edx, r15d
00030E43  418b7cc920             mov edi, dword ptr [r9 + rcx*8 + 0x20]
00030E48  83ef02                 sub edi, 2
00030E4B  7427                   je 0x30e74
00030E4D  0f1f00                 nop dword ptr [rax]
00030E50  448bd2                 mov r10d, edx
00030E53  4c03d3                 add r10, rbx
00030E56  41803a0f               cmp byte ptr [r10], 0xf
00030E5A  7512                   jne 0x30e6e
00030E5C  8d4201                 lea eax, [rdx + 1]
00030E5F  803c1805               cmp byte ptr [rax + rbx], 5
00030E63  7509                   jne 0x30e6e
00030E65  8d4202                 lea eax, [rdx + 2]
00030E68  803c18c3               cmp byte ptr [rax + rbx], 0xc3
00030E6C  7413                   je 0x30e81
00030E6E  ffc2                   inc edx
00030E70  3bd7                   cmp edx, edi
00030E72  72dc                   jb 0x30e50
00030E74  41ffc0                 inc r8d
00030E77  443bc6                 cmp r8d, esi
00030E7A  7ca4                   jl 0x30e20
00030E7C  e9eb030000             jmp 0x3126c
00030E81  4c8915182f0300         mov qword ptr [rip + 0x32f18], r10   ; -> 0x63da0
00030E88  488b05892f0300         mov rax, qword ptr [rip + 0x32f89]   ; -> 0x63e18
00030E8F  4885c0                 test rax, rax
00030E92  0f95c2                 setne dl
00030E95  8895f0070000           mov byte ptr [rbp + 0x7f0], dl
00030E9B  4885c0                 test rax, rax
00030E9E  4c0f45d8               cmovne r11, rax
00030EA2  4d63733c               movsxd r14, dword ptr [r11 + 0x3c]
00030EA6  4d03f3                 add r14, r11
00030EA9  4183be8c00000000       cmp dword ptr [r14 + 0x8c], 0
00030EB1  0f84b5030000           je 0x3126c
00030EB7  458b8e88000000         mov r9d, dword ptr [r14 + 0x88]
00030EBE  498d4614               lea rax, [r14 + 0x14]
00030EC2  48898580000000         mov qword ptr [rbp + 0x80], rax
00030EC9  498d4e06               lea rcx, [r14 + 6]
00030ECD  48898d88000000         mov qword ptr [rbp + 0x88], rcx
00030ED4  84d2                   test dl, dl
00030ED6  7524                   jne 0x30efc
00030ED8  4b8d340b               lea rsi, [r11 + r9]
00030EDC  8b461c                 mov eax, dword ptr [rsi + 0x1c]
00030EDF  894510                 mov dword ptr [rbp + 0x10], eax
00030EE2  448b6e24               mov r13d, dword ptr [rsi + 0x24]
00030EE6  4d03eb                 add r13, r11
00030EE9  448b6620               mov r12d, dword ptr [rsi + 0x20]
00030EED  4d03e3                 add r12, r11
00030EF0  488bc1                 mov rax, rcx
00030EF3  48894d08               mov qword ptr [rbp + 8], rcx
00030EF7  e970010000             jmp 0x3106c
00030EFC  4c8be8                 mov r13, rax
00030EFF  440fb700               movzx r8d, word ptr [rax]
00030F03  4d03c6                 add r8, r14
00030F06  418bd7                 mov edx, r15d
00030F09  4c8bf9                 mov r15, rcx
00030F0C  0fb731                 movzx esi, word ptr [rcx]
00030F0F  85f6                   test esi, esi
00030F11  743b                   je 0x30f4e
00030F13  0f1f4000               nop dword ptr [rax]
00030F17  660f1f840000000000     nop word ptr [rax + rax]
00030F20  8bc2                   mov eax, edx
00030F22  488d0c80               lea rcx, [rax + rax*4]
00030F26  488d1ccd00000000       lea rbx, [rcx*8]
00030F2E  428b7c0324             mov edi, dword ptr [rbx + r8 + 0x24]
00030F33  443bcf                 cmp r9d, edi
00030F36  7210                   jb 0x30f48
00030F38  428b4c0320             mov ecx, dword ptr [rbx + r8 + 0x20]
00030F3D  03cf                   add ecx, edi
00030F3F  443bc9                 cmp r9d, ecx
00030F42  0f828d010000           jb 0x310d5
00030F48  ffc2                   inc edx
00030F4A  3bd6                   cmp edx, esi
00030F4C  7cd2                   jl 0x30f20
00030F4E  4b8d340b               lea rsi, [r11 + r9]
00030F52  4c89bd88000000         mov qword ptr [rbp + 0x88], r15
00030F59  4c89ad80000000         mov qword ptr [rbp + 0x80], r13
00030F60  4c897d08               mov qword ptr [rbp + 8], r15
00030F64  4c89adb0000000         mov qword ptr [rbp + 0xb0], r13
00030F6B  488bc6                 mov rax, rsi
00030F6E  448b4e20               mov r9d, dword ptr [rsi + 0x20]
00030F72  410fb77d00             movzx edi, word ptr [r13]
00030F77  4903fe                 add rdi, r14
00030F7A  33db                   xor ebx, ebx
00030F7C  450fb727               movzx r12d, word ptr [r15]
00030F80  4585e4                 test r12d, r12d
00030F83  743b                   je 0x30fc0
00030F85  6666660f1f840000000000 nop word ptr [rax + rax]
00030F90  488d0c9b               lea rcx, [rbx + rbx*4]
00030F94  488d14cd00000000       lea rdx, [rcx*8]
00030F9C  448b443a24             mov r8d, dword ptr [rdx + rdi + 0x24]
00030FA1  453bc8                 cmp r9d, r8d
00030FA4  7210                   jb 0x30fb6
00030FA6  8b4c3a20               mov ecx, dword ptr [rdx + rdi + 0x20]
00030FAA  4103c8                 add ecx, r8d
00030FAD  443bc9                 cmp r9d, ecx
00030FB0  0f825c010000           jb 0x31112
00030FB6  ffc3                   inc ebx
00030FB8  413bdc                 cmp ebx, r12d
00030FBB  7cd3                   jl 0x30f90
00030FBD  488bc6                 mov rax, rsi
00030FC0  458be1                 mov r12d, r9d
00030FC3  448b4024               mov r8d, dword ptr [rax + 0x24]
00030FC7  4d03e3                 add r12, r11
00030FCA  450fb74d00             movzx r9d, word ptr [r13]
00030FCF  4d03ce                 add r9, r14
00030FD2  33d2                   xor edx, edx
00030FD4  450fb73f               movzx r15d, word ptr [r15]
00030FD8  4585ff                 test r15d, r15d
00030FDB  7430                   je 0x3100d
00030FDD  0f1f00                 nop dword ptr [rax]
00030FE0  488d0c92               lea rcx, [rdx + rdx*4]
00030FE4  488d1ccd00000000       lea rbx, [rcx*8]
00030FEC  428b7c0b24             mov edi, dword ptr [rbx + r9 + 0x24]
00030FF1  443bc7                 cmp r8d, edi
00030FF4  7210                   jb 0x31006
00030FF6  428b4c0b20             mov ecx, dword ptr [rbx + r9 + 0x20]
00030FFB  03cf                   add ecx, edi
00030FFD  443bc1                 cmp r8d, ecx
00031000  0f8220010000           jb 0x31126
00031006  ffc2                   inc edx
00031008  413bd7                 cmp edx, r15d
0003100B  7cd3                   jl 0x30fe0
0003100D  458be8                 mov r13d, r8d
00031010  448b4e1c               mov r9d, dword ptr [rsi + 0x1c]
00031014  4d03eb                 add r13, r11
00031017  488b85b0000000         mov rax, qword ptr [rbp + 0xb0]
0003101E  440fb700               movzx r8d, word ptr [rax]
00031022  4d03c6                 add r8, r14
00031025  33d2                   xor edx, edx
00031027  488b4508               mov rax, qword ptr [rbp + 8]
0003102B  440fb738               movzx r15d, word ptr [rax]
0003102F  4585ff                 test r15d, r15d
00031032  742d                   je 0x31061
00031034  488d0c92               lea rcx, [rdx + rdx*4]
00031038  488d1ccd00000000       lea rbx, [rcx*8]
00031040  428b7c0324             mov edi, dword ptr [rbx + r8 + 0x24]
00031045  443bcf                 cmp r9d, edi
00031048  7210                   jb 0x3105a
0003104A  428b4c0320             mov ecx, dword ptr [rbx + r8 + 0x20]
0003104F  03cf                   add ecx, edi
00031051  443bc9                 cmp r9d, ecx
00031054  0f82dc000000           jb 0x31136
0003105A  ffc2                   inc edx
0003105C  413bd7                 cmp edx, r15d
0003105F  7cd3                   jl 0x31034
00031061  44894d10               mov dword ptr [rbp + 0x10], r9d
00031065  0fb695f0070000         movzx edx, byte ptr [rbp + 0x7f0]
0003106C  8b7618                 mov esi, dword ptr [rsi + 0x18]
0003106F  897578                 mov dword ptr [rbp + 0x78], esi
00031072  85f6                   test esi, esi
00031074  0f84f2010000           je 0x3126c
0003107A  4533ff                 xor r15d, r15d
0003107D  0f1f00                 nop dword ptr [rax]
00031080  458bcf                 mov r9d, r15d
00031083  438b1cbc               mov ebx, dword ptr [r12 + r15*4]
00031087  84d2                   test dl, dl
00031089  0f84cd000000           je 0x3115c
0003108F  450fb74e14             movzx r9d, word ptr [r14 + 0x14]
00031094  4d03ce                 add r9, r14
00031097  33d2                   xor edx, edx
00031099  0fb730                 movzx esi, word ptr [rax]
0003109C  85f6                   test esi, esi
0003109E  0f84b2000000           je 0x31156
000310A4  488d0c92               lea rcx, [rdx + rdx*4]
000310A8  488d3ccd00000000       lea rdi, [rcx*8]
000310B0  468b440f24             mov r8d, dword ptr [rdi + r9 + 0x24]
000310B5  413bd8                 cmp ebx, r8d
000310B8  7210                   jb 0x310ca
000310BA  428b4c0f20             mov ecx, dword ptr [rdi + r9 + 0x20]
000310BF  4103c8                 add ecx, r8d
000310C2  3bd9                   cmp ebx, ecx
000310C4  0f8282000000           jb 0x3114c
000310CA  ffc2                   inc edx
000310CC  3bd6                   cmp edx, esi
000310CE  7cd4                   jl 0x310a4
000310D0  e981000000             jmp 0x31156
000310D5  428b74032c             mov esi, dword ptr [rbx + r8 + 0x2c]
000310DA  2bf7                   sub esi, edi
000310DC  4103f1                 add esi, r9d
000310DF  4903f3                 add rsi, r11
000310E2  4c89bd88000000         mov qword ptr [rbp + 0x88], r15
000310E9  4c89ad80000000         mov qword ptr [rbp + 0x80], r13
000310F0  4c897d08               mov qword ptr [rbp + 8], r15
000310F4  4c89adb0000000         mov qword ptr [rbp + 0xb0], r13
000310FB  448b4e20               mov r9d, dword ptr [rsi + 0x20]
000310FF  410fb77d00             movzx edi, word ptr [r13]
00031104  4903fe                 add rdi, r14
00031107  33db                   xor ebx, ebx
00031109  450fb727               movzx r12d, word ptr [r15]
0003110D  e97efeffff             jmp 0x30f90
00031112  448b643a2c             mov r12d, dword ptr [rdx + rdi + 0x2c]
00031117  452be0                 sub r12d, r8d
0003111A  4503e1                 add r12d, r9d
0003111D  448b4624               mov r8d, dword ptr [rsi + 0x24]
00031121  e9a1feffff             jmp 0x30fc7
00031126  468b6c0b2c             mov r13d, dword ptr [rbx + r9 + 0x2c]
0003112B  442bef                 sub r13d, edi
0003112E  4503e8                 add r13d, r8d
00031131  e9dafeffff             jmp 0x31010
00031136  428b44032c             mov eax, dword ptr [rbx + r8 + 0x2c]
0003113B  2bc7                   sub eax, edi
0003113D  4103c1                 add eax, r9d
00031140  894510                 mov dword ptr [rbp + 0x10], eax
00031143  488b4508               mov rax, qword ptr [rbp + 8]
00031147  e919ffffff             jmp 0x31065
0003114C  428b440f2c             mov eax, dword ptr [rdi + r9 + 0x2c]
00031151  412bc0                 sub eax, r8d
00031154  03d8                   add ebx, eax
00031156  8b7578                 mov esi, dword ptr [rbp + 0x78]
00031159  458bcf                 mov r9d, r15d
0003115C  8bd3                   mov edx, ebx
0003115E  4903d3                 add rdx, r11
00031161  bbc59d1c81             mov ebx, 0x811c9dc5
00031166  0fb60a                 movzx ecx, byte ptr [rdx]
00031169  84c9                   test cl, cl
0003116B  742b                   je 0x31198
0003116D  0f1f00                 nop dword ptr [rax]
00031170  488d5201               lea rdx, [rdx + 1]
00031174  8d419f                 lea eax, [rcx - 0x61]
00031177  3c19                   cmp al, 0x19
00031179  7703                   ja 0x3117e
0003117B  80e920                 sub cl, 0x20
0003117E  0fbec1                 movsx eax, cl
00031181  33c3                   xor eax, ebx
00031183  69d893010001           imul ebx, eax, 0x1000193
00031189  0fb60a                 movzx ecx, byte ptr [rdx]
0003118C  84c9                   test cl, cl
0003118E  75e0                   jne 0x31170
00031190  81fbe7f231b9           cmp ebx, 0xb931f2e7
00031196  741c                   je 0x311b4
00031198  41ffc7                 inc r15d
0003119B  443bfe                 cmp r15d, esi
0003119E  0f83c8000000           jae 0x3126c
000311A4  488b4508               mov rax, qword ptr [rbp + 8]
000311A8  0fb695f0070000         movzx edx, byte ptr [rbp + 0x7f0]
000311AF  e9ccfeffff             jmp 0x31080
000311B4  430fb7544d00           movzx edx, word ptr [r13 + r9*2]
000311BA  8b4d10                 mov ecx, dword ptr [rbp + 0x10]
000311BD  4903cb                 add rcx, r11
000311C0  8b1c91                 mov ebx, dword ptr [rcx + rdx*4]
000311C3  80bdf007000000         cmp byte ptr [rbp + 0x7f0], 0
000311CA  7458                   je 0x31224
000311CC  488b8580000000         mov rax, qword ptr [rbp + 0x80]
000311D3  440fb708               movzx r9d, word ptr [rax]
000311D7  4d03ce                 add r9, r14
000311DA  33d2                   xor edx, edx
000311DC  488b8588000000         mov rax, qword ptr [rbp + 0x88]
000311E3  0fb730                 movzx esi, word ptr [rax]
000311E6  85f6                   test esi, esi
000311E8  743a                   je 0x31224
000311EA  660f1f440000           nop word ptr [rax + rax]
000311F0  488d0c92               lea rcx, [rdx + rdx*4]
000311F4  488d3ccd00000000       lea rdi, [rcx*8]
000311FC  468b440f24             mov r8d, dword ptr [rdi + r9 + 0x24]
00031201  413bd8                 cmp ebx, r8d
00031204  720c                   jb 0x31212
00031206  428b4c0f20             mov ecx, dword ptr [rdi + r9 + 0x20]
0003120B  4103c8                 add ecx, r8d
0003120E  3bd9                   cmp ebx, ecx
00031210  7208                   jb 0x3121a
00031212  ffc2                   inc edx
00031214  3bd6                   cmp edx, esi
00031216  7cd8                   jl 0x311f0
00031218  eb0a                   jmp 0x31224
0003121A  428b440f2c             mov eax, dword ptr [rdi + r9 + 0x2c]
0003121F  412bc0                 sub eax, r8d
00031222  03d8                   add ebx, eax
00031224  4903db                 add rbx, r11
00031227  33c9                   xor ecx, ecx
00031229  0f1f8000000000         nop dword ptr [rax]
00031230  0fb60419               movzx eax, byte ptr [rcx + rbx]
00031234  3cb8                   cmp al, 0xb8
00031236  7411                   je 0x31249
00031238  3cc3                   cmp al, 0xc3
0003123A  7430                   je 0x3126c
0003123C  3ccc                   cmp al, 0xcc
0003123E  742c                   je 0x3126c
00031240  ffc1                   inc ecx
00031242  83f920                 cmp ecx, 0x20
00031245  7ce9                   jl 0x31230
00031247  eb23                   jmp 0x3126c
00031249  8b4c1901               mov ecx, dword ptr [rcx + rbx + 1]
0003124D  85c9                   test ecx, ecx
0003124F  741b                   je 0x3126c
00031251  0f31                   rdtsc 
00031253  48c1e220               shl rdx, 0x20
00031257  480bc2                 or rax, rdx
0003125A  4c8bc8                 mov r9, rax
0003125D  49c7c0ffffffff         mov r8, 0xffffffffffffffff
00031264  498bd2                 mov rdx, r10
00031267  e8ec4e0000             call 0x36158
0003126C  b8ffffffff             mov eax, 0xffffffff
00031271  488da5a8070000         lea rsp, [rbp + 0x7a8]
00031278  415f                   pop r15
0003127A  415e                   pop r14
0003127C  415d                   pop r13
0003127E  415c                   pop r12
00031280  5f                     pop rdi
00031281  5e                     pop rsi
00031282  5b                     pop rbx
00031283  5d                     pop rbp
00031284  c3                     ret 
00031285  e8563bfeff             call 0x14de0
0003128A  90                     nop 
0003128B  e8b03afeff             call 0x14d40
