$ErrorActionPreference = 'Stop';
$versionParts = $packageVersion -split '\.'
$majorMinorVersion = "$($versionParts[0]).$($versionParts[1])"
$installPath = "${env:ProgramFiles(x86)}\Stunt Rally $majorMinorVersion"

$uninstallArgs = @{
    PackageName     = $env:ChocolateyPackageName
    FileType        = "exe"
    SilentArgs      = "/S"
    ValidExitCodes  = @(0)
    File            = "$installPath\uninst.exe"
}

Uninstall-ChocolateyPackage @uninstallArgs
