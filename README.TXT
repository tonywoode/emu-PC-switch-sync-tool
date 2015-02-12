1.1: Updated this to make it all relative, now one script can copy either way
so its now got a modular/functional structure
First we call the batch that selects which way round we're going:
e.g.: RIVER-TO-SEAEEE.bat
these get funny when called as admin so I had to cd to scripts dir

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