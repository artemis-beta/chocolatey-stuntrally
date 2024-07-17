$ErrorActionPreference = 'Stop';
$checksum = "ed0df9a8d7df3fc8ef2ba953c29afd68405ee55e2bfd3c4eefbedeab2b91e7d0b4c26b3991b3ab58fa44300b6de9dc326e0b3b1c4d665aa088cf78522bde10cc"
$repository = "stuntrally/stuntrally3"
$versionParts = $packageVersion -split '\.'
$majorMinorVersion = "$($versionParts[0]).$($versionParts[1])"

Write-Host "Fetching version '$majorMinorVersion'"

$download_url = "https://github.com/$repository/releases/download/$majorMinorVersion/StuntRally-$majorMinorVersion-installer.exe"
$installArgs = @{
    packageName     = $env:ChocolateyPackageName
    silentArgs      = "/S"
    Url             = $download_url
    Checksum        = $checksum
    checksumType  = 'sha512'
}

Install-ChocolateyPackage @installArgs /V 4

$exePath = "${env:ProgramFiles(x86)}\Stunt Rally $majorMinorVersion\sr\bin\Release\StuntRally3.exe"

C:\Users\kzare\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Stunt Rally 3.1
# Manually Create Link so we can set Icon
Get-WebFile -Url "https://raw.githubusercontent.com/AlbertBall/railway-dot-exe/master/railway_Icon.ico" -FileName $binaryDirectory\railway.ico
Remove-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Stunt Rally $majorMinorVersion.lnk"
Install-ChocolateyShortcut -ShortcutFilePath "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Stunt Rally.lnk" -TargetPath "$exePath" -IconLocation $toolsDir\Data\icon.ico
