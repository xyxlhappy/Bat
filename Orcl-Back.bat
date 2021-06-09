@echo off
set dir=e:\backup
set date=%date:~0,4%%date:~5,2%%date:~8,2%
set rar="C:\Program Files\WinRAR\RAR.exe"
set outdate=30
e:
cd %dir%
expdp 用户名/密码@数据库名 directory=back dumpfile=%date%-NC.dmp  logfile=%date%-NC.log schemas=XXF
%rar% a %dir%\%date%-NC.rar %dir%\%date%-NC.*
for %%i in (dmp log) do (
del -y %dir%\%date%-NC.%%i
)
expdp 用户名/密码@数据库名 directory=back dumpfile=%date%-ISM.dmp  logfile=%date%-ISM.log schemas=ISM
%rar% a %dir%\%date%-ISM.rar %dir%\%date%-ISM.*
for %%i in (dmp log) do (
del -y %dir%\%date%-ISM.%%i
)
forfiles /p %dir% /m *.* /d -%outdate% /c "cmd /c del @file"
