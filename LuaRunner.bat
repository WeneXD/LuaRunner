@echo off
color 0d

title LuaRunner

if "%1"=="" goto InputFileName else goto Dragged

:Dragged
set file=%1
goto RunFile

:InputFileName
mode con: cols=30 lines=1
echo %1
set /p file=Filename:
set file=%file%.lua
goto RunFile

:RunFile
mode con: cols=80 lines=20
title LuaRunner [%file%]
set StartTime=%time%
lua %file%
set EndTime=%time%
title LuaRunner [%file%] [Stopped]
echo.
echo.
echo :::::::::::::::::
echo [Stopped Running]
echo #Start: %StartTime%
echo #End: %EndTime%
set /p jjjj=
goto Stopped

:Stopped
mode con: cols=30 lines=3
title LuaRunner
echo rerun [1]
echo run other file [2]
set x=1
set /p x=
if %x%==1 goto RunFile
if %x%==2 goto InputFileName