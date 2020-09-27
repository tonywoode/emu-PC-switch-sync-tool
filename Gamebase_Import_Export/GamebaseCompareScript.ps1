# Exports the registry entries for gamebase and compares them to the previous file dump (which existed long before this script)
# If there has been a change, archive the old file (max one per day) and replace it with a dump of the latest
# This reg file serves as backup of the state of the registry, and also is used by the auto-install scripts when setting up retro stuff

# https://superuser.com/questions/1355939/compare-registry-with-reg-files
# TODO: variable names of the existing reg file and the to-be reg file could be better named

$liveKey = 'HKEY_CURRENT_USER\Software\GB64'    #The live key you want to compare

$regName = 'Gamebase.reg'
$gamebaseDir  = 'P:\GAMEBASE\'

$livePath =  $gamebaseDir + "Gamebase.temp.reg" #Temporary location for the exported reg file

$compareToPath= $gamebaseDir + $regName    #The .reg file to compare to  

$archiveRegName = "Gamebase.{0:yyyyMMdd}.reg" -f (get-date)
$archivePath = $gamebaseDir + 'old_reg_files\' + $archiveRegName


# seeing as we must make a file to compare a reg key, the best behaviour is probably to make a temp key and only replace the
#  current key if we need to - this would seem counter-intutive on first inspection since the smallest number of moves would
#  be to move the old file to its archive home and put the 'new' file as $regName for comparison, but we want to reduce the 
#  number of unnecesary writes when sycing emus

REG EXPORT $liveKey $livePath

$compareToFile = ((Get-Content $compareToPath -Raw) -split "`r`n`r`n" | Sort-Object) -join "`r`n`r`n"
$liveFile = ((Get-Content $livePath -Raw) -split "`r`n`r`n" | Sort-Object) -join "`r`n`r`n"

#This will return True if they are the same, $false if they are different
If ($liveFile -eq $compareToFile) {
  Write-Output "Gamebase reg key is the same as $compareToPath, doing nothing" 
  Remove-Item $livePath 
} Else {
   Write-Output "Gamebase reg key does note match $compareToPath, making a new $compareToPath, and moving old .reg to $archivePath"
   #move the old .reg file to the archive, and make the new reg file the old one
   move-item $compareToPath $archivePath
   Rename-Item -Path $livePath -NewName $regName
     
}
