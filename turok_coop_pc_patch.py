#!/usr/bin/env python3
"""Turok: Evolution PC co-op - makes game\\default_coop.xbe from YOUR OWN USA default.xbe. Contains no game data.
  python turok_coop_pc_patch.py [game folder or default.xbe]   (default: the "game" folder beside this script)"""
import hashlib, os, struct, sys
here = os.path.dirname(os.path.abspath(__file__))
def die(m): print('ERROR: ' + m); sys.exit(1)
d = open(os.path.join(here, 'turok_evolution_coop_pc.tecp'), 'rb').read()
if d[:8] != b'TECPC001': die('bad patch file')
osz, nsz = struct.unpack_from('<II', d, 8); osha, nsha = d[16:36], d[36:56]; n, = struct.unpack_from('<I', d, 56)
p = sys.argv[1] if len(sys.argv) > 1 else os.path.join(here, 'game')
x = p if os.path.isfile(p) else os.path.join(p, 'default.xbe')
if not os.path.isfile(x): die('no default.xbe at ' + x + ' - start Play_Turok_Coop.bat once first so the game extracts your disc image into "game".')
a = open(x, 'rb').read()
if hashlib.sha1(a).digest() == nsha: die('that file already is the co-op xbe.')
if len(a) != osz or hashlib.sha1(a).digest() != osha: die('default.xbe is not the USA (NTSC) Turok: Evolution release.')
b = bytearray(a + b'\0' * (nsz - osz)); pos = 60
for _ in range(n):
    off, ln = struct.unpack_from('<II', d, pos); pos += 8; b[off:off + ln] = d[pos:pos + ln]; pos += ln
if hashlib.sha1(b).digest() != nsha: die('internal error: result hash mismatch')
out = os.path.join(os.path.dirname(x), 'default_coop.xbe'); open(out, 'wb').write(b); print('Done: ' + out)
