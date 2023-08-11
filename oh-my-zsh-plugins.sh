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
    # Install base16-shell
    URL="https://github.com/chriskempson/base16-shell.git" 
    DIR="${HOME}/.oh-my-zsh/custom/base16-shell"
    git clone "${URL}" "${DIR}"
    # Enable plugins
    # ------------------------------------------------------------------------------
    # Update plugins section
    echo "Updating plugins section..."
    echo '  plugins=(' >> ~/.zshrc
    echo '    git' >> ~/.zshrc
    echo '    zsh-autosuggestions' >> ~/.zshrc
    echo '    zsh-syntax-highlighting' >> ~/.zshrc
    echo '  )' >> ~/.zshrc

    # ------------------------------------------------------------------------------

    # UPDATE ZSH SETTINGS
    source ~/.zshrc
    # ------------------------------------------------------------------------------
    
    # Setting the Base16 Theme
    base16_pop
    # ------------------------------------------------------------------------------
    
}

# ------------------------------------------------------------------------------

echo "Installing plugins..."
install_zsh_plugins
echo "Plugins installed!"

# ------------------------------------------------------------------------------
