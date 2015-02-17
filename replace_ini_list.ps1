#we set our Machine, Width and Height and Refresh Rate - pass to script as THISSCRIPT.ps1 MACHINE_B 1024 1800 600 1440 65 72
#so e.g.:SEAEEE
$MACHINE = $args[0]
#Width Gets changed to eg: 1800
$WIDTH = $args[2]
#And height Gets changed to eg: 1440
$HEIGHT = $args[4]
#Then let's set the refresh rate (UAE needs this for a start)
$REFRESH = $args[6]
#gets changed to 72 (HZ that is)

#First all the amiga stuff
#Let's define a funtion for all these
function UAE_SCREEN {
(Get-Content $path2emu) |
Foreach-Object { $_ -replace "gfx_width=.*", "gfx_width=$WIDTH" } | 
ForEach-Object { $_ -replace "gfx_height=.*", "gfx_height=$HEIGHT" } | 
Foreach-Object { $_ -replace "gfx_width_fullscreen=.*", "gfx_width_fullscreen=$WIDTH" } | 
ForEach-Object { $_ -replace "gfx_height_fullscreen=.*", "gfx_height_fullscreen=$HEIGHT" } | 
ForEach-Object { $_ -replace "gfx_refreshrate=.*", "gfx_refreshrate=$REFRESH" } |
Set-Content $path2emu
}

#And let's do each one in term using the function
#UAE - default
$path2emu = "\\$MACHINE\Emulators\Commodore\Amiga\WinUAE\WINUAE\Configurations\default.uae"
UAE_SCREEN

#UAE - CD32 with PAD
$path2emu = "\\$MACHINE\Emulators\Commodore\Amiga\WinUAE\WINUAE\Configurations\cd32withpad.uae"
UAE_SCREEN

#Gamebase Amiga - Gamebase Amiga
$path2emu = "\\$MACHINE\Emulators\GAMEBASE\GameBase Amiga\GameBase Amiga.uae"
UAE_SCREEN

#Gamebase Amiga - whdload
$path2emu = "\\$MACHINE\Emulators\GAMEBASE\GameBase Amiga\WHDLoad.uae"
UAE_SCREEN

#DEMObase Amiga - Gamebase Amiga
$path2emu = "\\$MACHINE\Emulators\GAMEBASE\Amiga demobase\GameBase Amiga.uae"
UAE_SCREEN

#now that bit is for WinUAELoader is a bit manual. Is Width is 1366 we'll set 14, if 1800 or 1920 we want 19
IF ($WIDTH -eq "1366") { $SCREEN = 14 }
ELSEIF ($WIDTH -eq "1280") { $SCREEN = 11 } 
ELSE { $SCREEN = 19 }
$path2emu = "\\$MACHINE\Emulators\Commodore\Amiga\WinUAELoader\Data\WinUAELoader.ini"
(Get-Content $path2emu) |
Foreach-Object { $_ -replace "Screen=.*", "Screen=$SCREEN" } |
Set-Content $path2emu

#Then the sensible stuff

#BLUE MSX
$path2emu = "\\$MACHINE\Emulators\BlueMSX\blueMSXv28full\bluemsx.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "video.fullscreen.width=.*", "video.fullscreen.width=$WIDTH" } | 
ForEach-Object { $_ -replace "video.fullscreen.height=.*", "video.fullscreen.height=$HEIGHT" } | 
Set-Content $path2emu

#Caprice 3.6.1
$path2emu = "\\$MACHINE\Emulators\Amstrad_CPC\CAPRICE\CAPRICE_3.6.1\cap32.cfg"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "scr_width=.*", "scr_width=$WIDTH" } | 
ForEach-Object { $_ -replace "scr_height=.*", "scr_height=$HEIGHT" } | 
Set-Content $path2emu

#Caprice 4.2.0
$path2emu = "\\$MACHINE\Emulators\Nintendo\N64\Project64\Project64 2.1\Config\Project64.cfg"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "FullscreenWidth=.*", "FullscreenWidth=$WIDTH" } | 
ForEach-Object { $_ -replace "FullscreenHeight=.*", "FullscreenHeight=$HEIGHT" } | 
Set-Content $path2emu

#Project64 2.1
$path2emu = "\\$MACHINE\Emulators\Amstrad_CPC\CAPRICE\caprice_4.2.0\cap32.cfg"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "scr_width=.*", "scr_width=$WIDTH" } | 
ForEach-Object { $_ -replace "scr_height=.*", "scr_height=$HEIGHT" } | 
Set-Content $path2emu

