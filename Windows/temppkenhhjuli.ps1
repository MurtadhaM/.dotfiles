<# CONVERTS WINGET PACKAGES TO CHOCO PACKAGES#>
$winget_packages = ((winget list) -match ' winget$' | Select-String -Pattern "(?<= {2,})(?!\d+\.\d+)\S+(?= {2,})") | foreach {$_.Matches.Value}
$winget_packages = $winget_packages -replace ' ', '.'

 <# LIST OF PACKAGE IDs TO INSTALL WITH CHOCO#>
$packages = @(
    "7zip",
    "git",
    "googlechrome",
    "wget",
    "microsoft-edge",
    "microsoft-windows-terminal",
    "powertoys",
    "nmap",
    "vlc",
    "windirstat",
    "winrar",
    "wireshark",
    "jq",
    "fzf",
    "winscp",
    "vscode-insiders",
    "chocolatey",
    "putty",
    "gh",
    "python"
    )
    # Remove already installed packages
    $packages = $packages | Where-Object {$_ -notin $winget_packages}    
    # Install packages
    $total = $packages.Count
    Write-Host Installing $total packages -ForegroundColor Green
    foreach ($package in $packages) {
        Write-Host Installing $package $packages ($packages.IndexOf($package) + 1) of $total -ForegroundColor Blue
        choco search $package 
        Write-Host "🖊️ $package Installed 👀 " -ForegroundColor Green
    }   


