# to test things in here open up the powershell ide/ise, set these values to hardcoded results and change $MACHINE/Emulators/ to P:/

#we set our Machine, Width and Height and Refresh Rate - pass to script as THISSCRIPT.ps1 MACHINE_B 1800 1440 72
$MACHINE = $args[0] #so e.g.:SEAEEE
$WIDTH = $args[1] #Width Gets changed to eg: 1800
$HEIGHT = $args[2] #And height Gets changed to eg: 1440
$REFRESH = $args[3] #set refresh rate (UAE needs this for a start) gets changed to 72 (HZ that is)

# first deal with general properties to change due to desktop/laptop power etc
# note the ^\s* - we don't want to replace false positives (e.g.: had an issue with Screen=19 and Fullscreen=1)
# but in the same spirit we don't want to check and find a false positive either, since this will cause a write
# even if it does no harm beacause we replace the right thing
$BOL = "^\s*"
# regex in this domain is fairly standard see https://www.zerrouki.com/powershell-cheatsheet-regular-expressions/

function genericCheckAndReplace {
	param([string]$line, [string]$sep, [string]$key, [string]$val)
	IF (Select-String -InputObject $line -Pattern "$BOL$key$sep(?!$val)" -quiet) 
        {$line -replace "$BOL$key$sep.*", "$key$sep$val" } ELSE { $line }
}

#PCSX2 can look very nice on the desktop, change every setting needed to make that so, one by one...
# however note if you switch on machine, you might be in tv mode, so don't actually change resolution here
$path2conf = "P:\SONY\PS2\pcsx2\pcsx2\inis\GSdx.ini" 
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
$content = Get-Content $path2conf
$changed = $content| #note % is just 'Foreach-Object', and in this context it just means a line
    % { genericCheckAndReplace $_ " = " "upscale_multiplier" $upscale_multiplier } |
    % { genericCheckAndReplace $_ " = " "filter" $filter } |
    % { genericCheckAndReplace $_ " = " "UserHacks_MSAA" $UserHacks_MSAA } |
    % { genericCheckAndReplace $_ " = " "MaxAnisotropy" $MaxAnisotropy } |
    % { genericCheckAndReplace $_ " = " "Userhacks_align_sprite_X" $Userhacks_align_sprite_X } |
    % { genericCheckAndReplace $_ " = " "UserHacks_unscale_point_line" $UserHacks_unscale_point_line } |
    % { genericCheckAndReplace $_ " = " "wrap_gs_mem" $wrap_gs_mem } #NO LAST PIPE CHARACTER PLEASE!!!
IF (Compare-Object -ReferenceObject $content -DifferenceObject $changed) { Set-Content $path2conf -Value $changed }

# now similar for dolphin on retroarch - note all of retroarch's values are double-quoted
$path2conf = "P:\Retroarch\RetroArch\retroarch-core-options.cfg"
switch ($WIDTH) {
  "3840" {
    $dolphin_efb_scale = "`"x6 (3840 x 3168)`""
    break
  }
  default {
    $dolphin_efb_scale = "`"x2 (1280 x 1056)`""
    break
  }
}
$content = Get-Content $path2conf
$changed = $content| #note % is just 'Foreach-Object', and in this context it just means a line
    % { genericCheckAndReplace $_ " = " "dolphin_efb_scale" $dolphin_efb_scale } #NO LAST PIPE CHARACTER PLEASE!!!
IF (Compare-Object -ReferenceObject $content -DifferenceObject $changed) { Set-Content $path2conf -Value $changed }

#Then deal with width/height and screen res, which can have a generic function, that mostly gets facaded with the passed in props

