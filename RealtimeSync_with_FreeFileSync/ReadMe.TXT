How do I use this on Windows?

Load FreeFileSync and open a *._batch file from this folder. Change it to suit your configuration. Save it as a batch

Then we need to get RealtimeSync to run this batch file at logon

I'd recommend running as administrator from logon because you may have Symbolic Links which need to be admin to copy. 
That means setting up a scheduled task and having it run with highest prvilidges. There is a shortcut in this folder that will run RealtimeSync with the batch as Administrator, but it will prompt UAC.

So instead import the *ScheduledTask.xml into Task Scheduler and change to suit your configuration. This has to run at logon not startup (it won't work at startup)

Also here is a free file sync program runner called FreeFileSync - Administrator. This is so you can drag the shortcut to the taskbar and still be able to launch free file sync as administrator

