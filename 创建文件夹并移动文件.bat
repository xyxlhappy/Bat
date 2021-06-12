@Echo Off

::found
For /f "tokens=*" %%i in ('Dir /b /a-d *.mp4') do (
Echo %%~ni
Md %%~ni
)
::Pause

::move
setlocal enabledelayedexpansion
for %%a in (*.mp4) do (
    set "file=%%~na"
    md "!file!"
    move "!file:~,8!*" "!file!\"
)
Pause
