### INTERESTING PROFILE HERE --- 
#  https://raw.githubusercontent.com/ChrisTitusTech/powershell-profile/main/Microsoft.PowerShell_profile.ps1
#--------------------------------------------------

<# Murtadha Marzouq PowerShell Profile

CHANGE GLOBALLY
pwsh -ExecutionPolicy Bypass -NoExit -File  %userprofile%/profile.ps1
#>

$Content = @'
# Set Execution Policy
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser -Force
# Posh Setup
(@(& 'oh-my-posh.exe' init powershell --config='' --print) -join "`n") | Invoke-Expression
# Completion
oh-my-posh completion powershell | Out-String | Invoke-Expression
# Setting Keybinds
set-PSReadLineKeyHandler -Key Ctrl+a -Function BeginningOfLine
set-PSReadLineKeyHandler -Key Ctrl+e -Function EndOfLine
#  delete the whole line
set-PSReadLineKeyHandler -Key Ctrl+k -Function KillLine
# Set Default Editor
# Set Execution Policy
# Set Default Editor
$env:EDITOR = 'code -w'
# Set Default Browser
$env:BROWSER = 'firefox.exe'
# Set Default Shell
$env:SHELL = 'pwsh.exe'
# Set Default Terminal
$env:TERMINAL = 'wt.exe'
# Set Default Terminal
'@

# LIST OF TOOLS TO INSTALL
$tools = @(
    "Microsoft.PowerShell",
    "Microsoft.PowerShell.Preview",
    "posh", 
    "git", # git
    "oh-my-posh", # posh theme
    "Microsoft.PowerToys", # FancyZones
    "SomePythonThings.WingetUIStore",# winget gui
    
)



# install winget
function install_winget() {
    # Check if winget is installed
    if (!(Test-Path -Path $(where.exe winget.exe))){
        # Install winget
        [Net.ServicePointManager]::SecurityProtocol =
    [Net.ServicePointManager]::SecurityProtocol -bor
    [Net.SecurityProtocolType]::Tls12
    Install-PackageProvider -Name NuGet -Force
    Install-Module -Name PowerShellGet -Force
    Install-PackageProvider -Name winget -Force
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
    }else{
        Write-Host "winget is already installed"
    }
}

# POSH Setup
function install_tools() {
    winget install --id Microsoft.PowerShell --source winget
    winget install --id Microsoft.PowerShell.Preview --source winget 
    winget install posh git oh-my-posh
    winget install Microsoft.PowerToys
    winget install winget
}

function install_fonts() {
    cd $HOME\Downloads
    # Download Fonts Installer
    "DejaVuSansM Nerd Font Mono", "DejaVuSansMono Nerd Font Mono", "DejaVuSansMono Nerd Font", "DejaVuSansMono Nerd Font Complete Mono", "DejaVuSansMono Nerd Font Complete", "DejaVuSansMono Nerd Font Mono", "DejaVuSansMono Nerd Font", "DejaVuSansMono Nerd Font Complete Mono", "DejaVuSansMono Nerd Font Complete", "DejaVuSansMono Nerd Font Mono", "DejaVuSansMono Nerd Font", "DejaVuSansMono Nerd Font Complete Mono", "DejaVuSansMono Nerd Font Complete", "DejaVuSansMono Nerd Font Mono", "DejaVuSansMono Nerd Font", "DejaVuSansMono Nerd Font Complete Mono", "DejaVuSansMono Nerd Font Complete" | ForEach-Object { winget install $_ }
    
}

function profile_prep(){

# test if C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1 exists
if (!(Test-Path -Path $HOME\\profile1.ps1)){
     # Create profile.ps1
    New-Item -Path $HOME\\profile.ps1 -ItemType File
    # Write Content to profile.ps1
    Set-Content -Path $HOME\\profile.ps1 -Value $Content
    # Set Execution Policy
    Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser -Force
    # Posh Setup
    (@(& 'oh-my-posh.exe' init powershell --config='' --print) -join "`n") | Invoke-Expression
    # Completion
    oh-my-posh completion powershell | Out-String | Invoke-Expression
    # Setting Keybinds
    set-PSReadLineKeyHandler -Key Ctrl+a -Function BeginningOfLine
    set-PSReadLineKeyHandler -Key Ctrl+e -Function EndOfLine
    #  delete the whole line
    set-PSReadLineKeyHandler -Key Ctrl+k -Function KillLine
    # Set Default Editor
    # Set Execution Policy
    # Set Default Editor
    $env:EDITOR = 'code -w'
    # Set Default Browser
    $env:BROWSER = 'firefox.exe'
    # Set Default Shell
    $env:SHELL = 'pwsh.exe'
    # Set Default Terminal
    $env:TERMINAL = 'wt.exe'
    # Set Default Terminal
    # Set Profile
    
}
}

function posh(){
    # If oh-my-posh is not installed
    if (!(Test-Path -Path $(where.exe oh-my-posh.exe))){
        # Install Posh
        winget install posh git oh-my-posh
        # Posh Setup
        oh-my-posh init pwsh | Out-String | Invoke-Expression
        # Completion
        oh-my-posh completion powershell | Out-String | Invoke-Expression

    }else{
        # Set Execution Policy
        # Posh Setup
        oh-my-posh init pwsh | Out-String | Invoke-Expression
        # Completion
        oh-my-posh completion powershell | Out-String | Invoke-Expression
    }

}


function WSL_Networking_Install(){
# Install WSL IP Handler
$ModuleName = "Wsl-IpHandler"
$outFile = "$ModuleName.zip"
Invoke-WebRequest -Uri https://codeload.github.com/wikiped/Wsl-IpHandler/zip/refs/heads/master -OutFile $outFile
Expand-Archive -Path $outFile -DestinationPath '.' -Force
Remove-Item -Path $outFile
Rename-Item -Path "${ModuleName}-master" -NewName $ModuleName -Force
Set-Location $ModuleName
Import-Module .\Wsl-IpHandler.psd1
Set-Location ~


$gatewayIpAddress = "172.16.55.1"
$wslInstanceIpAddress = "172.16.55.101"
$wslInstanceName = "Ubuntu"

# Install Wsl-IpHandler
Install-WslIpHandler -WslInstanceName Ubuntu -GatewayIpAddress $gatewayIpAddress  -WslInstanceIpAddress $wslInstanceIpAddress -UseScheduledTaskOnUserLogOn -DontModifyPsProfile

Install-WslIpHandler -WslInstanceName $WslInstanceName -GatewayIpAddress $gatewayIpAddress  -WslInstanceIpAddress $wslInstanceIpAddress 

}


function init(){
# check if powershell version is 7.1
$version = $PSVersionTable.PSVersion.Major
if ($version -eq 7) {
Write-Host "PowerShell Version is 7"
# LOAD POSH PROFILE
profile_setup


} else {
    Write-Host "PowerShell Version is not 7 or above 😢! Installing using Winget 👀👀"
    # Install PowerShell 7
    winget install --id Microsoft.PowerShell --source winget # 👌👌
    winget  install --id Microsoft.PowerShell.Preview --source winget # 👌👌
    # Set PowerShell 7 as default shell
    $env:SHELL = 'pwsh.exe'
    # Set PowerShell 7 as default terminal
    $env:TERMINAL = 'wt.exe'
    
}

}


