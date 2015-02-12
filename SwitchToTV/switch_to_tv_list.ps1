#set quickplay to be bigger
#so we go from font size 8 to font size 12 and back again
#first set the size, pass to script as 8 12
$SIZE_A = $args[0]
$SIZE_B = $args[1]
$path2emu = "P:\QUICKPLAY\QuickPlayFrontend\qp\dats\settings.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "FontSize=$SIZE_A", "FontSize=$SIZE_B" } | 
Set-Content $path2emu

