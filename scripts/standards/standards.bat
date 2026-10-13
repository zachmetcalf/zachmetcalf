:: Copyright (c) 2026 Zach Metcalf. All Rights Reserved.

@echo off
title standards
setlocal

if "%~1"=="" (
	echo usage: standards.bat ^<projectdir^>
	exit /b 1
)

set cwd=%~dp0
set projectdir=%~1
set standardsdir=%cwd%..\..

if not exist "%projectdir%\.github\workflows" (
	mkdir "%projectdir%\.github\workflows"
	if errorlevel 1 exit /b 1
)

if not exist "%projectdir%\.vscode" (
	mkdir "%projectdir%\.vscode"
	if errorlevel 1 exit /b 1
)

copy /y "%standardsdir%\.github\workflows\secrets.yml" "%projectdir%\.github\workflows\secrets.yml" >nul
if errorlevel 1 exit /b 1
copy /y "%standardsdir%\.vscode\preferences.json" "%projectdir%\.vscode\preferences.json" >nul
if errorlevel 1 exit /b 1
copy /y "%standardsdir%\.vscode\settings.json" "%projectdir%\.vscode\settings.json" >nul
if errorlevel 1 exit /b 1
copy /y "%standardsdir%\.clang-tidy" "%projectdir%\.clang-tidy" >nul
if errorlevel 1 exit /b 1
copy /y "%standardsdir%\.editorconfig" "%projectdir%\.editorconfig" >nul
if errorlevel 1 exit /b 1
copy /y "%standardsdir%\.gitattributes" "%projectdir%\.gitattributes" >nul
if errorlevel 1 exit /b 1
copy /y "%standardsdir%\.gitignore" "%projectdir%\.gitignore" >nul
if errorlevel 1 exit /b 1
copy /y "%standardsdir%\license.txt" "%projectdir%\license.txt" >nul
if errorlevel 1 exit /b 1

echo standards completed
exit /b 0
