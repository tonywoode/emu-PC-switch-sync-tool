How could I use the NAS Syncs on Windows
========================================

Emulator_NAS_Sync\1.Frontend_Open_close_sync.ffs_batch
======================================================
The core idea here is to have a single auto-sync, that selectively syncs emulator save games, emulators files that are involved in day-to-day game 
playing, and most emulator config files generally, so this sync runs async when you open and close your frontend. (as such find a frontend runner 
in a parent dir here that calls this sync in some relatively cunning ways). I've got this auto-sync down to about 40 seconds. Its so fast because 
I've tuned it to only sync files from my emulators that are liable to actually change (and in particular aren't costly to sync). So Retroarch's 
'cheat' files aren't in the sync (they'll only change when I upgrade Retroarch and contain thousands of small files), and the files for emulators 
kept for historical/comparison interest aren't in, since they're unlikely to change in day-to-day use.

Emulator_NAS_Sync\2.Code_sync.ffs_gui
=====================================
There is a further script that only syncs files considered to be 'code'. By using the manual code sync in addition to the auto sync this should 
cover 95% of day-to-day changes (but for instance files in Emulators root may not sync when you might expect them to).

Emulator_NAS_Sync\3a.Full_No_Screenshots_sync.ffs_gui
Emulator_NAS_Sync\3b.Screenshots_Only_sync
Emulator_NAS_Sync\3z.Full_sync
=====================================================
Then there are some manual sync files, the fullest one is simply a full sync of your emulators folder, it has 2 relations which are convenience sync 
files, due to SCREENSHOTS being a terribly large part of retro gaming, we can either sync with them in mind, or not in mind, or exclusively.

There are common configs between the FFS sync files: e.g. there's some exclusion folders, and also the archive directory location, that's shared 
between the manual syncs, so its worth editing them all at once: open them all in the same FreeFileSync instance - use the 'open' button and 
ctrl_click them all to open

Emulator_NAS_Sync\4a.Emu_backup_mirror.ffs_batch
Emulator_NAS_Sync\4b.make_7zip_from_backup_emu_mirror.ps1
Emulator_NAS_Sync\4c.RIVERs Emu Backup Folder
=========================================================
The Emulator syncs are unhelpful for backup purposes. We do place FFS's file backup archive on all machines that do syncing, but thats not enough.
So we have a dedicated backup location. This holds a single mirror of the emulators folder (which is what 4a does for me and is fast). 
But at any time that mirror can be snapshotted off into its own 7zip archive (what 4b gets you). That is slow. Both are held at location 4c.
So the idea is to mirror much more often than archive. These are all manual

Emulator_NAS_Sync\5.create_symlinks_replace_script.ps1
======================================================
The NAS Sync does not copy symlinks at all. This is a major bugbear with syncing because only administrator can copy symlinks, but administrators mapped
drives might be different from user's mapped drives. And a linux nas box is not going to honour or make its own versions of windows symlinks. (And 
as we all know, lots can go wrong with symlinks). So in all the NAS syncs we ignore symlinks and instead running this script will (manually) create
another powershell script in the base of the emulators folder, which, when run, will reconstitute all the symlinks found when the original script was
run. This seems like the best way of communicating symlinks across operating systems/time/file-systems/storage-devices: if we ever need to reconsitute
the symlinks we can. The running of this script is manual because the symlinks here change very infrequently

6a.WindowsSaves_sync.ffs_batch
6b.RealtimeSyncWindowsSaves_scheduled_task.xml
6c.ImportXMLToTaskScheduler_RunMeAsAdmin.bat
==============================================
Modern-ish windows Games have a nasty habit of saving their save games in some crazy subfolder of your documents or 'saved games' home directories. In order to
try and preserve these saved games, we have to go a bit further: the idea is to take them into your 'Emulators' directory and then eventually sync those (ie: when I
perform a full sync). For now that works quite well, perhaps in time when these games are all playable via laptop I could change the sync target from P: (ie: the same
drive really that i'm coming from....) to the NAS itself (N:/). But for now its overkill. Also overkill is possibly running this windows games sync as a FFS 'Realtime Sync'
(i suspect the reason for it is simply its not an emulator-type sync), but to get this sync running, you have to import the xml (6b), by runing the bat (6c) as admin

* You may think its not safe to sync your 'documents' folder on Windows, but take a look at it. I've excluded all the usual suspects and all that's left is Game Saves.
* Note also the scheduled task creation here is not about running as admin, its about scheduling a task! And note the task is loaded via an xml, bypassing our problem of CMD-created 
tasks not starting when on batteries
* You might think that you need to do an intial sync before you activate the scheduled task, but on my first run of the scheduled task it did sync

Helper Files/Processes
======================

Emulator_NAS_Sync_Link_On_Desktop.ps1 - This will place a shortcut to the NAS Sync folder from this repo on your desktop, with a nice icon, for convenience

How could I use the deprecated computer-to-computer syncs on Windows?
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
