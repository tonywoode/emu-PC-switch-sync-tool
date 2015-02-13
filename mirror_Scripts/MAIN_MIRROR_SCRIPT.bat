@echo off & SETLOCAL
::You need to send command line parameters to this script: SEAEEE RIVER
::remember also that both machines need not only to have an Emulators share, but also a MACHINE_games share
SET MACHINE_A=%1
::Gets changed to eg: SEAEEE
SET MACHINE_B=%2
::and eg: RIVER
echo.
echo.
echo.COPY FROM %MACHINE_A% TO %MACHINE_B%
echo.
echo.
echo.TAKE NOTE OF THE LOCATION THIS IS RUNNING FROM, AND THE OPTIONS
echo.
echo.REMEMBER I SYNC MY OWN DIRECTORY AND I'M GOING TO RUN MYSELF FROM C:\ NO MATTER WHICH ONE OF ME YOU STARTED BY CALLING
echo.
pause
echo.YOU HAVE REMEMBERED TO RUN THE GAMEBASE EXPORT REG DIRECTLY FROM %MACHINE_A% HAVEN'T YOU?
echo.I WILL RUN THE GAMEBASE_IMPORT (so you'd better had or it might overwrite something)
echo.(RUN THE REST OF ME FROM THE FASTEST MACHINE remember I need to POWERSHELL AND BE QUICK)

pause
ECHO.-------------------------------------------------------------------------------
ECHO.Firstly: JUST CHECKING: YOU DO WANT TO COPY %MACHINE_A% EMULATORS TO %MACHINE_B% EMULATORS, RIGHT?
ECHO.-------------------------------------------------------------------------------
SET /P Select=Type 'y' for Yes Or 'n' for No:
IF /i %Select%==y (set _COPY=yes) else set COPY=no

ECHO.-------------------------------------------------------------------------------
ECHO.AND BEFORE THAT HAPPENS, DO YOU WANT TO FIRST COPY GAMECUBE CDI/DREAMCAST/GC/SATURN/PS2/PSP   EMUs/SCREENS/ROMDATA FROM %MACHINE_B% TO %MACHINE_A%?
ECHO.-------------------------------------------------------------------------------
SET /P Select=Type 'y' for Yes Or 'n' for No:
IF  /i %Select%==y (set _PRECOPY=yes) else set _PRECOPY=no

ECHO.-------------------------------------------------------------------------------
ECHO.Do you want to do games as well as Emulators from %MACHINE_A%_games TO %MACHINE_B%_games? Remember: UPDATES ONLY NOT A MIRROR
ECHO  -------------------------------------------------------------------------------
SET /P Select=Type 'y' for Yes Or 'n' for No:
IF  /i %Select%==y (set _GAMES=yes) else set _GAMES=no
ECHO.-------------------------------------------------------------------------------
ECHO  Lastly, Do you want to run the powershell re-resolution script at the end?
ECHO.-------------------------------------------------------------------------------
SET /P Select=Type 'y' for Yes Or 'n' for No:
IF  /i %Select%==y (set _POW=yes) else set _POW=no

::set Robo options
set _OPTIONS=/MIR /SL /R:5 /W:5 /TEE /ETA /LOG+:\\%MACHINE_A%\CODE\Scripts\Emulator_PC_Switcher_Sync_Tool\mirror_scripts\backlog\mirror_%MACHINE_A%_emu_to_%MACHINE_B%%DATE:/=%.log

:PRECOPY
IF (%_PRECOPY%)==(no) GOTO :COPY
::CD-I
robocopy "\\%MACHINE_B%\EMULATORS\Phillips" "\\%MACHINE_A%\EMULATORS\Phillips" %_OPTIONS%
robocopy "\\%MACHINE_B%\EMULATORS\SCREENSHOTS\Phillips CD-I" "\\%MACHINE_A%\EMULATORS\SCREENSHOTS\Phillips CD-I" %_OPTIONS%
robocopy "\\%MACHINE_B%\EMULATORS\QUICKPLAY\QuickPlayFrontend\qp\data\Disk\CD-I" "\\%MACHINE_A%\EMULATORS\QUICKPLAY\QuickPlayFrontend\qp\data\Disk\CD-I" %_OPTIONS%

::DREAMCAST
robocopy "\\%MACHINE_B%\EMULATORS\SEGA\Dreamcast" "\\%MACHINE_A%\EMULATORS\SEGA\Dreamcast" %_OPTIONS%
robocopy "\\%MACHINE_B%\EMULATORS\SCREENSHOTS\Sega Dreamcast" "\\%MACHINE_A%\EMULATORS\SCREENSHOTS\Sega Dreamcast" %_OPTIONS%
robocopy "\\%MACHINE_B%\EMULATORS\QUICKPLAY\QuickPlayFrontend\qp\data\Disk\Dreamcast" "\\%MACHINE_A%\EMULATORS\QUICKPLAY\QuickPlayFrontend\qp\data\Disk\Dreamcast" %_OPTIONS%

::GAMECUBE
robocopy "\\%MACHINE_B%\EMULATORS\Nintendo\Gamecube Wii" "\\%MACHINE_A%\EMULATORS\Nintendo\Gamecube Wii" %_OPTIONS%
robocopy "\\%MACHINE_B%\Emulators\SCREENSHOTS\Nintendo Gamecube" "\\%MACHINE_A%\Emulators\SCREENSHOTS\Nintendo Gamecube" %_OPTIONS%
robocopy "\\%MACHINE_B%\Emulators\QUICKPLAY\QuickPlayFrontend\qp\data\Disk\Gamecube" "\\%MACHINE_A%\Emulators\QUICKPLAY\QuickPlayFrontend\qp\data\Disk\Gamecube" %_OPTIONS%

::SATURN
robocopy "\\%MACHINE_B%\EMULATORS\SEGA\Saturn" "\\%MACHINE_A%\EMULATORS\SEGA\Saturn" %_OPTIONS%
robocopy "\\%MACHINE_B%\EMULATORS\SCREENSHOTS\Sega Saturn" "\\%MACHINE_A%\EMULATORS\SCREENSHOTS\Sega Saturn" %_OPTIONS%
robocopy "\\%MACHINE_B%\EMULATORS\QUICKPLAY\QuickPlayFrontend\qp\data\Disk\Saturn" "\\%MACHINE_A%\EMULATORS\QUICKPLAY\QuickPlayFrontend\qp\data\Disk\Saturn" %_OPTIONS%

::SONY PS2
robocopy "\\%MACHINE_B%\Emulators\SONY\PS2" "\\%MACHINE_A%\Emulators\SONY\PS2" %_OPTIONS%
robocopy "\\%MACHINE_B%\Emulators\SCREENSHOTS\Sony Playstation 2" "\\%MACHINE_A%\Emulators\SCREENSHOTS\Sony Playstation 2" %_OPTIONS%
robocopy "\\%MACHINE_B%\EMULATORS\QUICKPLAY\QuickPlayFrontend\qp\data\Disk\Playstation 2" "\\%MACHINE_A%\EMULATORS\QUICKPLAY\QuickPlayFrontend\qp\data\Disk\Playstation 2" %_OPTIONS%

::SONY PSP
robocopy "\\%MACHINE_B%\Emulators\SONY\PSP" "\\%MACHINE_A%\Emulators\SONY\PSP" %_OPTIONS%

::now sort out SFF's ini - first copy %MACHINE_B% version to ini_%MACHINE_B% then copy ini_%MACHINE_A% to the actual .ini
copy \\%MACHINE_A%\Emulators\SEGA\Saturn\SSF\SSF\SSF.ini \\%MACHINE_A%\Emulators\SEGA\Saturn\SSF\SSF\SSF.ini_%MACHINE_B%
copy \\%MACHINE_A%\Emulators\SEGA\Saturn\SSF\SSF\SSF.ini_%MACHINE_A% \\%MACHINE_A%\Emulators\SEGA\Saturn\SSF\SSF\SSF.ini
::we are left with %MACHINE_B%'s ini updated and seaee's version as the real ini - we'll reverse that in the powershell later

:COPY
IF (%_COPY%)==(no) GOTO :GAMES
robocopy \\%MACHINE_A%\EMULATORS \\%MACHINE_B%\Emulators %_OPTIONS% /XF "JoyTokey.log" "sync.ffs_db"

:GAMEBASEIMPORT
ECHO.IMPORTING GAMEBASE
REG IMPORT "..\Gamebase_Import_export\Gamebase.reg"


:Games
IF (%_GAMES%)==(no) GOTO :POW
robocopy \\%MACHINE_A%\seaeee_games \\%MACHINE_B%\river_games /E /XD "Backup" "$RECYCLE.BIN" "SYSTEM VOLUME INFORMATION" /XF "pagefile.sys" "SEAEEE_disk_IDs.txt" "syncguid.dat" /SL /R:5 /W:5 /TEE /ETA /LOG+:.\backlog\mirror_seaeee_emu_to_river%DATE:/=%.log

::now sort out Far Crys ini ie: replace %MACHINE_A%'s INI that you just copied over
copy "\\%MACHINE_A%\%MACHINE_A%_games\PC Games\FAR CRY\system.cfg" "\\%MACHINE_A%\%MACHINE_A%_games\PC Games\FAR CRY\system.cfg_%MACHINE_A%"
copy "\\%MACHINE_A%\%MACHINE_A%_games\PC Games\FAR CRY\system.cfg" "\\%MACHINE_B%\river_games\PC Games\FAR CRY\system.cfg_%MACHINE_A%"
copy "\\%MACHINE_B%\%MACHINE_B%_games\PC Games\FAR CRY\system.cfg_%MACHINE_B%" "\\%MACHINE_B%\%MACHINE_B%_games\PC Games\FAR CRY\system.cfg"
copy "\\%MACHINE_B%\%MACHINE_B%_games\PC Games\FAR CRY\system.cfg_%MACHINE_B%" "\\%MACHINE_A%\%MACHINE_A%_games\PC Games\FAR CRY\system.cfg_%MACHINE_B%"


:POW
IF (%_POW%)==(no) GOTO :END
::Note here passing everything to powershell EXCEPT machine_A - because powershell needs to know machine to act on, not machine A
::I've no idea how to get the powershell to log, but it errors in view if any probs
powershell -file .\..\replace_ini_list.ps1 %2 %3 %4 %5 %6 %7 %8


echo.Has it gone ok? Lastly are you sure you want to run the two files list? Press y if you do
SET /P Select=Type 'y' for Yes Or 'n' for No:
IF  /i %Select%==y (set _TWOFILES=yes) else set _TWOFILES=no


IF (%_TWOFILES%)==(no) GOTO :END
\\%MACHINE_A%\Emulators\Scripts\SYNC\SCRIPTS\two_files_ini_list.bat %MACHINE_A% %MACHINE_B%

:END
pause

