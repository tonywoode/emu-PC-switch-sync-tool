@echo off
set LUDUSAVI="%LOCALAPPDATA%\Microsoft\WinGet\Links\ludusavi.exe"

if not exist %LUDUSAVI% (
    winget install --id mtkennerly.ludusavi --scope user --silent --accept-source-agreements --accept-package-agreements
)

if "%~1"=="backup" (
    if "%~2"=="" (
        %LUDUSAVI% backup --force --path "P:\PC\WindowsGameSaves" < nul
    ) else (
        %LUDUSAVI% backup --force --path "P:\PC\WindowsGameSaves" "%~2" < nul
    )
) else if "%~1"=="restore" (
    if "%~2"=="" (
        %LUDUSAVI% restore --force --path "P:\PC\WindowsGameSaves" < nul
    ) else (
        %LUDUSAVI% restore --force --path "P:\PC\WindowsGameSaves" "%~2" < nul
    )
) else (
    echo Usage: ludusavi-sync.bat [backup^|restore] [optional_game_name]
)
