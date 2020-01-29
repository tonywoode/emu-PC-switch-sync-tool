EMU MIRROR SCRIPTS VERSION 1.0 FEB 2012
=======================================

First we call the batch that selects which way round we're going: e.g.: RIVER-TO-SEAEEE.bat (These get funny when called as admin: we must make sure we cd to scripts dir)

Note they will always go to the directory on the machine you're running FROM, not from the network name. I decided that was best, but if you call the script via MACHINEA's shared folder as it is on MACHINEB, it doesn't matter it will run the versions from MACHINEB. But then the script mirrors its own directory, so make sure MACHINEA and MACHINEB agree on the script contents before you run it, or try to always run the script itself from MACHINEB's version. Will also LOG robocopy to the machine you're running it FROM and then copy that log when its done

Essentially we pass the parameters "which machine I am" "which machine I'm going to" "source THEN destination res and refresh" to the main script, which in turn uses these parameters to pass to:

1) the replace list powershell script (which doesn't need to know which machine it is just which machine its altering files on)

2) The two files list which maintains two files for MACHINEA and big MACHINEB based on their file extension names 

Note that, although we should need the two files list to be echoed in the replace list for when doing the "TV" script, none of those files actually specify resolutions its speed etc that changes in them


NOTES
=====
* remember that these scripts kept registry settings (just for gamebase i think) in sync too, not just files. But it was never very automated, since registry export needs to be run from Machine A, import is run from MACHINE B
* remember there was also a solution for emulators with config files that differed too badly between desktop and laptop pc: namely to keep two files and copy one 'live' to a third file when syncing. This was very error prone however, I am still to find a better strategy than just ignoring the config files in question from a sync