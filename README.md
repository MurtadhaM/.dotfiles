# Windows Initialization Setup 🚀
---

##  Windows Terminal Setup 🎨 

powershell-core
- [x] Run the following PowerShell script to setup Windows Terminal with my custom settings.

```powershell
# Set Execution Policy to Bypass
Write-Host "Setting Execution Policy to Bypass" -ForegroundColor Magenta
Set-ExecutionPolicy Bypass -Scope Process -Force
# Download and RUN THE AUTOMATION SCRIPT
Write-Host "Downloading and Running the Windows Terminal Setup Script" -ForegroundColor Green
Invoke-WebRequest -Uri https://raw.githubusercontent.com/MurtadhaM/.dotfiles/Windows/WindowsTerminalSetup.ps1 -OutFile $HOME\Downloads\WindowsTerminalSetup.ps1"
# Run the Script
Write-Host "Running the Windows Terminal Setup Script" -ForegroundColor Magenta
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File "$HOME\Downloads\WindowsTerminalSetup.ps1"
# Set Execution Policy to Default
Write-Host "Setting Execution Policy to Default" -ForegroundColor Magenta
Set-ExecutionPolicy Default -Scope Process -Force
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
