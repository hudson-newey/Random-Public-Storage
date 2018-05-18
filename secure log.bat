@echo off
color a
title Secure Log: 100
set /a mins = 1000
set /a percent=100
ver >nul
cls

:loop
timeout /nobreak 60 >nul
set /a mins = %mins% - 1
if /i "%mins%" EQU "0" goto forcestop

REM calculate percentages for display
set /a percent=%mins%/10
title Secure Log: %percent%
goto loop

:forcestop
shutdown -c "Session Logging Out" -s
exit /B 1