@echo off
color a
title Remote Shutdown Repacked
set /a publickey=%random%
ver >nul
cls

mkdir "C:\Users\%username%\Desktop\RSR\"
copy "C:\Windows\System32\shutdown.exe" "C:\Users\%username%\Desktop\RSR\%publickey%.exe"
echo @echo off >>"C:\Users\%username%\Desktop\RSR\Remote Shutdown Repacked.cmd"
echo %publickey% -i>>"C:\Users\%username%\Desktop\RSR\Remote Shutdown Repacked.cmd"
echo exit /B 1>>"C:\Users\%username%\Desktop\RSR\Remote Shutdown Repacked.cmd"

REM show the user where the file is located
start explorer.exe "C:\Users\%username%\Desktop\RSR\"
