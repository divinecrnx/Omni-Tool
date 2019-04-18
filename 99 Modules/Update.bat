@ECHO off

CD ..
CLS
COLOR 0d
TITLE Youtube-DL Updater
ECHO Youtube-DL Version: 
ytdl --version
ECHO.
ECHO What would you like to do?
ECHO.
ECHO 1. Update
ECHO 2. Return
ECHO.
CHOICE /C 12 /M "Your choice:"
IF ERRORLEVEL 2 EXIT /B
IF ERRORLEVEL 1 GOTO update

:update
CLS
ECHO UPDATING...
ECHO.
ytdl -U
EXIT /B