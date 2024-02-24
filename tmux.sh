### TMUX CONFIGURATION
cat  <<EOT>> ~/.tmux.conf
### START TMUX CONFIGURATION
### START TMUX CONFIGURATION
set -g mouse on
set -g base-index 1
set -g pane-base-index 1
set -g status on

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'jimeh/tmux-themepack'


# THEME
#source-file ~/.tmux-themepack/powerline/double/red.tmuxtheme
source-file ${HOME}/.tmux-themepack/powerline/default/green.tmuxtheme

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
### END TMUX CONFIGURATION
EOT




### TMUX INSTALLATION
function install-tmux-tools(){
# Download TMUX-Themepack tmux-plgu
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack

# enable zsh plugins
omz plugin enable tmux tmuxinator
# Reload the tmux configuration
tmux source-file ~/.tmux.conf
}

### Run the function
install-tmux-tools

# APPEND TMUX THEME TO ZSHRC
tmux source-file /home/dash/.tmux-themepack/powerline/default/green.tmuxtheme

