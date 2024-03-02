# Windows Initialization Setup 🚀

## Windows Terminal Setup 🎨

```powershell
<# Windows Terminal Setup 🎨 #>
Write-Host "Windows Terminal Setup 🎨" -Foreground Red
# Set Execution Policy
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# Download Windows Terminal Setup Script
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MurtadhaM/.dotfiles/main/Windows/WindowsTerminalSetup.ps1" -OutFile "WindowsTerminalSetup.ps1" -UseBasicParsing -ErrorAction Stop 
# Run Windows Terminal Setup Script
Start-Process -FilePath "WindowsTerminalSetup.ps1"
```

### Oh-My-Basj Setup 🚀

```powershell
<# Oh-My-Bash Setup 🚀 #>
# Inide of MSYS2 Bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
```


