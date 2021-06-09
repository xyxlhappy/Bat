@ECHO OFF
Set host=
Set ip=
Set /p host=请输入要获取 ip 的主机名称：
For /f "skip=1 tokens=2 delims=[" %%a in ('ping  -n 1 %host%') do (
	For /f "tokens=1 delims=]" %%b in ("%%a") do (
		Set ip=%%b
	)
)
echo 域名 %host% 的IP地址是 %ip%
pause
