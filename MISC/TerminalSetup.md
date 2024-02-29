# Terminal Setup

<img src="Terminal.png" >

```bash
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/jandedobbeleer.omp.json)"
```
#### IMPORTANT: FONTS NEEDED ARE:

- [Symbols Nerd Font Mono](https://fonts.google.com/specimen/Symbols+NF)
- [Source Code Pro for Powerline](http://powerline.readthedocs.io/en/latest/installation/linux.html#fonts-installation)s

## Terminal



### THEMES
[OH My Posh](https://ohmyposh.dev/docs/themes)

[LINK TO ZIP](https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v12.22.0/themes.zip
  )

### Windows Terminal

- [ ] Install [Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab)
- [ ] Install PowerLine fonts [Download](https://powerline.readthedocs.io/en/latest/installation/windows.html#fonts-installation)
- [ ] Install [Oh My Posh](https://ohmyposh.dev/docs/windows)
- [ ] Profile [Settings](https://docs.microsoft.com/en-us/windows/terminal/customize-settings/profile-settings)
- [ ] [Themes](https://ohmyposh.dev/docs/themes)


### Linux

- [ ] Install [Oh My Posh](https://ohmyposh.dev/docs/linux)
- [ ] [Themes](https://ohmyposh.dev/docs/themes)
- [ ] [Powerline Fonts](https://powerline.readthedocs.io/en/latest/installation/linux.html#fonts-installation)
- [ ] [Powerline Symbols](https://powerline.readthedocs.io/en/latest/installation/linux.html#fonts-installation)
- [ ] [ZSH Config](https://ohmyposh.dev/docs/linux#zsh-config)

## VS Code
- [ ] Install [VS Code](https://code.visualstudio.com/)
- [ ] Install [PowerShell Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)
- [ ] Install [PowerShell Preview Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell-Preview)
- [ ] Install [PowerShell Core](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7.1)

### Mac OS
- [ ] Install Brew [Brew](eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)) 
- [ ] Install [Oh My Posh](https://ohmyposh.dev/docs/linux)
- [ ] Powerline Fonts [Powerline Fonts](https://raw.githubusercontent.com/powerline/fonts/master/install.sh)
- [ ] Brew Installations [Brew](https:/raw.githubusercontent.com/MurtadhaM/.dotfiles/master/Brew.md)
- [ ] ZSH Config [ZSH Config](https://raw.githubusercontent.com/MurtadhaM/.dotfiles/master/zshrc)


## Scripts


### Mac OS

- [ ] Install [Homebrew](https://brew.sh/)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
- [ ] Install [Oh My Posh](https://ohmyposh.dev/docs/linux)
```bash
brew install oh-my-posh
```
- [ ] Install [Powerline Fonts](https://powerline.readthedocs.io/en/latest/installation/linux.html#fonts-installation)
```bash
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```
- [ ] System Script [Useful System Scripts](https://raw.githubusercontent.com/MurtadhaM/.dotfiles/master/Settings_Mac_Configuration.sh)


### Windows
- [ ] Install [Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab)

- [ ] Install [PowerLine fonts](https://powerline.readthedocs.io/en/latest/installation/windows.html#fonts-installation)


- [ ] Install [Oh My Posh](https://ohmyposh.dev/docs/windows)
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
```
- [ ] Prompt [Prompt Setup] (https://raw.githubusercontent.com/MurtadhaM/.dotfiles/master/Settings_Windows_Prompt.ps1)
```powershell
(@(& '/usr/local/bin/oh-my-posh' init pwsh --config='/Users/dashm/Documents/GitHub/.dotfiles/\jandedobbeleer.omp.json' --print) -join "`n") | Invoke-Expression
```

# License
[MIT](https://raw.githubusercontent.com/MurtadhaM/.dotfiles/master/LICENSE)


# Author
<a href="">
          <img src="https://webpages.charlotte.edu/mmarzouq/English/background.jpg"  alt="Murtadha Marzouq" width=150  />
        </a>
        
[Murtadha Marzouq.](https://www.findasnake.com)THEMES https://ohmyposh.dev/docs/themes
