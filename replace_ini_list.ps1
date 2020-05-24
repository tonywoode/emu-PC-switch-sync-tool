#we set our Machine, Width and Height and Refresh Rate - pass to script as THISSCRIPT.ps1 MACHINE_B 1800 1440 72
#so e.g.:SEAEEE
$MACHINE = $args[0]
#Width Gets changed to eg: 1800
$WIDTH = $args[1]
#And height Gets changed to eg: 1440
$HEIGHT = $args[2]
#Then let's set the refresh rate (UAE needs this for a start)
$REFRESH = $args[3]
#gets changed to 72 (HZ that is)

#First all the amiga stuff
#Let's define a funtion for all these
function UAE_SCREEN {
(Get-Content $path2conf) |
Foreach-Object { $_ -replace "gfx_width=.*", "gfx_width=$WIDTH" } | 
ForEach-Object { $_ -replace "gfx_height=.*", "gfx_height=$HEIGHT" } | 
Foreach-Object { $_ -replace "gfx_width_fullscreen=.*", "gfx_width_fullscreen=$WIDTH" } | 
ForEach-Object { $_ -replace "gfx_height_fullscreen=.*", "gfx_height_fullscreen=$HEIGHT" } | 
ForEach-Object { $_ -replace "gfx_refreshrate=.*", "gfx_refreshrate=$REFRESH" } |
Set-Content $path2conf
}

# I think the only valid one that needs changing now is the cd32 config in winuaeloader's directory
#UAE - CD32 with PAD
$path2conf = "\\$MACHINE\Emulators\Commodore\Amiga\WinUAELoader\Data\cd32withpad.uae"
UAE_SCREEN

#And let's do each one in term using the function
#UAE - default - the section here is probably useless as the UAE registry entry changes the config 
#directory permanently to WinUAELoader's config directory, so any .uae not in there isn't even visible to winUAE
#$path2conf = "\\$MACHINE\Emulators\Commodore\Amiga\WinUAE\WINUAE\Configurations\default.uae"
#UAE_SCREEN

#UAE - CD32 with PAD
#$path2conf = "\\$MACHINE\Emulators\Commodore\Amiga\WinUAE\WINUAE\Configurations\cd32withpad.uae"
#UAE_SCREEN

#Gamebase Amiga - Gamebase Amiga
#$path2conf = "\\$MACHINE\Emulators\GAMEBASE\GameBase Amiga\GameBase Amiga.uae"
#UAE_SCREEN

#Gamebase Amiga - whdload
#$path2conf = "\\$MACHINE\Emulators\GAMEBASE\GameBase Amiga\WHDLoad.uae"
#UAE_SCREEN

#DEMObase Amiga - Gamebase Amiga
#$path2conf = "\\$MACHINE\Emulators\GAMEBASE\Amiga demobase\GameBase Amiga.uae"
#UAE_SCREEN

#now that bit is for WinUAELoader is a bit manual. If Width is 1366 we'll set 14, if 1800 or 1920 we want 19 and so on...
IF ($WIDTH -eq "1366") { $SCREEN = 14 }
ELSEIF ($WIDTH -eq "1280") { $SCREEN = 11 }
ELSEIF ($WIDTH -eq "2560") { $SCREEN = 29 }
ELSE { $SCREEN = 19 }
$path2conf = "\\$MACHINE\Emulators\Commodore\Amiga\WinUAELoader\Data\WinUAELoader.ini"
(Get-Content $path2conf) |
Foreach-Object { $_ -replace "Screen=.*", "Screen=$SCREEN" } |
Set-Content $path2conf

#and we need a similar trick for Kega Fusion (which doesn't like 4k resolutions btw, so we stick to 2k....)
IF ($WIDTH -eq '1920' -or $WIDTH -eq '3840') { $FusionString = '56,4,128,7' } #4k or tv
 ELSEIF ($WIDTH -eq '1280' -or $WIDTH -eq '2560') { $FusionString = '32,3,0,5' } #current laptops 1280x800
