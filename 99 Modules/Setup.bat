@ECHO off

SETLOCAL enabledelayedexpansion

:start
CLS
CD ..
COLOR 0A

IF EXIST debug.txt (
	PATH
	ECHO.
)

ECHO Ultimate Tool Setup
ECHO.
ECHO You may choose to setup or purge the dependencies and content folders
ECHO.
ECHO 1) Setup
ECHO 2) Purge
ECHO 3) Return
ECHO.

CHOICE /C 123 /M "Your choice:"

IF ERRORLEVEL 3 EXIT /B
IF ERRORLEVEL 2 GOTO purge
IF ERRORLEVEL 1 GOTO setup

:setup
IF EXIST Finish.txt (
	CLS
	ECHO Setup was done previously. No need to run again.
	PAUSE
	EXIT /B
)

IF NOT EXIST Finish.txt (
	MKDIR "01 Downloads"
	MKDIR "02 Gifs"
	MKDIR "03 Conversions"
	MKDIR "04 Combines"
)

IF NOT EXIST Downloads.txt (
COPY NUL "Previous Downloads.txt"
COPY NUL Downloads.txt
)

CD 00 Dependencies

IF EXIST ytdl.exe (
	REN ytdl.exe youtube-dl.exe
)

SET /a ytdl=0
SET /a ffmpeg=0
SET /a wget=0
SET /a okay=0

IF NOT EXIST OK.txt (
	CLS
	
	IF NOT EXIST youtube-dl.exe (
		ECHO.
		COPY NUL "youtube-dl is missing.txt"
	)ELSE (
		ECHO.
		IF EXIST "youtube-dl is missing.txt" DEL "youtube-dl is missing.txt"
		SET /a ytdl=1
		REN youtube-dl.exe ytdl.exe
	)
	
	IF NOT EXIST ffmpeg.exe (
		ECHO.
		COPY NUL "ffmpeg is missing.txt"
	)ELSE (
		ECHO.
		IF EXIST "ffmpeg is missing.txt" DEL "ffmpeg is missing.txt"
		SET /a ffmpeg=1
	)
	
	SET /a "okay=ffmpeg+ytdl"
	
	IF !okay!==2 (
		COPY NUL OK.txt
		CD ..
		ECHO Setup was ran successfully > Finish.txt
		DEL Issues.txt
	)
	
	CD 00 Dependencies
	
	IF NOT EXIST OK.txt (
		CD ..
		ECHO Folder 00 Dependencies needs attention... > Issues.txt
	)
	
	GOTO end
)ELSE (
	:: Might not need this else statement
	ECHO Dependencies are okay!
	PAUSE
	GOTO end
)

:purge
CLS
ECHO.
ECHO Are you sure you want to purge everything except Menu.bat, 00 Dependencies and 99 Modules?
ECHO.
ECHO 1) Yes
ECHO 2) No
ECHO.

CHOICE /C 12 /M "Your choice:"

IF ERRORLEVEL 2 GOTO start

IF ERRORLEVEL 1 (
	RMDIR /s /q "01 Downloads"
	RMDIR /s /q "02 Gifs"
	RMDIR /s /q "03 Conversions"
	RMDIR /s /q "04 Combines"
	del Issues.txt
	del Downloads.txt
	del Finish.txt
	del "Previous Downloads.txt"
	CD 00 Dependencies
	DEL OK.txt
	IF EXIST "ffmpeg is missing.txt" DEL "ffmpeg is missing.txt"
	IF EXIST "youtube-dl is missing.txt" DEL "youtube-dl is missing.txt"
	GOTO end
)

:end
CLS
ECHO.
ECHO End of setup reached.
ECHO.
PAUSE
EXIT /B