@ECHO off

CLS
CD ..
COLOR 0E

IF NOT EXIST Finish.txt (
	ECHO.
	ECHO Finish.txt not found. Cannot guarantee supposed directories exist.
	ECHO.
	ECHO Please refer to the warning in the main menu.
	ECHO.
	PAUSE
	EXIT /B
)

ECHO Which file/folder would you like to open?
ECHO.
ECHO 1) Dependencies
ECHO 2) Downloads
ECHO 3) Gifs
ECHO 4) Conversions
ECHO 5) Combines
ECHO 6) Modules
ECHO 7) Downloads.txt
ECHO 8) Previous Downloads.txt
ECHO 9) Return
ECHO.

CHOICE /C 123456789 /M "Your choice: "

IF ERRORLEVEL 9 EXIT /B

IF ERRORLEVEL 8 (
	START Previous Downloads.txt
	EXIT /B
)

IF ERRORLEVEL 7 (
	START Downloads.txt
	EXIT /B
)

IF ERRORLEVEL 6 (
	CD 99 Modules
	START .
	EXIT /B
)

IF ERRORLEVEL 5 (
	CD 04 Combines
	START .
	EXIT /B
)

IF ERRORLEVEL 4 (
	CD 03 Conversions
	START .
	EXIT /B
)

IF ERRORLEVEL 3 (
	CD 02 Gifs
	START .
	EXIT /B
)

IF ERRORLEVEL 2 (
	CD 01 Downloads
	START .
	EXIT /B
)

IF ERRORLEVEL 1 (
	CD 00 Dependencies
	START .
	EXIT /B
)