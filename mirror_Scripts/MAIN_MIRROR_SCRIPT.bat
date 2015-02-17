@echo off & SETLOCAL
::You need to send command line parameters to this script: SEAEEE RIVER
::remember also that both machines need not only to have an Emulators share, but also a MACHINE_games share
SET MACHINE_A=%1
::Gets changed to eg: SEAEEE
SET MACHINE_B=%2
::and eg: RIVER
ECHO.
ECHO.
ECHO.COPY FROM %MACHINE_A% TO %MACHINE_B%
ECHO.
ECHO.
ECHO.TAKE NOTE OF THE LOCATION THIS IS RUNNING FROM, AND THE OPTIONS
ECHO.
ECHO.REMEMBER I'M GOING TO RUN MYSELF FROM %COMPUTERNAME% NO MATTER WHICH ONE OF ME YOU STARTED BY CALLING
ECHO.
pause
ECHO.YOU HAVE REMEMBERED TO RUN THE GAMEBASE EXPORT REG DIRECTLY FROM %MACHINE_A% HAVEN'T YOU?
ECHO.I WILL RUN THE GAMEBASE_IMPORT (so you'd better had or it might overwrite something)
ECHO.(RUN THE REST OF ME FROM THE FASTEST MACHINE remember I need to POWERSHELL AND BE QUICK)

pause
ECHO.-------------------------------------------------------------------------------
ECHO.Firstly: JUST CHECKING: YOU DO WANT TO COPY %MACHINE_A% EMULATORS TO %MACHINE_B% EMULATORS, RIGHT?
ECHO.-------------------------------------------------------------------------------
SET /P Select=Type 'y' for Yes Or 'n' for No:
IF /i %Select%==y (set _COPY=yes) else set COPY=no

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

:COPY
:: Don't copy JoyToKey log (its live and locked), nor the the FreeFileSync database file (Else FFS will have to rebuild it)
IF (%_COPY%)==(no) GOTO :GAMES
robocopy \\%MACHINE_A%\EMULATORS \\%MACHINE_B%\Emulators %_OPTIONS% /XF "JoyTokey.log" "sync.ffs_db"

:GAMEBASEIMPORT
ECHO.IMPORTING GAMEBASE
REG IMPORT "..\Gamebase_Import_export\Gamebase.reg"

:Games
IF (%_GAMES%)==(no) GOTO :POW
robocopy \\%MACHINE_A%\seaeee_games \\%MACHINE_B%\river_games /E /XD "Backup" "$RECYCLE.BIN" "SYSTEM VOLUME INFORMATION" /XF "pagefile.sys" "SEAEEE_disk_IDs.txt" "syncguid.dat" /SL /R:5 /W:5 /TEE /ETA /LOG+:.\backlog\mirror_seaeee_emu_to_river%DATE:/=%.log

::now sort out Far Crys ini ie: replace %MACHINE_A%'s INI that you just copied over - TODO: rather hardcoded atm..
copy "\\%MACHINE_A%\games\PC Games\FAR CRY\system.cfg" "\\%MACHINE_A%\games\PC Games\FAR CRY\system.cfg_%MACHINE_A%"
copy "\\%MACHINE_A%\games\PC Games\FAR CRY\system.cfg" "\\%MACHINE_B%\games\PC Games\FAR CRY\system.cfg_%MACHINE_A%"
copy "\\%MACHINE_B%\games\PC Games\FAR CRY\system.cfg_%MACHINE_B%" "\\%MACHINE_B%\games\PC Games\FAR CRY\system.cfg"
copy "\\%MACHINE_B%\games\PC Games\FAR CRY\system.cfg_%MACHINE_B%" "\\%MACHINE_A%\%games\PC Games\FAR CRY\system.cfg_%MACHINE_B%"

:POW
IF (%_POW%)==(no) GOTO :END
::Note here passing everything to powershell EXCEPT machine_A - because powershell needs to know machine to act on, not machine A
::TODO: get powershell to log to file (atm it errors in view if any probs, so we'll pause for you to see)
powershell -file .\..\replace_ini_list.ps1 %2 %3 %4 %5 %6 %7 %8

ECHO.Has it gone ok? Lastly are you sure you want to run the two files list? Press y if you do
SET /P Select=Type 'y' for Yes Or 'n' for No:
IF  /i %Select%==y (set _TWOFILES=yes) else set _TWOFILES=no

IF (%_TWOFILES%)==(no) GOTO :END
\\%MACHINE_A%\Emulators\Scripts\SYNC\SCRIPTS\two_files_ini_list.bat %MACHINE_A% %MACHINE_B%

:END
pause