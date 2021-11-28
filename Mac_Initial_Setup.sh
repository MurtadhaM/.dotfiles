#!/usr/bin/env bash

echo "Setting up Mac..."

bash -c ./Settings_Mac_Configuration.sh &


echo "Setting up Homebrew..."


if [[ -f "${HOME}/.zshrc" ]]; then
    cp "${HOME}/.zshrc" "${HOME}/.zshrc.bkp"
fi
# Homebrew
export PATH="/usr/local/sbin:$PATH"

#------------------------------------------------------------------------------ 
#Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#------------------------------------------------------------------------------
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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

#------------------------------------------------------------------------------
# Git config
git config --global user.name "Murtadha Marzouq"
git config --global user.email  "mmarzou0@gmail.com"

# ------------------------------------------------------------------------------
# visual studio code Config
# ------------------------------------------------------------------------------


#------------------------------------------------------------------------------
# Install zsh-autosuggestions 
URL="https://github.com/zsh-users/zsh-autosuggestions"
DIR="${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
git clone "${URL}" "${DIR}"
# ------------------------------------------------------------------------------
# Install zsh-syntax-highlighting
URL="https://github.com/zsh-users/zsh-syntax-highlighting.git"
DIR="${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone "${URL}" "${DIR}"

read -r -d '' ZSH_PROFILE <<"EOF"
# OH MY ZSH SETTINGS
############################################################
# Path to oh-my-zsh installation
export ZSH="${HOME}/.oh-my-zsh"

# ZSH Terminal title
DISABLE_AUTO_TITLE=true

# Set name of the theme to load

# Update ZSH settings
source $ZSH/oh-my-zsh.sh

EOF

echo "${ZSH_PROFILE}" >> "${HOME}/.zshrc"


