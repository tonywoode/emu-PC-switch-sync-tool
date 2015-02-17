#we set our Machine, Width and Height and Refresh Rate - pass to script as THISSCRIPT.ps1 MACHINE_B 1024 1800 600 1440 65 72
#so e.g.:SEAEEE
$MACHINE_B = $args[0]
#So eg: 1024
$WIDTH_A = $args[1]
#Gets changed to eg: 1800
$WIDTH_B = $args[2]
#and eg: 600
$HEIGHT_A = $args[3]
#Gets changed to eg: 1440
$HEIGHT_B = $args[4]
#Then let's set the refresh rate (UAE needs this for a start)
$REFRESH_A = $args[5]
#so that's e.g.: 65 (HZ that is)
$REFRESH_B = $args[6]
#gets changed to 72 (HZ that is)

#First all the amiga stuff
#Let's define a funtion for all these
function UAE_SCREEN {
(Get-Content $path2emu) |
Foreach-Object { $_ -replace "gfx_width=.*", "gfx_width=$WIDTH_B" } | 
ForEach-Object { $_ -replace "gfx_height=.*", "gfx_height=$HEIGHT_B" } | 
Foreach-Object { $_ -replace "gfx_width_fullscreen=.*", "gfx_width_fullscreen=$WIDTH_B" } | 
ForEach-Object { $_ -replace "gfx_height_fullscreen=.*", "gfx_height_fullscreen=$HEIGHT_B" } | 
ForEach-Object { $_ -replace "gfx_refreshrate=.*", "gfx_refreshrate=$REFRESH_B" } |
Set-Content $path2emu
}

#And let's do each one in term using the function
#UAE - default
$path2emu = "\\$MACHINE_B\Emulators\Commodore\Amiga\WinUAE\WINUAE\Configurations\default.uae"
UAE_SCREEN

#UAE - CD32 with PAD
$path2emu = "\\$MACHINE_B\Emulators\Commodore\Amiga\WinUAE\WINUAE\Configurations\cd32withpad.uae"
UAE_SCREEN

#Gamebase Amiga - Gamebase Amiga
$path2emu = "\\$MACHINE_B\Emulators\GAMEBASE\GameBase Amiga\GameBase Amiga.uae"
UAE_SCREEN

#Gamebase Amiga - whdload
$path2emu = "\\$MACHINE_B\Emulators\GAMEBASE\GameBase Amiga\WHDLoad.uae"
UAE_SCREEN

#DEMObase Amiga - Gamebase Amiga
$path2emu = "\\$MACHINE_B\Emulators\GAMEBASE\Amiga demobase\GameBase Amiga.uae"
UAE_SCREEN

#now that bit is for WinUAELoader is a bit manual. Is Width is 1366 we'll set 14, if 1800 or 1920 we want 19
IF ($WIDTH_B -eq "1366") { $SCREEN = 14 }
ELSEIF ($WIDTH_B -eq "1280") { $SCREEN = 11 } 
ELSE { $SCREEN = 19 }
$path2emu = "\\$MACHINE_B\Emulators\Commodore\Amiga\WinUAELoader\Data\WinUAELoader.ini"
(Get-Content $path2emu) |
Foreach-Object { $_ -replace "Screen=.*", "Screen=$SCREEN" } |
Set-Content $path2emu

#Then the sensible stuff

#BLUE MSX
$path2emu = "\\$MACHINE_B\Emulators\BlueMSX\blueMSXv28full\bluemsx.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "video.fullscreen.width=.*", "video.fullscreen.width=$WIDTH_B" } | 
ForEach-Object { $_ -replace "video.fullscreen.height=.*", "video.fullscreen.height=$HEIGHT_B" } | 
Set-Content $path2emu

#Caprice 3.6.1
$path2emu = "\\$MACHINE_B\Emulators\Amstrad_CPC\CAPRICE\CAPRICE_3.6.1\cap32.cfg"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "scr_width=.*", "scr_width=$WIDTH_B" } | 
ForEach-Object { $_ -replace "scr_height=.*", "scr_height=$HEIGHT_B" } | 
Set-Content $path2emu

#Caprice 4.2.0
$path2emu = "\\$MACHINE_B\Emulators\Nintendo\N64\Project64\Project64 2.1\Config\Project64.cfg"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "FullscreenWidth=.*", "FullscreenWidth=$WIDTH_B" } | 
ForEach-Object { $_ -replace "FullscreenHeight=.*", "FullscreenHeight=$HEIGHT_B" } | 
Set-Content $path2emu

