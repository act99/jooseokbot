@Echo off
@Echo collector Start
set x=0
call "C:\Users\com\anaconda3\Scripts\activate.bat" C:\Users\com\anaconda3
@taskkill /f /im python.exe /fi "memusage gt 40" 2>NUL | findstr 성공 >NUL

:repeat
@tasklist | find "python.exe" /c > NUL
IF %ErrorLevel%==1 goto 1
IF NOT %ErrorLevel%==1 goto 0

:0
set /a x=%x%+1
echo x : %x%
::echo max : %max%
IF %x%==%max% @taskkill /f /im "python.exe"
goto repeat

:1
set x=0
set max=1000

start python "%~dp0/../collector_v3.py"
timeout 5 > NUL
goto repeat
