# This file is part of Castle Shuri, the dotfiles of Adam Wong
# https://github.com/adamwong246/Castle-Shuri                                          
# Licensed under the GNU GENERAL PUBLIC LICENSE.    

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="3den"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/Users/r625503/.rvm/gems/ruby-2.0.0-p195/bin:/Users/r625503/.rvm/gems/ruby-2.0.0-p195@global/bin:/Users/r625503/.rvm/rubies/ruby-2.0.0-p195/bin:/Users/r625503/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/r625503/.rvm/gems/ruby-2.0.0-p195/bin:/Users/r625503/.rvm/gems/ruby-2.0.0-p195@global/bin:/Users/r625503/.rvm/rubies/ruby-2.0.0-p195/bin:/Users/r625503/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/binexport:/usr/local/share/npm/bin

export PATH=$HOME/.cabal/bin:$PATH

GOPATH=/usr/local/bin/
export GOPATH

echo -en "\033[1m"

# greeting
echo "       
                          ███████████████████████                            
                    ███████████████████████████████████                      
                    ███████████████████████████████████                      
                ██████████████               █████████████                   
             █████████████████               █████████████████               
             █████████████                      ██████████████               
          █████████████      ████         ████      █████████████     
          █████████████      ████         ████      █████████████            
          ██████████      ███████         ███████      ██████████            
       █████████████      ███████         ███████      █████████████         
       █████████████      ███████         ███████      █████████████         
       █████████████                                   █████████████         
       ████████████████                             ████████████████         
       ████████████████                             ████████████████         
       ████████████████      ████   ███   ████      ████████████████         
       ████████████████      ████   ███   ████      ████████████████         
       █████████████████████████████████████████████████████████████         
          █████████████░░░████░░░░░░░░░░░░░░░████░░░█████████████            
          █████████████░░░████░░░░░░░░░░░░░░░████░░░█████████████            
             ███████░░░░░░███████░░░░░░░░░███████░░░░░░███████               
             ███████░░░░░░░██████░░░░░░░░░██████░░░░░░░███████               
                ████░░░░░░░░░████░░░░░░░░░████░░░░░░░░░███                   
                ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███                   
                ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███                   
                ████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███                   
                    ███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███                      
                    ███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███                      
                       █████████████████████████████                         
                       █████████████████████████████                         
       

               You are operating with the dotfiles of Adam Wong.
                  https://github.com/adamwong246/Castle-Shuri
                         adamwong246.github.io

"

# color test
# for attr in $(seq 0 1); do
#   for fg in $(seq 30 37); do
#     for bg in $(seq 40 47); do
#       printf "\033[$attr;${bg};${fg}m$attr;$fg;$bg\033[m "
#     done
#     echo
#   done
# done

