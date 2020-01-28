..\MonitorProfileSwitcher\MonitorSwitcher.exe -load:..\MyMonitorProfiles\TV.xml
timeout 3
..\nircmd-x64\nircmd.exe setdefaultsounddevice "4 - 42 TV"
%windir%\System32\schtasks.exe /run /tn "Switch to TV"
pause
..\MonitorProfileSwitcher\MonitorSwitcher.exe -load:..\MyMonitorProfiles\PC.xml
timeout 3
..\nircmd-x64\nircmd.exe setdefaultsounddevice "5 - PL2888UH"