function Replace-ScreenProps {
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
		(($replaceWidth) -And (Select-String -Path $path2conf -Pattern "$BOL$widthKey$sep(?!$thisWidth)" -quiet)) -Or 
		(($replaceHeight) -And (Select-String -Path $path2conf -Pattern "$BOL$heightKey$sep(?!$thisHeight)" -quiet)) -Or
		(($replaceRefresh) -And (Select-String -Path $path2conf -Pattern "$BOL$refreshKey$sep(?!$thisRefresh)" -quiet))
		){
     # https://stackoverflow.com/a/11652395 and note % is just 'Foreach-Object'
			(Get-Content $path2conf) |
			% { IF ($replaceWidth) {$_ -replace "$BOL$widthKey$sep.*", "$widthKey$sep$thisWidth"} ELSE {$_} } |
			% { IF ($replaceHeight) {$_ -replace "$BOL$heightKey$sep.*", "$heightKey$sep$thisHeight"} ELSE {$_} } |
			% { IF ($replaceRefresh) {$_ -replace "$BOL$refreshKey$sep.*", "$refreshKey$sep$thisRefresh"} ELSE {$_} } |
			Set-Content $path2conf
		}  
}

# call the generic function, but facade its properties inputs as the passed in screen properties (we can still control which props get replaced with 
#  the property keynames being supplied or not)
function Replace-SystemScreen { 
	param([string]$path2conf, [string]$sep, [string]$widthKey, [string]$heightKey, [string]$refreshKey)
	Replace-ScreenProps $path2conf $sep $widthKey $heightKey $refreshKey $WIDTH $HEIGHT $REFRESH
}

# a useful further facade is to call the generic function but only call and replace one arg, creating a generic setting replacer
function Replace-Setting {
	param([string]$path2conf, [string]$sep, [string]$key, [string]$val)
	Replace-ScreenProps $path2conf $sep $key "" "" $val
}

# each emulator in turn - I used block quotes for the emu names here just to save a line each time
<#ZINC - renderer.cfg#> Replace-SystemScreen "P:\ARCADE\Zinc\zinc11-win32\renderer.cfg" "			= " "XSize" "YSize"
<#BLUE MSX#> Replace-SystemScreen "P:\BlueMSX\blueMSXv28full\bluemsx.ini"  "=" "video.fullscreen.width" "video.fullscreen.height"
<#Caprice 3.6.1#> Replace-SystemScreen "P:\Amstrad_CPC\CAPRICE\CAPRICE_3.6.1\cap32.cfg"  "=" "scr_width" "scr_height"
<#Caprice 4.2.0#> Replace-SystemScreen "P:\Amstrad_CPC\CAPRICE\caprice_4.2.0\cap32.cfg"  "=" "scr_width" "scr_height"
<#Project64 2.1#> Replace-SystemScreen "P:\Nintendo\N64\Project64\Project64 2.1\Config\Project64.cfg" "=" "FullscreenWidth" "FullscreenHeight"
<#CPS3#> Replace-SystemScreen "P:\ARCADE\CPS3\cps3\emulator.ini" "=" "FullScreenWidth" "FullScreenHeight"
<#EPSXE#> Replace-SystemScreen "P:\SONY\PS1\EPSXE\plugins\gpuPeopsSoftX.cfg" "            = " "ResX" "ResY"
#FBA - this is how it was before generic fn, replacing horizontal and vertical width/height with just width and height#
Replace-SystemScreen "P:\ARCADE\FinalBurn_Alpha\fba\config\fba.ini" " " "nVidHorWidth" "nVidHorHeight"
Replace-SystemScreen "P:\ARCADE\FinalBurn_Alpha\fba\config\fba.ini" " " "nVidVerWidth" "nVidVerHeight"
<#FCEUx#> Replace-SystemScreen "P:\Nintendo\NES\FCEUx\fceux.cfg" " " "`"vmcx`"" "`"vmcy`""
<#M2 1.0#> Replace-SystemScreen "P:\ARCADE\M2\M2\m2emulator_10\EMULATOR.ini" "=" "FullScreenWidth" "FullScreenHeight"
<#Magic Engine#> Replace-SystemScreen "P:\PCEngine\Magic Engine\Magic-Engine113\pce.ini" "=" "screen_width" "screen_height"
<#Magic Engine FX#> Replace-SystemScreen "P:\PCEngine\Magic Engine FX\pcfx.ini" "=" "screen_width" "screen_height"
<#M2 0.9#> Replace-SystemScreen "P:\ARCADE\M2\M2\m2emulator_09\emulator.ini" "=" "FullScreenWidth" "FullScreenHeight"
<#M2 1.0#> Replace-SystemScreen "P:\ARCADE\M2\M2\m2emulator_10\emulator.ini" "=" "FullScreenWidth" "FullScreenHeight"
<#MEDNAFEN v09 config#> Replace-SystemScreen "P:\Mednafen\mednafen\mednafen-09x.cfg" " " "xres" "yres"
<#MEDNAFEN#> Replace-SystemScreen "P:\Mednafen\mednafen\mednafen.cfg" " " "xres" "yres"
<#PSX - note refresh#> Replace-SystemScreen "P:\SONY\PS1\pSX\pSX\psx.ini" "=" "Width" "Height" "Refresh"
<#RAINE#> Replace-SystemScreen "P:\ARCADE\Raine\Raine\config\raine32_sdl.cfg" " = " "screen_x" "screen_y"
<#Supermodel#> Replace-SystemScreen "P:\ARCADE\Supermodel\Supermodel\Config\Supermodel.ini" " = " "XResolution" "YResolution"
<#VisualBoyAdvance#> Replace-SystemScreen "P:\Nintendo\DS GBA GB\VisualBoy Advance\vba.ini" "=" "fsWidth" "fsHeight"
<#Vice - note refresh#> Replace-SystemScreen "P:\Commodore\WinVICE\WinVICE-2.2-x64\vice.ini" "=" "FullscreenWidth" "FullscreenHeight" "FullscreenRefreshRate"
#Winkawaks - two sets of changes for normal and neogeo
Replace-SystemScreen "P:\ARCADE\WinKawaks\winkawaks\WinKawaks.ini" "=" "FullScreenWidth" "FullScreenHeight"
Replace-SystemScreen "P:\ARCADE\WinKawaks\winkawaks\WinKawaks.ini" "=" "FullScreenWidthNeoGeo" "FullScreenHeightNeoGeo"
<#ZSnesW - note refresh#> Replace-SystemScreen "P:\Nintendo\SNES\ZSNES\zsnesw.cfg" "=" "CustomResX" "CustomResY" "SetRefreshRate"
<#ZX Spin#> Replace-SystemScreen "P:\Spectrum\Spin\Default.spincfg" "=" "FullScreenWidth" "FullScreenHeight"