#CPS3
$path2emu = "\\$MACHINE\Emulators\ARCADE\CPS3\cps3\emulator.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "FullScreenWidth=.*", "FullScreenWidth=$WIDTH" } | 
ForEach-Object { $_ -replace "FullScreenHeight=.*", "FullScreenHeight=$HEIGHT" } | 
Set-Content $path2emu

#EPSXE
$path2emu = "\\$MACHINE\Emulators\SONY\PS1\EPSXE\plugins\gpuPeopsSoftX.cfg"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "ResX            = .*", "ResX            = $WIDTH" } | 
ForEach-Object { $_ -replace "ResY            = .*", "ResY            = $HEIGHT" } | 
Set-Content $path2emu

#FBA
$path2emu = "\\$MACHINE\Emulators\ARCADE\FinalBurn_Alpha\fba\config\fba.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "nVidHorWidth .*", "nVidHorWidth $WIDTH" } | 
ForEach-Object { $_ -replace "nVidHorHeight .*", "nVidHorHeight $HEIGHT" } | 
Foreach-Object { $_ -replace "nVidVerWidth .*", "nVidVerWidth $WIDTH" } | 
ForEach-Object { $_ -replace "nVidVerHeight .*", "nVidVerHeight $HEIGHT" } | 
Set-Content $path2emu

#FCEUx
$path2emu = "\\$MACHINE\Emulators\Nintendo\NES\FCEUx\fceux.cfg"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "`"vmcx`" .*", "`"vmcx`" $WIDTH" } | 
ForEach-Object { $_ -replace "`"vmcy`" .*", "`"vmcy`" $HEIGHT" } | 
Set-Content $path2emu

#M2 1.0
$path2emu = "\\$MACHINE\Emulators\ARCADE\M2\M2\m2emulator_10\EMULATOR.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "FullScreenWidth=.*", "FullScreenWidth=$WIDTH" } | 
ForEach-Object { $_ -replace "FullScreenHeight=.*", "FullScreenHeight=$HEIGHT" } | 
Set-Content $path2emu

#Magic Engine
$path2emu = "\\$MACHINE\Emulators\PCEngine\Magic Engine\Magic-Engine113\pce.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "screen_width=.*", "screen_width=$WIDTH" } | 
ForEach-Object { $_ -replace "screen_height=.*", "screen_height=$HEIGHT" } |
Set-Content $path2emu
#Magic Engine FX
$path2emu = "\\$MACHINE\Emulators\PCEngine\Magic Engine FX\pcfx.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "screen_width=.*", "screen_width=$WIDTH" } | 
ForEach-Object { $_ -replace "screen_height=.*", "screen_height=$HEIGHT" } |
Set-Content $path2emu
#M2 0.9
$path2emu = "\\$MACHINE\Emulators\ARCADE\M2\M2\m2emulator_09\emulator.ini"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "FullScreenWidth=.*", "FullScreenWidth=$WIDTH" } | 
ForEach-Object { $_ -replace "FullScreenHeight=.*", "FullScreenHeight=$HEIGHT" } | 
Set-Content $path2emu

#MEDNAFEN
$path2emu = "\\$MACHINE\Emulators\Mednafen\mednafen-0.8.B-win32\mednafen.cfg"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "xres .*", "xres $WIDTH" } | 
ForEach-Object { $_ -replace "yres .*", "yres $HEIGHT" } | 
Set-Content $path2emu

#NESTOPIA
$path2emu = "\\$MACHINE\Emulators\Nintendo\NES\Nestopia\Nestopia140bin\nestopia.xml"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "<width>.*</width>", "<width>$WIDTH</width>" } | 
Foreach-Object { $_ -replace "<height>.*</height>", "<height>$HEIGHT</height>" } | 
Set-Content $path2emu

#PSX
$path2emu = "\\$MACHINE\Emulators\SONY\PS1\pSX\pSX\psx.ini"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "Width=.*", "Width=$WIDTH" } | 
Foreach-Object { $_ -replace "Height=.*", "Height=$HEIGHT" } | 
Foreach-Object { $_ -replace "Refresh=.*", "Refresh=$REFRESH" } | 
Set-Content $path2emu

#RAINE
$path2emu = "\\$MACHINE\Emulators\ARCADE\Raine\Raine\config\raine32_sdl.cfg"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "screen_x = .*", "screen_x = $WIDTH" } | 
Foreach-Object { $_ -replace "screen_y = .*", "screen_y = $HEIGHT" } | 
Set-Content $path2emu

