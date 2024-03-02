<# Murtadha Marzouq Windows Initial Setup Script #>

function Install-Fonts() {
    cd $HOME\Downloads
    # Download Fonts Installer
    Invoke-WebRequest -Uri "https://github.com/powerline/fonts/archive/refs/heads/master.zip" -OutFile "fonts.zip"
    Expand-Archive -Path "fonts.zip" -DestinationPath "fonts"
    cd fonts
    .\install.ps1
}

function Install-Winget(){
    # Source https://github.com/asheroto/winget-install
    # Check if Winget is installed
    $winget = Get-Command winget -ErrorAction SilentlyContinue
    if ($winget -eq $null) {
        # Attempt to install winget
        Write-Host "Installing Winget Method #1" -ForegroundColor Green
        # Method 1 (Run as Administrator)
        &([ScriptBlock]::Create((irm asheroto.com/winget))) -Force # Or irm asheroto.com/winget | iex
        # Check if winget is installed
        $winget = Get-Command winget -ErrorAction SilentlyContinue
        if ($winget -eq $null) {
            Write-Host "Attempting to Install Winget Method #2" -ForegroundColor Green
            # Method 2 (Run as Administrator)
            irm winget.pro | iex
        }
        else{
        Write-Host "🖊️ winget Installed 👀 !" -ForegroundColor White
        }

} else {
    Write-Host "winget already installed" -ForegroundColor Green
}
 
}


function Install-Winget-Packages(){

<# List of ALREADY INSTALLED WINGET PACKAGES#>
$winget_packages = ((winget list) -match ' winget$' | Select-String -Pattern "(?<= {2,})(?!\d+\.\d+)\S+(?= {2,})") | foreach {$_.Matches.Value}
$winget_packages = $winget_packages -replace ' ', '.'

 <# LIST OF PACKAGE IDs TO INSTALL WITH WINGET#>
$packages = @(
    "7zip.7zip",
    "Git.Git",
    "Google.Chrome",
    "JernejSimoncic.Wget",
    "rcmaehl.MSEdgeRedirect",
    "Microsoft.WindowsTerminal",
    "Microsoft.PowerToys",
    "Insecure.Nmap",
    "VideoLAN.VLC",
    "WinDirStat.WinDirStat",
    "RARLab.WinRAR",
    "WiresharkFoundation.Wireshark",
    "jqlang.jq",
    "junegunn.fzf",
    "WinSCP.WinSCP",
    "Microsoft.VisualStudioCode.Insiders",
    "Chocolatey.Chocolatey",
    "PuTTY.PuTTY",
    "GitHub.cli",
    "Git.Git",
    "Python.Launcher"
    )
    # Remove already installed packages
    $packages = $packages | Where-Object {$_ -notin $winget_packages}    
    # Install packages
    $total = $packages.Count
    Write-Host Installing $total packages -ForegroundColor Green
    foreach ($package in $packages) {
        Write-Host Installing $package $packages ($packages.IndexOf($package) + 1) of $total -ForegroundColor Blue
        winget install --id $package --source winget 
        Write-Host "🖊️ $package Installed 👀 " -ForegroundColor Green
    }   
}


<# INSTALL MSYS2 for LINUX-LIKE Experience#>
function Install-MSYS2(){
    # Download MSYS2 Installer
    Invoke-WebRequest -Uri "https://repo.msys2.org/distrib/msys2-x86_64-latest.exe" -OutFile "msys2-x86_64-latest.exe"
    # Install MSYS2
    .\msys2-x86_64-latest.exe install --root C:\MSYS2 --confirm-command
    # Check if MSYS2 is installed
    $msys2 = Test-Path -Path "C:\msys64\usr\bin\bash.exe"
    if ($msys2 -eq $true) {
        # Add MSYS2 to PATH
        $env:Path += ";C:\msys64\usr\bin\"
        # Set Alias for bash is MSYS2
        set-alias bash 'C:\msys64\usr\bin\'
        Write-Host "🖊️ MSYS2 Installed 👀 !" -ForegroundColor Green
    }
    else{
        Write-Host "MSYS2 Installation Failed" -ForegroundColor Red
    }

}




