@echo off
title mitmdump抓包 by 二次蓝
set seg=^===================================================================

for /f "delims=" %%i in ('type "config.ini"^| find /i "="') do set %%i

if "%~1"=="" (
echo tips：还可以拖动mitm抓包处理脚本到本bat上一键运行哦，其它默认配置使用config.ini内容。
echo %seg%
) else (
set "pyScriptPath=%~1"
)
if not exist "%pyScriptPath%" echo 脚本路径：%pyScriptPath% && echo 没有找到该脚本路径，请重新配置！ && goto toExit

for /f %%a in ("%pyScriptPath%") do cd %%~dpa

if not "%useAnaconda%" == "true" goto runMitm

rem 激活Anaconda环境
call "%activatePath%" "%env%"
if %errorlevel% == 1 (
echo 激活使用命令：call "%activatePath%" "%env%"
echo %seg%
echo Anaconda环境激活失败，请查看上面的出错信息，如果不需要使用Anaconda环境请在配置文件将useAnaconda设为false。
goto toExit
)
rem 启动抓包脚本
:runMitm
echo 使用指令：mitmdump --listen-host %host% -p %port% -s "%pyScriptPath%" %other%
mitmdump --listen-host %host% -p %port% -s "%pyScriptPath%" %other%

endlocal
goto :EOF

:toExit
endlocal
echo.
echo 按任意键退出...
pause>nul && exit
