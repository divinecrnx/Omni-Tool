@ECHO off

CLS
TITLE Navigation-DL
ECHO.
ECHO DL Options:
ECHO.
ECHO 1. Youtube-DL
ECHO 2. Music-DL
ECHO 3. Return
ECHO.

CHOICE /C 123 /M "Your choice:"

IF ERRORLEVEL 3 EXIT /B

IF ERRORLEVEL 2 (
	CALL Music-DL.bat
	EXIT /B
)

IF ERRORLEVEL 1 (
	CALL Youtube-DL.bat
	EXIT /B
)