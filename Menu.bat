@ECHO off

::BAT file to be used with youtubedl for ease of use. By: Zulhilmi

::THIS PROGRAM USES YOUTUBE-DL WHICH IN TURN USES PYTHON TO RUN, PLEASE INSTALL IT FIRST

IF EXIST nopython.txt (
	ECHO nopython.txt detected...
	PAUSE
	GOTO depencheck
)

:: This segment checks if python is installed

WHERE python >NUL 2>NUL
IF %ERRORLEVEL% NEQ 0 (
	ECHO.
	ECHO Python is not detected in PATH, please install it and add it to PATH.
	ECHO Visit https://www.python.org/
	ECHO.
	PAUSE
	EXIT
)ELSE (
	GOTO depencheck
)

:: End check segment

:: Checks if the dependencies folder is added to System Path. If not, it adds it to the path variable temporarily

:depencheck
SET "np=%~dp000 Dependencies"
ECHO %path%|find /i "%np:"=%">nul  || set "path=%path%;%np%"
GOTO start

:: End path check

:start
CD /d "%~dp0"
CLS
COLOR 07
TITLE OMNI TOOL
ECHO Omni Tool
ECHO Version 2.0

ECHO.
ECHO By: Zulhilmi
ECHO.
ECHO.

ECHO 1) Navigation-DL
ECHO 2) Giffer
ECHO 3) Converter
ECHO 4) Combine
ECHO 5) Update Youtube-DL
ECHO 6) Setup.bat
ECHO 7) WGET
ECHO 8) Show file/folders
ECHO 9) Exit
ECHO.

IF NOT EXIST Finish.txt ( 
	ECHO WARNING: 
	ECHO First time setup did not output Finish.txt. Please run Setup.bat to avoid issues...
	ECHO.
	ECHO Refer to Issues.txt for an error report
	ECHO.
)

CHOICE /C 123456789 /M "Your choice:"

IF ERRORLEVEL 9 EXIT

IF ERRORLEVEL 8 (
	CD %~dp0\99 Modules
	CALL Direct.bat
	GOTO start
)

IF ERRORLEVEL 7 (
	CD %~dp0\99 Modules
	CALL WGET.bat
	GOTO start
)

IF ERRORLEVEL 6 (
	CD %~dp0\99 Modules
	CALL Setup.bat
	GOTO start
)

IF ERRORLEVEL 5 (
	CD %~dp0\99 Modules
	CALL Update.bat
	GOTO start
)

IF ERRORLEVEL 4 (
	CD %~dp0\99 Modules
	CALL Combine.bat
	GOTO start
)

IF ERRORLEVEL 3 (
	CD %~dp0\99 Modules
	CALL Converter.bat
	GOTO start
)

IF ERRORLEVEL 2 (
	CD %~dp0\99 Modules
	CALL Giffer.bat
	GOTO start
)

IF ERRORLEVEL 1 (
	CD %~dp0\99 Modules
	CALL Navigation-DL.bat
	GOTO start
)
