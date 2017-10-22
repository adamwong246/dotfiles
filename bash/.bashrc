PATH=/Applications/Postgres.app/Contents/Versions/9.6/bin/psql:$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

eval "$(rbenv init -)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
