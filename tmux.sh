## TMUX Initialization Script
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
source ~/.zshrc

omz plugin enable tmux tmuxinator



}

install-themepack