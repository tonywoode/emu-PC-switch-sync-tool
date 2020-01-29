Emulator PC Switcher Sync Tool v1.04
====================================

Windows emulation users often have multiple PC setups, both a laptop and a desktop PC, often an HTPC or the capacity to switch their desktop
to a TV monitor. We can make our emulation and retro-gaming environments largely portable - just folders we sync between machines. 
However the difference in hardware of your machines is a problem. Particularly the properties of your screen.

Emulators contain config files which often specify the screen resolution to use. Highly problematic for a portable environment.
(Other problems include the presence or lack of physical DVD drive letter which confuses some implementations of disk mounting code in emulators)

Here's how I overcame these problems in a windows environment, a series of interrelated scripts for a variety of purposes mainly centered around
a Powershell replacement script, so I can, PORTABLY, do things like:

Main Features
=============
* Live sync Emulators folder between multiple systems whenever they see each other (using FreeFileSync) 
* Manually sync Emulators folders when required
* Sync changes in windows registry settings so all emulators work the same anywhere - like the Gamebase frontend
* Launch my Frontend of choice knowing the correct configs are in place for the emulators and resources it calls
* Launch any game, irrespective of system you're running it on
* Launch any emulator on any system
* Use the same Emulators/Frontend on different screens on the same system (aka "switch-to-tv" mode) 
			- You can change the windows DPI settings while you do this
* Save a game at home and continue where you left off on your laptop

Can I use this?
==================
The folders are organised by function, with a master Powershell script in the root directory. A good place to start is the RunFrontend_and_ReplaceConfigs
folder, where you can set a frontend to launch whilst replacing all the screen resolution settings in various emulators in the Powershell script.
Its designed to be run by double clicking the RunFrontend shortcut. See explanation doc in that folder. 
If you're new to Powershell note you'll need to reduce the security level on Powershell so it will run. 
You also need to go into the Powershell script and change the paths, and change the calls to Powershell to suit your system (by System name) in runner.bat

NOTES
=====
Registry export from an external machine is frowned upon. So we must run export on the machine with the config we want and run import on the other

History
=======

1.05 (git tagged as such) 

	* added all-new scripts for monitor and audio switching, and modded switch_to_TV script, to remake and enhance (now using MonitorProfileSwitcher)
	* removed the following 
	  * AMD Switching scripts (AMD removed the functionality entirely)
	  * ChangeWin_DPI scripts and associated 'Reset_for_TV' script (you always needed to log out and in again for this to take effect, so effectively useless)
	  * the symlinks in the root here for 'Switch_for_TV' and 'Reset_for_Tv' - we no longer script something that runs this shortcut that runs a scheduled task, we just script running a scheduled task in the profile switching script itself
	  * the nircmd sound shortcuts and exe in the SwitchToTV folder were removed from that folder and got assimalited into the new profileSwitcher dir (and the nircmd calls in switchToTV script as we now change sound device in the upstream profile switching script that kicks off this whole process. Also updated nircmd.exe version in the profile switching folder)	  
	
1.04 General Refactor and concerns in TV-Switcher are now far more separated

1.03 Added ability to run from a different drive letter than the Emu folder

1.02 Changed paths to allow for different emulator and config drives

1.01: Updated this to make it all relative, now one script can copy either way

