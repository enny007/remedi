#!/usr/bin/env python3
"""Merge a JSON object of new English strings (stdin) into lib/l10n/app_en.arb.

Usage: python3 tool/arb_add.py <<'JSON'
{"key": "Value {placeholder}"}
JSON
"""
import json, sys, re, collections, pathlib
path = pathlib.Path(__file__).resolve().parent.parent / 'lib/l10n/app_en.arb'
arb = json.loads(path.read_text(), object_pairs_hook=collections.OrderedDict)
new = json.loads(sys.stdin.read(), object_pairs_hook=collections.OrderedDict)
for k, v in new.items():
    if k in arb and arb[k] != v:
        print(f'! changed {k}', file=sys.stderr)
    arb[k] = v
    phs = re.findall(r'\{(\w+)\}', v)
    if phs:
        arb['@' + k] = {'placeholders': {p: {'type': 'String'} for p in dict.fromkeys(phs)}}
path.write_text(json.dumps(arb, ensure_ascii=False, indent=2) + '\n')
print(f'{len(new)} strings merged; total {sum(1 for k in arb if not k.startswith("@"))}')
