
::cd to script directory, for administrator needs to run this
cd /d "%~dp0" 

if "%computername%"=="RIVER" (call ReplaceTextAndLaunchQP.bat RIVER 3840 2160 60)
if "%computername%"=="TRICKLE" (call ReplaceTextAndLaunchQP.bat TRICKLE 1366 768 60)
if "%computername%"=="LAGOON" (call ReplaceTextAndLaunchQP.bat LAGOON 1280 800 60)

::my Emulators and frontend all live on Drive F (subst), so if we aren't on that drive, we won't be able to CD
if not ("%~d0")==("P:") (P:)
::now run my frontend 
P:\QUICKPLAY\QuickPlayFrontend\qp\QP.exe



