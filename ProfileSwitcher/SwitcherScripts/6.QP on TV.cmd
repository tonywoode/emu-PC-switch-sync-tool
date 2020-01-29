..\monitorProfileSwitcher\MonitorSwitcher.exe -load:..\myMonitorProfiles\TV.xml
timeout 3
..\nircmd-x64\nircmd.exe setdefaultsounddevice "4 - 42 TV"
%windir%\System32\schtasks.exe /run /tn "Switch to TV"
pause
..\monitorProfileSwitcher\MonitorSwitcher.exe -load:..\myMonitorProfiles\PC.xml
timeout 3
..\nircmd-x64\nircmd.exe setdefaultsounddevice "5 - PL2888UH"

