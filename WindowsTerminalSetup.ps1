<# Murtadha Marzouq Windows Initial Setup Script #>

function Install-Fonts() {
    cd $HOME\Downloads
    # Download Fonts Installer
    curl -L "https://github.com/powerline/fonts/archive/refs/heads/master.zip" -o "fonts.zip"
    Expand-Archive -Path "fonts.zip" -DestinationPath "fonts"
    cd fonts\fonts-master
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
function Install-Choco(){
    # Check if Choco is installed
    $choco = Get-Command choco -ErrorAction SilentlyContinue

    if ($choco -eq $null) {
        # Attempt to install choco
        Write-Host "Installing Choco" -ForegroundColor Green
        # Method 1 (Run as Administrator)
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        # Check if choco is installed
        $choco = Get-Command choco -ErrorAction SilentlyContinue
        if ($choco -eq $null) {
            Write-Host "Attempting to Install Choco Method #2" -ForegroundColor Green
            # Method 2 (Run as Administrator)
            irm https://chocolatey.org/install.ps1 | iex
        }
        else{
        Write-Host "🖊️ "
        Write-Host "Choco Installed 👀 !" -ForegroundColor Green
        }

        } else {
            Write-Host "Choco already installed" -ForegroundColor Green
        }

        # Set Choco Path
        $env:Path += ";C:\ProgramData\chocolatey\bin"
        # Enable Global Confirmation
        choco feature enable -n allowGlobalConfirmation


}

<# INSTALL Powershell Core#>
function Install-Powershell-Core(){
    # Check if Powershell Core is installed
    $pwsh = Get-Command pwsh -ErrorAction SilentlyContinue
    if ($pwsh -eq $null) {
        Write-Host "Installing Powershell Core" -ForegroundColor Green
        # Install Powershell Core
        choco install powershell-core -y
        Write-Host "🖊️ Powershell Core Installed 👀 !" -ForegroundColor Green
    }
    else{
        Write-Host "Powershell Core already installed" -ForegroundColor Green
    }
}


function Install-Choco-Packages(){

    

$packages = @(
    "powershell-core",
    "7zip",
    "openssl",
    "git",
    "google-chrome-x64",
    "wget",
    "Microsoft.WindowsTerminal",
    "powertoys",
    "grep",
    "nmap",
    "vlc",
    "oh-my-posh",
    "windirstat",
    "winrar",
    "wireshark",
    "jq",
    "fzf",
    "winscp",
    "vscode-insiders",
    "putty",
    "gh",
    "python312",
"tftpd32",
"bat",
"nerdfont-hack",
"font-nerd-DejaVuSansMono",
"nano"
    )
# Remove already installed packages
    $packages = $packages | Where-Object {$_ -notin $winget_packages}    
    # Install packages
    $total = $packages.Count
    Write-Host Installing $total packages -ForegroundColor Green
    # $packages| ForEach-Object -Parallel  { Write-Host "Installing $_" -ForegroundColor Green; choco install $_ -y } -ThrottleLimit 5
    foreach ($package in $packages) {
        Write-Host Installing $package $packages ($packages.IndexOf($package) + 1) of $total -ForegroundColor Blue
        # GLOBAL CONFIRMATION
        choco feature enable -n allowGlobalConfirmation
        choco install - $package  -y
        Write-Host "🖊️ $package Installed 👀 " -ForegroundColor Green
    }   
}

<# INSTALL PROCS #>
function INSTALL-PROCS(){
    # Check if Procs is installed
    $procs = Get-Command procs -ErrorAction SilentlyContinue
    if ($procs -eq $null) {
        Write-Host "Installing Procs" -ForegroundColor Green
        # Install Procs
        winget install procs 
        # CONFIGURING COMPLETION
        procs --gen-completion-out powershell | Out-String | Invoke-Expression
        Write-Host "🖊️ Procs Installed 👀 !" -ForegroundColor Green
    }
    else{
        Write-Host "Procs already installed, adding completion" -ForegroundColor Green
        # CONFIGURING COMPLETION
        procs --gen-completion-out powershell | Out-String | Invoke-Expression        
    }
}



<# INSTALL KUBECTL #>

function INSTALL-KUBECTL(){

# SOURCE https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/
 Write-Host DOWNLOADING KUBECTL USING CHOCO -ForegroundColor Green
#curl.exe -LO "https://dl.k8s.io/release/v1.30.0/bin/windows/amd64/kubectl.exe"
choco install kubernetes-cli
# CONFIGURING COMPLETION
# SOURCE: https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/
Write-Host CONFIGURING AUTOCOMPLETION -ForegroundColor Green
kubectl completion powershell >> $PROFILE
kubectl completion powershell | Out-String | Invoke-Expression

}

<# INSTALL MSYS2 for LINUX-LIKE Experience#>
function Install-MSYS2(){
    # Download MSYS2 Installer
    curl -L  "https://repo.msys2.org/distrib/msys2-x86_64-latest.exe" -o "msys2-x86_64-latest.exe"
    # Install MSYS2
    .\msys2-x86_64-latest.exe install --root C:\MSYS2 --confirm-command
    # Check if MSYS2 is installed
    $msys2 = Test-Path -Path "C:\msys64\usr\bin\bash.exe"
    if ($msys2 -eq $true) {
        # Add MSYS2 to PATH
        $env:Path += ";C:\msys64\usr\bin\"
        $env:Path += ";C:\msys64\ucrt64\bin\"
        $env:Path += ";C:\msys64\mingw64\bin\"
        # Set Alias for bash is MSYS2
        set-alias bash 'C:\msys64\usr\bin\'
        Write-Host "🖊️ MSYS2 Installed 👀 !" -ForegroundColor Green
    }
    else{
        Write-Host "MSYS2 Installation Failed" -ForegroundColor Red
    }

}


<# INSTALL WSL2#>
function Install-WSL2(){
    # Check if WSL2 is installed
    $wsl = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    if ($wsl -eq $null) {
        Write-Host "Installing WSL2" -ForegroundColor Green
        # Enable WSL2
        dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
        # Enable Virtual Machine Platform
        dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
        # Download and Install WSL2 Linux Kernel
        Invoke-WebRequest -Uri "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi" -OutFile "wsl_update_x64.msi"
        Start-Process -Wait -FilePath "wsl_update_x64.msi"
        # Set WSL2 as Default
        wsl --set-default-version 2
        Write-Host "🖊️ WSL2 Installed 👀 !" -ForegroundColor Green
    }
    else{
        Write-Host "WSL2 already installed" -ForegroundColor Green
    }
}

<# INSTALL WSL2 Distro#>
function Install-WSL2-Distro(){
    # Check if WSL2 Distro is installed
    $wsl_distro = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    if ($wsl_distro -eq $null) {
        Write-Host "Installing WSL2 Distro" -ForegroundColor Green
        # Download and Install Ubuntu 20.04
        wget "https://aka.ms/wslubuntu2004" -OutFile "Ubuntu2004.appx" 
        Add-AppxPackage .\Ubuntu2004.appx
        Write-Host "🖊️ WSL2 Distro Installed 👀 !" -ForegroundColor Green
    }
    else{
        Write-Host "WSL2 Distro already installed" -ForegroundColor Green
    }
}
<# SMART TASKBAR #>
function INSTALL-SMART-TASKBAR(){
    # Check if Smart Taskbar is installed
    $smart_taskbar =Get-Item "C:\Program Files\SmartTaskbar" -ErrorAction ignore
    if ($smart_taskbar -eq $null) {
        Write-Host "Installing Smart Taskbar" -ForegroundColor Green
        # Install Smart Taskbar
        Invoke-WebRequest -Uri "https://github.com/ChanpleCai/SmartTaskbar/releases/download/v1.4.5/SmartTaskbar_Setup.exe" -OutFile "C:\Windows\TEMP\SmartTaskbar_Setup.exe"
        Start-Process -Wait -FilePath "C:\Windows\TEMP\SmartTaskbar_Setup.exe" -ArgumentList "/VERYSILENT" 
    }
    else{
        Write-Host "Smart Taskbar already installed" -ForegroundColor Red
    }

}


<# SETUP GITHUB CLI#>
function Install-GitHubCLI(){

    # Install GitHub CLI Extensions
    gh extension install github/gh-copilot
    # Alias for GitHub CLI
    $GH_COPILOT_PROFILE = Join-Path -Path $(Split-Path -Path $PROFILE -Parent) -ChildPath "gh-copilot.ps1"
    gh copilot alias -- pwsh | Out-File ( New-Item -Path $GH_COPILOT_PROFILE -Force )
    Write-Host "GitHub CLI Extensions Installed 👀 !" -ForegroundColor Green
    . $GH_COPILOT_PROFILE
    Write-Host "GitHub CLI Aliased 👀 !" -ForegroundColor Green
    
}



<#  INSTALL CHROMATERM#>
function Install-Chromaterm(){
    # CHECK IF PYTHON IS INSTALLED
    $python = Get-Command python -ErrorAction SilentlyContinue
    if ($python -eq $null) {
        Write-Host "Python is not installed" -ForegroundColor Red
        Write-Host "Installing Python" -ForegroundColor Green
        choco install python -y
    }
    else{
        Write-Host "Python is already installed" -ForegroundColor Green
    }
    # INSTALL CHROMATERM USING PIP
    & $HOME\AppData\Local\Programs\Python\Python312\python.exe -m pip install https://github.com/hSaria/ChromaTerm/archive/refs/heads/windows.zip
    Write-host "Warning: CHANGE LINE nano +290 to nano +291 in chromaterm.py" -ForegroundColor Yellow
    # IMPORTANT FIX FOR CHROMATERM
    Write-Host "🖊️ Fixing Chromaterm" -ForegroundColor Green
    (Get-Content C:\python312\Lib\site-packages\chromaterm\__main__.py  -Raw -Encoding String).Replace("except io.UnsupportedOperation","except")|Out-File C:\python312\Lib\site-packages\chromaterm\__main__.py -Encoding utf8
    Write-Host "🖊️ Chromaterm Installed 👀 !" -ForegroundColor Green
    # DOWNLOAD CHROMATERM CONFIG
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MurtadhaM/Infrastructure/main/Administration/Colorize%20CLI/chromaterm.yml" -OutFile $HOME\.chromaterm.yml
    # MOVE CHROMATERM CONFIG TO APPDATA
    Write-Host "🖊️ Chromaterm Config Installed 👀 !" -ForegroundColor Green
    copy-Item -Path $HOME\.chromaterm.yml -Destination $env:APPDATA\chromaterm.yml
}


<# WINDOWS SETTINGS#>
function UPDATE-WINDOWS-SETTINGS(){
    # Set Dark Mode
    Write-Host "Setting Dark Mode" -ForegroundColor Green
    New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0 -PropertyType DWORD -Force
    New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0 -PropertyType DWORD -Force
    # Set Windows Terminal as Default Terminal
    # Disable Taskbar Search Box 
    Write-Host "Disabling Taskbar Search Box" -ForegroundColor Green
    New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name SearchboxTaskbarMode -Value 0 -PropertyType DWORD -Force
    # Disable Taskbar News and Interests
    Write-Host "Disabling Taskbar News and Interests" -ForegroundColor Green
    New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds -Name "FlightContent" -Value 0 -PropertyType DWORD -Force
}

<# COMMAND NOT FOUND INSTALLATION #>

function INSTALL-COMMAND-NOT-FOUND(){
    # Check if Command-Not-Found is installed
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Scope CurrentUser
    INSTALL-MODULE Microsoft.WinGet.CommandNotFound -Force -AllowClobber -Scope CurrentUser
    # Import Command-Not-Found Module
    Import-Module Microsoft.WinGet.CommandNotFound
    
}

<# Download CONFIG FILES #>
function Get-Config-FILES(){
    # Download Windows Terminal Config
    Write-Host "Downloading Windows Terminal Config" -ForegroundColor Green
    $WINDOWS_TERMINAL_SETTINGS_FILE=$(Get-Item "$ENV:USERPROFILE\AppData\Local\Packages\*Terminal*\LocalState\settings.json" |select -ExpandProperty FullName)
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MurtadhaM/.dotfiles/Windows/WindowsTerminalConfig.json" -OutFile $WINDOWS_TERMINAL_SETTINGS_FILE
    # Download WSL Config
    Write-Host "Downloading WSL Config" -ForegroundColor Green
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MurtadhaM/.dotfiles/Windows/WSL.config" -OutFile $HOME\.wslconfig
    # Download SSH Config & Keys
    Write-Host "Downloading SSH Config & Keys" -ForegroundColor Green
    # Download SSH Public Key
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MurtadhaM/.dotfiles/main/SECRETS/id_rsa.pub" -OutFile $HOME\.ssh\id_rsa.pub    
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MurtadhaM/.dotfiles/main/SECRETS/id_rsa" -OutFile $HOME\.ssh\id_rsa
    # Decrypt SSH Key
    Write-Host "Decrypting SSH Key ssh-keygen -p -f $HOME\.ssh\id_rsa" -ForegroundColor Green
    ssh-keygen -p -f $HOME\.ssh\id_rsa
}

<# INSTALL ALL#>
function INSTALL-ALL(){
    <#Set Execution Policy#> 
    # Write-Host "Setting Execution Policy" -ForegroundColor Yellow
    # Set-ExecutionPolicy Bypass -Scope Process -Force
    <# INSTALL CHOCO#>
    Write-Host "Installing Choco" -ForegroundColor Red
    Install-Choco
    <# INSTALL POWERSHELL CORE#>
    Write-Host "Installing Powershell Core" -ForegroundColor Blue
    Install-Powershell-Core
    <# INSTALL ALL CHOCO PACKAGES#>
    Write-Host "Installing Choco Packages" -ForegroundColor Green 
    #USING POWERSHELL 7.1 RUN     Install-Choco-Packages FOR PARALLEL INSTALLATION
    & 'C:\Program Files\PowerShell\7\pwsh.exe' -c . $HOME\Downloads\WindowsTerminalSetup.ps1; Install-Choco-Packages
    <# INSTALL WINGET#>
    Write-Host "Installing Winget" -ForegroundColor Blue
    Install-Winget
    <# INSTALL MSYS2#>
    Write-Host "Installing MSYS2" -ForegroundColor Blue
    Install-MSYS2
    <# INSTALL WSL DISTRO#>
    Write-Host "Installing WSL Distro" -ForegroundColor Blue
    Install-WSL2-Distro
    <# INSTALL NERD FONTS#>
    Write-Host "Installing Nerd Fonts" -ForegroundColor Orange
    Install-Fonts
    <# INSTALL SMART TASKBAR#>
    Write-Host "Installing Smart Taskbar" -ForegroundColor Green
    INSTALL-SMART-TASKBAR
    Write-Host "INSTALL COMMAND-NOT-FOUND" -ForegroundColor Green
    INSTALL-COMMAND-NOT-FOUND
    Write-Host "DOWNLOAD CONFIG FILES" -ForegroundColor Green
    Get-Config-FILES
    Write-Host "INSTALL GITHUB CLI" -ForegroundColor Green
    Install-GitHubCLI
    Write-Host "UPDATE WINDOWS SETTINGS" -ForegroundColor Green
    UPDATE-WINDOWS-SETTINGS
    Write-Host "Clone Dotfiles" -ForegroundColor Green
    git clone https://github.com/MurtadhaM/.dotfiles.git $HOME\.dotfiles; cd $HOME\.dotfiles; git checkout Windows
    Write-Host "Setup setup-AUTOCOMPLETION" -ForegroundColor Green
    . $HOME\.dotfiles\CUSTOM-FUNCTIONS.ps1; setup-AUTOCOMPLETION



}

<# INSTALL ALL#>
Write-Host "INSTALL ALL" -ForegroundColor Green
INSTALL-ALL
