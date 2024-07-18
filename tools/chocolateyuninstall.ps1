$ErrorActionPreference = 'Stop';
$versionParts = $packageVersion -split '\.'
$majorMinorVersion = "$($versionParts[0]).$($versionParts[1])"
$installPath = "${env:ProgramFiles(x86)}\Stunt Rally $majorMinorVersion"
$registryPath = "HKLM:\HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Stunt Rally"
$shortcutPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Stunt Rally $majorMinorVersion\Stunt Rally 3.lnk"

# No silent option to NSIS installer so have to manually uninstall
if(Test-Path $shortcutPath) {
    Remove-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Stunt Rally $majorMinorVersion\Stunt Rally 3.lnk"
}

if(Test-Path $installPath) {
    Remove-Item -Recurse -Verbose $installPath
}

if(Test-Path $registryPath) {
    Write-Output "Deleting Registry Entry"
    Remove-Item -Path $registryPath -Recurse -Force
}