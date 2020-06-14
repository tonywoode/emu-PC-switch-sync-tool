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
::https://freefilesync.org/manual.php?topic=command-line
::After synchronization one of the following status codes is returned:
::Exit Codes
::0 - Synchronization completed successfully
::1 - Synchronization completed with warnings
::2 - Synchronization completed with errors
::3 - Synchronization was aborted 

::https://stackoverflow.com/questions/34698230/how-to-run-multiple-commands-via-start-command
:: see also https://ss64.com/nt/syntax-esc.html
:: we want to start these 3 syncs asynschronously from quickplay, but not continue to the next sync if errorlevel,
:: which may catch us out sometimes, but also means if we quit a sync we stop all syncs
set FFS="C:\Program Files\FreeFileSync\FreeFileSync.exe"
set nas_sync_dir="P:\WinScripts\Emulator_PC_Switcher_Sync_Tool\RealtimeSync_with_FreeFileSync\Emulator_NAS_Sync\AutoSyncs\"
set open_close_sync=%FFS% "%nas_sync_dir:"=%Frontend_Open_close_sync.ffs_batch"
set run_sync=START "runningSync" /MIN /LOW cmd /c " %open_close_sync% " 
:: don' start with the /b flag else we won't be able to taskkill /T later on, use /MIN instead
%run_sync%

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

:: QP is now no longer running, if any syncs are still running, kill them (lets you get out of a laborious unintended sync quickly) 
:: If no syncs are running, run a full(ish) sync
:: a possible issue here is if you load up quickplay when using FFS for some other long term operation, it might kill that operation
:: however another consideration is if freefilesync is running for some other reason, we won't kick off the sync, but that's probably a good thing
::  hence the WindowTitle kill.....see https://stackoverflow.com/questions/9486960/how-to-get-pid-of-process-just-started-from-within-a-batch-file
tasklist /FI "IMAGENAME eq FreeFileSync.exe" 2>NUL | find /I /N "FreeFileSync.exe">NUL
if "%ERRORLEVEL%"=="0" (
	:: there actually always seems to be both FreeFileSync.exe and FreeFileSync_64.exe running
	taskkill /FI "WindowTitle eq runningSync*" /T /F
) ELSE (
	%run_sync%
)

::export the gamebase reg before we close
REG EXPORT HKEY_CURRENT_USER\Software\GB64 "P:\GAMEBASE\Gamebase.reg" /y

::kill joy2key as it can have unwanted side effects
taskkill /IM "JoyToKey.exe" /F
