..\monitorProfileSwitcher\MonitorSwitcher.exe -load:..\myMonitorProfiles\TV.xml
timeout 3
..\nircmd-x64\nircmd.exe setdefaultsounddevice "4 - 42 TV"
::%windir%\System32\schtasks.exe /run /tn "Switch to TV_windows_scheduled_task-quickPlayJS"
start /wait "Frontend" ..\..\SwitchToTV\SWITCH_TO_TV-quickPlayJS.bat

..\monitorProfileSwitcher\MonitorSwitcher.exe -load:..\myMonitorProfiles\PC.xml
timeout 3
..\nircmd-x64\nircmd.exe setdefaultsounddevice "5 - PL2888UH"

