@echo off
echo.==================================================
echo. One-off Migration: RealtimeSync to Ludusavi
echo.==================================================

:: 1. Delete legacy Scheduled Task & kill process
schtasks /delete /tn "RealtimeSyncWindowsSaves" /f 2>nul
taskkill /IM RealtimeSync.exe /F 2>nul

:: 2. Archive legacy P: drive folders to P:\PC\WindowsGameSaves_LegacyArchive
if not exist "P:\PC\WindowsGameSaves_LegacyArchive" mkdir "P:\PC\WindowsGameSaves_LegacyArchive"
if exist "P:\PC\WindowsGameSaves\Documents" move "P:\PC\WindowsGameSaves\Documents" "P:\PC\WindowsGameSaves_LegacyArchive\" 2>nul
if exist "P:\PC\WindowsGameSaves\Saved Games" move "P:\PC\WindowsGameSaves\Saved Games" "P:\PC\WindowsGameSaves_LegacyArchive\" 2>nul
if exist "P:\PC\WindowsGameSaves\appdata" move "P:\PC\WindowsGameSaves\appdata" "P:\PC\WindowsGameSaves_LegacyArchive\" 2>nul
if exist "P:\PC\WindowsGameSaves\program files (x86)" move "P:\PC\WindowsGameSaves\program files (x86)" "P:\PC\WindowsGameSaves_LegacyArchive\" 2>nul
echo.Legacy folders archived to P:\PC\WindowsGameSaves_LegacyArchive.

:: 3. Delete obsolete legacy files in folder 6 (6a, 6b, 6c)
if exist "%~dp06a.WindowsSaves_sync.ffs_batch" del /f /q "%~dp06a.WindowsSaves_sync.ffs_batch"
if exist "%~dp06b.RealtimeSyncWindowsSaves_scheduled_task.xml" del /f /q "%~dp06b.RealtimeSyncWindowsSaves_scheduled_task.xml"
if exist "%~dp06c.ImportXMLToTaskScheduler_RunMeAsAdmin.bat" del /f /q "%~dp06c.ImportXMLToTaskScheduler_RunMeAsAdmin.bat"

:: 4. Perform initial Ludusavi full backup directly to P:\PC\WindowsGameSaves
echo.Running initial Ludusavi full backup to P:\PC\WindowsGameSaves...
"%LOCALAPPDATA%\Microsoft\WinGet\Links\ludusavi.exe" backup --force --path "P:\PC\WindowsGameSaves" < nul
echo.Migration Complete!
