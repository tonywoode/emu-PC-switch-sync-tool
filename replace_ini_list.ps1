#we set our Machine, Width and Height and Refresh Rate - pass to script as THISSCRIPT.ps1 MACHINE_B 1800 1440 72
$MACHINE = $args[0] #so e.g.:SEAEEE
$WIDTH = $args[1] #Width Gets changed to eg: 1800
$HEIGHT = $args[2] #And height Gets changed to eg: 1440
$REFRESH = $args[3] #set refresh rate (UAE needs this for a start) gets changed to 72 (HZ that is)

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

#Then the sensible stuff, which can have a generic function, that mostly gets facaded with the passed in props
function replace-ScreenProps {
	param([string]$path2conf, [string]$sep, [string]$widthKey, [string]$heightKey, [string]$refreshKey, [string]$thisWidth, [string]$thisHeight, [string]$thisRefresh)
	# first check if our params have been passed, only replace those which have been - https://stackoverflow.com/a/48643616
	#  - note bad things can happen otherwise for instance omitting $refreshKey results in often replacing "" with a 
	# separator or " " and a regex which therefore equates to " ".*. So making refresh optional was a large factor here!
	$replaceWidth = ($widthKey  -ne '')
	$replaceHeight = ($heightKey  -ne '')
	$replaceRefresh = ($refreshKey -ne '')

	# negative lookbehind to only replace where you find >=1 height=[NOT 1280]
	# this prevents changing timestamps for no good reason, the conditional structure should replace any one of (good for inconsistent state)
	If ( 
		(($replaceWidth) -And (Select-String -Path $path2conf -Pattern "$widthKey$sep(?!$thisWidth)" -quiet)) -Or 
		(($replaceHeight) -And (Select-String -Path $path2conf -Pattern "$heightKey$sep(?!$thisHeight)" -quiet)) -Or
		(($replaceRefresh) -And (Select-String -Path $path2conf -Pattern "$refreshKey$sep(?!$thisRefresh)" -quiet))
		){
     # this was a nice pipe but I needed conditionals....
			$text = (Get-Content $path2conf) 
			$text2 = IF ($replaceWidth) { Foreach-Object { $text -replace "$widthKey$sep.*", "$widthKey$sep$thisWidth" } } ELSE { $text }
			$text3 = IF ($replaceHeight) { ForEach-Object { $text2 -replace "$heightKey$sep.*", "$heightKey$sep$thisHeight" } } ELSE { $text2 }
			$text4 = IF ($replaceRefresh) { ForEach-Object { $text3 -replace "$refreshKey$sep.*", "$refreshKey$sep$thisRefresh" } } ELSE { $text3 }
			Set-Content -Path $path2conf -Value $text4
		}  
}

# call the generic function, but facade its properties inputs as the passed in screen properties (we can still control which props get replaced with 
#  the property keynames being supplied or not
function replace-systemScreen { 
	param([string]$path2conf, [string]$sep, [string]$widthKey, [string]$heightKey, [string]$refreshKey)
	replace-ScreenProps $path2conf $sep $widthKey $heightKey $refreshKey $WIDTH $HEIGHT $REFRESH
}

