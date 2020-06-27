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
Dir $emuDir -Force -Recurse -ErrorAction 'silentlycontinue' | 
#  below would just report all symlinks in the same format nix would, instead of making a reconstitute script
#  Where { $_.Attributes -match "ReparsePoint"} | % {$_.FullName + " --> "+ $_.Target + " (" + $_.LinkType + ")"} | Tee P:\Symlinks.txt
  Where { $_.Attributes -match "ReparsePoint"} | % {
  "pushd " + '"' + $(split-path $_.Fullname) + '"'
  "New-Item -ItemType SymbolicLink -Path " + '"' + $_.FullName + '"' + " -Target "+ '"' + $_.Target + '"'
  "popd"
  } | Tee P:\RemakeSymlinks.ps1
