### TMUX CONFIGURATION
echo <<EOT>> ~/.tmux.conf
### START TMUX CONFIGURATION
source-file ~/.tmux-themepack/powerline/double/orange.tmuxtheme
set -g mouse on
set -g default-shell /bin/zsh
set -g default-command /bin/zsh
set -g base-index 1
set -g pane-base-index 1
set -g status on
set -g status-position bottom
set -g status-style bg=colour235,fg=colour136,bright
set -g window-style bg=colour235,fg=colour250
set -g window-active-style bg=colour236,fg=colour137,bright
### END TMUX CONFIGURATION
EOT




### TMUX INSTALLATION
function install-themepack(){
# Download TMUX-Themepack
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
# Set the default theme
tmux set -g @themepack 'powerline/block/cyan'
echo set -g status-style bg=colour235,fg=colour136,bright >> ~/.tmux.conf
# Set the default window style
echo set -g window-style bg=colour235,fg=colour250 >> ~/.tmux.conf
# Set the default window active style
echo set -g window-active-style bg=colour236,fg=colour137,bright >> ~/.tmux.conf
# Reading COnfig
source ~/.zshrc
omz plugin enable tmux tmuxinator
# Reload the tmux configuration
tmux source-file ~/.tmux.conf
}

### Run the function
install-themepack



