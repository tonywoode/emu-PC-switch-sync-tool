# Windows Game Saves Management System (Ludusavi)

This system manages all Windows PC game save files across local storage (`C:`), the portable drive (`P:\PC\WindowsGameSaves`), and NAS network storage (`N:`).

It replaces legacy background RealtimeSync tasks with **Ludusavi**—an open-source, CLI-driven game save backup and restore tool backed by the PCGamingWiki database.

---

## 1. Key Principles & Architecture

* **Local Storage (`C:`)**: Windows games run directly off local C: drive save paths (`AppData`, `Documents`, `Saved Games`, `ProgramData`).
* **Instant Game Launch**: Games launch immediately with zero network or restore delays.
* **Exit-Only Backup**: Save backups occur locally to `P:\PC\WindowsGameSaves` when exiting RetroBat games or closing Quickplay.
* **5-Version Retention Policy**: Ludusavi maintains up to 5 timestamped full backup snapshots for every game you play. Previous versions are preserved as historical snapshots.
* **Minecraft Excluded**: Minecraft world management is excluded from this system to avoid cross-device conflicts.

---

## 2. Directory Structure & Key Files

| File / Folder | Purpose |
| :--- | :--- |
| `P:\PC\WindowsGameSaves\` | Flat, game-named save backup directory containing individual game save folders. |
| `P:\PC\WindowsGameSaves_LegacyArchive\` | Safe archive for legacy pre-Ludusavi save folders (`Documents`, `Saved Games`, `appdata`, `program files (x86)`). |
| `1.Setup_New_PC_for_Windows_Game_Saves.bat` | **Run on New PC**: Installs Ludusavi via Winget, configures `config.yaml`, and restores all game saves from `P:\PC\WindowsGameSaves` to the local `C:` drive. |
| `RealtimeSync_with_FreeFileSync\Emulator_NAS_Sync\6.WindowsGameSaves\ludusavi-sync.bat` | Central backup & restore launcher script called by RetroBat and Quickplay. |
| `RealtimeSync_with_FreeFileSync\Emulator_NAS_Sync\6.WindowsGameSaves\convertRealtimeSyncToLudusavi-one-off.bat` | Self-elevating Admin migration script that idempotently deletes legacy RealtimeSync task, archives legacy folders, and removes obsolete 6a/6b/6c files. |
| `R:\retrobat\emulationstation\.emulationstation\scripts\game-end\ludusavi-backup-game.bat` | RetroBat game-end hook script. Automatically triggers single-game backup on game exit. |

---

## 3. Usage Commands & CLI

### Manual Backup (All Games)
```cmd
call P:\WinScripts\Emulator_PC_Switcher_Sync_Tool\RealtimeSync_with_FreeFileSync\Emulator_NAS_Sync\6.WindowsGameSaves\ludusavi-sync.bat backup
```

### Manual Backup (Single Game)
```cmd
call P:\WinScripts\Emulator_PC_Switcher_Sync_Tool\RealtimeSync_with_FreeFileSync\Emulator_NAS_Sync\6.WindowsGameSaves\ludusavi-sync.bat backup "Grand Theft Auto V"
```

### Manual Restore (All Games on New PC)
```cmd
call P:\WinScripts\Emulator_PC_Switcher_Sync_Tool\RealtimeSync_with_FreeFileSync\Emulator_NAS_Sync\6.WindowsGameSaves\ludusavi-sync.bat restore
```

---

## 4. Ludusavi Configuration Location

Configuration file: `%APPDATA%\ludusavi\config.yaml`

Default configuration settings:
```yaml
backup:
  path: P:/PC/WindowsGameSaves
  ignoredGames:
    - 'Minecraft'
    - 'Minecraft: Bedrock Edition'
    - 'Minecraft: Java Edition'
  retention:
    full: 5
    differential: 0
  filter:
    ignoredPaths:
      - 'N:/**'
      - 'S:/**'
      - 'R:/**'
      - 'P:/**'
      - 'F:/**'
```
