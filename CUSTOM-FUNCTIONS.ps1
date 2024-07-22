# Description: Custom functions for PowerShell 
# Author: Murtadha Marzouq



<# ENABLE WSL SYSTEMD #>
function Enable-WSL-SYSTEMD{
# WRITE TO /etc/wsl.conf 
$WSL_CONF ="[boot] 
systemd=true
"
wsl --exec bash -c "echo "$WSL_CONF" | sudo tee /etc/wsl.conf"
# RESTART WSL
wsl --shutdown
# RESTART WSL
wsl
}

<# DISABLE WSL SYSTEMD #>
function Disable-WSL-SYSTEMD{
Write-Host "Disabling WSL Systemd" -ForegroundColor Green
# WRITE TO /etc/wsl.conf
$WSL_CONF ="[boot]
systemd=false
"
wsl --exec bash -c "echo "$WSL_CONF" | sudo tee /etc/wsl.conf" 
# RESTART WSL
wsl --shutdown
# RESTART WSL
}





<# ENCRYPT FILE FUNCTION#>
function ENCRYPT-FILE($INPUT_FILE, $OUTPUT) {
    Write-Host $INPUT_FILE  -ForegroundColor GREEN;
    Write-Host $OUTPUT OUTPUT FILE -ForegroundColor RED;
    IF ($INPUT_FILE -eq $null -or $OUTPUT -eq $null -or $INPUT_FILE -eq "" -or $OUTPUT -eq "") {
        Write-Host "Please Provide a File to Encrypt and a File to Save the Encrypted File" -ForegroundColor Red
        Write-Host "Example: ENCRYPT-FILE -DECRYPTED_FILE "$env:HOMEPATH\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" -ENCRYPTED_FILE "$env:HOMEPATH\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt.enc"" -ForegroundColor Yellow
        return    
    }
    # Check if File Exists
    IF (!(Test-Path $INPUT_FILE)) {
        Write-Host "File Not Found" -ForegroundColor Red
        return
    }
    # Encrypt File
    Write-Host "Encrypting File" -ForegroundColor Green
    openssl.exe enc -aes-256-cbc -in $INPUT_FILE -out $OUTPUT -pbkdf2
    Write-Host "Encrypted File: $OUTPUT" -ForegroundColor Green
}

