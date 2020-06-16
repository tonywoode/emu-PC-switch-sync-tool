::cd to script directory, for administrator needs to run this
cd /D "%~dp0" 
::caputure the script dir, we'll need it later
pushd .

::import the gamebase reg REG IMPORT "P:\GAMEBASE\Gamebase.reg"
::TODO: why did i comment that out?

::here START ensures these get called async, a nice touch tho is remove the /B and you see the output in a new persisting window
if "%computername%"=="RIVER"   (START /B ReplaceTextAndLaunchQP.bat RIVER 3840 2160 60)
if "%computername%"=="TRICKLE" (START /B ReplaceTextAndLaunchQP.bat TRICKLE 1366 768 60)
if "%computername%"=="LAGOON"  (START /B ReplaceTextAndLaunchQP.bat LAGOON 1280 800 60)
if "%computername%"=="POND"    (START /B ReplaceTextAndLaunchQP.bat POND 2560 1600 60)

:: though the ffs sync basics are setup in this file (so that the switch-to-tv script can also use them), we do have a lot in this file
::  that assumes knowledge of that one (eg: using the window title setup in that script later on) so do refer to it to understand this one
call ./runFFSSync.bat

::my Emulators and frontend all live on Drive P (subst), so if we aren't on that drive, we won't be able to CD
if not ("%~d0")==("P:") (P:)

::joy2key does my mappings for player1 in many emulators, consider that there's many emulators that won't
:: let you map both a keyboard and joypad at the same time
start /D "P:\JoytoKey\" JoyToKey.exe

::now run my frontend, if we don't CD to qp's dir, relative paths won't work. Many tools currently need relative paths
cd /D P:\QUICKPLAY\QuickPlayFrontend\qp 
QP.exe

:: QP is now no longer running, if any syncs are still running, kill them (lets you get out of a laborious unintended sync quickly) 
:: If no syncs are running, sync again
popd
call ./runFFSSync.bat

::export the gamebase reg before we close
REG EXPORT HKEY_CURRENT_USER\Software\GB64 "P:\GAMEBASE\Gamebase.reg" /y

::kill joy2key as it can have unwanted side effects
taskkill /IM "JoyToKey.exe" /F
