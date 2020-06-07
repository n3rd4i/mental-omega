$GameName = 'MentalOmega'

$installLocation = [IO.Path]::Combine($ENV:LocalAppData, 'Programs', $GameName.toLower())
$startMenuDir = [IO.Path]::Combine($ENV:AppData, 'Microsoft\Windows\Start Menu\Programs', "$GameName")
$binLocation = "$(Join-Path $installLocation 'MentalOmegaClient.exe')"

$iniFile = "$(Join-Path $installLocation 'RA2MO.ini')"
