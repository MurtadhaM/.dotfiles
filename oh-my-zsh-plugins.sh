function install_zsh_plugins(){
    # ------------------------------------------------------------------------------
    # Install powerline fonts
    echo "Installing powerline fonts..."
    cd "~"
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    #OH MY ZSH SETTINGS
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

function base_enable() {

# Install base16-shell
URL="https://github.com/chriskempson/base16-shell.git"
DIR="${HOME}/.oh-my-zsh/custom/plugins/base16-shell"
git clone "${URL}" "${DIR}"
# ------------------------------------------------------------------------------
# Enable base16-shell
echo "Updating plugins section..."
source ~/.oh-my-zsh/custom/plugins/base16-shell/scripts/base16-pop.sh
# ZSH CUSTOM SETTINGS
echo 'source ~/.oh-my-zsh/custom/plugins/base16-shell/scripts/base16-pop.sh' >> ~/.zshrc
# ------------------------------------------------------------------------------

}


# INSTALL ZSH PLUGINS
install_zsh_plugins
# ------------------------------------------------------------------------------
# SETTINGS
# ------------------------------------------------------------------------------
# Path to oh-my-zsh installation
# ZSH Terminal title
DISABLE_AUTO_TITLE=true
#------------------------------------------------------------------------------
# Install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# ------------------------------------------------------------------------------
# Base16 Shell
# ------------------------------------------------------------------------------
base_enable
# ------------------------------------------------------------------------------
# Change the theme and enable base16 theme
base16_material-vivid
# ------------------------------------------------------------------------------
# Set the powerlevel10k theme
echo "Setting the powerlevel10k theme..."
echo 'source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
# ------------------------------------------------------------------------------
# Enable plugins
omz plugin enable git zsh-syntax-highlighting zsh-navigation-tools base16-shell zsh-autosuggestions z fzf tmux tmux-cssh tmuxinator zsh-interactive-cd aliases themes