#Stella
$path2emu = "\\$MACHINE\Emulators\Atari\Atari 2600\Stella\stella-2.6.1\stella.ini"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "fullres = .*", "fullres = $WIDTH x $HEIGHT" } | 
Set-Content $path2emu

#Supermodel
$path2emu = "\\$MACHINE\Emulators\ARCADE\Supermodel\Supermodel\Config\Supermodel.ini"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "XResolution = .*", "XResolution = $WIDTH" } | 
Foreach-Object { $_ -replace "YResolution = .*", "YResolution = $HEIGHT" } | 
Set-Content $path2emu

#VisualBoyAdvance
$path2emu = "\\$MACHINE\Emulators\Nintendo\DS GBA GB\VisualBoy Advance\vba.ini"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "fsWidth=.*", "fsWidth=$WIDTH" } | 
ForEach-Object { $_ -replace "fsHeight=.*", "fsHeight=$HEIGHT" } |
Set-Content $path2emu

#Vice
$path2emu = "\\$MACHINE\Emulators\Commodore\WinVICE\WinVICE-2.2-x64\vice.ini"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "FullscreenWidth=.*", "FullscreenWidth=$WIDTH" } | 
ForEach-Object { $_ -replace "FullscreenHeight=.*", "FullscreenHeight=$HEIGHT" } | 
ForEach-Object { $_ -replace "FullscreenRefreshRate=.*", "FullscreenRefreshRate=$REFRESH" } | 
Set-Content $path2emu

#Winkawaks
$path2emu = "\\$MACHINE\Emulators\ARCADE\WinKawaks\winkawaks\WinKawaks.ini"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "FullScreenWidth=.*", "FullScreenWidth=$WIDTH" } | 
ForEach-Object { $_ -replace "FullScreenHeight=.*", "FullScreenHeight=$HEIGHT" } | 
ForEach-Object { $_ -replace "FullScreenWidthNeoGeo=.*", "FullScreenWidthNeoGeo=$WIDTH" } | 
ForEach-Object { $_ -replace "FullScreenHeightNeoGeo=.*", "FullScreenHeightNeoGeo=$HEIGHT" } | 
Set-Content $path2emu

#ZINC - all files in dir
Get-ChildItem "\\$MACHINE\Emulators\ARCADE\Zinc\zinc11-win32\rcfg" *.cfg -recurse |
    Foreach-Object {
        $c = ($_ | Get-Content) 
        $c = $c -replace "XSize=.*", "XSize=$WIDTH"
		$c = $c -replace "YSize=.*", "YSize=$HEIGHT"
        [IO.File]::WriteAllText($_.FullName, ($c -join "`r`n"))
		}

#ZINC - renderer.cfg
$path2emu = "\\$MACHINE\Emulators\ARCADE\Zinc\zinc11-win32\renderer.cfg"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "XSize			= .*", "XSize			= $WIDTH" } | 
Foreach-Object { $_ -replace "YSize			= .*", "YSize			= $HEIGHT" } | 
Set-Content $path2emu

#ZSnesW
$path2emu = "\\$MACHINE\Emulators\Nintendo\SNES\ZSNES\zsnesw.cfg"
(Get-Content $path2emu) | 
ForEach-Object { $_ -replace "CustomResX=.*", "CustomResX=$WIDTH" } | 
ForEach-Object { $_ -replace "CustomResY=.*", "CustomResY=$HEIGHT" } | 
ForEach-Object { $_ -replace "SetRefreshRate=.*", "SetRefreshRate=$REFRESH" } | 
Set-Content $path2emu

#ZX Spin
$path2emu = "\\$MACHINE\Emulators\Spectrum\Spin\Default.spincfg"
(Get-Content $path2emu) | 
Foreach-Object { $_ -replace "FullScreenWidth=.*", "FullScreenWidth=$WIDTH" } | 
ForEach-Object { $_ -replace "FullScreenHeight=.*", "FullScreenHeight=$HEIGHT" } | 
Set-Content $path2emu


#and lastly, we might be running this script to just change from river's monitor to the TV
#so we should include changing from the two files list also, it doesn't matter if we change these now
#because in a second, if we aren't doing that, we'll run the twofiles list and its just going to replace the file
#however, because none of the twofiles list currently specifies refresh or frame rate, we don't need to