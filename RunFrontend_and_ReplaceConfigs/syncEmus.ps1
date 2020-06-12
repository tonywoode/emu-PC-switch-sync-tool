$FFS="C:\Program Files\FreeFileSync\FreeFileSync.exe"
$nas_sync_dir="P:\WinScripts\Emulator_PC_Switcher_Sync_Tool\RealtimeSync_with_FreeFileSync\Emulator_NAS_Sync\"

# here are our three syncs
$save_game_sync=$nas_sync_dir+"1.Save_Game_sync.ffs_batch"
$active_files_sync=$nas_sync_dir+"2.Active_Files_No_Screenshots_sync.ffs_batch"
$screenshots_sync=$nas_sync_dir+"3.Screenshots_Only_sync.ffs_batch"

# sadly the powershell equivalent of cmd's && || operators is somewhat unsatisfying, requiring this helper fn to
#  to be synchronous, to reroute the error code into control flow, and to coerce it into a bool: makes you appreciate all of what && does!
# https://stackoverflow.com/questions/2416662/what-are-the-powershell-equivalents-of-bashs-and-operators
# to make matters worse i've had to specificise the fn to launch FFS with the batch 
function Get-ExitBoolean($FFSBatchFile) { & $FFS $FFSBatchFile | Out-Null; $? }
Set-Alias geb Get-ExitBoolean

function Check-Running($cmd) { 
  Get-Process
  $quickplay = Get-Process QP -ErrorAction SilentlyContinue
  $usedEmulators = Get-Process retroarch,mame64,pcsx2 -ErrorAction SilentlyContinue
  if ($quickplay) {
    if ( !($usedEmulators) ) {
      return $true
    }} else {
      return $false 
   }
 }

# here's a standard cascade, if you exit any of the scans or if there's an issue, all the rest won't run
$isit=Check-Running
echo "isit is " + $isit
# the problem is that $isit doesn't get set to the output of the fn, therefore can't be used below
#  (my idea was just to make three (Check-Running && get $save_game_sync) blocks
(geb $save_game_sync ) -and (geb $active_files_sync) -and (geb $screenshots_sync)

# but what we can do now is say, firstly that quickplay has to be running and also that it has to be the process under ffs