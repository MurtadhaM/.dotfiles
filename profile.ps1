### INTERESTING PROFILE HERE --- 
#  https://raw.githubusernt.com/ChrisTitusTech/powershell-profile/main/Microsoft.PowerShell_profile.ps1
#--------------------------------------------------

# Mintty

# Set Bash to point to mintty to prevent WSL from opening in Windows Terminal
Set-Alias bash mintty


# Global Variables
$PSDefaultParameterValues['*:Out-File:Encoding'] = 'utf8'
$PSDefaultParameterValues['*:Set-Content:Encoding'] = 'utf8'
$PSDefaultParameterValues['*:Export-Csv:Encoding'] = 'utf8'
$PSDefaultParameterValues['*:Import-Csv:Encoding'] = 'utf8'


$Content = @'
# Posh Setup
oh-my-posh init pwsh --config 'C:\Users\MMARZ\AppData\Local\oh-my-posh\craver.omp.json' | Invoke-Expression
# Completion
oh-my-posh completion powershell | Out-String | Invoke-Expression
# Setting Keybinds
set-PSReadLineKeyHandler -Key Ctrl+a -Function BeginningOfLine
set-PSReadLineKeyHandler -Key Ctrl+e -Function EndOfLine
#  delete the whole line
set-PSReadLineKeyHandler -Key Ctrl+k -Function KillLine
# Set Default Editor
$env:EDITOR = 'code -w'
# Set Default Browser
$env:BROWSER = 'firefox.exe'
'@





# POSH Setup
function install_tools() {
    winget install --id Microsoft.PowerShell --source winget
    winget install --id Microsoft.PowerShell.Preview --source winget 
    winget install posh git oh-my-posh
}

function install_fonts() {
    cd $HOME\Downloads
    # Download Fonts Installer
    
}

function profile_prep() {

    # test if C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1 exists
    if (!(Test-Path -Path $PROFILE )) {
        # Check if directory exists
        if (!(Test-Path -Path "$HOME\Documents\WindowsPowerShell" )) {
            # Create A Directory
            New-Item -ItemType Directory -Path "$HOME\Documents\WindowsPowerShell" -Force
            # Create Profile
            New-Item -ItemType File -Path $PROFILE -Force
            # Write Content to Profile
            $Content | Out-File -FilePath $PROFILE -Encoding utf8 -Force
        
            $PROFILE = "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
            #Reload Profile
            . $PROFILE

      

        }
        else {
            # Create A Directory
            $Content | Out-File -FilePath "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -Encoding utf8 -Force
            $PROFILE = "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
            #Reload Profile
            . $PROFILE

        }
    
    }
    else {
        # Execute Content
        $Content | Out-File -FilePath $PROFILE -Encoding utf8 -Force    
        $PROFILE = "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
        #Reload Profile
        . $PROFILE
       
    }
}

function profile_setup() {
    # Set Profile
    Write-Host "Setting Profile"
    # Set $PROFILE to $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
    $PROFILE = "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"    
    # Set Execution Policy
    # Install Tools
    install_tools

}

function wsl_prep() {

    # WSL IMPOROVEMENTS
    Set-Location ~ 
    # Set Default Editor
    $env:EDITOR = 'code -w'
    # Set Default Browser
    $env:BROWSER = 'firefox.exe'
    # Network Config Bridge
    $ModuleName = "Wsl-IpHandler"
    $outFile = "$ModuleName.zip"
    Invoke-WebRequest -Uri https://codeload.github.com/wikiped/Wsl-IpHandler/zip/refs/heads/master -OutFile $outFile
    Expand-Archive -Path $outFile -DestinationPath '.' -Force
    Remove-Item -Path $outFile
    Rename-Item -Path "${ModuleName}-master" -NewName $ModuleName -Force
    Set-Location $ModuleName
    .\install.ps1
    Set-Location ~
}




function SHOW_SPIES() { netstat -anob | findstr exe  | unique | sort | unique }
function ssh_to_switch() { 'ssh root@172.16.0.3 -o KexAlgorithms=diffie-hellman-group1-sha1 -o HostKeyAlgorithms=ssh-rsa -oCiphers=aes256-cbc  -m hmac-sha1-96' }

