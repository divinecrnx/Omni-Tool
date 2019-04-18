@ECHO off


CLS
COLOR 06
TITLE Giffer
CD ..\02 Gifs
ECHO Giffer Mainframe
ECHO.
ECHO Converts video files into high quality gifs!
ECHO This is a work in progress, any feedback is appreciated
ECHO.
SET /p video= "Video File (extension needed): "
SET /p gif= "Gif File (extension not needed.): "

SET palette="palette.png"
SET filters="fps=30,scale=480:-1:flags=lanczos"
SET dither="bayer:bayer_scale=3"

ffmpeg -v warning -i "%video%" -vf "%filters%,palettegen=stats_mode=diff" -y %palette%
ffmpeg -v warning -i "%video%" -i %palette% -lavfi "%filters% [x]; [x][1:v] paletteuse=dither=%dither%:diff_mode=rectangle" -y "%gif%.gif"
DEL palette.png

EXIT /B