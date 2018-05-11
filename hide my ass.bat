@echo off
color c
title Hide My Ass
ver >nul
set /a okay=0
cls

:loop
if /i "%okay%" EQU "1" goto wait
tasklist /FI "IMAGENAME eq chrome.exe" 2>NUL | find /I /N "chrome.exe">NUL
if "%ERRORLEVEL%"=="0" goto yes
goto loop

:yes
taskkill /F /IM chrome.exe
start chrome.exe --incognito
cls
set /a okay=1
timeout /nobreak 4 >nul
goto loop
:wait
tasklist /FI "IMAGENAME eq chrome.exe" 2>NUL | find /I /N "chrome.exe">NUL
if not "%ERRORLEVEL%"=="0" set /a okay=0
timeout /t 0 >nul
goto loop