# Profile Switching: video monitors, audio source, and retro-gaming tv switcher

## Why did you make this?
AMDs switching stopped working. There are monitor switching apps but all are very heavyweight. We just want to switch audio and video sources around
I found [Monitor Profile Switcher download \| SourceForge.net](https://sourceforge.net/projects/monitorswitcher/)

## How does it work/what do i need to do
1. the command line version of MonitorProfileSwitcher can save and load presets, you just win+p to choose the setup you'd like:

https://sourceforge.net/p/monitorswitcher/discussion/general/thread/96b05a8d/

> **How to use the command line version?**
> The command line program MonitorSwitcher.exe has two possible parameters, -load:FileName.xml and -save:FileName.xml which loads a monitor profile from a file and saves the current monitor profile to a xml file respectively.
So we save named profiles into the folder 'myMonitorProfiles'

2. we then make named profiles for switching in the `switcherScripts` dir: each one first invokes MonitorProfileSwitcher with the xml profile from the previous step, waits a while (the monitor needs to be in an active state in order to have an audio source to switch to), then switches the audio source

3. We also make a profile that switches to the TV, but ALSO invokes the retro-gaming `switch-to-tv` process. That script waits at the end, and then switches everything back to the PC monitor (since thats 99% of how i've used this)

4. In order to get the switcher profile scripts accessible and keyboard shortcuts working with them, the easiest way is to right-click each and make a shortcut to each script on the Desktop, and go to the properties of those shortcuts to set a keyboard shortcut. (Remember the shortcuts you make don't have to have file extensions etc so you can strip those). There can be issues with the keyboard shortcuts though (I just considered it was easier than using AutoHK or similar, and anyway I actually want these on the Desktop) for instance: https://support.microsoft.com/en-us/kb/134552: "Make sure that the shortcuts for which you want to use shortcut keys are on the desktop, on the Start menu, or in the Windows\Start Menu\Programs folder." The keyboard shortcuts will only work **if the Desktop has focus** (which it really always should for my use case if you think about it, you switch once you've finished an activity or when you can easily get the Desktop focussed) 

5. There are some premade shortcuts to audio switching in the `audioShortcuts` dir, these aren't called by any scripts, they are just a convenience so you can shortcut or just put them on your desktop (hardcoded paths in them) to switch audio sources outside of the profile switching

## Note

* The GUI version of MonitorProfileSwitcher doesn't work on any of my machines, despite all of them having the .net framework 4.0 basic requirement installed, but we don't need it at all

* In case MonitorProfileSwitcher stops working one day, here are some alternative lightweight monitor switching apps. At the very least I know helios and nirsoft will be command-line callable:
  * [Enable/disable/configure multiple monitors on Windows](https://www.nirsoft.net/utils/multi_monitor_tool.html)
  * [View and modify the settings of your monitor (VCP Features)](https://www.nirsoft.net/utils/control_my_monitor.html)
  * [MultiMonitor TaskBar](https://www.mediachance.com/free/multimon.htm)
  * [GitHub - falahati/HeliosDisplayManagement: An open source display profile management program for Windows with support for NVIDIA Surround](https://github.com/falahati/HeliosDisplayManagement)
  * [Display Changer II \| 12noon](https://12noon.com/?page_id=641)
  * [Dual Monitor Tools - Home](http://dualmonitortool.sourceforge.net/)