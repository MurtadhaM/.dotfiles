<# .SYNOPSIS #>
<# This is the profile script for PowerShell. for Murtadha Marzouq#>
<# .DESCRIPTION #>
<# This script is used to set up the PowerShell environment for Murtadha Marzouq#>
<# .NOTES #>
<# Filename: profile.ps1 #>

# Global Variables
$PSDefaultParameterValues['*:Out-File:Encoding'] = 'utf8'
$PSDefaultParameterValues['*:Set-Content:Encoding'] = 'utf8'
$PSDefaultParameterValues['*:Export-Csv:Encoding'] = 'utf8'
$PSDefaultParameterValues['*:Import-Csv:Encoding'] = 'utf8'
# Setting Keybinds
set-PSReadLineKeyHandler -Key Ctrl+a -Function BeginningOfLine
set-PSReadLineKeyHandler -Key Ctrl+e -Function EndOfLine
#  delete the whole line
set-PSReadLineKeyHandler -Key Ctrl+k -Function KillLine
# Set Default Editor
$env:EDITOR = 'nodepad.exe'
# Set Default Browser
$env:BROWSER = 'chrome.exe'
Import-Module CompletionPredictor
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -MaximumHistoryCount 10000
Set-PSReadLineOption -MaximumKillRingCount 10000
Set-PSReadLineOption -HistoryNoDuplicates 
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
# Colorize Predictions
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Ctrl+R -Function ReverseSearchHistory
Set-PSReadLineKeyHandler -Key Ctrl+Shift+R -Function ForwardSearchHistory

function Beta_Clear() {
    # Remove Google Chrome Beta, Remove Cache, and Reinstall Google Chrome Beta
    winget uninstall --name "Google Chrome Beta" --force --purge;
    Remove-Item 'C:\Program Files (x86)\Google' -Force -Recurse -ErrorAction Ignore;
    Remove-Item '$env:USER\AppData\Local\Google\Chrome Beta' -Force -Recurse -ErrorAction Ignore;
    winget install --name "Google Chrome Beta"
}


function SETUP-AUTOCOMPLETION() {
# CHECK IF   CompletionPredictor MODULE IS INSTALLED
IF (!(Get-Module -Name CompletionPredictor -ListAvailable)) {
    Write-Host "Installing CompletionPredictor Module" -ForegroundColor Green
    Install-Module CompletionPredictor -Force
}

# Check if the history file below 100 lines
IF ((Get-Content C:\Users\$env:USERNAME\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt).Count -lt 100) {
    Write-Host "Downloading History File" -ForegroundColor Green
    # Download History File
    $url = "https://raw.githubusercontent.com/MurtadhaM/.dotfiles/Windows/ConsoleHost_history.txt.enc"
    $ENCRYPTED_FILE = "C:\Users\$env:USERNAME\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt.enc"
    $DECRYPTED_FILE = "C:\Users\$env:USERNAME\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
    Invoke-WebRequest -Uri $url -OutFile $ENCRYPTED_FILE
    # Decrypt File
    DECRYPT-FILE $ENCRYPTED_FILE $DECRYPTED_FILE
    # Import File
    Get-Content $DECRYPTED_FILE | Add-Content $env:USERNAME\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
    # Remove Temp Files
    Remove-Item -Path $ENCRYPTED_FILE -Force
    Write-Host "History File Downloaded" -ForegroundColor Green
}

# Set Prediction Source
Import-Module CompletionPredictor
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -MaximumHistoryCount 10000
Set-PSReadLineOption -MaximumKillRingCount 10000
Set-PSReadLineOption -HistoryNoDuplicates 
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
# Colorize Predictions
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Ctrl+Space -Function MenuComplete
Set-PSReadLineKeyHandler -Key Ctrl+R -Function ReverseSearchHistory
Set-PSReadLineKeyHandler -Key Ctrl+Shift+R -Function ForwardSearchHistory
Set-PSReadLineKeyHandler -Key Ctrl+Shift+Space -Function MenuComplete
}



