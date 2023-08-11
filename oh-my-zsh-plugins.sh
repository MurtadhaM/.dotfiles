function install_zsh_plugins(){
    
    # ------------------------------------------------------------------------------
    # Install powerline fonts
    echo "Installing powerline fonts..."
    cd "~"
    # git clone https://github.com/powerline/fonts.git --depth=1
    # cd fonts
    # ./install.sh
    
    # OH MY ZSH SETTINGS
    # Path to oh-my-zsh installation
    # ZSH Terminal title
    DISABLE_AUTO_TITLE=true
  
    
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
    # Install base16-shell
    URL="https://github.com/chriskempson/base16-shell.git"
    DIR="${HOME}/.oh-my-zsh/custom/plugins/base16-shell"
    git clone "${URL}" "${DIR}"
    # Enable plugins
    # ------------------------------------------------------------------------------
    # Update plugins section
    echo "Updating plugins section..."
    
}

# ------------------------------------------------------------------------------

echo "Installing plugins..."
install_zsh_plugins
echo "Plugins installed!"


omz plugin enable git zsh-syntax-highlighting zsh-navigation-tools base16-shell zsh-autosuggestions
# ------------------------------------------------------------------------------
# UPDATE ZSH SETTINGS
source ~/.zshrc
# ------------------------------------------------------------------------------

# Setting the Base16 Theme
base16_pop
# ------------------------------------------------------------------------------
1
# ------------------------------------------------------------------------------