#Project64 2.1
$path2emu = "\\$MACHINE_B\Emulators\Amstrad_CPC\CAPRICE\caprice_4.2.0\cap32.cfg"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "scr_width=.*", "scr_width=$WIDTH_B" } | 
ForEach-Object { $_ -replace "scr_height=.*", "scr_height=$HEIGHT_B" } | 
Set-Content $path2emu

#CPS3
$path2emu = "\\$MACHINE_B\Emulators\ARCADE\CPS3\cps3\emulator.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "FullScreenWidth=.*", "FullScreenWidth=$WIDTH_B" } | 
ForEach-Object { $_ -replace "FullScreenHeight=.*", "FullScreenHeight=$HEIGHT_B" } | 
Set-Content $path2emu

#EPSXE
$path2emu = "\\$MACHINE_B\Emulators\SONY\PS1\EPSXE\plugins\gpuPeopsSoftX.cfg"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "ResX            = .*", "ResX            = $WIDTH_B" } | 
ForEach-Object { $_ -replace "ResY            = .*", "ResY            = $HEIGHT_B" } | 
Set-Content $path2emu

#FBA
$path2emu = "\\$MACHINE_B\Emulators\ARCADE\FinalBurn_Alpha\fba\config\fba.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "nVidHorWidth .*", "nVidHorWidth $WIDTH_B" } | 
ForEach-Object { $_ -replace "nVidHorHeight .*", "nVidHorHeight $HEIGHT_B" } | 
Foreach-Object { $_ -replace "nVidVerWidth .*", "nVidVerWidth $WIDTH_B" } | 
ForEach-Object { $_ -replace "nVidVerHeight .*", "nVidVerHeight $HEIGHT_B" } | 
Set-Content $path2emu

#FCEUx
$path2emu = "\\$MACHINE_B\Emulators\Nintendo\NES\FCEUx\fceux.cfg"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "`"vmcx`" .*", "`"vmcx`" $WIDTH_B" } | 
ForEach-Object { $_ -replace "`"vmcy`" .*", "`"vmcy`" $HEIGHT_B" } | 
Set-Content $path2emu

#M2 1.0
$path2emu = "\\$MACHINE_B\Emulators\ARCADE\M2\M2\m2emulator_10\EMULATOR.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "FullScreenWidth=.*", "FullScreenWidth=$WIDTH_B" } | 
ForEach-Object { $_ -replace "FullScreenHeight=.*", "FullScreenHeight=$HEIGHT_B" } | 
Set-Content $path2emu

#Magic Engine
$path2emu = "\\$MACHINE_B\Emulators\PCEngine\Magic Engine\Magic-Engine113\pce.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "screen_width=.*", "screen_width=$WIDTH_B" } | 
ForEach-Object { $_ -replace "screen_height=.*", "screen_height=$HEIGHT_B" } |
Set-Content $path2emu
#Magic Engine FX
$path2emu = "\\$MACHINE_B\Emulators\PCEngine\Magic Engine FX\pcfx.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "screen_width=.*", "screen_width=$WIDTH_B" } | 
ForEach-Object { $_ -replace "screen_height=.*", "screen_height=$HEIGHT_B" } |
Set-Content $path2emu
#M2 0.9
$path2emu = "\\$MACHINE_B\Emulators\ARCADE\M2\M2\m2emulator_09\emulator.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "FullScreenWidth=.*", "FullScreenWidth=$WIDTH_B" } | 
ForEach-Object { $_ -replace "FullScreenHeight=.*", "FullScreenHeight=$HEIGHT_B" } | 
Set-Content $path2emu

#MEDNAFEN
$path2emu = "\\$MACHINE_B\Emulators\Mednafen\mednafen-0.8.B-win32\mednafen.cfg"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "xres .*", "xres $WIDTH_B" } | 
ForEach-Object { $_ -replace "yres .*", "yres $HEIGHT_B" } | 
Set-Content $path2emu

#NESTOPIA
$path2emu = "\\$MACHINE_B\Emulators\Nintendo\NES\Nestopia\Nestopia140bin\nestopia.xml"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "<width>.*</width>", "<width>$WIDTH_B</width>" } | 
Foreach-Object { $_ -replace "<height>.*</height>", "<height>$HEIGHT_B</height>" } | 
Set-Content $path2emu

#PSX
$path2emu = "\\$MACHINE_B\Emulators\SONY\PS1\pSX\pSX\psx.ini"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "Width=.*", "Width=$WIDTH_B" } | 
Foreach-Object { $_ -replace "Height=.*", "Height=$HEIGHT_B" } | 
Foreach-Object { $_ -replace "Refresh=.*", "Refresh=$REFRESH_B" } | 
Set-Content $path2emu

