How could I use the NAS Syncs on Windows
========================================

The core idea here is to have a single auto-sync, that selectively syncs emulator files that are involved in day-to-day game playing, 
so as to capture trivial changes that get made by emulators when you play games, so this sync runs async when you open and close your frontend
(as sich find a frontend runner in a parent dir here that calls this sync in some relatively cunning ways). I've got this auto-sync down to about
40 seconds

Then there are three manual syncs, the main one is simply a full sync of your emulators folder, the other two are convenience sync files, due
to SCREENSHOTS being a terribly large part of retro gaming, we can either sync with them in mind, or not in mind, or exclusively. If you don't
care about this, just always run the full sync. You run the full syncs when you've made code changes, or larger changes that affect whole emulators

Interestingly in this plan, emulator config file changes sit somewhere in-between, but really ALL should be captured by the auto-sync, despite that not
really being its primiary puropose

Note that there's some exclusion folders and also the archive directory that's shared between the manual syncs, a change to one requires a change to all,
and easy way of doing that is to open them all in the same FreeFileSync instance - use the 'open' button and ctrl_click them all to open

The NAS Sync does not copy symlinks at all. Some other solution needs to exist to make sure symlinks are the same on all Emu folders


How could I use the computer-to-computer syncs on Windows?
=======================================================

Its all about administrator because of symlinks. First Load FreeFileSync and open a *._batch file from this folder. Change it to suit your configuration. Save it as a batch

Then we need to get RealtimeSync to run this batch file at logon. I'd recommend running as administrator from logon because you may have Symbolic Links which need to be admin to copy. 
That means setting up a scheduled task and having it run with highest priviledges. There is a shortcut in this folder that will run RealtimeSync with the batch as Administrator, but it will prompt UAC.

So instead, run ImportXMLToTaskScheduler as admin which will import the *ScheduledTask.xml into Task Scheduler. This has to run at logon not startup (it won't work at startup)

Also here is a free file sync program runner called FreeFileSync - Administrator. This is so you can drag the shortcut to the taskbar and still be able to launch free file sync as administrator


Why are there both administator and non-administrator runners for FreeFileSync in here?
=======================================================================================

Just to remind me that although admin FFS is about symlinks, you have to do work to make administrators mapped drives to be the same as non-administrators,
so any problems experienced, you can compare the admin and non-admin versions
