# https://superuser.com/a/733990
# https://blogs.sap.com/2018/07/31/symbolic-links-in-powershell-extending-the-view-format/
# https://stackoverflow.com/questions/36772569/printing-with-powershell-and-files-in-folders#36774439 (just for fullName)
# https://4sysops.com/archives/writing-to-files-with-powershell-redirect-tee-out-file-set-content/
$emuDir = "P:\"
Dir $emuDir -Force -Recurse -ErrorAction 'silentlycontinue' | 
  Where { $_.Attributes -match "ReparsePoint"} | % {$_.FullName + " --> "+ $_.Target + " (" + $_.LinkType + ")"} | Tee P:\Symlinks.txt
