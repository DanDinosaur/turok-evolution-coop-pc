# Turok: Evolution PC co-op - makes game\default_coop.xbe from YOUR OWN USA default.xbe. Contains no game data.
param([string]$Path = (Join-Path $PSScriptRoot 'game'))
$ErrorActionPreference = 'Stop'
function Fail($m) { Write-Host "ERROR: $m" -ForegroundColor Red; exit 1 }
function Sha($b) { [BitConverter]::ToString([Security.Cryptography.SHA1]::Create().ComputeHash($b)) }
$d = [IO.File]::ReadAllBytes((Join-Path $PSScriptRoot 'turok_evolution_coop_pc.tecp'))
if ([Text.Encoding]::ASCII.GetString($d, 0, 8) -ne 'TECPC001') { Fail 'bad patch file' }
$osz = [BitConverter]::ToUInt32($d, 8); $nsz = [BitConverter]::ToUInt32($d, 12)
$osha = [BitConverter]::ToString($d, 16, 20); $nsha = [BitConverter]::ToString($d, 36, 20); $n = [BitConverter]::ToUInt32($d, 56)
$x = if (Test-Path $Path -PathType Leaf) { $Path } else { Join-Path $Path 'default.xbe' }
if (-not (Test-Path $x -PathType Leaf)) { Fail "no default.xbe at $x - start Play_Turok_Coop.bat once first so the game extracts your disc image into 'game'." }
$a = [IO.File]::ReadAllBytes($x)
if ((Sha $a) -eq $nsha) { Fail 'that file already is the co-op xbe.' }
if ($a.Length -ne $osz -or (Sha $a) -ne $osha) { Fail 'default.xbe is not the USA (NTSC) Turok: Evolution release.' }
$b = New-Object byte[] $nsz; [Array]::Copy($a, $b, $osz); $pos = 60
for ($i = 0; $i -lt $n; $i++) {
    $off = [BitConverter]::ToUInt32($d, $pos); $ln = [BitConverter]::ToUInt32($d, $pos + 4); $pos += 8
    [Array]::Copy($d, $pos, $b, $off, $ln); $pos += $ln
}
if ((Sha $b) -ne $nsha) { Fail 'internal error: result hash mismatch' }
$out = Join-Path (Split-Path $x) 'default_coop.xbe'; [IO.File]::WriteAllBytes($out, $b)
Write-Host "Done: $out" -ForegroundColor Green
