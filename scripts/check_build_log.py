#!/usr/bin/env python3
# Copyright (c) 2026 Benjamin Stanley Frohman. Licensed under Apache-2.0.
# Author: Benjamin Stanley Frohman
"""Read every line of the given Lean/Lake log(s) and fail on any `sorry` warning, any use of
`sorryAx`, any `Lean.ofReduceBool` (native_decide) or any `error:` line. Every hit is printed
with its line number. A missing or empty log fails (a vacuous check is not a pass)."""
import os, re, sys

PAT = re.compile(r"declaration uses .sorry.|\bsorryAx\b|\bofReduceBool\b|\berror:")
bad, n = [], 0
if len(sys.argv) < 2:
    print("check_build_log: no log given"); sys.exit(2)
for path in sys.argv[1:]:
    if not os.path.isfile(path):
        print(f"check_build_log FAIL: log not found: {path}")
        sys.exit(1)
    with open(path, encoding="utf-8", errors="replace") as f:
        for i, line in enumerate(f, 1):
            n += 1
            if PAT.search(line):
                bad.append(f"{path}:{i}: {line.rstrip()}")
if n == 0:
    print(f"check_build_log FAIL: read 0 lines of {', '.join(sys.argv[1:])} (vacuous check)")
    sys.exit(1)
if bad:
    print("BUILD LOG FAIL: sorry / sorryAx / ofReduceBool / error in the log:\n" + "\n".join(bad))
    sys.exit(1)
print(f"check_build_log: read all {n} lines of {', '.join(sys.argv[1:])}: no sorry, sorryAx, ofReduceBool or error")