ELSE { $FusionString = '224,1,128,2' } #default to 640x480 if something else happenss
$path2conf = "\\$MACHINE\Emulators\SEGA\Fusion\Fusion\Fusion.ini"
(Get-Content $path2conf) | 
Foreach-Object { $_ -replace "DResolution=.*", "DResolution=$FusionString" } |  
Set-Content $path2conf

#PCSX2 can look very nice on the desktop, change every setting needed to make that so, one by one...
$path2conf = "\\$MACHINE\Emulators\SONY\PS2\pcsx2\pcsx2\inis\GSdx.ini" 
switch ($MACHINE) {
  "RIVER" {
    $upscale_multiplier=2
    $filter=2
    $UserHacks_MSAA=8
    $MaxAnisotropy=8
    $Userhacks_align_sprite_X=1
    $UserHacks_unscale_point_line=1
    $wrap_gs_mem=1
    break
  }
  default {
    $upscale_multiplier=1
    $filter=3
    $UserHacks_MSAA=0
    $MaxAnisotropy=2
    $Userhacks_align_sprite_X=0
    $UserHacks_unscale_point_line=0
    $wrap_gs_mem=0
    break
  }
}
(Get-Content $path2conf) | 
Foreach-Object { $_ -replace "upscale_multiplier=.*", "upscale_multiplier=$upscale_multiplier" } | 
Foreach-Object { $_ -replace "filter=.*", "filter=$filter" } | 
Foreach-Object { $_ -replace "UserHacks_MSAA=.*", "UserHacks_MSAA=$UserHacks_MSAA" } | 
Foreach-Object { $_ -replace "MaxAnisotropy=.*", "MaxAnisotropy=$MaxAnisotropy" } | 
Foreach-Object { $_ -replace "Userhacks_align_sprite_X=.*", "Userhacks_align_sprite_X=$Userhacks_align_sprite_X" } | 
Foreach-Object { $_ -replace "UserHacks_unscale_point_line=.*", "UserHacks_unscale_point_line=$UserHacks_unscale_point_line" } | 
Foreach-Object { $_ -replace "wrap_gs_mem=.*", "wrap_gs_mem=$wrap_gs_mem" } | 
Set-Content $path2conf

# now similar for dolphin on retroarch
$path2conf = "\\$MACHINE\Emulators\Retroarch\RetroArch\retroarch-core-options.cfg"
switch ($MACHINE) {
  "RIVER" {
    $dolphin_internal_resolution = "6x (3840x3168)"
    break
  }
  default {
    $dolphin_internal_resolution = "1.5x (960x792)"
    break
  }
}
(Get-Content $path2conf) | 
Foreach-Object { $_ -replace "dolphin_internal_resolution = .*", "dolphin_internal_resolution = $dolphin_internal_resolution" } | 
Set-Content $path2conf

# And for Zinc it looks like the D3D renderer will only do up to 1280x1024, so lets do multiples
# note tv and 4k monitor will get the SAME multiple
IF ($WIDTH -eq '2560' ) { 
	$FIXED_WIDTH='1280' 
	$FIXED_HEIGHT='800' 
	}
  ELSE { 
	$FIXED_WIDTH='1024' 
	$FIXED_HEIGHT='768' 
	}



#Then the sensible stuff, which can have a generic function

