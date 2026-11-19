@echo off
rem Makes game\default_coop.xbe from your own USA default.xbe. You can also drag a game folder or default.xbe onto this file.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0Patch-TurokCoopPC.ps1" %*
pause
