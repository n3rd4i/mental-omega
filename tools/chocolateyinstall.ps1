$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

$unzipLocation = $installLocation
$url        = Get-ModdbDlUrl 'https://www.moddb.com/downloads/start/115776'
$packageArgs = @{
  packageName   = "$env:ChocolateyPackageName-mod" # VERSION 3.3.0 (16/12/2016)
  unzipLocation = $unzipLocation
  url           = $url
  checksum      = 'A064A353E957C03D82CDA967B0DC6CC76C780A964AF54A03C1E86F75C8ECFF0E'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$url        = Get-ModdbDlUrl 'https://www.moddb.com/downloads/start/144023'
$packageArgs = @{
  packageName   = "$env:ChocolateyPackageName-patch" ## PATCH 3.3.4 (24/09/2018)
  unzipLocation = $unzipLocation
  url           = $url
  checksum      = '51ECD358E408E45D8683BA7B707C9002F09C24C5FF9724D1A7EA2AB8C5429775'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$url        = Get-ModdbDlUrl 'https://www.moddb.com/downloads/start/115815'
$packageArgs = @{
  packageName   = "$env:ChocolateyPackageName-soundtrack" # SOUNDTRACK FOR 3.3.X
  unzipLocation = $unzipLocation
  url           = $url
  checksum      = '1294471E8E52F985F0B546FC98027B26FB7F4AFF869EF03744EEAADCD050E55C'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## Change `Renderer` from Default to TS_DDRAW_2
(Get-Content "$iniFile") -replace 'Renderer=Default', 'Renderer=TS_DDRAW_2' | Set-Content "$iniFile"

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir $GameName).lnk" `
  -TargetPath $binLocation `
  -WorkingDirectory "$installLocation"
Install-ChocolateyShortcut -ShortcutFilePath "$(Join-Path $startMenuDir README.lnk)" `
  -TargetPath "$(Join-Path $installLocation readmeMO.txt)"
