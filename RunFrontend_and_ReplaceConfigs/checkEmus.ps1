Write-Host "Num Args:" $args.Length;
$usedEmulators = Get-Process retroarch,mame64,pcsx2 -ErrorAction SilentlyContinue
if ( !($usedEmulators) ) {
  & $args[0] $args[1]
  }
