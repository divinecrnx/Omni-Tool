@ECHO off

CLS
TITLE Converter
CD ..\03 Conversions
ECHO Multi Purpose Converter
ECHO.
ECHO This module let's you convert any media file from one format to another such as: 
ECHO (mp4 to mp3) (mkv to mp3) (mkv to mp4) (flv to mp4) , and more...
ECHO.
ECHO Would you like to specify a start time and duration?
ECHO.
ECHO 1) Yes
ECHO 2) No
ECHO.

CHOICE /C 12 /M "Your choice: "


IF ERRORLEVEL 2 (
	CLS
	ECHO Input and Outputs need to have their filenames AND extensions. Be mindful.
	ECHO.
	SET /p i= "Input File: "
	SET /p o= "Output File: "
	CLS
	TITLE Converting...
	ffmpeg -i "%i%" "%o%"
	EXIT /B
)

IF ERRORLEVEL 1 (
	CLS
	ECHO Input and Outputs need to have their filenames AND extensions. Be mindful.
	ECHO.
	SET /p i= "Input File: "
	SET /p o= "Output File: "
	SET /p START= "START Time: "
	SET /p time= "Duration: "
	TITLE Converting...
	ffmpeg -ss %START% -i "%i%" -t %time% "%o%"
	EXIT /B
)


SET /p i= "Input File: "
SET /p o= "Output File: "
SET /p START= "START Time: "
SET /p time= "Duration: "

TITLE Converting...
ffmpeg -ss %START% -i "%i%" -t %time% "%o%"
EXIT /B