# then less general uses of the fns
# I think a subtlety here is if computername is RIVER, it could be in tv mode, hence the actual res passed in instead of $MACHINE

# AMIGA - uae has a set of 'fullscreen' width and heights, as well as the standard width/height/refresh. TBH i'm not sure i've ever investigated why
function Replace-UAE {
	param([string]$path2conf)
	Replace-SystemScreen $path2conf "=" "gfx_width" "gfx_height" "gfx_refreshrate"
	Replace-SystemScreen $path2conf "=" "gfx_width_fullscreen" "gfx_height_fullscreen"
}
# remember that the UAE registry is currently hardcoded to UAE loaders data dir, meaning non-gamebase uae files elsewhere (specifically in
#  UAE's own configurations directory) are not worth changing atm as they aren't even visible to the active winUAE
# so the cd32 config in winuaeloader's directory needs changing, but the one in WinUAE's own configurations dir does not
<#UAE - CD32 with PAD#> Replace-UAE "P:\Commodore\Amiga\WinUAELoader\Data\cd32withpad.uae"
<#Gamebase Amiga - disk games #> Replace-UAE "P:\GAMEBASE\GameBase Amiga\GameBase Amiga.uae"
<#Gamebase Amiga - whdload#> Replace-UAE "P:\GAMEBASE\GameBase Amiga\WHDLoad.uae"
<#WinUAELoader Gamebase Amiga - disk games #> Replace-UAE "P:\Commodore\Amiga\WinUAELoader\Data\GameBase.uae"
<#WinUAELoader Gamebase Amiga - whdload#> Replace-UAE "P:\Commodore\Amiga\WinUAELoader\Data\WHDLoad.uae"
<#DEMObase Amiga#> Replace-UAE "P:\GAMEBASE\Amiga demobase\GameBase Amiga.uae"
#<#UAE's main dir #> Replace-UAE "P:\Commodore\Amiga\WinUAE\WINUAE\Configurations\default.uae"
#<#UAE - CD32 with PAD#> Replace-UAE "P:\Commodore\Amiga\WinUAE\WINUAE\Configurations\cd32withpad.uae"

