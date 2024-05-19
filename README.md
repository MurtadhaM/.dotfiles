# Windows Initialization Setup 🚀
---

##  Windows Terminal Setup 🎨 

- [x] Run the following PowerShell script to setup Windows Terminal with my custom settings.

```powershell
# Set Execution Policy to Bypass
Write-Host "Setting Execution Policy to Bypass" -ForegroundColor Purple
Set-ExecutionPolicy Bypass -Scope Process -Force
# Download and RUN THE AUTOMATION SCRIPT
Write-Host "Downloading and Running the Windows Terminal Setup Script" -ForegroundColor Green
Invoke-WebRequest -Uri https://raw.githubusercontent.com/MurtadhaM/.dotfiles/Windows/WindowsTerminalSetup.ps1 -OutFile ~/Downloads/WindowsTerminalSetup.ps1
# Run the Script
Wirte-Host "Running the Windows Terminal Setup Script" -ForegroundColor Blue
Start-Process -FilePath ~/Downloads/WindowsTerminalSetup.ps1
```
 
## Download My Custom Powershell Settings 🛠️
 
```powershell
# Download the Configuration Files
Write-Host "Downloading the Configuration Files" -ForegroundColor Green
# Go to the User Profile Directory
cd $env:USERPROFILE
# Download the Configuration Files
git clone https://github.com/MurtadhaM/.dotfiles/
cd .dotfiles
git checkout Windows
# Copy the Configuration Files to the Windows Terminal Directory
Copy-Item profile.ps1 $PROFILE.AllUsersCurrentHost

```
