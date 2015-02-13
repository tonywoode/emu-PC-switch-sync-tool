@echo off
set backlog_dir=O:\Scripts\Emulator_PC_Switcher_Sync_Tool\mirror_Scripts\backlog
robocopy F: Y: /mir /XD "$RECYCLE.BIN" "System Volume Information" "$AVG" "RECYCLER" /R:5 /W:5 /TEE /ETA /LOG+:%backlog_dir%\backlog_STREAM_TO_STREAM%DATE:/=%.log
pause

