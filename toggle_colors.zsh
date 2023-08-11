## Author: Murtadha Marzouq (https://github.com/MurtadhaM)
## Description: A useful script to toggle between light and dark themes in bat with a keybinding

# Dependencies: bat

# Pre-execution:

function toggle_colors() {
    if [[ $(bat --list-themes | grep -c "OneHalfDark") -eq 1 ]]; then
        bat  --style plain --language fish <<< $(cat $1)
    else
        bat  --style plain --language fish <<< $(cat $1)
    fi
}

# Run the function with the current file as an argument
toggle_colors $1

# Post-execution:

# Add the following line to your .zshrc file  
bindkey -s '^[t' 'source $HOME/.config/zsh/toggle_colors.zsh\n'

# Usage:

# Press Alt+t to toggle between light and dark themes in bat

function eww(){
    last_command=$(fc -ln -1)
    if [[ $(echo $last_command | grep -c "eww") -eq 1 ]]; then
        eww close
    else
        eww open
    fi


eww


}


ps 
eci