function replace-WidthHeight{
	param([string]$path2conf, [string]$sep, [string]$widthKey, [string]$heightKey, [string]$refreshKey)
	# first check if our params have been passed, only replace those which have been - https://stackoverflow.com/a/48643616
	#  - note bad things can happen otherwise for instance omitting $refreshKey results in often replacing "" with a 
	# separator or " " and a regex which therefore equates to " ".*. So making refresh optional was a large factor here!
	$replaceWidth = ($widthKey  -ne '')
	$replaceHeight = ($heightKey  -ne '')
	$replaceRefresh = ($refreshKey -ne '')

	# negative lookbehind to only replace where you find >=1 height=[NOT 1280]
	# this prevents changing timestamps for no good reason
	If ( 
		(($replaceWidth) -And (Select-String -Path $path2conf -Pattern "$widthKey$sep(?!$WIDTH)" -quiet)) -Or 
		(($replaceHeight) -And (Select-String -Path $path2conf -Pattern "$heightKey$sep(?!$HEIGHT)" -quiet)) -Or
		(($replaceRefresh) -And (Select-String -Path $path2conf -Pattern "$refreshKey$sep(?!$REFRESH)" -quiet))
		){
     # this was a nice pipe but I needed conditionals....
			$text = (Get-Content $path2conf) 
			$text2 = IF ($replaceWidth) { Foreach-Object { $text -replace "$widthKey$sep.*", "$widthKey$sep$WIDTH" } } ELSE { $text }
			$text3 = IF ($replaceHeight) { ForEach-Object { $text2 -replace "$heightKey$sep.*", "$heightKey$sep$HEIGHT" } } ELSE { $text2 }
			$text4 = IF ($replaceRefresh) { ForEach-Object { $text3 -replace "$refreshKey$sep.*", "$refreshKey$sep$REFRESH" } } ELSE { $text3 }
			Set-Content -Path $path2conf -Value $text4
		}  
}

#ZINC - all files in dir
Get-ChildItem "\\$MACHINE\Emulators\ARCADE\Zinc\zinc11-win32\rcfg" *.cfg -recurse |
    Foreach-Object {
	#	replace-WidthHeight $_ "=" "XSize" "YSize"
	#}
        $c = ($_ | Get-Content) 
        $c = $c -replace "XSize=.*", "XSize=$FIXED_WIDTH"
		$c = $c -replace "YSize=.*", "YSize=$FIXED_HEIGHT"
        [IO.File]::WriteAllText($_.FullName, ($c -join "`r`n"))
		}

