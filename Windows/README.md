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
Invoke-WebRequest -Uri https://raw.githubusercontent.com/MurtadhaM/.dotfiles/main/Windows/WindowsTerminalSetup.ps1 -OutFile ~/Downloads/WindowsTerminalSetup.ps1
# Run the Script
Wirte-Host "Running the Windows Terminal Setup Script" -ForegroundColor Blue
Start-Process -FilePath ~/Downloads/WindowsTerminalSetup.ps1
# Set Execution Policy back to Restricted
Write-Host "Setting Execution Policy back to Restricted" -ForegroundColor Red
Set-ExecutionPolicy Restricted -Scope Process -Force
<# Windows Terminal Setup 🎨 #>
Write-Host "Windows Terminal Setup 🎨" -ForegroundColor Yellow
Invoke-WebRequest -Uri https://aka.ms/terminal -OutFile ~/Downloads/MicrosoftTerminalInstaller.exe
Start-Process -FilePath ~/Downloads/MicrosoftTerminalInstaller.exe
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
# Copy the Configuration Files to the Windows Terminal Directory
Copy-Item profile.ps1 $PROFILE.AllUsersCurrentHost

```
