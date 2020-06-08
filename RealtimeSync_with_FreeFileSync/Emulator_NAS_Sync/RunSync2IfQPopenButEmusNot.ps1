$quickplay = Get-Process QP -ErrorAction SilentlyContinue
$usedEmulators = Get-Process retroarch,mame64,pcsx2 -ErrorAction SilentlyContinue

if ($quickplay) {
  if ( !($usedEmulators) ) {
    echo "quickplay is running, but none of those emulators are"
    & "C:\Program Files\FreeFileSync\RealTimeSync.exe" "P:\WinScripts\Emulator_PC_Switcher_Sync_Tool\RealtimeSync_with_FreeFileSync\Emulator_NAS_Sync\2.Active_Files_No_Screenshots_sync.ffs_batch"
  }
}
