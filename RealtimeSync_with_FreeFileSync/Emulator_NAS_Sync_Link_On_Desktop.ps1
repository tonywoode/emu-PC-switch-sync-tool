# https://stackoverflow.com/questions/41707358/how-can-i-change-icons-for-existing-url-shortcuts-using-powershell
# https://stackoverflow.com/questions/9701840/how-to-create-a-shortcut-using-powershell 
# https://stackoverflow.com/questions/8343767/how-to-get-the-current-directory-of-the-cmdlet-being-executed
$invocation = (Get-Variable MyInvocation).Value
$thisDir = Split-Path $invocation.MyCommand.Path
$shortcutPath="$($env:USERPROFILE)\Desktop\NAS_EMU_Sync.lnk"
$IconLocation=$thisDir + "\FFS.ico"
$IconArrayIndex=0

$Shell = New-Object -ComObject ("WScript.Shell")
$Shortcut = $Shell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $thisDir + "\Emulator_NAS_Sync"
$Shortcut.IconLocation = "$IconLocation, $IconArrayIndex"
$Shortcut.Save()