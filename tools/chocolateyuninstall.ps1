$ErrorActionPreference = 'Stop';
$installPath = "${env:ProgramFiles(x86)}\Stunt Rally $env:ChocolateyPackageVersion"

$uninstallArgs = @{
    PackageName     = $env:ChocolateyPackageName
    FileType        = "exe"
    SilentArgs      = "/S"
    ValidExitCodes  = @(0)
    File            = "$installPath\uninst.exe"
}

Uninstall-ChocolateyPackage @uninstallArgs
