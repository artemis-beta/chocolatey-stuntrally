$ErrorActionPreference = 'Stop';
$checksum = "ba579c4f691c240286ca21f95f0c93b2a787bec3e379d20d04b59fe47d379fea"
$repository = "stuntrally/stuntrally3"

Write-Host "Fetching version '$env:ChocolateyPackageVersion'"

$download_url = "https://github.com/$repository/releases/download/$env:ChocolateyPackageVersion/StuntRally-$env:ChocolateyPackageVersion-installer.exe"
$installArgs = @{
    packageName     = $env:ChocolateyPackageName
    silentArgs      = "/S"
    Url             = $download_url
    Checksum        = $checksum

}

Install-ChocolateyPackage $installArgs