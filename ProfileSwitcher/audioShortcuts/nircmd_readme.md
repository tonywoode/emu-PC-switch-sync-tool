http://www.sevenforums.com/tutorials/56892-sound-shortcuts-create.html

I dont know if this was covered before with Nirsoft as there were many search results for it however I could not find one for this use.

You can use nircmd from Nirsoft to create desktop shortcuts.

Right click, New, Shortcut.

Use this line as the target for your shortcut.

C:\Windows\nircmd.exe setdefaultsounddevice "Exact device name goes here"

The device name can be found in the playback tab of your Sound under control panel or from right clicking the speaker icon in the system tray.

Then name your shortcut whatever you want.

If you dont want nircmd.exe in your windows folder, specify the alternate location where you saved it instead of the default windows folder directory.

Also, this is not a program that runs in the background. It just executes.

There are also other programs which allow for a hotkey you can choose from your keyboard, but the ones I have seen either work only for xp, require it in the system tray (which you can still hide) and/or add another background process.

But I like nircmd the best. 