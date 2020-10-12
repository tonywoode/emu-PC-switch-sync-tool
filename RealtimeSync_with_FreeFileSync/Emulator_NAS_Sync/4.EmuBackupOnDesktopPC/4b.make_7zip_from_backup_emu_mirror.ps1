# https://code.adonline.id.au/creation-date-into-filename/

# https://superuser.com/questions/702122/how-to-show-extraction-progress-of-7zip-inside-cmd
[string]$7zip = "C:\Program Files\7-Zip\7zG.exe"

# zip name will have current date
$date = (get-date).ToString("ddMMyyyy")

#here lies the emulator folder, its the one that ffs mirrors to this location, not the live folder on P:
$emuBackupFolder = "G:\BACKUPS\Emu\Emulators"

# 7zip takes archive name first
$archive = $emuBackupFolder + $date + ".7z"
[array]$arguments = @("a", "-tzip", "-y", $archive) + $emuBackupFolder

#its a bit like we take a zip 'snapshot' of that folder,after we zip this up (which will take some time) we continue to use the emulators backup folder as mirror dest
& $7Zip $arguments
