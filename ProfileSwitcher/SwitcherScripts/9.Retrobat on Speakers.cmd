@echo off
setlocal

:: 1. INITIAL SWITCH: Move to TV and Audio
echo Switching to TV Profile...
"..\monitorProfileSwitcher\MonitorSwitcher.exe" -load:"..\myMonitorProfiles\TV.xml"

timeout /t 3 /nobreak >nul

echo Setting Audio to Speakers...
..\nircmd-x64\nircmd.exe setdefaultsounddevice "Speakers"

:: 2. LAUNCH: Start the RetroBat launcher
echo Launching RetroBat...
start "" "R:\Retrobat\RetroBat.exe"

:: 3. THE "PATIENCE" LOOP: Wait for EmulationStation to actually show up
echo Waiting for EmulationStation to initialize...
:CHECK_START
timeout /t 5 /nobreak >nul
tasklist /FI "IMAGENAME eq emulationstation.exe" 2>NUL | find /I "emulationstation.exe" >NUL
if %ERRORLEVEL% NEQ 0 goto CHECK_START

echo EmulationStation detected. Gaming mode active.

:: 4. THE "SLEEP" LOOP: Check every 5 seconds if it's still running
:WAIT_EXIT
timeout /t 5 /nobreak >nul
tasklist /FI "IMAGENAME eq emulationstation.exe" 2>NUL | find /I "emulationstation.exe" >NUL
if %ERRORLEVEL% EQU 0 goto WAIT_EXIT

:: 5. REVERT: Switch back to PC monitor and original audio
echo Frontend closed. Reverting to PC Monitor...
"..\monitorProfileSwitcher\MonitorSwitcher.exe" -load:"..\myMonitorProfiles\PC.xml"

timeout /t 3 /nobreak >nul

echo Resetting Audio...
"..\nircmd-x64\nircmd.exe" setdefaultsounddevice "5 - PL2888UH"

exit

