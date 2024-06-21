cat <<EOF>> ~/.zshrc
# ------------------------------------------------------------------------------
export EDITOR=nano
alias publicIP='curl -s https://api.ipify.org'
eval "$(register-python-argcomplete az)"
# TO FIND AN REMOVE ALL .DS_STORE FILES
alias check_ip="curl http://icanhazip.com/"

