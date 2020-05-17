$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

Remove-Item "$installLocation" -recurse -force
Remove-Item "$startMenuDir" -recurse -force
