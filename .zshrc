
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
alias ida64="/Applications/'IDA Freeware 7.7'/ida64.app/Contents/MacOS/ida64"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell" # set by `omz`
export VCPKG_ROOT="$HOME/vcpkg"
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
plugins=(git colorize z fzf autojump zsh-syntax-highlighting zsh-autosuggestions command-not-found web-search sublime)

#source $ZSH/oh-my-zsh.sh

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="/usr/bin:$PATH"
PATH=/Users/m/.cargo/bin/cargo:$PATH
#export PATH=/usr/local/Cellar/python@3.10/3.10.1/bin/:$PATH
export PATH="/Applications/TouIST.app/Contents/external/touist:$PATH"
alias touist='/Applications/TouIST.app/Contents/external/touist'
#export PATH="/usr/local/opt/python@3.10/bin:$PATH"
#export PATH=/usr/local/Cellar/python@3.9/3.9.10/Frameworks/Python.framework/Versions/3.9/bin/:$PATH
export PATH="/usr/local/opt/autoconf@2.69/bin:$PATH"
export PATH="/usr/local/opt/autoconf@2.69/bin:$PATH"
export PATH="/usr/local/opt/python@3.10/bin:$PATH"
export PATH="/usr/local/lib/python3.10/:$PATH"
#export PATH="/usr/local/opt/python@3.10/Frameworks/Python.framework/Versions/3.10/bin:/usr/local/lib/python3.10/site-packages:/usr/local/opt/python@3.10/bin:/Applications/TouIST.app/Contents/external/touist:/Users/m/.cargo/bin/cargo:/usr/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:$PATH"
#alias pip=pip3
#export PATH="$HOME/homebrew/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

export PATH="/usr/sbin:$PATH"

#export PATH="$PATH:/usr/local/bin/node"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/Applications/Wine Stable.app/Contents/Resources/wine/bin:$PATH"
alias cutter=/Applications/Cutter.app/Contents/MacOS/cutter
export PATH='/Users/m/tizen-studio/tools:/Applications/Wine Stable.app/Contents/Resources/wine/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/lib/python3.10/:/usr/local/opt/python@3.10/bin:/usr/local/opt/autoconf@2.69/bin:/usr/local/opt/autoconf@2.69/bin:/Applications/TouIST.app/Contents/external/touist:/Users/m/.cargo/bin/cargo:/usr/bin:/Users/m/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/share/dotnet:~/.dotnet/tools:/Library/TeX/texbin'
alias OCR='cd ~/Documents/GitHub/JAVASCRIPT/OCR_Crack/; sudo node ~/Documents/GitHub/JAVASCRIPT/OCR_Crack/app.js'
export PATH="/opt/Mongo/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
alias BOOT='sudo launchctl start -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist'
alias gm=git commit -m "💢" 
alias gc=git commit -m "💢" 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# OH MY ZSH SETTINGS
############################################################
# Path to oh-my-zsh installation
export ZSH="${HOME}/.oh-my-zsh"

# ZSH Terminal title
DISABLE_AUTO_TITLE=true

# Set name of the theme to load

# Update ZSH settings
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-you-should-use/you-should-use.plugin.zsh
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/m/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/m/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/m/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/m/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
alias GITALL=ls  | while read line; do echo  $($line &&  git add . && git commit -m "👹🐸" && git push ) ; done
export PATH=/Applications/Maltego.app/Contents/Resources/Maltego/bin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="$PATH:/Developer/flutter/bin/"
source /Users/m/.cargo/env
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

RUST_BACKTRACE=1
export RUST_BACKTRACE=1
export RUST_BACKTRACE=full
export PATH="$PATH:/Volumes/Mac2Small/sdk"
export ANDROID_HOME=/Users/m/Library/Android/sdk/

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/m/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/m/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/m/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/m/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
#  eval alias fuck='eval "$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck "$(fc -ln -1)")"'
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256

export PATH="~/.local/share/google-cloud-sdk/bin:$PATH"
export PATH="/Users/m/.local/share/google-cloud-sdk/bin:$PATH"
alias check_ip="curl http://icanhazip.com/"
export GOOGLE_APPLICATION_CREDENTIALS='/Users/m/.config/gcloud/application_default_credentials.json'
export GOOGLE_APPLICATION_CREDENTIALS='/Users/m/.config/gcloud/application_default_credentials.json'

complete -o nospace -C /usr/local/bin/terraform terraform

function dockerFile(){
cp ~/.gitignore ./.dockerignore;
touch Dockerfile;
}


PATH="/usr/local/bin:$PATH"
export COLUMNS=800
stty columns  $COLUMNS
