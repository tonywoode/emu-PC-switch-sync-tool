@echo off % SETLOCAL

:: This is the instantiation of the switch to tv script
:: To change screen properties edit this file

:: we call passing 
:: $1 = computer we're on (ps1 script needs this, passing)
:: $2 = TV's width
:: $3 = TV's Height
:: $4 = TV's refresh rate
:: $5 = Monitor's Width
:: $6 = Monitors Height
:: $7 = Monitor's Refresh Rate

SWITCH_TO_TV_MAIN_SCRIPT.bat %COMPUTERNAME% 1920 1080 60 3840 2160 60

