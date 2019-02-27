@echo off
title System Repair
ver >nul
cls

sfc /SCANNOW
set /a return=%errorlevel%

cls
if /i "%return%" EQU "0" echo Repair Completed Successfully! && color a

::if the repair failed, tell the user
if not '%return%'=='0' (
echo Repair Failed...
color c
)

pause >nul
exit /B 1
