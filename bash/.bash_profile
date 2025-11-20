[[ -s ~/.bashrc ]] && source ~/.bashrc
export PATH="/usr/local/opt/gsl@1/bin:$PATH"
. "$HOME/.cargo/env"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
