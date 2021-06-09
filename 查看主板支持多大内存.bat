@echo off
wmic memphysical get maxcapacity > 0.txt
for /f "tokens=*" %%a in ('more +1 "0.txt"') do (
set "var=%%a"
)
del 0.txt
:loop
if "%var:~-1%"==" " set "var=%var:~0,-1%"&goto loop
set /a size=%var%/1024/1024
echo 该电脑最大支持 %size%G 内存。
pause