<# DECRYPT FILE FUNCTION#>
function DECRYPT-FILE($INPUT_FILE, $OUTPUT) {
    IF ($OUTPUT -eq $null -or $INPUT_FILE -eq $null -or $OUTPUT -eq "" -or $INPUT_FILE -eq "") {
        Write-Host "Please Provide a File to Decrypt and a File to Save the Decrypted File" -ForegroundColor Red
        Write-Host "Example: DECRYPT-FILE -ENCRYPTED_FILE "$env:HOMEPATH\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt.enc" -DECRYPTED_FILE "$env:HOMEPATH\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"" -ForegroundColor Yellow
        return    
    }
    # Check if File Exists
    IF (!(Test-Path $INPUT_FILE)) {
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
    #Remove-Item -Path "$HOME\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    # Remove Temp Files
    #Remove-Item -Path "c:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    # Clear DNS Cache
    ipconfig /flushdns
    # Clear Recycle Bin
    Clear-RecycleBin -DriveLetter C


}




function Beta_Clear() {
    # Remove Google Chrome Beta, Remove Cache, and Reinstall Google Chrome Beta
    winget uninstall --name "Google Chrome Beta" --force --purge;
    Remove-Item "C:\Program Files (x86)\Google" -Force -Recurse -ErrorAction Ignore;
    Remove-Item "$env:HOMEPATH\AppData\Local\Google\Chrome Beta" -Force -Recurse -ErrorAction Ignore;
    winget install --name "Google Chrome Beta"
}

<# tskark & Wireshark #>
function Wireshark() {
    # Check if Wireshark is installed

    IF (!(Get-Command -Name tshark -ErrorAction SilentlyContinue) -and !(Test-Path -Path "C:\Program Files\Wireshark\Wireshark.exe" -ErrorAction SilentlyContinue)) {
        Write-Host "Wireshark is not installed" -ForegroundColor Red
        Write-Host "Installing Wireshark" -ForegroundColor Green
        winget install --name "Wireshark"
    } else {
        Write-Host "Wireshark is installed! Adding to PATH just in case" -ForegroundColor Green
        $ENV:PATH += ";C:\Program Files\Wireshark"
        

    }
}

function SETUP-AUTOCOMPLETION() {
    # CHECK IF   CompletionPredictor MODULE IS INSTALLED
    IF (!(Get-Module -Name CompletionPredictor -ListAvailable)) {
        Write-Host "Installing CompletionPredictor Module" -ForegroundColor Green
        Install-Module CompletionPredictor -Force
    }

    # Check if the history file below 100 lines
    IF ((Get-Content $env:HOMEPATH\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt).Count -lt 100) {
        Write-Host "Downloading History File" -ForegroundColor Green
        # Download History File
        $url = "https://raw.githubusercontent.com/MurtadhaM/.dotfiles/Windows/ConsoleHost_history.txt.enc"
        $ENCRYPTED_FILE = "$env:HOMEPATH\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt.enc"
        $DECRYPTED_FILE = "$env:HOMEPATH\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
        Invoke-WebRequest -Uri $url -OutFile $ENCRYPTED_FILE
        # Decrypt File
        DECRYPT-FILE $ENCRYPTED_FILE $DECRYPTED_FILE
        # Import File
        Get-Content $DECRYPTED_FILE | Add-Content $env:HOMEPATH\APPDATA\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
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
    Set-PSReadLineKeyHandler -Key Ctrl+Spacebar -Function MenuComplete
    Set-PSReadLineKeyHandler -Key Ctrl+R -Function ReverseSearchHistory
    Set-PSReadLineKeyHandler -Key Ctrl+Shift+R -Function ForwardSearchHistory
    Set-PSReadLineKeyHandler -Key Ctrl+Shift+Spacebar -Function MenuComplete
}




function SYNC-TIME() {
    # START TIME SERVICE
    START-SERVICE w32time
    #START-SERVICE tzautoupdate
    ## FORCE SYNC TIME
    W32tm /resync /force

}




<# RANDOM COLOR FUNCTION #>
function RANDOM-COLOR() { ([System.ConsoleColor].DeclaredMembers)[(Get-Random -Maximum 14 -Minimum 2 -SetSeed (((Get-Date -AsUTC).Ticks) % 100))].name }

<# STOP SPOOLER SERVICE #>
function STOP-PRINT-SERVICE() {
    Write-Host "STOPPING SPOOLSV.exe and its service" -ForegroundColor Red
    Stop-Service -Name Spooler -Force
}


<#  Function to list all the processes that are listening on the network (Must be run as Administrator) #>
function LISTENERS() {

((NETSTAT.EXE -nba ) -split "\n" -clike "*exe*" -replace "\[" -replace "\]" | sort | unique | ForEach-Object -Process { Write-Host $_ -ForegroundColor ([System.ConsoleColor].DeclaredMembers)[(Get-Random -Maximum 14 -Minimum 2 -SetSeed (((Get-Date -AsUTC).Ticks) % 100))].name })
}














<# REMOVE ONEDRIVE FROM PSMODULESPATH#>
function Remove-OneDrive-Path(){
    $PSModulePath = [Environment]::GetEnvironmentVariable("PSModulePath", "Process")
    $PSModulePath = $PSModulePath -split ";" | Where-Object {$_ -notlike "*OneDrive*"}
    $PSModulePath = $PSModulePath -join ";"
    [Environment]::SetEnvironmentVariable("PSModulePath", $PSModulePath, "User")
    
    $PSModulePath = [Environment]::GetEnvironmentVariable("PSModulePath", "Machine")
    $PSModulePath = $PSModulePath -split ";" | Where-Object {$_ -notlike "*OneDrive*"}
    $PSModulePath = $PSModulePath -join ";"
    
    $PSModulePath = [Environment]::GetEnvironmentVariable("PSModulePath", "User")
    $PSModulePath = $PSModulePath -split ";" | Where-Object {$_ -notlike "*OneDrive*"}
    $PSModulePath = $PSModulePath -join ";"
    [Environment]::SetEnvironmentVariable("PSModulePath", $PSModulePath, "Process")
    
}





<# START-UP FUNCTION #>
function START-UP() {
    Write-Host "Starting Up" -ForegroundColor Green
    oh-my-posh init pwsh --config "C:\Users\MMARZ\AppData\Local\Programs\oh-my-posh\themes\tonybaloney.omp.json" |Invoke-Expression
    # Global Variables
    $PSDefaultParameterValues["*:Out-File:Encoding"] = "utf8"
    $PSDefaultParameterValues["*:Set-Content:Encoding"] = "utf8"
    $PSDefaultParameterValues["*:Export-Csv:Encoding"] = "utf8"
    $PSDefaultParameterValues["*:Import-Csv:Encoding"] = "utf8"
    # Setting Keybinds
    set-PSReadLineKeyHandler -Key Ctrl+a -Function BeginningOfLine
    set-PSReadLineKeyHandler -Key Ctrl+e -Function EndOfLine
    set-PSReadLineKeyHandler -Key Ctrl+k -Function KillLine
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
    # BAT OPTIONS
    $ENV:BAT_PAGING="never"
    $ENV:BAT_STYLE="plain"
    $ENV:BAT_THEME="Solarized (dark)"
    # FZF OPTIONS
    $ENV:FZF_DEFAULT_OPTS="--color=16 --ansi"
    # REMOVE ONEDRIVE FROM PSMODULESPATH
    Remove-OneDrive-Path
    }
    
  
# POST BOOT SCRIPT
function POST-BOOT() {
    # KILLING ICLOUD DRIVE AND APPLE PRINT SERVICE
    taskkill /T /F /IM iclou* ;taskkill /F /IM APS*
    # KILLING PRINT SERVICE
    STOP-PRINT-SERVICE
}
