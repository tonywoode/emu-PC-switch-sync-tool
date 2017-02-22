SETLOCAL
::switch to tv
::this is an abstraction of the tv switching function, things that might change realtively often are set in SWITCH_TO_TV.bat
::cd to script directory, for administrator needs to run this
cd /D "%~dp0"

echo.****CONFIGURING TV MODE AND LAUNCHING FRONTEND*****

::Unlike the other switcher scripts in this set, this does a back-and-forth so needs to be told both monitor A and monitor B's settings
SET MACHINE=%1
SET TV_WIDTH=%2
SET TV_HEIGHT=%3
SET TV_REFRESH=%4
SET MON_WIDTH=%5
SET MON_HEIGHT=%6
SET MON_REFRESH=%7

powershell -file .\..\replace_ini_list.ps1 %MACHINE% %TV_WIDTH% %TV_HEIGHT% %TV_REFRESH%

::do tv specific stuff
powershell -file .\switch_to_tv_list.ps1 14

:now we will set the resolution 1920x1080 in the registry for EPSXE - Pete's D3D driver
:for instance		Monitor				TV
:			ResX	3840 = 0x00000F00	1920 = 0x00000780
:			ResY	2160 = 0x00000870	1080 = 0x00000438
:: To get a return value, we have to echo in that script and capture the echo...not great 
@FOR /F "tokens=*" %%i IN ('To_Hex.bat %TV_WIDTH%') DO set HEX_WIDTH=%%i
@FOR /F "tokens=*" %%j IN ('To_Hex.bat %TV_HEIGHT%') DO set HEX_HEIGHT=%%j


::set the Monitors resolution in the registry for EPSXE - Pete's D3D driver
reg add "HKCU\Software\Vision Thing\PSEmu Pro\GPU\PeteD3D" /v ResX /t REG_DWORD /d %HEX_WIDTH% /f
reg add "HKCU\Software\Vision Thing\PSEmu Pro\GPU\PeteD3D" /v ResY /t REG_DWORD /d %HEX_HEIGHT% /f
::and EPSXE's Joypad needs to turn on
reg add HKEY_CURRENT_USER\Software\epsxe\config /v Pad1 /t REG_SZ  /d 515,513,512,514,273,275,274,272,278,280,279,281,277,276,282,283 /f
reg add HKEY_CURRENT_USER\Software\epsxe\config /v GamepadMotorType /t REG_SZ  /d 1,0,0,0,0,0,0,0 /f

::may need to start joytokey as administrator too...
::taskkill /IM "JoyToKey.exe" /F
start /D "P:\JoytoKey\" JoyToKey.exe

::try and ensure the tv gets the audio to the tv
"O:\Scripts\Emulator_PC_Switcher_Sync_Tool\SwitchToTV\nircmd_sound_shortcuts\TV_SAMSUNG.lnk"

::launch our frontend
"P:\QUICKPLAY\QuickPlayFrontend\qp\QP.exe" /HTPC /MAXIMISE

::then when we go back, we do it the other way round
echo.****EXITING TV MODE*****
::go back to O drive where my code is kept (TODO: should use pushd and popd)
::if not ("%~d0")==("O:") (O:)

powershell -file .\..\replace_ini_list.ps1 %MACHINE% %MON_WIDTH% %MON_HEIGHT% %MON_REFRESH%

::undo tv-specific stuff
powershell -file .\switch_to_tv_list.ps1 8

@FOR /F "tokens=*" %%k IN ('To_Hex.bat %MON_WIDTH%') DO set HEX_WIDTH=%%k
@FOR /F "tokens=*" %%l IN ('To_Hex.bat %MON_HEIGHT%') DO set HEX_HEIGHT=%%l

::Sadly Pete's D3D driver can't cope with 4k res, so we need to add a manual exception for 3840x2160
:: TODO: I tried going to the OPENGL2 driver but it hated display scaling - maybe when launched by quickplay it would work fine though
::The highest we seem to be able to get is 1920x1440 (the registry shows you the hex of these - just set it in epsxe and look)
if (%HEX_WIDTH%)==(0x00000F00) do set HEX_WIDTH=0x00000780
if (%HEX_WIDTH%)==(0x00000870) do set HEX_WIDTH=0x000005a0

reg add "HKCU\Software\Vision Thing\PSEmu Pro\GPU\PeteD3D" /v ResX /t REG_DWORD /d %HEX_WIDTH% /f
reg add "HKCU\Software\Vision Thing\PSEmu Pro\GPU\PeteD3D" /v ResY /t REG_DWORD /d %HEX_HEIGHT% /f

::and set EPSXE's dual shock back to the keyboard (or those keys that we can anyway)
reg add HKEY_CURRENT_USER\Software\epsxe\config /v Pad1 /t REG_SZ  /d 203,205,200,208,17,32,31,30,16,15,18,19,28,42,36,38 /f
reg add HKEY_CURRENT_USER\Software\epsxe\config /v GamepadMotorType /t REG_SZ  /d 0,0,0,0,0,0,0,0 /f

::try and ensure the pc gets the audio to the speakers
"O:\Scripts\Emulator_PC_Switcher_Sync_Tool\SwitchToTV\nircmd_sound_shortcuts\Speakers.lnk"

exit
