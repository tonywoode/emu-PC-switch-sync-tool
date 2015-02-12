::remember that theoretically we also need an entry for these in the replace_ini list in case we are just changing from river's monitor to the TV
::however, none of these specify sreen res or refresh rate
::First we set our source and destination names - pass to script as THISSCRIPT.ps1 SEAEEE RIVER
::So
SET MACHINE_A=%1
::Gets changed to eg: SEAEEE
SET MACHINE_B=%2
::and eg: RIVER




::Desmume x64 - MAINTAIN 2 FILES
SET path2emu="Emulators\Nintendo\DS GBA GB\Desmume\desmume-64\desmume.ini"
CALL :TWO_FILES




::Desmume 32bit - MAINTAIN 2 FILES
SET path2emu="Emulators\Nintendo\DS GBA GB\Desmume\desmume\desmume.ini"
CALL :TWO_FILES




::NoCASh GBA - MAINTAIN 2 FILES
SET path2emu="Emulators\Nintendo\DS GBA GB\No$GBA\No$gba\NO$GBA.ini"
CALL :TWO_FILES

::PROJECT64 1.7 - MAINTAIN 2 FILES
SET path2emu="Emulators\Nintendo\N64\Project64\Project64_1.7.0.49\Project64.cfg"
CALL :TWO_FILES

::SSF - maintain two files
SET path2emu="Emulators\SEGA\Saturn\SSF\SSF\SSF.ini"
CALL :TWO_FILES
pause&goto:eof


::define the function. Note that path to emu now becomes without server/drive/share name
:TWO_FILES 
::First copy SEAEEE ini to the ini_SEAEEE to update it - hopefully you'll never put spaces in machine names
copy \\%MACHINE_A%\%path2emu% \\%MACHINE_A%\%path2emu%_%MACHINE_A%
copy \\%MACHINE_A%\%path2emu% \\%MACHINE_B%\%path2emu%_%MACHINE_A%
::Then copy RIVER ini to be the real ini on River
copy  \\%MACHINE_B%\%path2emu%_%MACHINE_B% \\%MACHINE_B%\%path2emu%
::and make sure system A also gets a refreshed copy of that
copy \\%MACHINE_B%\%path2emu%_%MACHINE_B% \\%MACHINE_A%\%path2emu%_%MACHINE_B%
GOTO:EOF