# now that bit is for WinUAELoader is a bit manual. If Width is 1366 we'll set 14, if 1800 or 1920 we want 19 and so on...
# why is 1366 '14' yet 2880 '12'? the value is just index in auto-generated array based on system res, however this is brittle as at one point
# they were BOTH index 14, prob operating system changes altered the 2880 machines resolutions
IF ($WIDTH -eq "1366"){ $SCREEN = 14 }
ELSEIF ($WIDTH -eq "2880") { $SCREEN = 12 }
ELSEIF ($WIDTH -eq "1280") { $SCREEN = 11 }
ELSEIF ($WIDTH -eq "2560") { $SCREEN = 29 }
ELSE { $SCREEN = 19 }
Replace-Setting "P:\Commodore\Amiga\WinUAELoader\Data\WinUAELoader.ini" "=" "Screen" $SCREEN

# C64 - ccs64. Same deal as the above, oddly all the variables in the cfg really do start with $ but its less confusing to omit it than to single quote it
# again this vintage emulator doesn't like real resolutions so where we can set it to 2880x1800 it postage stamps, so set to 1920x1200,
# why this number equates to the same as 1280's setting I don't know
IF ($WIDTH -eq "1280" -or $WIDTH -eq "2880") { $SCREENMODE = 14 }
ELSEIF ($WIDTH -eq "2560") { $SCREENMODE = 32 }
ELSE { $SCREENMODE = 32 } # for some reason the res of the 4k monitor causes it to postage stamp, and i think 32 will also work for both tv and 4k
Replace-Setting "P:\Commodore\C64\CCS64\c64.cfg" "=" "SCREENMODE" $SCREENMODE

# MEGADRIVE - we need a similar trick for Kega Fusion (which doesn't like 4k resolutions btw, so we stick to 2k....)
# To work out a resolution, load fusion.exe, change fullscreen resolution, switch to it and exit, now check DResolution in its config
IF ($WIDTH -eq "1920" -or $WIDTH -eq "3840") { $FusionString = "56,4,128,7" } #4k or tv
ELSEIF ($WIDTH -eq "2880") { $FusionString = "176,4,128,7" } #actually fusion can cope with 1920x1200 which is the largest we'll get with our 2880x1800
ELSEIF ($WIDTH -eq "1280" -or $WIDTH -eq "2560") { $FusionString = "32,3,0,5" } #current laptops 1280x800
ELSE { $FusionString = "224,1,128,2" } #default to 640x480 if something else happenss (actually thats what fusion will automatically do if problems)
Replace-Setting "P:\SEGA\Fusion\Fusion\Fusion.ini" "=" "DResolution" $FusionString

#NESTOPIA - tony the pony...here we are, regexing xml....the original version of this made it very clear its xml
#  note as such its the only case in which the separator is nothing
$widthAndEndTag = "$WIDTH</width>"
$heightAndEndTag = "$HEIGHT</height>"
Replace-ScreenProps "P:\Nintendo\NES\Nestopia\Nestopia140bin\nestopia.xml" "" "<width>" "<height>" "" $widthAndEndTag $heightAndEndTag

#Stella - just the general case of a generic replacement (instead of 'width') but a combination
$fullres = "$WIDTH x $HEIGHT"
Replace-Setting "P:\Atari\Atari 2600\Stella\stella-2.6.1\stella.ini" " = " "fullres" $fullres

#ZINC - do a recursive replace using the fn
# it looks like the D3D renderer will only do up to 1280x1024, so lets do multiples, note tv and 4k monitor will get the SAME multiple
IF ( ($WIDTH -eq '2560') -Or ($WIDTH -eq '1280') ) { 
	$FIXED_WIDTH='1280' 
	$FIXED_HEIGHT='800' 
} ELSE { 
	$FIXED_WIDTH='1024' 
	$FIXED_HEIGHT='768' 
}
# now loop through all files in dir, overriding $WIDTH and $HEIGHT in the generic fn
Get-ChildItem "P:\ARCADE\Zinc\zinc11-win32\rcfg" *.cfg -recurse |
    Foreach-Object {
		Replace-ScreenProps $_.FullName "=" "XSize" "YSize" "" "$FIXED_WIDTH" "$FIXED_HEIGHT"
	}