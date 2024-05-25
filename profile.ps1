<# .SYNOPSIS #>
<# This is the profile script for PowerShell. for Murtadha Marzouq#>
<# .DESCRIPTION #>
<# This script is used to set up the PowerShell environment for Murtadha Marzouq#>
<# .NOTES #>
<# Filename: profile.ps1 #>

# Import Custom Functions
. 'C:\Users\MMARZ\.dotfiles\CUSTOM-FUNCTIONS.ps1'
Write-Host "RUN POST-BOOT if this is after boot" -ForegroundColor Yellow
## CALL START-UP FUNCTION
START-UP
oh-my-posh init pwsh --config 'C:\Users\MMARZ\AppData\Local\Programs\oh-my-posh\themes\iterm2.omp.json' | Invoke-Expression

