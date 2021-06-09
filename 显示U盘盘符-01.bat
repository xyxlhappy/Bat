@echo off 
setlocal enabledelayedexpansion 
set l=1abcdef 
for /f "skip=1" %%i in ('wmic logicaldisk where drivetype^=2 get name') do ( 
set /a n+=1 
call set %%l:~!n!,1%%=%%i) 
echo %a% 
echo %b% 
pause
