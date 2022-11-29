<#
# Author: Murtadha Marzouq
#>
$Separator = [System.IO.Path]::DirectorySeparatorChar

# Install PowerLine Fonts
cd "$env:HOME"  
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
# Install all fonts
Powrshell -ExecutionPolicy  -File fonts\\install.ps1
rm -rf fonts


# Install Oh My Posh
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
# Set-Theme

# . LINUX ((Get-Content /proc/version).Contains("Linux") ) -and ( $(Get-Content /proc/version).Contains("linux"))
$OS_ARCH = [Environment]::OSVersion.Platform 

$installer = ''
if ($OS_ARCH -eq "Win32NT") {
    $OS_ARCH = "windows"
} elseif ($OS_ARCH -eq "Unix") {
    $OS_ARCH = "linux"
} else {
    $OS_ARCH = "macos"
}

if ($OS_ARCH -eq "windows") {
    $installer = "install-amd64.exe"
} elseif ($OS_ARCH -eq "linux") {
    $installer = "posh-linux-amd64"
} else {
    $installer = "posh-darwin-amd64"
}


if ($installer -eq '') {
    Write-Host @"
The installer for system architecture ($arch) is not available.
"@
    exit
}
Write-Host "Downloading $installer..."

$url = "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/$installer"

$downloadPath = "$env:HOME" +  $Separator + $installer
Invoke-WebRequest -Uri $url -OutFile $downloadPath

Write-Host "Installing $installer..."
if ($OS_ARCH -eq "windows") {
    Start-Process -FilePath $downloadPath -Wait
} else {
    chmod +x $downloadPath
    $downloadPath
}


Write-Host @'
Done!

Restart your terminal and have a look at the
documentation on how to proceed from here.

https://ohmyposh.dev/docs/installation/prompt
'@


