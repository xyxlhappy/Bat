@echo off
title api.xxfcar.com端口监控
:again
set name=api.xxfcar.com
set port=8086
set s=180
start /min telnet.exe %name% %port%
For /f "skip=1 tokens=2 delims=[" %%a in ('ping -n 3 %name%') do (
	For /f "tokens=1 delims=]" %%b in ("%%a") do (
		Set ip=%%b
	)
)
tasklist|findstr /i "telnet.exe" > nul
if ERRORLEVEL 1 (goto err) else (goto ok)

:err
echo %Date:~0,4%-%Date:~5,2%-%Date:~8,2% %Time:~0,2%:%Time:~3,2% 警告！端口连接失败！
echo %Date:~0,4%-%Date:~5,2%-%Date:~8,2% %Time:~0,2%:%Time:~3,2% 域名：%name%的IP地址变更为：%ip%
echo 警告！警告！ >> mail.txt
echo %Date:~0,4%-%Date:~5,2%-%Date:~8,2% %Time:~0,2%:%Time:~3,2% 域名：%name%的IP地址变更为：%ip% >> mail.txt
start /min mail.bat
ping -n %s% 127.0.0.1  > nul
goto again

:ok
taskkill /F -IM "telnet.exe" > nul
echo %Date:~0,4%-%Date:~5,2%-%Date:~8,2% %Time:~0,2%:%Time:~3,2% 端口检测正常。
echo %Date:~0,4%-%Date:~5,2%-%Date:~8,2% %Time:~0,2%:%Time:~3,2% 域名：%name%的IP地址是：%ip% > mail.txt
ping -n %s% 127.0.0.1  > nul
goto again
