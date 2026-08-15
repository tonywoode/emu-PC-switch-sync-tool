@echo off
:: Self-elevate script to Administrator if not already running as Admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting Administrator privileges...
    powershell -Command "Start-Process cmd.exe -ArgumentList '/c \"\"%~f0\"\"' -Verb RunAs"
    exit /b
)

echo.==================================================
echo. One-off Migration: RealtimeSync to Ludusavi
echo.==================================================

:: 1. Delete legacy Scheduled Task idempotently
powershell -Command "Unregister-ScheduledTask -TaskName 'RealtimeSyncWindowsSaves' -Confirm:$false -ErrorAction SilentlyContinue" >nul 2>&1
schtasks /delete /tn "RealtimeSyncWindowsSaves" /f >nul 2>&1
schtasks /delete /tn "\RealtimeSyncWindowsSaves" /f >nul 2>&1
echo.Legacy Scheduled Task 'RealtimeSyncWindowsSaves' deleted.

:: 2. Kill legacy RealtimeSync background process
taskkill /IM RealtimeSync.exe /F >nul 2>&1

:: 3. Archive legacy P: drive folders to P:\PC\WindowsGameSaves_LegacyArchive
if not exist "P:\PC\WindowsGameSaves_LegacyArchive" mkdir "P:\PC\WindowsGameSaves_LegacyArchive"
if exist "P:\PC\WindowsGameSaves\Documents" move "P:\PC\WindowsGameSaves\Documents" "P:\PC\WindowsGameSaves_LegacyArchive\" >nul 2>&1
if exist "P:\PC\WindowsGameSaves\Saved Games" move "P:\PC\WindowsGameSaves\Saved Games" "P:\PC\WindowsGameSaves_LegacyArchive\" >nul 2>&1
if exist "P:\PC\WindowsGameSaves\appdata" move "P:\PC\WindowsGameSaves\appdata" "P:\PC\WindowsGameSaves_LegacyArchive\" >nul 2>&1
if exist "P:\PC\WindowsGameSaves\program files (x86)" move "P:\PC\WindowsGameSaves\program files (x86)" "P:\PC\WindowsGameSaves_LegacyArchive\" >nul 2>&1

:: 4. Delete obsolete legacy files in folder 6 (6a, 6b, 6c)
if exist "%~dp06a.WindowsSaves_sync.ffs_batch" del /f /q "%~dp06a.WindowsSaves_sync.ffs_batch"
if exist "%~dp06b.RealtimeSyncWindowsSaves_scheduled_task.xml" del /f /q "%~dp06b.RealtimeSyncWindowsSaves_scheduled_task.xml"
if exist "%~dp06c.ImportXMLToTaskScheduler_RunMeAsAdmin.bat" del /f /q "%~dp06c.ImportXMLToTaskScheduler_RunMeAsAdmin.bat"

echo.Migration ^& Cleanup Complete!
pause
