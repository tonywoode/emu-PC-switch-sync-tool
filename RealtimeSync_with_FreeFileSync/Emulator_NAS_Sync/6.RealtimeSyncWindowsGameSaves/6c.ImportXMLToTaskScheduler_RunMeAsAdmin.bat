echo off

::cd to this scripts dir
cd /D "%~dp0"


echo.This will import a scheduled task that will background sync my emulation-based files
echo.
echo.RUN ME AS ADMIN
echo.**AND MAKE SURE THAT THERE ISN'T ALREADY A TASK WITH THIS NAME OR IT WILL REFUSE***
pause
::http://superuser.com/questions/575644/how-to-import-a-scheduled-task-automatically-from-an-xml-file
schtasks /create /xml "6b.RealtimeSyncWindowsSaves_scheduled_task.xml" /tn "RealtimeSyncWindowsSaves"
pause