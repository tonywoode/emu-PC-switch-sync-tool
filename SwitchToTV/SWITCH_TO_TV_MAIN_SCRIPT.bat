@echo off & SETLOCAL
::switch to tv
::this is an abstraction of the tv switching function, things that might change realtively often are set in SWITCH_TO_TV.bat

echo.****CONFIGURING TV MODE AND LAUNCHING FRONTEND*****

SET MACHINE=$1
SET TV_WIDTH=$2
SET TV_HEIGHT=$3
SET TV_REFRESH=$4
SET MON_WIDTH=$5
SET MON_HEIGHT=$6
SET MON_REFRESH=$7

::cd to script directory, for administrator needs to run this
cd /d "%~dp0" 

powershell -file .\..\replace_ini_list.ps1 %MACHINE% %TV_WIDTH% %TV_HEIGHT% %TV_REFRESH%
::when we HADN'T changed the windows Font size the below used to be 8 22
powershell -file .\switch_to_tv_list.ps1 14

:now we will set the resolution 1920x1080 in the registry for EPSXE - Pete's D3D driver
:for instance		Monitor				TV
:			ResX	3840 = 0x00000F00	1920 = 0x00000780
:			ResY	2160 = 0x00000870	1080 = 0x00000438
To_Hex %TV_WIDTH% HEX_WIDTH
To_HEX %TV_HEIGHT% HEX_HEIGHT

reg add "HKCU\Software\Vision Thing\PSEmu Pro\GPU\PeteD3D" /v ResX /t REG_DWORD /d %HEX_WIDTH% /f
reg add "HKCU\Software\Vision Thing\PSEmu Pro\GPU\PeteD3D" /v ResY /t REG_DWORD /d %HEX_HEIGHT% /f
:and EPSXE's Joypad needs to turn on
reg add HKEY_CURRENT_USER\Software\epsxe\config /v Pad1 /t REG_SZ  /d 515,513,512,514,273,275,274,272,278,280,279,281,277,276,282,283 /f
reg add HKEY_CURRENT_USER\Software\epsxe\config /v GamepadMotorType /t REG_SZ  /d 1,0,0,0,0,0,0,0 /f

:may need to start joytokey as administrator too...
::taskkill /IM "JoyToKey.exe" /F

::if we aren't on drive P, well we need to be, its where I keep my emulators
if not ("%~d0")==("P:") (P:)
cd P:\Tools\JoytoKey\JoyToKey
start /D "P:\Tools\JoytoKey\JoyToKey" JoyToKey.exe

"P:\QUICKPLAY\QuickPlayFrontend\qp\QP.exe" /HTPC /MAXIMISE

::then when we go back, we do it the other way round
echo.****EXITING TV MODE*****
::go back to O drive where my code is kept (TODO: should use pushd and popd)
if not ("%~d0")==("O:") (o:)

powershell -file .\..\replace_ini_list.ps1 %MACHINE% %MON_WIDTH% %MON_HEIGHT% %MON_REFRESH%
::when we HADN'T changed the windows Font size the below used to be 22 8
powershell -file .\switch_to_tv_list.ps1 8

To_Hex %MON_WIDTH% HEX_WIDTH
To_HEX %MON_HEIGHT% HEX_HEIGHT

:now we will set the resolution 1800x1440 in the registry for EPSXE - Pete's D3D driver
reg add "HKCU\Software\Vision Thing\PSEmu Pro\GPU\PeteD3D" /v ResX /t REG_DWORD /d %HEX_WIDTH% /f
reg add "HKCU\Software\Vision Thing\PSEmu Pro\GPU\PeteD3D" /v ResY /t REG_DWORD /d %HEX_HEIGHT% /f
:and set its dual shock back to the keyboard (or those keys that we can anyway)
reg add HKEY_CURRENT_USER\Software\epsxe\config /v Pad1 /t REG_SZ  /d 203,205,200,208,17,32,31,30,16,15,18,19,28,42,36,38 /f
reg add HKEY_CURRENT_USER\Software\epsxe\config /v GamepadMotorType /t REG_SZ  /d 0,0,0,0,0,0,0,0 /f

exit
