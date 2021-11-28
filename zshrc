# If you come from bash you might have to change your $PATH.
# exsort PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/Users/m/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster" # set by `omz`

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git alias-finder autojump  fzf    git npm zsh-autosuggestions zsh-completions zsh-syntax-highlighting  z  colorize grc macos command-not-found  vscode python autoenv zsh-autosuggestions extract)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zshconfig="nano ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
	
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
alias killtb='pkill "Touch Bar agent"; killall ControlStrip'
alias killdock='killall Dock'
alias clock='cli-clock -b " " -f ▫️'

alias rundev='cd ~/dev/mitx && vagrant ssh'
alias work='cd ~/dev/mitx'

#ICANTYPEGOOD
alias brwe='brew'

alias v='vagrant'
alias ack='ag'
alias cat='bat'
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop"
alias find="fd"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
source /Users/m/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/opt/libressl/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export  PATH='/usr/local/opt/openssl@1.1/bin:/usr/local/opt/libressl/bin:/Users/m/.autojump/bin:/Users/m/.cargo/bin:./bin:/Users/m/.rbenv/shims:/Users/m/.rbenv/bin:/Users/m/.cabal/bin:/usr/local/heroku/bin:/Users/m/.bin:/bin:/usr/local/opt/llvm/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/usr/local/opt/fzf/bin:/Users/m/.pyenv/versions/3.11-dev/bin'
export  PATH='/usr/local/opt/openssl@1.1/bin:/usr/local/opt/libressl/bin:/Users/m/.autojump/bin:/Users/m/.cargo/bin:./bin:/Users/m/.rbenv/shims:/Users/m/.rbenv/bin:/Users/m/.cabal/bin:/usr/local/heroku/bin:/Users/m/.bin:/bin:/usr/local/opt/llvm/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/usr/local/opt/fzf/bin:/Users/m/.pyenv/versions/3.11-dev/bin':/Users/m/.pyenv/versions/3.11-dev/bin

#alias python3=python3.11	
eval $(thefuck --alias)
export FLASK_ENV=development
export FLASK_APP=Travel_app.py
alias powershell='/usr/local/microsoft/powershell/7/pwsh'
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
alias code='/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code'
alias code=/Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/MacOS/Electron
alias code=/Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/MacOS/Electron
alias code=/Applications/'Visual\ Studio\ Code\ -\ Insiders.app'/Contents/MacOS/Electron
plugins=(you-should-use you-should-use git alias-finder autojump fzf git npm zsh-autosuggestions zsh-completions zsh-syntax-highlighting z colorize grc macos command-not-found vscode python  autoenv extract)
source /Users/m/.oh-my-zsh/oh-my-zsh.sh
alias usage='du -h -d1'
alias net='lsof -i '
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh		
#~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
alias powershell='pwsh'
function powerline_precmd() {
    PS1="$($GOPATH/bin/powerline-go -error $? -jobs ${${(%):%j}:-0})"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    install_powerline_precmd
fi