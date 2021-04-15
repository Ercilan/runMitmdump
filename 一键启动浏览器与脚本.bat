@echo off && setlocal enabledelayedexpansion
title 一键启动浏览器与mitmdump抓包脚本 by 二次蓝

for /f "delims=" %%i in ('type "config.ini"^| find /i "="') do set %%i

start 启动抓包脚本.bat %pyScriptPath%
echo 等待mitmdump启动完毕中...

set args=
if "%useIncognito%" == "true" set args=%args% --incognito
if "%autoOpenUrl%" == "true" set args=%args% --new-window "%url%"
if "%autoOpenConsole%" == "true" set args=%args% --auto-open-devtools-for-tabs 

ping -n 5 127.0.0.1>nul
start /D "%browserPath%" /B %browserName%%args%
endlocal
