#!/usr/bin/env python3
"""
HYDRA MCM 7 — clean Unicorn reference harness (bit-exact ground truth).

Runs the REAL code from the reconstructed original image for:
  - DRBG (0x21490)
  - RC4-KSA shuffle (0x22490)   [with hooks to extract S/W tables + final state]
  - build_key_table (0x22BC0)
  - VM (0x1FDB0)
  - full check() (0x5E000) with explicit args

Usage as a library:  from hydra_ref import HydraRef
"""
import os
import struct
import sys

from unicorn import *
from unicorn.x86_const import *

REPO = "/home/z/my-project/repo/hydra"
IMG_PATH = os.path.join(REPO, "evidence/original_image.bin")
DUMPS = os.path.join(REPO, "evidence/dumps")
XORKEY = bytes.fromhex("54286d44")

BASE = 0x140000000          # synthetic base for the original image
STACK = 0x200000000
STACK_SZ = 0x1000000
HEAP = 0x300000000
HEAP_SZ = 0x40000000        # 1 GiB for the 1 MiB DRBG scratch + margin
FAKE = 0x400000000
FAKE_SZ = 0x200000

P = 0xFFFF0001              # GM reduction constants from the asm


def gm_reduce(x):
    """Exact replication of the Granlund-Montgomery reduction sequence mod 65537."""
    x &= 0xFFFFFFFF
    prod = (0xFFFF0001 * x) & 0xFFFFFFFFFFFFFFFF
    q = prod >> 48
    return (x - q * 0x10001) & 0xFFFFFFFF


def fnv1a(data, basis=0x811C9DC5):
    h = basis
    for b in data:
        h = ((h ^ b) * 0x1000193) & 0xFFFFFFFF
    return h


def load_dump_blob():
    fn = os.path.join(DUMPS, "pid8140_prompt_0x2535A128000_0x4000.bin")
    return open(fn, "rb").read()[0xFC0:0xFC0 + 0x200]


BLOB1 = bytes.fromhex("0a262379e09b70bba4848fa5d5c447ef0780f9170cd8276a887106fd397e81f6")
BLOB2_RAW = load_dump_blob()
BLOB2 = BLOB2_RAW[:16]      # vector end-begin = 16 bytes