<#ZINC - renderer.cfg#> replace-WidthHeight "\\$MACHINE\Emulators\ARCADE\Zinc\zinc11-win32\renderer.cfg" "			= " "XSize" "YSize"
<#BLUE MSX#> replace-WidthHeight "\\$MACHINE\Emulators\BlueMSX\blueMSXv28full\bluemsx.ini"  "=" "video.fullscreen.width" "video.fullscreen.height"
<#Caprice 3.6.1#> replace-WidthHeight "\\$MACHINE\Emulators\Amstrad_CPC\CAPRICE\CAPRICE_3.6.1\cap32.cfg"  "=" "scr_width" "scr_height"
<#Caprice 4.2.0#> replace-WidthHeight "\\$MACHINE\Emulators\Amstrad_CPC\CAPRICE\caprice_4.2.0\cap32.cfg"  "=" "scr_width" "scr_height"
<#Project64 2.1#> replace-WidthHeight "\\$MACHINE\Emulators\Nintendo\N64\Project64\Project64 2.1\Config\Project64.cfg" "=" "FullscreenWidth" "FullscreenHeight"
<#CPS3#> replace-WidthHeight "\\$MACHINE\Emulators\ARCADE\CPS3\cps3\emulator.ini" "=" "FullScreenWidth" "FullScreenHeight"
<#EPSXE#> replace-WidthHeight "\\$MACHINE\Emulators\SONY\PS1\EPSXE\plugins\gpuPeopsSoftX.cfg" "            = " "ResX" "ResY"
#FBA - this is how it was before generic fn, replacing horizontal and vertical width/height with just width and height#
replace-WidthHeight "\\$MACHINE\Emulators\ARCADE\FinalBurn_Alpha\fba\config\fba.ini" " " "nVidHorWidth" "nVidHorHeight"
replace-WidthHeight "\\$MACHINE\Emulators\ARCADE\FinalBurn_Alpha\fba\config\fba.ini" " " "nVidVerWidth" "nVidVerHeight"
<#FCEUx#> replace-WidthHeight "\\$MACHINE\Emulators\Nintendo\NES\FCEUx\fceux.cfg" " " "`"vmcx`"" "`"vmcy`""
<#M2 1.0#> replace-WidthHeight "\\$MACHINE\Emulators\ARCADE\M2\M2\m2emulator_10\EMULATOR.ini" "=" "FullScreenWidth" "FullScreenHeight"
<#Magic Engine#> replace-WidthHeight "\\$MACHINE\Emulators\PCEngine\Magic Engine\Magic-Engine113\pce.ini" "=" "screen_width" "screen_height"
<#Magic Engine FX#> replace-WidthHeight "\\$MACHINE\Emulators\PCEngine\Magic Engine FX\pcfx.ini" "=" "screen_width" "screen_height"
<#M2 0.9#> replace-WidthHeight "\\$MACHINE\Emulators\ARCADE\M2\M2\m2emulator_09\emulator.ini" "=" "FullScreenWidth" "FullScreenHeight"
<#MEDNAFEN v09 config#> replace-WidthHeight "\\$MACHINE\Emulators\Mednafen\mednafen\mednafen-09x.cfg" " " "xres" "yres"
<#MEDNAFEN#> replace-WidthHeight "\\$MACHINE\Emulators\Mednafen\mednafen\mednafen.cfg" " " "xres" "yres"
<#PSX - note refresh#> replace-WidthHeight "\\$MACHINE\Emulators\SONY\PS1\pSX\pSX\psx.ini" "=" "Width" "Height" "Refresh"
<#RAINE#> replace-WidthHeight "\\$MACHINE\Emulators\ARCADE\Raine\Raine\config\raine32_sdl.cfg" " = " "screen_x" "screen_y"
<#Supermodel#> replace-WidthHeight "\\$MACHINE\Emulators\ARCADE\Supermodel\Supermodel\Config\Supermodel.ini" " = " "XResolution" "YResolution"
<#VisualBoyAdvance#> replace-WidthHeight "\\$MACHINE\Emulators\Nintendo\DS GBA GB\VisualBoy Advance\vba.ini" "=" "fsWidth" "fsHeight"
<#Vice - note refresh#> replace-WidthHeight "\\$MACHINE\Emulators\Commodore\WinVICE\WinVICE-2.2-x64\vice.ini" "=" "FullscreenWidth" "FullscreenHeight" "FullscreenRefreshRate"
#Winkawaks - two sets of changes for normal and neogeo
replace-WidthHeight "\\$MACHINE\Emulators\ARCADE\WinKawaks\winkawaks\WinKawaks.ini" "=" "FullScreenWidth" "FullScreenHeight"
replace-WidthHeight "\\$MACHINE\Emulators\ARCADE\WinKawaks\winkawaks\WinKawaks.ini" "=" "FullScreenWidthNeoGeo" "FullScreenHeightNeoGeo"
<#ZSnesW - note refresh#> replace-WidthHeight "\\$MACHINE\Emulators\Nintendo\SNES\ZSNES\zsnesw.cfg" "=" "CustomResX" "CustomResY" "SetRefreshRate"
<#ZX Spin#> replace-WidthHeight "\\$MACHINE\Emulators\Spectrum\Spin\Default.spincfg" "=" "FullScreenWidth" "FullScreenHeight"

# Then these, which almost fit the mould of the generic function but don't quite

#NESTOPIA - tony the pony...don't regex xml
$path2conf = "\\$MACHINE\Emulators\Nintendo\NES\Nestopia\Nestopia140bin\nestopia.xml"
If ( 
	(Select-String -Path $path2conf -Pattern "<width>(?!$WIDTH</width>)" -quiet) -Or
	(Select-String -Path $path2conf -Pattern "<height>(?!$HEIGHT</height>)" -quiet)
	){
	(Get-Content $path2conf) | 
	ForEach-Object { $_ -replace "<width>.*</width>", "<width>$WIDTH</width>" } | 
	Foreach-Object { $_ -replace "<height>.*</height>", "<height>$HEIGHT</height>" } | 
	Set-Content $path2conf
}

#Stella
$path2conf = "\\$MACHINE\Emulators\Atari\Atari 2600\Stella\stella-2.6.1\stella.ini"
If ( Select-String -Path $path2conf -Pattern "fullres = (?!$WIDTH x $HEIGHT)" -quiet) {
	(Get-Content $path2conf) | 
	ForEach-Object { $_ -replace "fullres = .*", "fullres = $WIDTH x $HEIGHT" } | 
	Set-Content $path2conf
}