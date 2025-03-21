SETLOCAL
::cd to script directory, for administrator needs to run this
cd /D "%~dp0" 
::capture the script dir, we'll need it later
pushd .

echo.****CONFIGURING EMUS AND LAUNCHING FRONTEND*****

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

::here START ensures these get called async, a nice touch tho is remove the /B and you see the output in a new persisting window
if "%computername%"=="RIVER"   (%replace_text_in_inis% RIVER 3840 2160 60)
if "%computername%"=="TRICKLE" (%replace_text_in_inis% TRICKLE 1366 768 60)
if "%computername%"=="LAGOON"  (%replace_text_in_inis% LAGOON 1280 800 60)
if "%computername%"=="POND"    (%replace_text_in_inis% POND 2560 1600 60)
if "%computername%"=="TYPHOON-WIN"    (%replace_text_in_inis% TYPHOON-WIN 2880 1800 60)

:: the ffs sync basics are setup in this file (so that the switch-to-tv script can also use them)
call ./runFFSSync.bat

::my Emulators and frontend all live on Drive P (subst), so if we aren't on that drive, we won't be able to CD
if not ("%~d0")==("P:") (P:)

::joy2key does my mappings for player1 in many emulators, consider that there's many emulators that won't
:: let you map both a keyboard and joypad at the same time
start /D "P:\JoytoKey\" JoyToKey.exe

::now run my frontend, if we don't CD to qp's dir, relative paths won't work. Many tools currently need relative paths
cd /D P:\quickPlayJS
quickPlayJS-dogfood-edition.exe

::there are actions to take on exit
echo.****EXITING EMU*****

:: QP is now no longer running, if any syncs are still running, kill them (lets you get out of a laborious unintended sync quickly) 
:: If no syncs are running, sync again
popd
call ./runFFSSync.bat

::export the gamebase reg before we close - backup the older file, but only one per day pls
powershell -file .\..\Gamebase_Import_Export\GamebaseCompareScript.ps1

::kill joy2key as it can have unwanted side effects
taskkill /IM "JoyToKey.exe" /F
