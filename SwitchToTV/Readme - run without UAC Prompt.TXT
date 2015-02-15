1. Press the Windows + R keys to open the Run dialog, type taskschd.msc, and press Enter.
NOTE: This will open Task Scheduler. This file is located at:
C:\Windows\system32\taskschd.msc.

2. While having Task Scheduler Library selected in the left pane, click/tap on Create task in the far right pane

3. Under the General tab, type in the "Name" of the program you want to create this shortcut for. 
NOTE: This will be the name of the task. As an example, I will use CCleaner for that program. Make note of this name, you will need it later in step 12 and 14 below.

4. Check the Run with highest privileges box

5. Click/tap on the Configure for drop down box to open it, and select Windows® 7, Windows Server™ 2008 R2 or the Windows you are currently in
NOTE: This is like compatibility mode. If the program does not support running in Windows 7 normally, then you can select the OS that is does support running in instead to have it run in compatibility mode as if it was running in that OS instead of Windows 7.

6. Click/tap on the Actions tab, then on the New button

7. In the Program/script: box in the Actions tab, copy and paste the path below

    %windir%\System32\cmd.exe

8. In the Add arguments (optional): box in the Actions tab, type in the argument below

NOTE: Substitute Task Name in the argument below with the name you entered in step 3 (ex: CCleaner) within quotes, and substitute Full Path of Program in the argument below with the actual full path of the program's .exe file within quote.

    /c start "Task Name" "Full Path of Program"


    For example:

    Code:

    /c start "CCleaner" "C:\Program Files\CCleaner\CCleaner64.exe"

9. Click/tap on OK

10. Click/tap on the Conditions tab, and uncheck the Stop if the computer switches to battery power box first, then uncheck the Start the task only if the computer is on AC power box
NOTE: This step is mostly for laptops, so that you will be able to run the program when the laptop is running on battery power.

11. Click/tap on OK

12. You will now see your new task created with the name (ex: CCleaner) you gave it in step 3. Close Task Scheduler

13. Right click or press and hold on an empty area of your desktop, then click/tap on New and Shortcut.

14. Type in the target below for the location field, then click/tap on the Next button
NOTE: Subsitute task-name in the target with the name (ex: CCleaner) within quotes that you used in step 3.

    schtasks /run /tn "task-name"

    For example: For my task name CCleaner I used from step 3, I would type:

        schtasks /run /tn "CCleaner"

15. Type in a name you want for the shortcut (ex: CCleaner), then click/tap on the Finish button

16. Right click on the new shortcut (ex: CCleaner) on the desktop, then click/tap on Properties.

17. Click/tap on the Shortcut tab, and on the Change Icon button

18. Click/tap on OK

19. Click/tap on the Browse button

20. Navigate to the .exe file of the program that you have created this shortcut with, select it, and click/tap on Open
NOTE: If you have a icon of your own that you would prefer to use instead, then navigate to where you have that icon saved at instead.

21. Select the icon you want for the shortcut, then click/tap on OK. (see screenshot below)

22. Click/tap on OK. (see screenshot below)

23. You can now use this elevated shortcut to run at startup in your "Startup" folder, run at startup as a task, Pin to Start Menu, Pin to Taskbar, assign a keyboard shortcut, or move to where you like for easy use.

24. When you run this new elevated shortcut, you will now no longer have to click/tap on YES to approve the UAC prompt to allow the program run as administrator