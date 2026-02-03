:: Copyright (c) 2026 Zach Metcalf. All Rights Reserved.

@echo off
title standards

if "%~1"=="" (
	echo usage: standards.bat ^<projectdir^>
	exit /b 1
)

set cwd=%~dp0
set projectdir=%~1
set standardsdir=%cwd%..

if not exist "%projectdir%\.vscode" (
	mkdir "%projectdir%\.vscode"
)

copy /y "%standardsdir%\.vscode\settings.json" "%projectdir%\.vscode\settings.json" >nul
copy /y "%standardsdir%\.clang-tidy" "%projectdir%\.clang-tidy" >nul
copy /y "%standardsdir%\.editorconfig" "%projectdir%\.editorconfig" >nul
copy /y "%standardsdir%\.gitattributes" "%projectdir%\.gitattributes" >nul
copy /y "%standardsdir%\.gitignore" "%projectdir%\.gitignore" >nul
copy /y "%standardsdir%\license.txt" "%projectdir%\license.txt" >nul

echo standards completed
exit /b 0
