#!/usr/bin/env bash
echo "Setting up Mac..."

# Check if Linux or Mac
function CheckOS() {
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        echo "Linux"
        elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "MacOS"
    else
        echo "Unknown"
    fi
}




function Personalize_Config(){
    curl https://raw.githubusercontent.com/MurtadhaM/.dotfiles/main/zshrc -o ~/.zshrc
    # getting gitignore
    curl https://raw.githubusercontent.com/MurtadhaM/.dotfiles/main/gitignore -o ~/.gitignore
    # getting aliases
    curl https://raw.githubusercontent.com/MurtadhaM/.dotfiles/main/aliases -o ~/.aliases
    #------------------------------------------------------------------------------
    # Git config
    git config --global user.name "Murtadha Marzouq"
    git config --global user.email  "mmarzou0@gmail.com"
}

function install_brew_packages(){
    echo "Installing brew packages..."
    # Install GNU core utilities (those that come with macOS are outdated).
    # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
    brew install coreutils
    ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
    # Install some other useful utilities like `sponge`.
    brew install moreutils
    # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
    brew install findutils
    # Install GNU `sed`, overwriting the built-in `sed`.
    brew install gnu-sed --with-default-names
    # Install a modern version of Bash.
    brew install bash
    brew install bash-completion2
    # Install Homebrew Cask Formulas and
    brew tap homebrew/cask-fonts
    brew install font-hack-nerd-font
    brew tap 'brew install   cask room/brew install   cask '
    brew tap 'brew install   cask room/versions'
    brew tap 'homebrew install /bundle'
    brew tap 'homebrew install /core'
    brew tap 'homebrew install /dupes'
    brew install  'coreutils'
    brew install 'cmake'
    brew install  'zsh'
    brew install  'zsh-history-substring-search'
    brew install  'zsh-syntax-highlighting'
    brew install  'curl'
    brew install  'git'
    brew install  'git-extras'
    brew install  'grep'
    brew install  'node'
    brew install   cask  'iterm2'
    brew install   cask  'sublime-text3'
    brew install   cask  'transmission'
    brew install   cask  'vlc'
    brew install   cask  'dropbox'
    brew install   cask  'firefox'
    brew install   cask  'google-chrome'
    brew install   cask  'google-chrome-canary'
    brew install   'The Unarchiver'
    brew install 'font-powerline-symbols'
    brew install 'zsh-completions'
    brew install 'zsh-autosuggestions'
    brew install 'zsh-you-should-use'
    brew install 'python'
    brew install 'fzf'
    brew install 'fzf-completion'
    brew install 'autojump'
    brew install 'automake'
    brew install 'autoconf'
    brew install 'neofetch'
    brew install 'nmap'
    brew install 'sqlite'
    brew install 'powerlevel10k'
    brew install 'powerline-fonts'
}

function Install_Mac(){
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    BREW_PREFIX=$(brew --prefix)
    # Homebrew
    export PATH="/usr/local/sbin:$PATH"
    
    # Switch to using brew-installed bash as default shell
    if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
        echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
        chsh -s "${BREW_PREFIX}/bin/bash";
    fi;
    
  # CALLING FUNCTIONS    
  install_brew_packages
  Personalize_Config
}


function install_zsh_plugins(){
    
    # ------------------------------------------------------------------------------
    # Install powerline fonts
    echo "Installing powerline fonts..."
    cd "~"
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    
    # OH MY ZSH SETTINGS
    # Path to oh-my-zsh installation
    echo '  export ZSH="${HOME}/.oh-my-zsh"'  >> ~/.zshrc
    # ZSH Terminal title
    DISABLE_AUTO_TITLE=true
    # Set name of the theme to load
    # Update ZSH settings
    echo '  source $ZSH/oh-my-zsh.sh' >> ~/.zshrc
    # Set to this to use case-sensitive completion
    
    # installing oh-my-zsh
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # installing powerlevel10k
    echo "Installing powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
    # Install zsh-autosuggestions
    URL="https://github.com/zsh-users/zsh-autosuggestions"
    DIR="${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
    git clone "${URL}" "${DIR}"
    # ------------------------------------------------------------------------------
    # Install zsh-syntax-highlighting
    URL="https://github.com/zsh-users/zsh-syntax-highlighting.git"
    DIR="${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    git clone "${URL}" "${DIR}"
    
    # ------------------------------------------------------------------------------
    # Enable plugins
    # ------------------------------------------------------------------------------
    # Update plugins section
    echo "Updating plugins section..."
    echo '  plugins=(' >> ~/.zshrc
    echo '    git' >> ~/.zshrc
    echo '    zsh-autosuggestions' >> ~/.zshrc
    echo '    zsh-syntax-highlighting' >> ~/.zshrc
    echo '  )' >> ~/.zshrc
    
    
}





if [[ "$(CheckOS)" == "MacOS" ]]; then Install_Mac; fi
install_zsh_plugins



