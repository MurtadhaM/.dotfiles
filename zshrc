# Murtadha's ZSH Config


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.oh-my-zsh/oh-my-zsh.sh
ZSH_THEME="intheloop" # set by `omz`

plugins=(git zsh-syntax-highlighting zsh-navigation-tools base16-shell base16-shell  zsh-autosuggestions z)

source $ZSH/oh-my-zsh.sh


source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source ~/.oh-my-zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

TOOLS="ssh telnet minicom ifconfig ip netstat ping traceroute"

echo $TOOLS | while read -d ' ' tool; do alias $tool="ct  $tool";done

export EDITOR=nano

alias publicIP='curl -s https://api.ipify.org'

eval "$(register-python-argcomplete az)"

# TO FIND AN REMOVE ALL .DS_STORE FILES
alias DS_DESTROY="find ./ -name ".DS_Store" -depth -exec rm {} \;""

