PATH=/Applications/Postgres.app/Contents/Versions/9.6/bin/psql:$HOME/.rbenv/shims:$HOME/.rbenv/bin:/Users/adam/.nvm/versions/node/v16.9.1/bin/node/$PATH

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

eval "$(rbenv init -)"
echo "RBENV!"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
