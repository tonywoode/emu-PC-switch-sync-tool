VERSION 2.02 DEC 17
===================
Windows 10 now sees the shortcut to explorer and the original shortcut as the same type of thing, rendering the shortcut obsolete, we can now right click the first shortcut RunFronend.lnk and 'send to taskbar"

VERSION 2.01 APR 2014
=====================
I had immediately changed this shortcut to run from the React_OS version of CMD previously, but a strange thing happens with my winmounting script if I do that. It passes incorrect command lines to winmount AND daemon tools. 

The short term fix was to just take this script back to calling windows CMD for now.

VERSION 2.0 FEB 2014
====================
* realised you CAN call the VB script without a cmd window - you call it via a shortcut
* realised you DON'T need to run as administrator - I tested the replace list and it all works as non-admin
* fount that it isn't just explorer that can mean you can push a shortcut to the launch bar, start works too - and we use start to launch the VB hiding script. So we can kill two birds with one stone

So the process now works like this:

1) Quickplay.lnk runs - This kills two birds. We need to pass the VB script the ACTUAL .bat file that runs code. We also need to have something that essentially runs any other command than a VB one to shortcut to the win7 launch bar (becuase if we push a vb one there you will get the VERY ugly VB icon on your luanch bar)
so that shortcut is running this:

```
P:\QUICKPLAY\qp\cmd.exe /C start "QP" /WAIT /B "HideConsole.vbs" runner.bat
```

note the `/B` which will make the window disaapear once run (it won't open a new window). note we pass the vb script the real running code
we make sure we run this shortcut minimised, and that it runs from the script directory.
hence
2) we can run the code

somehow this combo makes ALL windows invisible totally, nothing even flashes up for a second. Total result!

If you WANT to see the CMD window, just run `runner.bat` itself

VERSION 1.0 JAN 2014
====================
* The shortcut runner runs, minimised, as admin
* runner checks whether we are TRICKLE or RIVER (the string to check must be uppercase)
* if river, runs RIVER_QP.bat (if trickle likewise)
* these call the replaceTextAndLaunchQP script, which in turn calls the powershell replacement script, which is HARDCODED TO THE PARENT DIRECTORY
* We don't use the two-files things I created (to try and maintain a different emulator config file for whichever system we're on), we'll need another option.

This ensures that all resolutions (and any other setting for future text-alterable) we have in the emulators folder can be CHECKED if they are at the resolution of trickle, and if we are river, it will replace them with rivers

The first shortcut to runner is there so we can run as admin, but the second is there so we can put the shortcut on the windows 7 taskbar. Windows 7 only likes to put APPLICATIONS on the taskbar, and we can fool it by making a shortcut which calls EXPLORER "shortcut.lnk" - this is an application....

the vbs script is here because I wanted to hide the cmd window, but then "how do you launch that eh" ;-) You'd have to have it run the runner's code instead of take params, and then shortcut it and run THAT shortcut as admin.

