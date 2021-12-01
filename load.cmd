@echo off
setlocal enabledelayedexpansion&color 2f&set errorlevel=
title NTBOOTautofix&path %systemroot%\system32&set tmpfile=autofixx.tmp&set /a q=1
if exist %systemroot%\system32\mode.com if exist %systemroot%\system32\ureg.dll mode con cols=80 lines=25
if not exist %systemroot%\system32\reg.exe ren reg5.exe reg.exe>nul 2>nul
if not exist %systemroot%\system32\find.exe ren find5.exe find.exe>nul 2>nul
dir ..\NTaufix/ad 2>nul|find /i "NTaufix">nul 2>nul
if %errorlevel% equ 0 (rd ..\NTaufix /s/q>nul 2>nul&md ..\NTaufix>nul 2>nul) else md..\NTaufix>nul 2>nul
copy /y . ..\NTaufix>nul 2>nul
if /i "%systemroot:~0,1%" neq "X" (
reg query HKCU\Console\%%SystemRoot%%_system32_cmd.exe /v QuickEdit >%tmpfile% 2>nul && (
	for /F "skip=2 tokens=3" %%i in (%tmpfile%) do (set /a qdata=%%i)
	if !qdata! equ 0 (set /a q=0)) || (reg query HKCU\Console /v QuickEdit >%tmpfile% 2>nul && (
		for /F "skip=2 tokens=3" %%i in (%tmpfile%) do (set /a qdata=%%i)
		if !qdata! equ 0 set /a q=0)))
if %q% equ 1 (
	reg add HKCU\Console\%%SystemRoot%%_system32_cmd.exe /f >nul 2>nul
	reg add HKCU\Console\%%SystemRoot%%_system32_cmd.exe /v QuickEdit /t REG_DWORD /d 0 /f >nul 2>nul)
del %tmpfile%>nul 2>nul
cd..\NTaufix
if %q% equ 1 (start cmd /c NTBOOTautofix.cmd) else NTBOOTautofix.cmd
exit /b