function Beta_Clear() {
    # Delete  Chrome Beta
    winget uninstall --id Google.Chrome.Beta --source winget 
    
    # Remove Chrome Beta Directory
    Remove-Item -Path "C:\Program Files (x86)\Google\Chrome Beta" -Recurse -Force -ErrorAction SilentlyContinue

    # Remove Chrome Beta Directory
    Remove-Item -Path "$HOME\AppData\Local\Google\Chrome Beta" -Recurse -Force -ErrorAction SilentlyContinue

    # Install Chrome Beta MSI Installer
    msiexec /i "C:\Users\MMARZ\ONE\OneDrive\Documents\APPS\ChromeBeta.msi" /norestart
}


function setup-autocompletion() {

    Register-ArgumentCompleter -Native -CommandName az -ScriptBlock {
        param($commandName, $wordToComplete, $cursorPosition)
        $completion_file = New-TemporaryFile
        $env:ARGCOMPLETE_USE_TEMPFILES = 1
        $env:_ARGCOMPLETE_STDOUT_FILENAME = $completion_file
        $env:COMP_LINE = $wordToComplete
        $env:COMP_POINT = $cursorPosition
        $env:_ARGCOMPLETE = 1
        $env:_ARGCOMPLETE_SUPPRESS_SPACE = 0
        $env:_ARGCOMPLETE_IFS = "`n"
        $env:_ARGCOMPLETE_SHELL = 'powershell'
        az 2>&1 | Out-Null
        Get-Content $completion_file | Sort-Object | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, "ParameterValue", $_)
        }
        Remove-Item $completion_file, Env:\_ARGCOMPLETE_STDOUT_FILENAME, Env:\ARGCOMPLETE_USE_TEMPFILES, Env:\COMP_LINE, Env:\COMP_POINT, Env:\_ARGCOMPLETE, Env:\_ARGCOMPLETE_SUPPRESS_SPACE, Env:\_ARGCOMPLETE_IFS, Env:\_ARGCOMPLETE_SHELL
    }


    Import-Module Az.Tools.Predictor
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin
    Import-Module Az.Tools.Predictor
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin


    #Install-Module -Name Az.Tools.Predictor
    #install-module CompletionPredictor
    Import-Module CompletionPredictor
    Set-PSReadLineOption -Colors @{ InlinePrediction = $PSStyle.Background.Blue }
    Get-PSReadLineOption | Select-Object -Property PredictionSource
    Set-PSReadLineOption -PredictionViewStyle ListView
    Set-PSReadLineOption -Colors @{ InlinePrediction = $PSStyle.Background.Blue }
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


function GET-ENVIRONMENT-PATH(){
    Write-Host "Environment Path: $env:PATH" -ForegroundColor Green 
    Write-Host "Environment Path: $env:PSModulePath" -ForegroundColor Green
}

function ADD-ENVIRONMENT-PATH($path) {
    $env:PATH += ";$path"
    $env:PSModulePath += ";$path"
}

function Init-Script() {
    # Get Profile
    Write-Host "Checking Profile" -ForegroundColor Green
    Get-Profile
    # Auto-Completion
    Write-Host "Setting Up Auto-Completion" -ForegroundColor Green
    setup-autocompletion
    Import-Module CompletionPredictor
    # Oh-My-Posh
    Write-Host "Setting Up Oh-My-Posh" -ForegroundColor Green
    Set-PoshPrompt -Theme '~\appdata\local\Programs\oh-my-posh\themes\plague.omp.json'
    Write-Host "Loading Profile" -ForegroundColor Blue
}


## MAIN
function START-UP(){
    Write-Host "Starting Up" -ForegroundColor Green
    # Set Profile
    Set-PoshPrompt -Theme '~\appdata\local\Programs\oh-my-posh\themes\plague.omp.json' 
    # BASIC SETUP
    # Setting Keybinds
    set-PSReadLineKeyHandler -Key Ctrl+a -Function BeginningOfLine
    set-PSReadLineKeyHandler -Key Ctrl+e -Function EndOfLine
    #  delete the whole line
    set-PSReadLineKeyHandler -Key Ctrl+k -Function KillLine
    # Set Default Editor
    $env:EDITOR = 'notepad'
    # Set Default Browser
    $env:BROWSER = 'firefox.exe'

}

## CALL START-UP
START-UP