# each emulator in turn - I used block quotes for the emu names here just to save a line each time
<#ZINC - renderer.cfg#> replace-systemScreen "\\$MACHINE\Emulators\ARCADE\Zinc\zinc11-win32\renderer.cfg" "			= " "XSize" "YSize"
<#BLUE MSX#> replace-systemScreen "\\$MACHINE\Emulators\BlueMSX\blueMSXv28full\bluemsx.ini"  "=" "video.fullscreen.width" "video.fullscreen.height"
<#Caprice 3.6.1#> replace-systemScreen "\\$MACHINE\Emulators\Amstrad_CPC\CAPRICE\CAPRICE_3.6.1\cap32.cfg"  "=" "scr_width" "scr_height"
<#Caprice 4.2.0#> replace-systemScreen "\\$MACHINE\Emulators\Amstrad_CPC\CAPRICE\caprice_4.2.0\cap32.cfg"  "=" "scr_width" "scr_height"
<#Project64 2.1#> replace-systemScreen "\\$MACHINE\Emulators\Nintendo\N64\Project64\Project64 2.1\Config\Project64.cfg" "=" "FullscreenWidth" "FullscreenHeight"
<#CPS3#> replace-systemScreen "\\$MACHINE\Emulators\ARCADE\CPS3\cps3\emulator.ini" "=" "FullScreenWidth" "FullScreenHeight"
<#EPSXE#> replace-systemScreen "\\$MACHINE\Emulators\SONY\PS1\EPSXE\plugins\gpuPeopsSoftX.cfg" "            = " "ResX" "ResY"
#FBA - this is how it was before generic fn, replacing horizontal and vertical width/height with just width and height#
replace-systemScreen "\\$MACHINE\Emulators\ARCADE\FinalBurn_Alpha\fba\config\fba.ini" " " "nVidHorWidth" "nVidHorHeight"
replace-systemScreen "\\$MACHINE\Emulators\ARCADE\FinalBurn_Alpha\fba\config\fba.ini" " " "nVidVerWidth" "nVidVerHeight"
<#FCEUx#> replace-systemScreen "\\$MACHINE\Emulators\Nintendo\NES\FCEUx\fceux.cfg" " " "`"vmcx`"" "`"vmcy`""
<#M2 1.0#> replace-systemScreen "\\$MACHINE\Emulators\ARCADE\M2\M2\m2emulator_10\EMULATOR.ini" "=" "FullScreenWidth" "FullScreenHeight"
<#Magic Engine#> replace-systemScreen "\\$MACHINE\Emulators\PCEngine\Magic Engine\Magic-Engine113\pce.ini" "=" "screen_width" "screen_height"
<#Magic Engine FX#> replace-systemScreen "\\$MACHINE\Emulators\PCEngine\Magic Engine FX\pcfx.ini" "=" "screen_width" "screen_height"
<#M2 0.9#> replace-systemScreen "\\$MACHINE\Emulators\ARCADE\M2\M2\m2emulator_09\emulator.ini" "=" "FullScreenWidth" "FullScreenHeight"
<#MEDNAFEN v09 config#> replace-systemScreen "\\$MACHINE\Emulators\Mednafen\mednafen\mednafen-09x.cfg" " " "xres" "yres"
<#MEDNAFEN#> replace-systemScreen "\\$MACHINE\Emulators\Mednafen\mednafen\mednafen.cfg" " " "xres" "yres"
<#PSX - note refresh#> replace-systemScreen "\\$MACHINE\Emulators\SONY\PS1\pSX\pSX\psx.ini" "=" "Width" "Height" "Refresh"
<#RAINE#> replace-systemScreen "\\$MACHINE\Emulators\ARCADE\Raine\Raine\config\raine32_sdl.cfg" " = " "screen_x" "screen_y"
<#Supermodel#> replace-systemScreen "\\$MACHINE\Emulators\ARCADE\Supermodel\Supermodel\Config\Supermodel.ini" " = " "XResolution" "YResolution"
<#VisualBoyAdvance#> replace-systemScreen "\\$MACHINE\Emulators\Nintendo\DS GBA GB\VisualBoy Advance\vba.ini" "=" "fsWidth" "fsHeight"
<#Vice - note refresh#> replace-systemScreen "\\$MACHINE\Emulators\Commodore\WinVICE\WinVICE-2.2-x64\vice.ini" "=" "FullscreenWidth" "FullscreenHeight" "FullscreenRefreshRate"
#Winkawaks - two sets of changes for normal and neogeo
replace-systemScreen "\\$MACHINE\Emulators\ARCADE\WinKawaks\winkawaks\WinKawaks.ini" "=" "FullScreenWidth" "FullScreenHeight"
replace-systemScreen "\\$MACHINE\Emulators\ARCADE\WinKawaks\winkawaks\WinKawaks.ini" "=" "FullScreenWidthNeoGeo" "FullScreenHeightNeoGeo"
<#ZSnesW - note refresh#> replace-systemScreen "\\$MACHINE\Emulators\Nintendo\SNES\ZSNES\zsnesw.cfg" "=" "CustomResX" "CustomResY" "SetRefreshRate"
<#ZX Spin#> replace-systemScreen "\\$MACHINE\Emulators\Spectrum\Spin\Default.spincfg" "=" "FullScreenWidth" "FullScreenHeight"

