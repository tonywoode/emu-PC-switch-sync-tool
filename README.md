Emulator PC Switcher Sync Tool v1.02
by Tony Woode, 2015

Description
===========
Windows emulation users often have multiple PC setups, both a laptop and a desktop PC, often an HTPC or the capacity to switch their desktop
to a TV monitor.

some years ago, these setups would have such different specifications, that no one would try and run the same emulation software on all of these,
for instance it would take minutes for a laptop pc to uncompress a DVD to run, so DVD-based gaming was restricted to your home PC.

Now, performance is becoming a negligible concern: we CAN sync our windows emulators between multiple PCs without performance issues. 
32bit/64 bit is no longer an issue, memory is no longer an issue. 

So we can try and make our emulation and retro-gamin environments portable - just folders we sync between machines. 
What IS an issue, though, for emulators is the difference in hardware of your machines. Particularly the properties of your screen.

Emulators contain config files which often specify the screen resolution to use. Highly problematic for a portable environment.
Other problems include the presence or lack of physical DVD drive letter which confuses some implementations of disk mounting code in emulators

Here's how I overcame these problems in a windows environment, a series of interrelated scripts for a variety of purposes mainly centered around
a Powershell replacement script, so you can PORTABLY:
* Live sync your emulators folders between multiple systems whenever they see each other 
* Manually sync emulators folders if you need
* Sync changes in windows registry settings so all emulators work the same anywhere
* Launch your frontend of choice
* Launch any game you have, irrespective of system
* Launch any emulator on any system
* Save a game at home and continue where you left off on your laptop

So the purpose of this suite of scripts and configs is to ensure that EVERY Windows emulator can change its config depending on running system.

For instance my home PC has a 4k monitor and can be switched to a 2k tv. My laptop has a curiously 1024x800 screen. My home PC has a physical DVD drive,
my laptop does not. 

This suite of tools allows you to use the same emulators files and frontend to manage the setups on different PCs. We can perform a number of actions:

1) When I run my frontend, it knows what computer I'm running from, so changes the config files of many emulators to match my resolution and drive specs
2) If I make changes to the Gamebase databases on one system (which are windows registry based) these can be synced
3) If I change from a 4k to 2k monitor on my desktop pc, all my emulators change to reflect this, and my frontend changes its font radically
4) My emulation files will automatically sync as long as I install Free File Sync on one PC
5) If I wish to manually sync my emulators on different machines and the registry states of their Gamebase databases, I can do so

How do I use this?
==================
The folders are organised by function, with a master Powershell script in the root directory. A good place to start is the RunFrontend_and_ReplaceConfigs
folder, where you can set a frontend to launch whilst replacing all the screen resolution settings in various emulators in the powershell script. Just adapt
both to your needs.

You need to reduce the secuirty level on powershell so it will run.
You need to go into the powershell script and change the paths

History
=======
1.2 Changed paths to allow for different emulator and config drives

1.1: Updated this to make it all relative, now one script can copy either way
now got a modular/functional structure
First we call the batch that selects which way round we're going:
e.g.: RIVER-TO-SEAEEE.bat
So please note they will always go to the C directory of the machine you're running FROM
I decided that was best, but if you call the script via SEAEEE's shared folder as it is on RIVER, it doesn't matter it will run the versions from RIVER!
This is tricky because the script mirrors its own directory, so just make sure river and seaeee agree on the script contents before you run it, or try to always run the script itself from RIVERs version
Will also LOG robocopy to the machine you're running it FROM and then copy that log when its done
So we passs the parameters "which machine I am" "which machine I'm going to" "source THEN destination res and refresh" to the main script, which in turn uses these parameters to pass to:
1) the replace list powershell script (which doesn't need to know which machine it is just which machine its altering files on)
2) The two files list which maintains two files for little and big computers
Although we should need the two files list to be echoed in the replace list for when doing the "TV" script, none of those files actually specify resolutions its speed etc that changes in them
____________________________________________________________
registry export is run from seaeee, import is run from river

Seaa to river script copies emus plus games
Seaa to river does NOT sync these emu folders:
"Nintendo\Gamecube Wii" "CD-I" "SEGA\Saturn" "SEGA\Dreamcast"

or these games folders:
"Backup" "NEW THINGS" "$RECYCLE.BIN" "SYSTEM VOLUME INFORMATION"
or these games files: "pagefile.sys" "SEAEEE_disk_IDs.txt" "syncguid.dat

river to seaa script copies emus only