<# ENCRYPT FILE FUNCTION#>
function ENCRYPT-FILE($INPUT_FILE,$OUTPUT) {
    Write-Host $INPUT_FILE  -ForegroundColor GREEN;
    Write-Host $OUTPUT OUTPUT FILE -ForegroundColor RED;
    IF($INPUT_FILE -eq $null -or $OUTPUT -eq $null -or $INPUT_FILE -eq "" -or $OUTPUT -eq "") {
        Write-Host "Please Provide a File to Encrypt and a File to Save the Encrypted File" -ForegroundColor Red
        Write-Host "Example: ENCRYPT-FILE -DECRYPTED_FILE 'C:\Users\$env:USERNAME\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt' -ENCRYPTED_FILE 'C:\Users\$env:USERNAME\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt.enc'" -ForegroundColor Yellow
        return    
    }
    # Check if File Exists
    IF(!(Test-Path $INPUT_FILE)) {
        Write-Host "File Not Found" -ForegroundColor Red
        return
    }
    # Encrypt File
    Write-Host "Encrypting File" -ForegroundColor Green
    openssl.exe enc -aes-256-cbc -in $INPUT_FILE -out $OUTPUT -pbkdf2
    Write-Host "Encrypted File: $OUTPUT" -ForegroundColor Green
}

<# DECRYPT FILE FUNCTION#>
function DECRYPT-FILE($INPUT_FILE,$OUTPUT) {
    IF($OUTPUT -eq $null -or $INPUT_FILE -eq $null -or $OUTPUT -eq "" -or $INPUT_FILE -eq "") {
        Write-Host "Please Provide a File to Decrypt and a File to Save the Decrypted File" -ForegroundColor Red
        Write-Host "Example: DECRYPT-FILE -ENCRYPTED_FILE 'C:\Users\$env:USERNAME\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt.enc' -DECRYPTED_FILE 'C:\Users\$env:USERNAME\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt'" -ForegroundColor Yellow
        return    
    }
    # Check if File Exists
    IF(!(Test-Path $INPUT_FILE)) {
        Write-Host "File Not Found" -ForegroundColor Red
        return
    }
    # Decrypt File
    Write-Host "Decrypting File" -ForegroundColor Green
    openssl.exe enc -aes-256-cbc -d -in $INPUT_FILE -out $OUTPUT -pbkdf2
    Write-Host "Decrypted File: $OUTPUT" -ForegroundColor Green
}

function Delete-Cache() {
    # Remove Temp Files
    Remove-Item -Path "$HOME\AppData\Local\Temp" -Recurse -Force -ErrorAction SilentlyContinue
    # Remove Temp Files
    Remove-Item -Path "c:\Windows\Temp" -Recurse -Force -ErrorAction SilentlyContinue
    # Clear DNS Cache
    ipconfig /flushdns
    # Clear Recycle Bin
    Clear-RecycleBin -DriveLetter C


}


# Download Profile.ps1
function Get-Profile(){

if (!(test-path ~\.dotfiles)) {
    Write-Host "Downloading Profile"

    # Download Profile from GitHub
    $url="https://github.com/MurtadhaM/.dotfiles"
    # Clone Repo
    cd ~
    git clone $url
    # Set Profile
    #Checkout Windows Branch
    cd ~\.dotfiles
    git checkout Windows
    $PROFILE.CurrentUserCurrentHost=~\.dotfiles\profile.ps1

}else {
        # Skip Download
        Write-Host "Skipping Download"
        # Set Profile
}
}
function Reset-Profile() {
    Write-Host "Resetting Profile" -ForegroundColor Green
    # Update Profile
    cd ~\.dotfiles
    git pull
    # Set Profile
    echo '. ~\.dotfiles\profile.ps1' > $PROFILE
    cd ~
    . ~\.dotfiles\profile.ps1
    # Reload Profile


}

function UPLOAD-PROFILE(){
    # Upload Profile
    cd ~\.dotfiles
    git add .
    git commit -m "Updated Powershell Profile"
    git push
    # Set Profile
    $PROFILE=~\.dotfiles\profile.ps1
    # Reload Profile
    $PROFILE
}


