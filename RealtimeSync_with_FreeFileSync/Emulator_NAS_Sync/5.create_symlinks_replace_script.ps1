# https://superuser.com/a/733990
# https://blogs.sap.com/2018/07/31/symbolic-links-in-powershell-extending-the-view-format/
# https://stackoverflow.com/questions/36772569/printing-with-powershell-and-files-in-folders#36774439 (just for fullName)
# https://4sysops.com/archives/writing-to-files-with-powershell-redirect-tee-out-file-set-content/
# https://winaero.com/blog/create-symbolic-link-windows-10-powershell/ (just for creating syntax)

# this will make a powershell script that reconstitutes all the symlinks in a target folder
# used powershell over cmd because with mklink in cmd you have to specify file vs directory symlink (somewhat pointlessly since there's a target!?!)
# a complication is that many of my symlink's targets are relative paths eg: P:\SONY\PS1\EPSXE\bios\SCPH-5502.bin pointing to ..\..\BIOS\SCPH-5502.bin
# so we have to move into their folder in order to try to make those, and maybe powershell makes relative links in the actual symlink target string
# just like mklink does (which is what i originally used to make the symlinks) (not the end of the world if it doesn't links will still work just be less flexible if moved)
# so we effectively write all the powershell commands into a single script file, which can be manually run one day
# pity about having to surround with double quotes all the time, its acutally not needed by the links i have atm

$emuDir = "P:\"
# Take note of this folder here, its in your autoInstall files ie: we're assuming the main use for this script is at build time only
$outFilePath = $emuDir + "WinScripts\winAutoInstall\7.RemakeEmulatorsSymlinks\RemakeSymlinks.ps1"
# First a bit of code using powershell's heredoc to make it so I don't have to run the result as admin...

Write-Host "Finding all symlinks in $emuDir and writing a file that will reconstitute them to $outFilePath..."

"# This file generated from $PSCommandPath" > $outFilePath

$runAsAdminPreamble = @'
param([switch]$Elevated)

function Test-Admin {
  $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
  $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) 
    {
        # tried to elevate, did not work, aborting
    } 
    else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
}

exit
}
'running with full privileges'
'@ >> $outFilePath

# now note Tee-ing the output and appending to file (we need to for each loop but its ok since we already overwrote the previous file with our pre-amble)
Dir $emuDir -Force -Recurse -ErrorAction 'silentlycontinue' | 
#  below would just report all symlinks in the same format nix would, instead of making a reconstitute script
#  Where { $_.Attributes -match "ReparsePoint"} | % {$_.FullName + " --> "+ $_.Target + " (" + $_.LinkType + ")"} | Tee P:\Symlinks.txt
  Where { $_.Attributes -match "ReparsePoint"} | % {
  "pushd " + '"' + $(split-path $_.Fullname) + '"'
  "New-Item -ItemType SymbolicLink -Path " + '"' + $_.FullName + '"' + " -Target "+ '"' + $_.Target + '"'
  "popd"
  } | Tee $outFilePath -Append
