@echo off & SETLOCAL
::Change the DPI setting and log out so it can be activated

::cd to script directory, for administrator needs to run this
cd /D "%~dp0" 

::now find out if its large or small DPI. Just test the actual desktop value, for if its large
::from here: http://stackoverflow.com/questions/9315289/batch-file-if-registry-keys-data-is-equal-to
reg query "HKCU\Control Panel\Desktop" /v LogPixels | find "0x90"
if %ERRORLEVEL% == 1 echo "LogPixels is not large/144" && SET DPI_WE_NEED="0x00000090"
if %ERRORLEVEL% == 0 echo "LogPixels is large/144" && SET DPI_WE_NEED="0x00000060"

::now run the reg file that changes the DPI
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontDPI" /v LogPixels /t REG_DWORD /d %DPI_WE_NEED% /f
reg add "HKLM\SYSTEM\CurrentControlSet\Hardware Profiles\0000\Software\Fonts" /v LogPixels /t REG_DWORD /d %DPI_WE_NEED% /f
reg add "HKLM\SYSTEM\CurrentControlSet\Hardware Profiles\0001\Software\Fonts" /v LogPixels /t REG_DWORD /d %DPI_WE_NEED% /f
reg add "HKLM\SYSTEM\CurrentControlSet\Hardware Profiles\Current\Software\Fonts" /v LogPixels /t REG_DWORD /d %DPI_WE_NEED% /f
reg add "HKCU\Control Panel\Desktop" /v LogPixels /t REG_DWORD /d %DPI_WE_NEED% /f

::Then regrettably....
shutdown -l