#RAINE
$path2emu = "\\$MACHINE_B\Emulators\ARCADE\Raine\Raine\config\raine32_sdl.cfg"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "screen_x = .*", "screen_x = $WIDTH_B" } | 
Foreach-Object { $_ -replace "screen_y = .*", "screen_y = $HEIGHT_B" } | 
Set-Content $path2emu

#Stella
$path2emu = "\\$MACHINE_B\Emulators\Atari\Atari 2600\Stella\stella-2.6.1\stella.ini"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "fullres = .*", "fullres = $WIDTH_B x $HEIGHT_B" } | 
Set-Content $path2emu

#Supermodel
$path2emu = "\\$MACHINE_B\Emulators\ARCADE\Supermodel\Supermodel\Config\Supermodel.ini"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "XResolution = .*", "XResolution = $WIDTH_B" } | 
Foreach-Object { $_ -replace "YResolution = .*", "YResolution = $HEIGHT_B" } | 
Set-Content $path2emu

#VisualBoyAdvance
$path2emu = "\\$MACHINE_B\Emulators\Nintendo\DS GBA GB\VisualBoy Advance\vba.ini"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "fsWidth=.*", "fsWidth=$WIDTH_B" } | 
ForEach-Object { $_ -replace "fsHeight=.*", "fsHeight=$HEIGHT_B" } |
Set-Content $path2emu

#Vice
$path2emu = "\\$MACHINE_B\Emulators\Commodore\WinVICE\WinVICE-2.2-x64\vice.ini"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "FullscreenWidth=.*", "FullscreenWidth=$WIDTH_B" } | 
ForEach-Object { $_ -replace "FullscreenHeight=.*", "FullscreenHeight=$HEIGHT_B" } | 
ForEach-Object { $_ -replace "FullscreenRefreshRate=.*", "FullscreenRefreshRate=$REFRESH_B" } | 
Set-Content $path2emu

#Winkawaks
$path2emu = "\\$MACHINE_B\Emulators\ARCADE\WinKawaks\winkawaks\WinKawaks.ini"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "FullScreenWidth=.*", "FullScreenWidth=$WIDTH_B" } | 
ForEach-Object { $_ -replace "FullScreenHeight=.*", "FullScreenHeight=$HEIGHT_B" } | 
ForEach-Object { $_ -replace "FullScreenWidthNeoGeo=.*", "FullScreenWidthNeoGeo=$WIDTH_B" } | 
ForEach-Object { $_ -replace "FullScreenHeightNeoGeo=.*", "FullScreenHeightNeoGeo=$HEIGHT_B" } | 
Set-Content $path2emu

#ZINC - all files in dir
Get-ChildItem "\\$MACHINE_B\Emulators\ARCADE\Zinc\zinc11-win32\rcfg" *.cfg -recurse |
    Foreach-Object {
        $c = ($_ | Get-Content) 
        $c = $c -replace "XSize=.*", "XSize=$WIDTH_B"
		$c = $c -replace "YSize=.*", "YSize=$HEIGHT_B"
        [IO.File]::WriteAllText($_.FullName, ($c -join "`r`n"))
		}

#ZINC - renderer.cfg
$path2emu = "\\$MACHINE_B\Emulators\ARCADE\Zinc\zinc11-win32\renderer.cfg"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "XSize			= .*", "XSize			= $WIDTH_B" } | 
Foreach-Object { $_ -replace "YSize			= .*", "YSize			= $HEIGHT_B" } | 
Set-Content $path2emu

#ZSnesW
$path2emu = "\\$MACHINE_B\Emulators\Nintendo\SNES\ZSNES\zsnesw.cfg"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "CustomResX=.*", "CustomResX=$WIDTH_B" } | 
ForEach-Object { $_ -replace "CustomResY=.*", "CustomResY=$HEIGHT_B" } | 
ForEach-Object { $_ -replace "SetRefreshRate=.*", "SetRefreshRate=$REFRESH_B" } | 
Set-Content $path2emu

#ZX Spin
$path2emu = "\\$MACHINE_B\Emulators\Spectrum\Spin\Default.spincfg"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "FullScreenWidth=.*", "FullScreenWidth=$WIDTH_B" } | 
ForEach-Object { $_ -replace "FullScreenHeight=.*", "FullScreenHeight=$HEIGHT_B" } | 
Set-Content $path2emu


#and lastly, we might be running this script to just change from river's monitor to the TV
#so we should include changing from the two files list also, it doesn't matter if we change these now
#because in a second, if we aren't doing that, we'll run the twofiles list and its just going to replace the file
#however, because none of the twofiles list currently specifies refresh or frame rate, we don't need to