function SYNC-TIME(){
# START TIME SERVICE
START-SERVICE w32time
#START-SERVICE tzautoupdate
## FORCE SYNC TIME
W32tm /resync /force

}




<# RANDOM COLOR FUNCTION #>
function RANDOM-COLOR(){([System.ConsoleColor].DeclaredMembers)[(Get-Random -Maximum 14 -Minimum 2 -SetSeed (((Get-Date -AsUTC).Ticks)%100))].name}

<# STOP SPOOLER SERVICE #>
function STOP-PRINT-SERVICE(){
Write-Host "STOPPING SPOOLSV.exe and its service" -ForegroundColor Red
Stop-Service -Name Spooler -Force
}


<#  Function to list all the processes that are listening on the network (Must be run as Administrator) #>
function LISTENERS(){

((NETSTAT.EXE -nba )   -split "\n" -clike "*exe*" -replace "\["  -replace "\]" |sort|unique |ForEach-Object -Process {Write-Host $_ -ForegroundColor ([System.ConsoleColor].DeclaredMembers)[(Get-Random -Maximum 14 -Minimum 2 -SetSeed (((Get-Date -AsUTC).Ticks)%100))].name })
}

<# FUNCTION TO LOAD GH COPILOT#>
function GH-COPILOT(){
    # Set Profile
    $GH_COPILOT_PROFILE = Join-Path -Path $(Split-Path -Path $PROFILE -Parent) -ChildPath "gh-copilot.ps1"
    # Set Alias
    gh copilot alias -- pwsh | Out-File ( New-Item -Path $GH_COPILOT_PROFILE -Force )
    # Reload Profile
    . $GH_COPILOT_PROFILE
#    Write-Host "GH COPILOT LOADED" -ForegroundColor Green
 #   Write-Host "FOR EXPLAINATION: > ghce 'code' " -ForegroundColor Red
  #  Write-Host "FOR SHELL COMMAND: > ghcs 'code -n'" -ForegroundColor Blue

}
## MAIN
function START-UP(){
    Write-Host "Starting Up" -ForegroundColor Green
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin
    # Check Oh-My-Posh
    #oh-my-posh init pwsh --config '$env:USERNAME\AppData\Local\oh-my-posh\microverse-power.omp.json'|Invoke-Expression    # BASIC SETUP
    oh-my-posh init pwsh --config '$env:USERNAME\AppData\Local\Programs\oh-my-posh\themes\iterm2.omp.json' | Invoke-Expression
    # Setting Keybinds
    set-PSReadLineKeyHandler -Key Ctrl+a -Function BeginningOfLine
    set-PSReadLineKeyHandler -Key Ctrl+e -Function EndOfLine
    #  delete the whole line
    set-PSReadLineKeyHandler -Key Ctrl+k -Function KillLine
    # Set Default Editor
    $env:EDITOR = 'notepad'
    # Set Default Browser
    $env:BROWSER = 'firefox.exe'
    # GH COPILOT ALIAS
    # GH-COPILOT
    # LOAD THE CUSTOM-FUNCTIONS FILE
    . c:\users\$env:USERNAME\.dotfiles\CUSTOM-FUNCTIONS.ps1
}

# POST BOOT SCRIPT
function POST-BOOT(){
# KILLING CORSAIR
taskkill.exe /F /IM cors*
# KILLING PRINT SERVICE
STOP-PRINT-SERVICE
# START TIME SERVICE
SYNC-TIME
SYNC-TIME
# STOPING LG, TUNNELBEAR  & Corsair Services
stop-SErvice -displayName "cors*"
stop-SErvice -displayName "*lg*"
STOP-SErvice -displayName "*tunne*" -Force
# KILLING WSL
wsl --shutdown
}


Write-Host "RUN POST-BOOT if this is after boot" -ForegroundColor Yellow
## CALL START-UP
START-UP
oh-my-posh init pwsh --config 'C:\Users\MMARZ\AppData\Local\Programs\oh-my-posh\themes\iterm2.omp.json' | Invoke-Expression
