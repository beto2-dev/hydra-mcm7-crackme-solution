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
