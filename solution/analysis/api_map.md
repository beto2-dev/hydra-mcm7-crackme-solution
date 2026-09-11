# Runtime API resolution map (FNV-1a, uppercased)

The original program resolves all APIs by hashing module and export names
while walking `PEB->Ldr->InMemoryOrderModuleList` (no import table).

## Module hashes

| Hash | Name |
|---|---|
| `0x29CDD463` | KERNEL32.DLL |

## Export hashes (kernel32)

| Hash | API | Resolved at |
|---|---|---|
| `0x0AEF7A8B` | SetConsoleTitleW | 0x313F6 |
| `0x12D71805` | GetProcAddress | x6 sites |
| `0x20EF9D2D` | SetConsoleTitleA | x1 |
| `0x2AF75C1D` | GetModuleFileNameA | x3 |
| `0x38E87001` | VirtualAlloc | x1 |
| `0x390A6579` | CreateThread | x1 |
| `0x3A773DE8` | GetCurrentThread | x4 |
| `0x4298A5F2` | SetThreadContext | x1 |
| `0x4D774D1D` | Beep | x1 |
| `0x523E1741` | QueryPerformanceCounter | x4 |
| `0x62C5C373` | VirtualProtect | x6 |
| `0x64BAE532` | Thread32First | x1 |
| `0x672A88B5` | SetConsoleTextAttribute | x1 |
| `0x6D3D9A28` | Sleep | x3 |
| `0x74F0ACB6` | OpenProcess | x1 |
| `0x7C072ED8` | GetFileSize | x1 |
| `0x849E049A` | CreateFileMappingA | x1 |
| `0x8ABA4AAB` | MapViewOfFile | x1 |
| `0x8DAD0C4A` | GetStdHandle | x1 |
| `0x940FB0C6` | ResetWriteWatch | x1 |
| `0x97321634` | GetSystemDirectoryA | x1 |
| `0x976326F1` | ContinueDebugEvent | x1 |
| `0x982D6A5E` | GetThreadContext | x3 |
| `0x9EB60B55` | CreateToolhelp32Snapshot | x1 |
| `0xA2AE8F7C` | GetModuleHandleA | x6 |
| `0xAC392D5A` | ExitProcess | x1 |
| `0xB6F9B737` | GetTickCount64 | x1 |
| `0xBC5C02C3` | ReadFile | x1 |
| `0xC36D7CE0` | GetCurrentProcessId | x2 |
| `0xC75B7345` | GetCurrentProcess | x1 |
| `0xC7C10569` | CopyFileA | x1 |
| `0xD4319E37` | QueryPerformanceFrequency | x2 |
| `0xD447E1B5` | Thread32Next | x1 |
| `0xE075BCB8` | VirtualQuery | x1 |
| `0xE3EB7329` | CreateProcessA | x1 |
| `0xE84B3A8E` | CreateFileA | x1 |
| `0xEF74207A` | WaitForDebugEvent | x1 |
| `0xF78A6CC3` | GetEnvironmentVariableA | x1 |
| `0x0FEF545` | CloseHandle | inline scans |

ntdll (resolved from the ntdll walk): `0xB931F2E7` = NtTerminateProcess.

The packer additionally maintains a thunk table at RVA `0x6F000+`
(`movabs rax, <real addr>; jmp rax` variants) referenced via the
`[0x67000+]` slot array — resolved at runtime on the analysis machine.
