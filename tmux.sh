
# This script is used to initialize tmux with a set of windows and panes
# Set the session name
SESSION="tmux"
# FUNCTION TO INSTALL THE
function install-themepack(){
# Download TMUX-Themepack
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
# Set the default theme
tmux set -g @themepack 'powerline/block/cyan'
# Add the following line to your ~/.tmux.conf to use the theme
echo source-file ~/.tmux-themepack/powerline/double/orange.tmuxtheme > ~/.tmux.conf
# enable scroll
echo set -g mouse on >> ~/.tmux.conf
# Set the default shell
echo set -g default-shell /bin/zsh >> ~/.tmux.conf
# Set the default command
echo set -g default-command /bin/zsh >> ~/.tmux.conf
# Set the default window index
echo set -g base-index 1 >> ~/.tmux.conf
# Set the default pane index
echo set -g pane-base-index 1 >> ~/.tmux.conf
# Set the default status
echo set -g status on >> ~/.tmux.conf
# Set the default status position
echo set -g status-position bottom >> ~/.tmux.conf
# Set the default status style
echo set -g status-style bg=colour235,fg=colour136,bright >> ~/.tmux.conf
# Set the default window style
echo set -g window-style bg=colour235,fg=colour250 >> ~/.tmux.conf
# Set the default window active style
echo set -g window-active-style bg=colour236,fg=colour137,bright >> ~/.tmux.conf
# Reading COnfig
source ~/.zshrc
omz plugin enable tmux tmuxinator
}
install-themepack