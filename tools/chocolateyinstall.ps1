$ErrorActionPreference = 'Stop';
$checksum = "abff07d8cc1880e70b4eb44cfff25f6cecd03d8aca544f5ff142320342616f525185fa1617b5c0290a604a1e9670bfac422b5b4435a06b64b620516dea08f909"
$checksum_icon = "92ab5274c605d291711bfc69e9d0214f5fa99d6c3acf6303b07326bc059211971e916cee750a547869943a91ca82d5142e4f31065cc0e6e76dea5eb08730a4be"
$repository = "stuntrally/stuntrally3"
$versionParts = $packageVersion -split '\.'
$majorMinorVersion = "$($versionParts[0]).$($versionParts[1])"
$installDirectory = "${env:ProgramFiles(x86)}\Stunt Rally $majorMinorVersion\sr\bin\Release"
$exePath = "$installDirectory\StuntRally3.exe"

Write-Host "Fetching version '$majorMinorVersion'"

$download_url = "https://github.com/$repository/releases/download/$majorMinorVersion/StuntRally-$majorMinorVersion-installer.exe"
$installArgs = @{
    packageName     = $env:ChocolateyPackageName
    silentArgs      = "/S"
    Url             = $download_url
    Checksum        = $checksum
    checksumType  = 'sha512'
}
$shortcutArgs = @{
    ShortcutFilePath    = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Stunt Rally 3.2\Stunt Rally.lnk"
    TargetPath          = "$exePath"
    IconLocation        = "$installDirectory\StuntRallyIcon.ico"
    WorkingDirectory    = "$installDirectory"
}

Install-ChocolateyPackage @installArgs


# Manually Create Link so we can set Icon
Get-WebFile -Url "https://raw.githubusercontent.com/artemis-beta/chocolatey-stuntrally/main/media/StuntRallyIcon.ico" -FileName $installDirectory\StuntRallyIcon.ico
Get-ChecksumValid -File $installDirectory\StuntRallyIcon.ico -Checksum $checksum_icon -ChecksumType 'sha512'
Remove-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Stunt Rally 3.2\Stunt Rally 3.lnk"
Install-ChocolateyShortcut @shortcutArgs
