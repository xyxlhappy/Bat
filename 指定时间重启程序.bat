@echo off
:test
cls
echo 将在每天的5:00重启FineBI……
set m=%time:~0,2%%time:~3,2%
if %m% == 500 goto taskkill
ping 127.0.0.1 -n 30 >nul
goto test
pause

:taskkill
taskkill /f /im FineBI.exe >nul
ping 127.0.0.1 -n 60 >nul
D:\FineBI\FineBI.exe
goto test
