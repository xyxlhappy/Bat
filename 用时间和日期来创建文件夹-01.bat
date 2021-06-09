@echo off

set dd=%date:~8,2%
set mm=%date:~5,2%
set yy=%date:~0,4%
set Tss=%TIME:~6,2%
set Tmm=%TIME:~3,2%
set Thh=%TIME:~0,2%
set Thh=%Thh: =0%
set folder="%yy%.%mm%.%dd%.%Thh%.%Tmm%.%Tss%"

echo.

echo 当前时间为%folder% 
md c:\%folder%
echo.
exit
