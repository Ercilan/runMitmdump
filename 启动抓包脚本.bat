@echo off
title mitmdumpץ�� by ������
set seg=^===================================================================

for /f "delims=" %%i in ('type "config.ini"^| find /i "="') do set %%i

if "%~1"=="" (
echo tips���������϶�mitmץ������ű�����bat��һ������Ŷ������Ĭ������ʹ��config.ini���ݡ�
echo %seg%
) else (
set "pyScriptPath=%~1"
)
if not exist "%pyScriptPath%" echo �ű�·����%pyScriptPath% && echo û���ҵ��ýű�·�������������ã� && goto toExit

for /f %%a in ("%pyScriptPath%") do cd %%~dpa

if not "%useAnaconda%" == "true" goto runMitm

rem ����Anaconda����
call "%activatePath%" "%env%"
if %errorlevel% == 1 (
echo ����ʹ�����call "%activatePath%" "%env%"
echo %seg%
echo Anaconda��������ʧ�ܣ���鿴����ĳ�����Ϣ���������Ҫʹ��Anaconda�������������ļ���useAnaconda��Ϊfalse��
goto toExit
)
rem ����ץ���ű�
:runMitm
echo ʹ��ָ�mitmdump --listen-host %host% -p %port% -s "%pyScriptPath%" %other%
mitmdump --listen-host %host% -p %port% -s "%pyScriptPath%" %other%

endlocal
goto :EOF

:toExit
endlocal
echo.
echo ��������˳�...
pause>nul && exit