# then less general uses of the fns

#ZINC - it looks like the D3D renderer will only do up to 1280x1024, so lets do multiples, note tv and 4k monitor will get the SAME multiple
IF ( ($WIDTH -eq '2560') -Or ($WIDTH -eq '1280') ) { 
	$FIXED_WIDTH='1280' 
	$FIXED_HEIGHT='800' 
} ELSE { 
	$FIXED_WIDTH='1024' 
	$FIXED_HEIGHT='768' 
}
# now loop through all files in dir, overriding $WIDTH and $HEIGHT in the generic fn
Get-ChildItem "\\$MACHINE\Emulators\ARCADE\Zinc\zinc11-win32\rcfg" *.cfg -recurse |
    Foreach-Object {
		replace-ScreenProps $_.FullName "=" "XSize" "YSize" "" "$FIXED_WIDTH" "$FIXED_HEIGHT"
	}

# AMIGA - uae has a set of 'fullscreen' width and heights, as well as the standard width/height/refresh. TBH i'm not sure i've ever investigated why
function UAE_Replace {
	param([string]$path2conf)
	replace-systemScreen $path2conf "=" "gfx_width" "gfx_height" "gfx_refreshrate"
	replace-systemScreen $path2conf "=" "gfx_width_fullscreen" "gfx_height_fullscreen"
}
# remember that the UAE registry is currently hardcoded to UAE loaders data dir, meaning non-gamebase uae files elsewhere (specifically in
#  UAE's own configurations directory) are not worth changing atm as they aren't even visible to the active winUAE
# so the cd32 config in winuaeloader's directory needs changing, but the one in WinUAE's own configurations dir does not
<#UAE - CD32 with PAD#> UAE_Replace "\\$MACHINE\Emulators\Commodore\Amiga\WinUAELoader\Data\cd32withpad.uae"
<#Gamebase Amiga - disk games #> UAE_Replace "\\$MACHINE\Emulators\GAMEBASE\GameBase Amiga\GameBase Amiga.uae"
<#Gamebase Amiga - whdload#> UAE_Replace "\\$MACHINE\Emulators\GAMEBASE\GameBase Amiga\WHDLoad.uae"
<#DEMObase Amiga#> UAE_Replace "\\$MACHINE\Emulators\GAMEBASE\Amiga demobase\GameBase Amiga.uae"
#<#UAE's main dir #> UAE_Replace "\\$MACHINE\Emulators\Commodore\Amiga\WinUAE\WINUAE\Configurations\default.uae"
#<#UAE - CD32 with PAD#> UAE_Replace "\\$MACHINE\Emulators\Commodore\Amiga\WinUAE\WINUAE\Configurations\cd32withpad.uae"

#now that bit is for WinUAELoader is a bit manual. If Width is 1366 we'll set 14, if 1800 or 1920 we want 19 and so on...
IF ($WIDTH -eq "1366") { $SCREEN = 14 }
ELSEIF ($WIDTH -eq "1280") { $SCREEN = 11 }
ELSEIF ($WIDTH -eq "2560") { $SCREEN = 29 }
ELSE { $SCREEN = 19 }
# now we can bastardise the generic function and use its ability to only call one of its replacement params (ie: this isn't width but works)
replace-ScreenProps "\\$MACHINE\Emulators\Commodore\Amiga\WinUAELoader\Data\WinUAELoader.ini" "=" "Screen" "" "" $SCREEN

# MEGADRIVE - we need a similar trick for Kega Fusion (which doesn't like 4k resolutions btw, so we stick to 2k....)
IF ($WIDTH -eq "1920" -or $WIDTH -eq "3840") { $FusionString = "56,4,128,7" } #4k or tv
 ELSEIF ($WIDTH -eq "1280" -or $WIDTH -eq "2560") { $FusionString = "32,3,0,5" } #current laptops 1280x800
ELSE { $FusionString = "224,1,128,2" } #default to 640x480 if something else happenss
replace-ScreenProps "\\$MACHINE\Emulators\SEGA\Fusion\Fusion\Fusion.ini" "=" "DResolution" "" "" $FusionString

# Then these varients, which almost fit the mould of the generic function but don't quite, and aren't general enough to warrant modding
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