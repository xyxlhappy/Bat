@echo off
set dir=d:\sqlback
set date=%date:~0,4%%date:~5,2%%date:~8,2%
set rar="C:\Program Files\WinRAR\RAR.exe"
set outdate=30
echo 数据备份中……
d:
cd %dir%
osql -U 用户名 -P 密码 -S 127.0.0.1 -Q "backup database [XXF] to disk='%dir%\%date%.bak'"
echo 数据备份完成，开始压缩……
%rar% a %dir%\%date%.rar %dir%\%date%.bak
for %%i in (dmp log bak) do (
del -y %dir%\%date%.%%i
)
forfiles /p %dir% /m *.* /d -%outdate% /c "cmd /c del @file"