class HydraRef:
    def __init__(self):
        self.img = bytearray(open(IMG_PATH, "rb").read())
        # decrypt the check region (XOR-wrapped at rest)
        dec = bytearray(self.img[0x5E000:0x61000])
        for i in range(len(dec)):
            dec[i] ^= XORKEY[i % 4]
        self.img[0x5E000:0x61000] = dec
        self.img = bytes(self.img)

        self.uc = Uc(UC_ARCH_X86, UC_MODE_64)
        uc = self.uc
        uc.ctl_set_cpu_model(UC_CPU_X86_HASWELL)
        uc.mem_map(BASE, 0x400000)
        uc.mem_write(BASE, self.img[:0x8A000])   # text + data through 0x8A000
        if len(self.img) > 0x8F000:
            uc.mem_write(BASE + 0x8F000, self.img[0x8F000:])
        uc.mem_map(STACK, STACK_SZ)
        uc.mem_map(HEAP, HEAP_SZ)
        uc.mem_map(FAKE, FAKE_SZ)

        self._heap_ptr = HEAP + 0x100000
        self.ret_magic = 0x600000000
        uc.mem_map(self.ret_magic & ~0xFFF, 0x1000)

        self.tsc = [0x1122334455667788]
        self.outputs = []
        self.gww_result = [1]      # GetWriteWatch: nonzero => "call failed" style
        self.gww_count = [0]

        self._install_libc_stubs()
        self._install_rdtsc()
        self._install_fake_peb()
        self._install_getwritewatch()

        # state captured by hooks
        self.ksa_state = None       # final 1024-byte state before packing
        self.ksa_S = None
        self.ksa_W = None
        self.hooks_ksa = False

    # ------------------------------------------------------------ alloc
    def alloc(self, size, align=0x20):
        p = (self._heap_ptr + align - 1) & ~(align - 1)
        self._heap_ptr = p + max(size, 1) + 0x40
        return p

    # ------------------------------------------------------------ stubs
    def _stub_ret(self, uc, rax=0):
        rsp = uc.reg_read(UC_X86_REG_RSP)
        rip, = struct.unpack("<Q", uc.mem_read(rsp, 8))
        uc.reg_write(UC_X86_REG_RSP, rsp + 8)
        uc.reg_write(UC_X86_REG_RAX, rax & 0xFFFFFFFFFFFFFFFF)
        uc.reg_write(UC_X86_REG_RIP, rip)

    def _install_libc_stubs(self):
        uc = self.uc

        def h_malloc(uc_, a, s, u):
            sz = uc_.reg_read(UC_X86_REG_RCX)
            self._stub_ret(uc_, self.alloc(sz + 0x40))

        def h_free(uc_, a, s, u):
            self._stub_ret(uc_, 0)

        def h_chkstk(uc_, a, s, u):
            rsp = uc_.reg_read(UC_X86_REG_RSP)
            rip, = struct.unpack("<Q", uc_.mem_read(rsp, 8))
            uc_.reg_write(UC_X86_REG_RSP, rsp + 8)
            uc_.reg_write(UC_X86_REG_RIP, rip)

        def h_memcpy(uc_, a, s, u):
            dst = uc_.reg_read(UC_X86_REG_RCX)
            src = uc_.reg_read(UC_X86_REG_RDX)
            n = uc_.reg_read(UC_X86_REG_R8)
            if n:
                uc_.mem_write(dst, bytes(uc_.mem_read(src, n)))
            self._stub_ret(uc_, dst)

        def h_memset(uc_, a, s, u):
            dst = uc_.reg_read(UC_X86_REG_RCX)
            val = uc_.reg_read(UC_X86_REG_RDX) & 0xFF
            n = uc_.reg_read(UC_X86_REG_R8)
            if n:
                uc_.mem_write(dst, bytes([val]) * n)
            self._stub_ret(uc_, dst)

        uc.hook_add(UC_HOOK_CODE, h_malloc, begin=BASE + 0x3895C, end=BASE + 0x3895C + 1)
        uc.hook_add(UC_HOOK_CODE, h_free, begin=BASE + 0x3886C, end=BASE + 0x3886C + 1)
        uc.hook_add(UC_HOOK_CODE, h_chkstk, begin=BASE + 0x39090, end=BASE + 0x39090 + 1)
        uc.hook_add(UC_HOOK_CODE, h_memcpy, begin=BASE + 0x57BE0, end=BASE + 0x57BE0 + 1)
        uc.hook_add(UC_HOOK_CODE, h_memset, begin=BASE + 0x58290, end=BASE + 0x58290 + 1)

    def _install_rdtsc(self):
        uc = self.uc

        def h_rdtsc(uc_, a, s, u):
            t = self.tsc[0]
            uc_.reg_write(UC_X86_REG_RAX, t & 0xFFFFFFFFFFFFFFFF)
            uc_.reg_write(UC_X86_REG_RDX, (t >> 64) & 0xFFFFFFFF)
            self.tsc[0] += 0x100
            uc_.reg_write(UC_X86_REG_RIP, a + s)

        i = self.img.find(b"\x0f\x31", 0, 0x61000)
        sites = []
        while i >= 0:
            sites.append(i)
            i = self.img.find(b"\x0f\x31", i + 1, 0x61000)
        for a in sites:
            uc.hook_add(UC_HOOK_CODE, h_rdtsc, begin=BASE + a, end=BASE + a + 2)

        def h_cpuid(uc_, a, s, u):
            uc_.reg_write(UC_X86_REG_RAX, 0)
            uc_.reg_write(UC_X86_REG_RBX, 0)
            uc_.reg_write(UC_X86_REG_RCX, 0)
            uc_.reg_write(UC_X86_REG_RDX, 0)
            uc_.reg_write(UC_X86_REG_RIP, a + s)
        i = self.img.find(b"\x0f\xa2", 0, 0x61000)
        while i >= 0:
            uc.hook_add(UC_HOOK_CODE, h_cpuid, begin=BASE + i, end=BASE + i + 2)
            i = self.img.find(b"\x0f\xa2", i + 1, 0x61000)

    def _install_fake_peb(self):
        uc = self.uc
        PEB = FAKE + 0x1000
        LDR = FAKE + 0x2000
        K32 = FAKE + 0x10000
        self.K32 = K32

        def w64(addr, val):
            uc.mem_write(addr, struct.pack("<Q", val))

        def wstr(addr, s):
            uc.mem_write(addr, s.encode("utf-16-le") + b"\x00\x00")

        # fake kernel32 with the exports check() walks for
        names = [b"GetStdHandle", b"GetWriteWatch"]
        img = bytearray(0x1000)
        img[0:2] = b"MZ"
        struct.pack_into("<I", img, 0x3C, 0x80)
        struct.pack_into("<I", img, 0x80, 0x4550)
        opt = 0x80 + 0x18
        struct.pack_into("<H", img, opt, 0x20B)
        export_rva = 0x2000
        struct.pack_into("<I", img, opt + 112, export_rva)
        struct.pack_into("<I", img, opt + 116, 0x200)
        struct.pack_into("<H", img, 0x80 + 6, 1)
        struct.pack_into("<H", img, 0x80 + 20, 240)
        sec = opt + 240
        img[sec:sec + 8] = b".edata\x00\x00"
        struct.pack_into("<IIII", img, sec + 8, 0x400, export_rva, 0x400, 0x400)
        uc.mem_write(K32, bytes(img))

        API_ADDR = {n: K32 + 0x3000 + i * 0x40 for i, n in enumerate(names)}
        expdir = bytearray(0x400)
        ER = export_rva
        struct.pack_into("<IIII", expdir, 0x0C, ER + 0x300, 1, len(names), len(names))
        struct.pack_into("<III", expdir, 0x1C, ER + 0x100, ER + 0x180, ER + 0x200)
        for i, n in enumerate(names):
            struct.pack_into("<I", expdir, 0x180 + i * 4, ER + 0x100 + 0x60 + sum(len(x) + 1 for x in names[:i]))
            expdir[0x60 + sum(len(x) + 1 for x in names[:i]):][:len(n) + 1] = n + b"\x00"
            struct.pack_into("<I", expdir, 0x100 + i * 4, (API_ADDR[n] - K32))
            struct.pack_into("<H", expdir, 0x200 + i * 2, i)
        uc.mem_write(K32 + export_rva, bytes(expdir))
        self.API_ADDR = API_ADDR

        w64(PEB + 0x18, LDR)
        ENTRY = FAKE + 0x3000
        w64(LDR + 0x20, ENTRY)
        w64(ENTRY + 0x00, LDR + 0x20)
        w64(ENTRY + 0x08, LDR + 0x20)
        w64(LDR + 0x20 + 0x00, ENTRY)
        w64(LDR + 0x20 + 0x08, ENTRY)
        w64(ENTRY + 0x20, K32)
        name = "KERNEL32.DLL"
        NAMEBUF = FAKE + 0x3800
        wstr(NAMEBUF, name)
        us = bytearray(0x20)
        struct.pack_into("<HHIQ", us, 0, len(name) * 2, len(name) * 2 + 2, 0, NAMEBUF)
        uc.mem_write(ENTRY + 0x48, bytes(us))

        TEB = FAKE + 0x5000
        uc.mem_write(TEB + 0x60, struct.pack("<Q", PEB))
        uc.reg_write(UC_X86_REG_GS_BASE, TEB)
        self.PEB = PEB

        # GetStdHandle stub
        def h_gsh(uc_, a, s, u):
            self._stub_ret(uc_, FAKE + 0x50000)
        uc.hook_add(UC_HOOK_CODE, h_gsh, begin=API_ADDR[b"GetStdHandle"], end=API_ADDR[b"GetStdHandle"] + 1)

    def _install_getwritewatch(self):
        uc = self.uc
        addr = self.API_ADDR[b"GetWriteWatch"]

        def h_gww(uc_, a, s, u):
            # signature: (flags, base, size, addrs, &count, &granularity)
            cnt_ptr = uc_.reg_read(UC_X86_REG_R9)  # 5th arg via stack actually
            rsp = uc_.reg_read(UC_X86_REG_RSP)
            p_cnt = struct.unpack("<Q", uc_.mem_read(rsp + 0x20, 8))[0]
            p_gran = struct.unpack("<Q", uc_.mem_read(rsp + 0x28, 8))[0]
            res = self.gww_result[0]
            if res != 0:
                # emulate failure: count untouched (stays 0x40 pre-set), eax = 0
                self._stub_ret(uc_, 0)
            else:
                uc_.mem_write(p_cnt, struct.pack("<Q", self.gww_count[0]))
                uc_.mem_write(p_gran, struct.pack("<Q", 0x1000))
                self._stub_ret(uc_, self.gww_count[0])
        uc.hook_add(UC_HOOK_CODE, h_gww, begin=addr, end=addr + 1)

    # ------------------------------------------------------------ call helper
    def call(self, rva, args, count=2_000_000_000, timeout=600):
        uc = self.uc
        sp = (STACK + STACK_SZ - 0x200000) & ~0xF
        for reg, val in zip((UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_R9), args[:4]):
            uc.reg_write(reg, val)
        for i, a in enumerate(args[4:6]):
            uc.mem_write(sp + 0x20 + i * 8, struct.pack("<Q", a))
        uc.mem_write(sp, struct.pack("<Q", self.ret_magic))
        uc.reg_write(UC_X86_REG_RSP, sp)
        uc.reg_write(UC_X86_REG_RBP, sp + 0x100)
        uc.emu_start(BASE + rva, self.ret_magic, timeout=timeout * 1_000_000, count=count)
        return uc.reg_read(UC_X86_REG_RAX)

    # ------------------------------------------------------------ string helper
    def mk_string(self, s: bytes):
        p = self.alloc(0x40)
        st = bytearray(0x20)
        if len(s) <= 15:
            st[0:len(s)] = s
            struct.pack_into("<Q", st, 0x10, len(s))
            struct.pack_into("<Q", st, 0x18, 15)
        else:
            buf = self.alloc(len(s) + 1)
            self.uc.mem_write(buf, s + b"\x00")
            struct.pack_into("<Q", st, 0, buf)
            struct.pack_into("<Q", st, 0x10, len(s))
            struct.pack_into("<Q", st, 0x18, len(s) | 15)
        self.uc.mem_write(p, bytes(st))
        return p

    # ------------------------------------------------------------ primitives
    def drbg(self, seed):
        """0x21490(scratch, seed) -> fills 1 MiB. Returns the bytes."""
        buf = self.alloc(0x100000 + 0x1000)
        self.call(0x21490, [buf, seed & 0xFFFFFFFF])
        return bytes(self.uc.mem_read(buf, 0x100000))

    def ksa(self, pwd: bytes):
        """0x22490(&string, &state32_out). Returns (final_state_bytes, state32 list)."""
        uc = self.uc
        sptr = self.mk_string(pwd)
        out = self.alloc(0x1000)

        # hooks to capture S/W and the final state
        captured = {}

        def hook_round_start(uc_, a, s, u):
            if captured.get("round1_seen"):
                return
            captured["round1_seen"] = True
            rbp = uc_.reg_read(UC_X86_REG_RBP)
            rsp = uc_.reg_read(UC_X86_REG_RSP)
            captured["state"] = bytes(uc_.mem_read(rbp + 0x20, 0x400))
            captured["W"] = bytes(uc_.mem_read(rbp + 0x420, 0x800))
            captured["S"] = bytes(uc_.mem_read(rsp + 0x20, 0x100))

        def hook_pack(uc_, a, s, u):
            if captured.get("final_seen"):
                return
            captured["final_seen"] = True
            rbp = uc_.reg_read(UC_X86_REG_RBP)
            captured["final_state"] = bytes(uc_.mem_read(rbp + 0x20, 0x400))

        h1 = uc.hook_add(UC_HOOK_CODE, hook_round_start, begin=BASE + 0x22884, end=BASE + 0x22884 + 1)
        h2 = uc.hook_add(UC_HOOK_CODE, hook_pack, begin=BASE + 0x22ACB, end=BASE + 0x22ACB + 1)
        try:
            self.call(0x22490, [sptr, out])
        finally:
            uc.hook_del(h1)
            uc.hook_del(h2)
        state32 = list(struct.unpack("<512I", bytes(uc.mem_read(out, 0x800))))
        return captured, state32

    def build_kt(self, pwd: bytes, seed):
        """0x22BC0(&out_vector, &string, arg3, seed) -> kt 512 bytes."""
        sptr = self.mk_string(pwd)
        out = self.alloc(0x20)
        self.uc.mem_write(out, b"\x00" * 0x18)
        self.call(0x22BC0, [out, sptr, 0, seed & 0xFFFFFFFF])
        begin, end, cap = struct.unpack("<QQQ", self.uc.mem_read(out, 24))
        return bytes(self.uc.mem_read(begin, end - begin)), (begin, end)

    def vm(self, program: bytes, seed):
        """VM(0x1FDB0): rcx=&struct{begin,end}, rdx=ctx, r8=seed. Returns (rax, ctx)."""
        uc = self.uc
        d = self.alloc(len(program) + 0x40)
        uc.mem_write(d, program)
        st = self.alloc(0x20)
        uc.mem_write(st, struct.pack("<QQ", d, d + len(program)))
        ctx = self.alloc(0x200)
        uc.mem_write(ctx, b"\x00" * 0x200)
        sp = (STACK + STACK_SZ - 0x400000) & ~0xF
        uc.reg_write(UC_X86_REG_RCX, st)
        uc.reg_write(UC_X86_REG_RDX, ctx)
        uc.reg_write(UC_X86_REG_R8, seed & 0xFFFFFFFF)
        uc.mem_write(sp, struct.pack("<Q", self.ret_magic))
        uc.reg_write(UC_X86_REG_RSP, sp)
        uc.reg_write(UC_X86_REG_RBP, sp + 0x100)
        uc.emu_start(BASE + 0x1FDB0, self.ret_magic, timeout=300 * 1_000_000, count=2_000_000_000)
        rax = uc.reg_read(UC_X86_REG_RAX)
        return rax, bytes(uc.mem_read(ctx, 0x100)), bytes(uc.mem_read(d, len(program)))

    # ------------------------------------------------------------ full check
    def seed_globals(self, gww_mode="skip"):
        """Seed runtime globals from the CI dump values (image-relative)."""
        uc = self.uc
        g = lambda rva: BASE + rva
        b1 = self.alloc(0x40)
        uc.mem_write(b1, BLOB1)
        uc.mem_write(g(0x63DC8), struct.pack("<Q", b1))
        uc.mem_write(g(0x63DD0), struct.pack("<Q", b1 + 0x20))
        b2 = self.alloc(0x400)
        uc.mem_write(b2, BLOB2_RAW)
        uc.mem_write(g(0x63DE0), struct.pack("<Q", b2))
        uc.mem_write(g(0x63DE8), struct.pack("<Q", b2 + len(BLOB2)))
        uc.mem_write(g(0x63E00), struct.pack("<Q", 0xF264101F9F7E56A0))
        if gww_mode == "skip":
            uc.mem_write(g(0x63E08), struct.pack("<Q", 0))
        else:
            uc.mem_write(g(0x63E08), struct.pack("<Q", FAKE + 0x60000))
        uc.mem_write(g(0x63E10), struct.pack("<Q", 0xE7D00E18CCD577BF))
        uc.mem_write(g(0x63E18), struct.pack("<Q", 0x25359C00000))
        uc.mem_write(g(0x63E20), struct.pack("<Q", 3))
        uc.mem_write(g(0x63E28), struct.pack("<Q", BASE))
        uc.mem_write(g(0x63E30), struct.pack("<Q", 0x5DC84))
        uc.mem_write(g(0x63E38), struct.pack("<Q", 0x8D43042D))
        uc.mem_write(g(0x63E40), struct.pack("<Q", 0x7CBC1676F6))
        uc.mem_write(g(0x63E48), struct.pack("<Q", 0))
        uc.mem_write(g(0x63E50), struct.pack("<Q", 0x68a4537a0eb2823f))

    def check(self, pwd: bytes, arg2, arg3, arg4, arg5, gww_mode="skip"):
        """Full check() emulation. Returns dict with intermediate values."""
        uc = self.uc
        self.seed_globals(gww_mode)
        sptr = self.mk_string(pwd)

        captured = {"kt": None, "blob_pt": None, "vm_out": None, "r11": None,
                    "check_buf": None, "verdict_fvn": None}

        def h_after_kt(uc_, a, s, u):
            if captured["kt"] is None:
                begin, end = struct.unpack("<QQ", uc_.mem_read(uc_.reg_read(UC_X86_REG_RBP) + 0x90, 16))
                captured["kt"] = bytes(uc_.mem_read(begin, end - begin))
                captured["kt_len"] = end - begin

        def h_after_blob(uc_, a, s, u):
            if captured["blob_pt"] is None:
                begin, end = struct.unpack("<QQ", uc_.mem_read(uc_.reg_read(UC_X86_REG_RBP) - 0x18, 16))
                captured["blob_pt"] = bytes(uc_.mem_read(begin, end - begin))

        def h_after_vm(uc_, a, s, u):
            if captured["vm_out"] is None:
                captured["vm_out"] = uc_.reg_read(UC_X86_REG_RAX)

        def h_r11(uc_, a, s, u):
            if captured["r11"] is None:
                captured["r11"] = uc_.reg_read(UC_X86_REG_R11) & 0xFFFFFFFF

        def h_checkbuf(uc_, a, s, u):
            if captured["check_buf"] is None:
                rbp = uc_.reg_read(UC_X86_REG_RBP)
                captured["check_buf"] = bytes(uc_.mem_read(rbp - 0x60, 0x40))

        def h_verdict(uc_, a, s, u):
            # 0x5ED61: cmp [rbp], eax  (match flag) -> stop before the print paths
            rbp = uc_.reg_read(UC_X86_REG_RBP)
            match = struct.unpack("<I", uc_.mem_read(rbp, 4))[0]
            captured["match"] = match
            rbp_ = uc_.reg_read(UC_X86_REG_RBP)
            captured["check_buf"] = captured["check_buf"] or bytes(uc_.mem_read(rbp_ - 0x60, 0x40))
            uc_.reg_write(UC_X86_REG_RIP, self.ret_magic)
            uc_.emu_stop()

        hooks = [
            uc.hook_add(UC_HOOK_CODE, h_after_kt, begin=BASE + 0x5E04D, end=BASE + 0x5E04D + 1),
            uc.hook_add(UC_HOOK_CODE, h_after_blob, begin=BASE + 0x5E19A, end=BASE + 0x5E19A + 1),
            uc.hook_add(UC_HOOK_CODE, h_after_vm, begin=BASE + 0x5E2B0, end=BASE + 0x5E2B0 + 1),
            uc.hook_add(UC_HOOK_CODE, h_r11, begin=BASE + 0x5E6E2, end=BASE + 0x5E6E2 + 1),
            uc.hook_add(UC_HOOK_CODE, h_checkbuf, begin=BASE + 0x5ECA4, end=BASE + 0x5ECA4 + 1),
            uc.hook_add(UC_HOOK_CODE, h_verdict, begin=BASE + 0x5ED61, end=BASE + 0x5ED61 + 1),
        ]
        try:
            r = self.call(0x5E000, [sptr, arg2 & 0xFFFFFFFF, arg3, arg4, arg5 & 0xFFFFFFFF], timeout=120)
        except UcError as e:
            captured["emu_error"] = str(e)
            rip = uc.reg_read(UC_X86_REG_RIP)
            captured["emu_error_rip"] = hex(rip - BASE) if BASE <= rip < BASE + 0x61000 else hex(rip)
        finally:
            for h in hooks:
                uc.hook_del(h)
        captured["ret"] = r
        captured["outputs"] = [bytes(x) for x in self.outputs]
        return captured


