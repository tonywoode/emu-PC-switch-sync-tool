SETLOCAL
::cd to script directory, for administrator needs to run this
cd /D "%~dp0"
::capture the script dir, we'll need it later
pushd .

echo.****CONFIGURING TV MODE AND LAUNCHING FRONTEND*****

::I used to import the gamebase reg, which seemed intuitive at first, but think: importing this is an setup-time-only-action,
:: and indeed if you open gamebase outside of opening QuickPlay, you'll lose any changes made... 
::REG IMPORT P:\GAMEBASE\Gamebase.reg

::We will replace emu ini text with the args you pass to me. Args are
::%1 = new Machine
::%2 = new width
::%3 = new height
::%4 = new refresh
::note one based, where powershell is zero based (because arg 0 is the command that was run) 
::now powershell - remember we do NOT need old machine for this.....
set replace_text_in_inis=START /B powershell -file .\..\replace_ini_list.ps1

::Unlike the other switcher scripts in this set, this does a back-and-forth so needs to be told both monitor A and monitor B's settings
SET MACHINE=%1
SET TV_WIDTH=%2
SET TV_HEIGHT=%3
SET TV_REFRESH=%4
SET MON_WIDTH=%5
SET MON_HEIGHT=%6
SET MON_REFRESH=%7


%replace_text_in_inis% %MACHINE% %TV_WIDTH% %TV_HEIGHT% %TV_REFRESH%

::do tv specific stuff
powershell -file .\switch_to_tv_list.ps1 14

:: we'll use this many times
set set_epsxe_reg=reg add HKCU\Software\epsxe\config

:: To get a return value, we have to echo in that script and capture the echo...not great 
@FOR /F "tokens=*" %%i IN ('To_Hex.bat %TV_WIDTH%') DO set HEX_WIDTH=%%i
@FOR /F "tokens=*" %%j IN ('To_Hex.bat %TV_HEIGHT%') DO set HEX_HEIGHT=%%j
call :set_epsxe_reg %HEX_WIDTH% %HEX_HEIGHT%
 
::and EPSXE's Joypad needs to turn on
%set_epsxe_reg% /v Pad1 /t REG_SZ  /d 515,513,512,514,273,275,274,272,278,280,279,281,277,276,282,283 /f
%set_epsxe_reg% /v GamepadMotorType /t REG_SZ  /d 1,0,0,0,0,0,0,0 /f

::may need to start joytokey as administrator too...
::why did i comment this out and why is it above the runner for itself
::taskkill /IM "JoyToKey.exe" /F

:: the ffs sync basics are setup in this file (so that the switch-to-tv script can also use them)
call ../RunFrontend_and_ReplaceConfigs/runFFSSync.bat

::my Emulators and frontend all live on Drive P (subst), so if we aren't on that drive, we won't be able to CD
if not ("%~d0")==("P:") (P:)

::joy2key does my mappings for player1 in many emulators, consider that there's many emulators that won't
:: let you map both a keyboard and joypad at the same time
start /D "P:\JoytoKey\" JoyToKey.exe

::now run my frontend, if we don't CD to qp's dir, relative paths won't work. Many tools currently need relative paths
cd /D P:\quickPlayJS
quickPlayJS-dogfood-edition.exe

::then when we go back, we do it the other way round
echo.****EXITING TV MODE*****

:: QP is now no longer running, if any syncs are still running, kill them (lets you get out of a laborious unintended sync quickly) 
:: If no syncs are running, sync again
popd
call ../RunFrontend_and_ReplaceConfigs/runFFSSync.bat

::export the gamebase reg before we close - backup the older file, but only one per day pls
powershell -file .\..\Gamebase_Import_Export\GamebaseCompareScript.ps1

::kill joy2key as it can have unwanted side effects
taskkill /IM "JoyToKey.exe" /F

::for the TV script we must also do these...
%replace_text_in_inis% %MACHINE% %MON_WIDTH% %MON_HEIGHT% %MON_REFRESH%

::undo tv-specific stuff
powershell -file .\switch_to_tv_list.ps1 8

@FOR /F "tokens=*" %%k IN ('To_Hex.bat %MON_WIDTH%') DO set HEX_WIDTH=%%k
@FOR /F "tokens=*" %%l IN ('To_Hex.bat %MON_HEIGHT%') DO set HEX_HEIGHT=%%l
call :set_epsxe_reg %HEX_WIDTH% %HEX_HEIGHT%

::and set EPSXE's dual shock back to the keyboard (or those keys that we can anyway)
%set_epsxe_reg% /v Pad1 /t REG_SZ  /d 203,205,200,208,17,32,31,30,16,15,18,19,28,42,36,38 /f
%set_epsxe_reg% /v GamepadMotorType /t REG_SZ  /d 0,0,0,0,0,0,0,0 /f

EXIT

:now we will set the resolution 1920x1080 in the registry for EPSXE - Use Pete's OpenGL2 GPU core driver not D3D or it will crash on 4K
:for instance		Monitor				TV
:			ResX	3840 = 0x00000F00	1920 = 0x00000780
:			ResY	2160 = 0x00000870	1080 = 0x00000438
:set_epsxe_reg
%set_epsxe_reg%\ogl2 /v ResX /t REG_DWORD /d %1 /f
%set_epsxe_reg%\ogl2 /v ResY /t REG_DWORD /d %2 /f
