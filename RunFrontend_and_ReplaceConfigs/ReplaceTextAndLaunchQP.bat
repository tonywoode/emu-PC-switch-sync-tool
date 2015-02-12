::@echo off & 
SETLOCAL
::We will replace emu ini text with the args you pass to me, and launch qp
::So args are
::%1 = new Machine
::%2 = old width	%3 = new width
::%4 = old height	%4 = new height
::%6 = old refresh	%7 = new refresh
::Bear in mind command line seems to be one based on this, where powershell is zero based (nb: that's because arg 0 is the command that was run in cmd, and c++ for that matter, right) 

::these get funny when called as admin so I had to cd to scripts dir
cd ./../
::now powershell - remember we do NOT need old machine for this.....
powershell -file P:\Scripts\Sync\SCRIPTS\replace_ini_list.ps1 %1 %2 %3 %4 %5 %6 %7

::we don't do the 2 files list, it would fuck it up



