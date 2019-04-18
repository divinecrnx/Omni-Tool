@ECHO OFF

CLS
TITLE Combine
CD ..\04 Combines
ECHO Combine your video only and audio only file into a new file that has a combination of both. (This is a work in progress)
ECHO.
ECHO Please specify the filename and extension for all prompts
ECHO.
SET /p videoc="Video File: "
SET /p audioc="Audio File: "
SET /p combined="Output File: "
ffmpeg -i "%videoc%" -i "%audioc%" -c:v copy -c:a aac -strict experimental -map 0:v:0 -map 1:a:0 "%combined%"
EXIT /B