#!/usr/bin/env python3
"""Generate a themed wordlist of plausible original passwords for HYDRA MCM7.

Every candidate is run through the full pipeline by hydra_search (wordlist
mode), so the list can be large — but it is kept focused:

  * challenge/author themes (Hydra, MCM7, CrackNotMe, pwned.space, pwn.by)
  * the trap-string family (Suck..., MCM_SUCK_..., FUNC13...)
  * common crackme passwords + leetspeak mutations + separators
  * lengths != 8/12/27/29 (those lengths sabotage the tables)
"""
import itertools
import sys

BASES = [
    "Hydra", "hydra", "HYDRA", "MCM7", "mcm7", "MCM", "Hydra7", "hydra7",
    "CrackNotMe", "cracknotme", "CrackMe", "crackme", "Cr4ckM3",
    "pwned", "pwned.space", "pwnby", "pwn.by", "pwn", "PWN",
    "SuckSuck", "sucksuck", "Suck", "suck", "SUCK", "MCM_SUCK", "mcm_suck",
    "password", "Password", "passw0rd", "letmein", "letmein123",
    "admin", "root", "toor", "flag", "Flag", "secret", "Secret",
    "beto", "Beto", "beto2", "beto2dev", "CrackNot", "notme",
    "HydraMCM", "hydramcm", "MCMHydra", "mcmhydra", "crack", "Crack",
    "keygen", "Keygen", "reverse", "Reverse", "reversing", "pwned7",
    "Hydra_7", "hydra_7", "seven", "Seven", "lucky7",
]

SEPS = ["", "_", "-", ".", "!", "@", "#", "$", "*", "+", "1", "7", "0"]
TAILS = ["", "7", "!", "1", "123", "1337", "69", "007", "2024", "2025",
         "MCM", "mcm", "7up", "x", "xx", "1234", "12345", "31337",
         "_7", "-7", "77", "777", "999", "666"]

LEET = str.maketrans("aeiostAEIOST", "431057431057")

def main():
    seen = set()
    out = []
    def add(w):
        if w and w not in seen and 8 < len(w) < 40 and len(w) not in (8, 12, 27, 29):
            # hmm: short ones are fine too except the trap lengths
            if len(w) not in (8, 12, 27, 29) and 1 <= len(w) <= 64:
                seen.add(w)
                out.append(w)
    for base in BASES:
        add(base)
        for sep, tail in itertools.product(SEPS, TAILS):
            add(base + sep + tail)
            add((base + sep + tail).translate(LEET))
            add(base.upper() + sep + tail)
            add(base.lower() + sep + tail)
            add((base + sep + tail)[::-1])
        # doubled
        add(base + base)
        add(base + "_" + base)
    sys.stderr.write(f"[*] {len(out)} candidates\n")
    for w in out:
        sys.stdout.write(w + "\n")

if __name__ == "__main__":
    main()