if __name__ == "__main__":
    ref = HydraRef()
    print("[*] reference emulator ready")

    print("\n=== VM(blob2, 0) ===")
    rax, ctx, mod = ref.vm(BLOB2, 0)
    print("rax =", hex(rax), "(expected 0x32cd000005a5)")

    print("\n=== DRBG(0) first 64 bytes ===")
    sc = ref.drbg(0)
    print(sc[:64].hex())

    print("\n=== KSA('AAAA') ===")
    cap, state32 = ref.ksa(b"AAAA")
    print("S:", cap.get("S", b"")[:32].hex())
    print("W[0:16]:", struct.unpack("<8H", cap.get("W", b"")[:16]))
    print("final_state[0:32]:", cap.get("final_state", b"")[:32].hex())
    print("state32[0:8]:", [hex(x) for x in state32[:8]])

    print("\n=== build_key_table('AAAA', 0x12345678) ===")
    kt, _ = ref.build_kt(b"AAAA", 0x12345678)
    print("kt len:", len(kt))
    print("kt[0:32]:", kt[:32].hex())

    print("\n=== full check('AAAA', arg2=0x45523F21, arg3=0, arg4=0x29DF32308AA1DF6, arg5=0x11223344) ===")
    res = ref.check(b"AAAA", 0x45523F21, 0, 0x29DF32308AA1DF6, 0x11223344)
    for k, v in res.items():
        if isinstance(v, bytes) and len(v) > 64:
            print(f"{k}: {v[:32].hex()}... ({len(v)} bytes)")
        else:
            print(f"{k}: {hex(v) if isinstance(v, int) else v}")
