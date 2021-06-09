@echo off
for %%a in (c d e f g h i j k l m n o p q r s t u v w x y z) do (
for /f %%h in ('fsutil fsinfo drivetype %%a:^|findstr "Removable.* 可移动"') do (
set disk=%%h
)
)
md %disk%\%computername%
set fn=%disk%\%computername%\%computername%.log
echo 计算机名=%computername%>%fn%
for /f "tokens=2 delims==" %%a in ('wmic cpu get name /value^|find "="') do (
  set CPU=%%a
)
echo %cpu% >>%fn%
wmic os get TotalVisibleMemorySize > 0.txt
for /f "tokens=*" %%a in ('more +1 "0.txt"') do (
set "var=%%a"
)
del 0.txt
:loop
if "%var:~-1%"==" " set "var=%var:~0,-1%"&goto loop
set /a size=%var%/1024/1024
echo %size%G 内存 >>%fn%
echo 硬盘信息： >>%fn% 
wmic diskdrive get model,size >>%fn%
for /f "tokens=16" %%i in ('ipconfig ^|find /i "ipv4"') do (
set ip=%%i
echo IP地址=%%i >>%fn%
)
getmac /fo list /v >>%fn%
