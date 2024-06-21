#!/usr/bin/bash
#Script to install oh-my-zsh and related plugins

# Install powerline fonts <Optional>
#install_powerline_fonts

# Function to install powerline fonts
install_powerline_fonts() {
    echo "Installing powerline fonts..."
    cd ~ || exit
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts || exit
    ./install.sh
    cd ..
    rm -rf fonts

}

# Function to install oh-my-zsh and related plugins
install_oh_my_zsh_plugins() {
    # Install oh-my-zsh
    echo "Installing oh-my-zsh..."
    zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"

    # Install powerlevel10k
    echo "Installing powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

    # Install zsh-autosuggestions
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

    # Install zsh-syntax-highlighting
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    # Install base16-shell
    echo "Installing base16-shell..."
    git clone https://github.com/chriskempson/base16-shell.git ~/.oh-my-zsh/custom/plugins/base16-shell
}

# Function to enable base16-shell
enable_base16_shell() {
    echo "Enabling base16-shell..."
    source ~/.oh-my-zsh/custom/plugins/base16-shell/scripts/base16-pop.sh
    echo 'source ~/.oh-my-zsh/custom/plugins/base16-shell/scripts/base16-pop.sh' >> ~/.zshrc
}
# Install oh-my-zsh and related plugins
echo "Installing oh-my-zsh and related plugins..."
install_oh_my_zsh_plugins
# Enable base16-shell
echo "Enabling base16-shell..."
enable_base16_shell

# Enable plugins
echo "Enabling plugins..."
source ~/.zshrc
omz plugin enable git zsh-syntax-highlighting zsh-navigation-tools base16-shell zsh-autosuggestions z fzf tmux tmux-cssh tmuxinator  aliases themes
