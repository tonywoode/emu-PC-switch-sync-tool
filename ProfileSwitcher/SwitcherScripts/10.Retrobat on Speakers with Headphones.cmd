@echo off
setlocal

:: 1. INITIAL SWITCH: Move to TV and Audio
echo Switching to TV Profile...
"..\monitorProfileSwitcher\MonitorSwitcher.exe" -load:"..\myMonitorProfiles\TV.xml"

timeout /t 3 /nobreak >nul

echo Setting Audio to Speakers and enabling Windows Sonic...
"..\nircmd-x64\nircmd.exe" setdefaultsounddevice "Speakers"
:: This line enables Windows Sonic on the 'Speakers' device
"..\soundvolumeview-x64\SoundVolumeView.exe" /SetSpatial "Speakers" "Windows Sonic for Headphones"

:: 2. LAUNCH: Start the RetroBat launcher
echo Launching RetroBat...
start "" "R:\Retrobat\RetroBat.exe"

:: 3. THE "PATIENCE" LOOP
echo Waiting for EmulationStation to initialize...
:CHECK_START
timeout /t 5 /nobreak >nul
tasklist /FI "IMAGENAME eq emulationstation.exe" 2>NUL | find /I "emulationstation.exe" >NUL
if %ERRORLEVEL% NEQ 0 goto CHECK_START

echo EmulationStation detected. Spatial Sound active.

:: 4. THE "SLEEP" LOOP
:WAIT_EXIT
timeout /t 5 /nobreak >nul
tasklist /FI "IMAGENAME eq emulationstation.exe" 2>NUL | find /I "emulationstation.exe" >NUL
if %ERRORLEVEL% EQU 0 goto WAIT_EXIT

:: 5. REVERT: Switch back to PC monitor, Audio, and turn OFF Sonic
echo Frontend closed. Reverting to PC Monitor...

:: Turn off Spatial sound before switching devices back
"..\soundvolumeview-x64\SoundVolumeView.exe" /SetSpatial "Speakers" "None"

"..\monitorProfileSwitcher\MonitorSwitcher.exe" -load:"..\myMonitorProfiles\PC.xml"

timeout /t 3 /nobreak >nul

echo Resetting Audio...
"..\nircmd-x64\nircmd.exe" setdefaultsounddevice "5 - PL2888UH"

exit