@echo off
color 0f
ver >nul
cls

echo Minutes Left,
set /p mins=:
set /a timeleft=%mins% * 60

:loop
:: if the time is done go to the exit program
if /i "%timeleft%" EQU "0" goto finished
cls

:: user display n' stuff
echo %timeleft%
timeout /nobreak 1 >nul
set /a timeleft=%timeleft% - 1
goto loop

:finished
REM display the message box so the user doesn't have to keep checkign the program
echo Timer Done for %mins% Minutes!
echo echo msgbox "Timer Done for %mins% Minutes!">>"%cd%\mes.vbs"
timeout /t 0 >nul
start "%cd%\mes.vbs"
del "%cd%\mes.vbs"

pause >nul
exit /B 1
