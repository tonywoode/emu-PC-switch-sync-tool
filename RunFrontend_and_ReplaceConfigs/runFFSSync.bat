::ensure we sync save games, basic automatic emulator changes (nvram etc), and any emu config changes I make when gaming

:: make it so we can run >1 syncs (not currently used but you can && here), but if we quit a sync (or it has an issue) we stop all syncs
:: should you ever want to run >1 syncs again:
::https://freefilesync.org/manual.php?topic=command-line
::After synchronization one of the following status codes is returned:
::Exit Codes
::0 - Synchronization completed successfully
::1 - Synchronization completed with warnings
::2 - Synchronization completed with errors
::3 - Synchronization was aborted 

:: see also https://ss64.com/nt/syntax-esc.html
set FFS="C:\Program Files\FreeFileSync\FreeFileSync.exe"
set nas_sync_dir="P:\WinScripts\Emulator_PC_Switcher_Sync_Tool\RealtimeSync_with_FreeFileSync\Emulator_NAS_Sync\"
set open_close_sync=%FFS% "%nas_sync_dir:"=%1.Frontend_Open_close_sync.ffs_batch"

call :run_syncs_if_only_sync

EXIT /B %ERRORLEVEL%

:: at first i run this fn from the caller of the start command herein (hence it checks if the window it subsequently creates is open)
::  and i only called it when closing my frontend (when starting up, i called only the start command)
::  but its much tidier this way, and its probably useful not to begin another sync if FreeFileSync is open and doing something else,
:: (your save game will probably eventually sync just fine after all)

:: at first I also killed any instance of FreeFileSync - a possible issue here there was if you load up quickplay when using FFS for some 
:: other long term operation, it might kill that operation
::  hence the WindowTitle kill.....see https://stackoverflow.com/questions/9486960/how-to-get-pid-of-process-just-started-from-within-a-batch-file
:: however another consideration is if freefilesync is running for some other reason, we won't kick off the sync, but that's probably a good thing

:run_syncs_if_only_sync
tasklist /FI "IMAGENAME eq FreeFileSync.exe" 2>NUL | find /I /N "FreeFileSync.exe">NUL
if "%ERRORLEVEL%"=="0" (
	:: there actually always seems to be both FreeFileSync.exe and FreeFileSync_64.exe running
	taskkill /FI "WindowTitle eq runningSync*" /T /F
) ELSE (
	:: don' start with the /b flag else we won't be able to taskkill /T later on, use /MIN instead
	START "runningSync" /MIN /LOW cmd /c " %open_close_sync% "
)
