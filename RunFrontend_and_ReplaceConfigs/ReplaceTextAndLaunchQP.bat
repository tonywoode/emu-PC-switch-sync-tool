@echo off & SETLOCAL
::We will replace emu ini text with the args you pass to me, and launch qp
::So args are
::%1 = new Machine
::%2 = new width
::%3 = new height
::%4 = new refresh
::note one based, where powershell is zero based (because arg 0 is the command that was run) 

::now powershell - remember we do NOT need old machine for this.....
powershell -file .\..\replace_ini_list.ps1 %1 %2 %3 %4




