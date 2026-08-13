@echo off
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
    echo   retention:
    echo     full: 5
    echo     differential: 0
    echo   filter:
    echo     ignoredGames:
    echo       - "Minecraft: Java Edition"
    echo       - "Minecraft: Bedrock Edition"
    echo       - "Minecraft"
    echo     ignoredPaths:
    echo       - "N:/**"
    echo       - "S:/**"
    echo       - "R:/**"
    echo       - "P:/**"
    echo       - "F:/**"
) > "%LUDUSAVI_CONFIG_DIR%\config.yaml"

echo.Restoring all PC game saves from P:\PC\WindowsGameSaves to local C: drive...
"%LOCALAPPDATA%\Microsoft\WinGet\Links\ludusavi.exe" restore --force --path "P:\PC\WindowsGameSaves" < nul
schtasks /delete /tn "RealtimeSyncWindowsSaves" /f 2>nul
taskkill /IM RealtimeSync.exe /F 2>nul

echo.Setup Complete! Your PC game saves are restored and ready.
pause
