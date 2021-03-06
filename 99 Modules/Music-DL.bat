@ECHO off

CLS
COLOR 07
TITLE Music-DL
CD ..
ECHO.
ECHO Download options:
ECHO.
ECHO 1. Single
ECHO 2. Non-Playlist Batch Download
ECHO 3. Playlist Batch Download
ECHO 4. Channel/User Download
ECHO 5. Return
ECHO.

CHOICE /C 12345 /M "Your choice:"

IF ERRORLEVEL 5 EXIT /B
IF ERRORLEVEL 4 GOTO channel
IF ERRORLEVEL 3 GOTO batchplaylist
IF ERRORLEVEL 2 GOTO batchsingle
IF ERRORLEVEL 1 GOTO single

:single
CLS
COLOR 04
TITLE Music-DL
ECHO Single
ECHO.
SET /p link= "Media Link: "
ytdl --no-playlist --extract-audio --audio-format mp3 %link% -o "./01 Downloads/%%(title)s.%%(ext)s"
EXIT /B

:batchsingle
CLS
COLOR 04
TITLE Music-DL
ECHO Batch
ECHO.
ytdl --no-playlist --extract-audio --audio-format mp3 -a "Downloads.txt" -o "./01 Downloads/%%(title)s.%%(ext)s"
COPY Downloads.txt "Previous Downloads.txt"
ECHO. 2>Downloads.txt
EXIT /B

:batchplaylist
CLS
COLOR 04
TITLE Music-DL
ECHO Batch
ECHO.
ECHO WARNING: Only download playlist links with this format: https://www.youtube.com/playlist?list=LLG5WKW8OTOA3dVR3zKexpSQ
ECHO.
ECHO Close this window if your link formats are wrong. Otherwise, 
ECHO. 
PAUSE
ytdl --extract-audio --audio-format mp3 -a "Downloads.txt" -o "./01 Downloads/%%(playlist)s/%%(playlist_index)s - %%(title)s.%%(ext)s"
COPY Downloads.txt "Previous Downloads.txt"
ECHO. 2>Downloads.txt
EXIT /B

:channel
CLS
COLOR 04
TITLE Music-DL
ECHO Channel
ECHO.
SET /p link= "Channel Link: "
ytdl --extract-audio --audio-format mp3 %link% -o "./01 Downloads%%(uploader)s/%%(playlist)s/%%(playlist_index)s - %%(title)s.%%(ext)s"
/B

