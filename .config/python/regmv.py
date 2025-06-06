#!/usr/bin/env python

import re
import os
import sys

def print_usage():
    print("Usage: regmv (...) [input] [output]")
    print("Try: 'regmv --help' for more information.")

def print_help():
    print("Usage: regmv (...) [input] [output]")
    print("    -h / --help")
    print("    -g / --global")
    print("    -i / --ignore-case")
    print("    -d / --dry-run")

def print_col(a: str, b:str, a_max: int):
    n_insert : int = a_max - len(a) + 8
    print(a + " " * n_insert + b)

def filename_maxlen_get():
    filelens = [len(file) for _, _, files in os.walk(".") for file in files]
    return max(filelens) if filelens else 0

def main():
    match_global : bool = False
    match_ign_case : bool = False
    dry_run : bool = False

    if len(sys.argv) < 3:
        if len(sys.argv) == 2 and (sys.argv[1] == "-h" or sys.argv[1] == "--help"):
            print_help()
            sys.exit(0)
        else:
            print_usage()
        sys.exit(1)

    for i in sys.argv[1:-2]:
        match i:
            case "-h" | "--help":
                print_help()
                sys.exit(0)
            case "-g" | "--global":
                match_global = True
            case "-i" | "--ignore-case":
                match_ign_case = True
            case "-d" | "--dry-run":
                dry_run = True
            case _:
                print_usage()

    flags = 0
    if match_ign_case:
        flags |= re.IGNORECASE

    input = re.compile(sys.argv[-2], flags)
    out : str = sys.argv[-1]

    filename_maxlen = filename_maxlen_get()


    for i in os.listdir():
        file_out: str

        if match_global:
            file_out = input.sub(out, i)
        else:
            file_out = input.sub(out, i, count=1)

        if dry_run:
            print_col(i, file_out, filename_maxlen)
        else:
            os.rename(i , file_out)

main()
