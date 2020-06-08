
::cd to script directory, for administrator needs to run this
cd /D "%~dp0" 
::import the gamebase reg REG IMPORT "P:\GAMEBASE\Gamebase.reg"
::TODO: why did i comment that out?

::here START ensures these get called async, a nice touch tho is remove the /B and you see the output in a new persisting window
if "%computername%"=="RIVER"   (START /B ReplaceTextAndLaunchQP.bat RIVER 3840 2160 60)
if "%computername%"=="TRICKLE" (START /B ReplaceTextAndLaunchQP.bat TRICKLE 1366 768 60)
if "%computername%"=="LAGOON"  (START /B ReplaceTextAndLaunchQP.bat LAGOON 1280 800 60)
if "%computername%"=="POND"    (START /B ReplaceTextAndLaunchQP.bat POND 2560 1600 60)

::ensure we sync save games
START "" "C:\Program Files\FreeFileSync\FreeFileSync.exe" "P:\WinScripts\Emulator_PC_Switcher_Sync_Tool\RealtimeSync_with_FreeFileSync\Emulator_NAS_Sync\1.Save_Game_sync.ffs_batch"
::kick off a powershell script that will sync commonly used emu configs if qp is open, but not if commonly used emus are...
START powershell -File "P:\WinScripts\Emulator_PC_Switcher_Sync_Tool\RealtimeSync_with_FreeFileSync\Emulator_NAS_Sync\RunSync2IfQPopenButEmusNot.ps1"
:: kick off realtimeSync for the screnshots
START "" "C:\Program Files\FreeFileSync\RealTimeSync.exe" "P:\WinScripts\Emulator_PC_Switcher_Sync_Tool\RealtimeSync_with_FreeFileSync\Emulator_NAS_Sync\3.Screenshots_Only_sync.ffs_batch"

::my Emulators and frontend all live on Drive P (subst), so if we aren't on that drive, we won't be able to CD
if not ("%~d0")==("P:") (P:)
dir

::joy2key does my mappings for player1 in many emulators, consider that there's many emulators that won't
:: let you map both a keyboard and joypad at the same time
start /D "P:\JoytoKey\" JoyToKey.exe

::now run my frontend
::if we don't CD to qp's dir, realative paths won't work. Many tools currently need relative paths
cd /D P:\QUICKPLAY\QUickPlayFrontend\qp 
QP.exe

::now we're done re-ensure we sync save games
START "C:\Program Files\FreeFileSync\FreeFileSync.exe" "P:\WinScripts\Emulator_PC_Switcher_Sync_Tool\RealtimeSync_with_FreeFileSync\Emulator_NAS_Sync\1.Save_Game_sync.ffs_batch"

::export the gamebase reg before we close
REG EXPORT HKEY_CURRENT_USER\Software\GB64 "P:\GAMEBASE\Gamebase.reg" /y

::kill joy2key as it can have unwanted side effects
taskkill /IM "JoyToKey.exe" /F


