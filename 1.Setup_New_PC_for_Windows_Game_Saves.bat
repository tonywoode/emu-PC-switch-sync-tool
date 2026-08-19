@echo off
:: Self-elevate script to Administrator if not already running as Admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting Administrator privileges...
    powershell -Command "Start-Process cmd.exe -ArgumentList '/c \"\"%~f0\"\"' -Verb RunAs"
    exit /b
)

echo.==================================================
echo. Setting Up Ludusavi and Restoring PC Game Saves
echo.==================================================

echo.Installing Ludusavi via winget...
winget install --id mtkennerly.ludusavi --scope user --silent --accept-source-agreements --accept-package-agreements

set LUDUSAVI_CONFIG_DIR=%APPDATA%\ludusavi
if not exist "%LUDUSAVI_CONFIG_DIR%" mkdir "%LUDUSAVI_CONFIG_DIR%"
(
    echo backup:
    echo   path: "P:\PC\WindowsGameSaves"
    echo   ignoredGames:
    echo     - "Minecraft: Java Edition"
    echo     - "Minecraft: Bedrock Edition"
    echo     - "Minecraft"
    echo   retention:
    echo     full: 5
    echo     differential: 0
    echo   filter:
    echo     ignoredPaths:
    echo       - "N:/**"
    echo       - "S:/**"
    echo       - "R:/**"
    echo       - "P:/**"
    echo       - "F:/**"
) > "%LUDUSAVI_CONFIG_DIR%\config.yaml"

echo.Restoring all PC game saves from P:\PC\WindowsGameSaves to local C: drive...
"%LOCALAPPDATA%\Microsoft\WinGet\Links\ludusavi.exe" restore --force --path "P:\PC\WindowsGameSaves" < nul

:: Remove legacy RealtimeSync task if present
powershell -Command "Unregister-ScheduledTask -TaskName 'RealtimeSyncWindowsSaves' -Confirm:$false -ErrorAction SilentlyContinue" >nul 2>&1
schtasks /delete /tn "RealtimeSyncWindowsSaves" /f >nul 2>&1
schtasks /delete /tn "\RealtimeSyncWindowsSaves" /f >nul 2>&1
taskkill /IM RealtimeSync.exe /F >nul 2>&1

echo.Setup Complete! Your PC game saves are restored and ready.
pause
