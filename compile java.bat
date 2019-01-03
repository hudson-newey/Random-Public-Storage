@echo off
title Compile Java
ver >nul
cls

echo File to Compile,
set /p filec=:

cd "C:\Users\Andy\Desktop\coding"
set "path=%path%;C:\program files\java\jdk1.8.0_151\bin"
REM change these things for your computer ^

set classfile=%filec:java=%
REM save the old run file for future use in the run command
set runfile=%classfile%
set runfile=%runfile:.=%

REM delete the .class file if it allready exists
SET "classfile=%classfile%class"
if exist "%cd%\%classfile%" del /P "%cd%\%classfile%"
timeout /t 0 >nul
javac %filec%

:retry
cls
echo.
echo Done!
set /p answer=Run Program? (yes/no)
if /i "%answer:~,1%" EQU "Y" goto run
if /i "%answer:~,1%" EQU "N" exit /B 1
goto retry

:run
cls
java %runfile%
if /i "%errorlevel%" EQU "1" goto runfailed
pause >nul
exit /B 1

:runfailed
cls

color c
echo Runtime Failed! %runfile%
pause
exit /B 1