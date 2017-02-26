
::cd to script directory, for administrator needs to run this
cd /D "%~dp0" 
::import the gamebase reg REG IMPORT "P:\GAMEBASE\Gamebase.reg"
if "%computername%"=="RIVER" (call ReplaceTextAndLaunchQP.bat RIVER 3840 2160 60)
if "%computername%"=="TRICKLE" (call ReplaceTextAndLaunchQP.bat TRICKLE 1366 768 60)
if "%computername%"=="LAGOON" (call ReplaceTextAndLaunchQP.bat LAGOON 1280 800 60)
if "%computername%"=="POND"  (call ReplaceTextAndLaunchQP.bat POND 2560 1600 60)

::my Emulators and frontend all live on Drive P (subst), so if we aren't on that drive, we won't be able to CD
if not ("%~d0")==("P:") (P:)
dir
::now run my frontend
::if we don't CD to qp's dir, realative paths won't work. Many tools currently need relative paths
cd /D P:\QUICKPLAY\QUickPlayFrontend\qp 
QP.exe
::export the gamebase reg before we close
REG EXPORT HKEY_CURRENT_USER\Software\GB64 "P:\GAMEBASE\Gamebase.reg" /y


