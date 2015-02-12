
::cd to script directory, for administrator needs to run this
cd /d "%~dp0" 

if "%computername%"=="RIVER" (call ReplaceTextAndLaunchQP.bat RIVER 1366 3840 768 2160 60 60)
if "%computername%"=="TRICKLE" (call ReplaceTextAndLaunchQP.bat TRICKLE 3840 1366 2160 768 60 60)
if "%computername%"=="LAGOON" (call ReplaceTextAndLaunchQP.bat LAGOON 3840 1280 2160 800 60 60)

::and some other possibilities because we now have threee pcs
if "%computername%"=="RIVER" (call ReplaceTextAndLaunchQP.bat RIVER 1280 3840 800 2160 60 60)
if "%computername%"=="TRICKLE" (call ReplaceTextAndLaunchQP.bat TRICKLE 1280 1366 800 768 60 60)
if "%computername%"=="LAGOON" (call ReplaceTextAndLaunchQP.bat LAGOON 1366 1280 768 800 60 60)

::my Emulators and frontend all live on Drive F (subst), so if we aren't on that drive, we won't be able to CD
if not ("%~d0")==("P:") (P:)
::now run my frontend 
P:\QUICKPLAY\QuickPlayFrontend\qp\QP.exe



