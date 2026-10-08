#!/usr/bin/env python3
"""Merge translated strings (JSON on stdin) into lib/l10n/app_<code>.arb,
keeping app_en.arb key order. Usage: python3 tool/arb_merge.py yo < new.json"""
import json, sys, pathlib, collections
root = pathlib.Path(__file__).resolve().parent.parent / 'lib/l10n'
code = sys.argv[1]
en = json.loads((root / 'app_en.arb').read_text(), object_pairs_hook=collections.OrderedDict)
path = root / f'app_{code}.arb'
tr = json.loads(path.read_text(), object_pairs_hook=collections.OrderedDict)
tr.update(json.loads(sys.stdin.read()))
out = collections.OrderedDict([('@@locale', code)])
for k in en:
    if not k.startswith('@') and k in tr:
        out[k] = tr[k]
path.write_text(json.dumps(out, ensure_ascii=False, indent=2) + '\n')
