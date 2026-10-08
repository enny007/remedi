#!/usr/bin/env python3
"""Validate a translated ARB against app_en.arb: same keys, same placeholders.

Usage: python3 tool/arb_check.py yo
"""
import json, re, sys, pathlib
root = pathlib.Path(__file__).resolve().parent.parent / 'lib/l10n'
en = json.loads((root / 'app_en.arb').read_text())
code = sys.argv[1]
tr = json.loads((root / f'app_{code}.arb').read_text())
keys = [k for k in en if not k.startswith('@')]
errors = []
if tr.get('@@locale') != code:
    errors.append(f'@@locale must be "{code}"')
for k in keys:
    if k == '@@locale':
        continue
    if k not in tr:
        errors.append(f'missing: {k}')
        continue
    a = sorted(set(re.findall(r'\{(\w+)\}', en[k])))
    b = sorted(set(re.findall(r'\{(\w+)\}', tr[k])))
    if a != b:
        errors.append(f'placeholder mismatch in {k}: en={a} {code}={b}')
    if not tr[k].strip():
        errors.append(f'empty: {k}')
extra = [k for k in tr if not k.startswith('@') and k not in en]
errors += [f'extra key: {k}' for k in extra]
print('\n'.join(errors) if errors else f'OK: {len(keys)-1} strings valid for {code}')
sys.exit(1 if errors else 0)
