@echo off && setlocal enabledelayedexpansion
title һ�������������mitmdumpץ���ű� by ������

for /f "delims=" %%i in ('type "config.ini"^| find /i "="') do set %%i

start ����ץ���ű�.bat %pyScriptPath%
echo �ȴ�mitmdump���������...

set args=
if "%useIncognito%" == "true" set args=%args% --incognito
if "%autoOpenUrl%" == "true" set args=%args% --new-window "%url%"
if "%autoOpenConsole%" == "true" set args=%args% --auto-open-devtools-for-tabs 

ping -n 5 127.0.0.1>nul
start /D "%browserPath%" /B %browserName%%args%
endlocal
