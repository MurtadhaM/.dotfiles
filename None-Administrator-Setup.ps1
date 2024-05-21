


# INSTALL CHOCOLATEY
function Install-Chocolatey {
    <# OPTION 1 #>
    # $InstallDir='C:\ProgramData\chocoportable'
    # $env:ChocolateyInstall="$InstallDir"
    # Set-ExecutionPolicy Bypass -Scope Process -Force;
    # iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    <# OPTION 2 #>
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Write-Host "Installing Chocolatey..." -ForegroundColor Yellow
    $env:chocolateyUseWindowsCompression = 'true' ; 
    $env:ChocolateyInstall = "$home\choco" ; 
    Write-Host "Installing Chocolatey to $env:ChocolateyInstall"
    iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex;
    Write-Host "Adding Chocolatey to PATH" -ForegroundColor Yellow
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User") ;
    [System.Environment]::SetEnvironmentVariable("Path", $env:Path, "Machine") ;
} 


# INSTALL PORTABLE PACKAGES
function Install-Packages {
    $PACKAGE_LIST = @(
        '7zip.portable',
        'git.portable',
        'putty.portable',
        'nano',
        'posh-git',
        'posh-sshell',
       
        'hack-font',
        'fira-code',
        'vscode'
    )

    foreach ($package in $PACKAGE_LIST) {
        # Below command is to enable global confirmation for chocolatey
        choco feature enable -n allowGlobalConfirmation
      
        choco install $package -y -Force -
    }
}




$env:PATH = "$env:PATH;C:\ProgramData\chocoportable\bin\"