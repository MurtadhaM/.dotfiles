eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/pixelrobots.omp.json)"
source ~/.oh-my-zsh/oh-my-zsh.sh
plugins=( git alias-finder autojump fzf git npm zsh-autosuggestions zsh-syntax-highlighting z colorize grc macos command-not-found vscode python autoenv
zsh-autosuggestions z extract  colored-man-pages dotnet)
export EDITOR=nano
export PATH="/usr/local/opt/dotnet@6/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/bin:$PATH"
alias code='open /Applications/Visual\ Studio\ Code.app'
alias publicIP='curl -s https://api.ipify.org'

eval "$(register-python-argcomplete az)"
