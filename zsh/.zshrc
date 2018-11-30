# credits
## git functions: https://gist.github.com/1712320

source ~/.shrc
source ~/auto-nvm.zsh

# turn on colors
autoload -U colors && colors

# compdef _gnu_generic gcc

##
# Completion
##
autoload -U compinit
compinit
zmodload -i zsh/complist        
setopt hash_list_all            # hash everything before completion
setopt completealiases          # complete alisases
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word    
setopt complete_in_word         # allow completion from within a word/phrase

setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.

zstyle ':completion:*:*:*:*:*' menu select # select completions with arrow keys

#zstyle ':completion:*:manuals'    separate-sections true
#zstyle ':completion:*:manuals.*'  insert-sections   true
#zstyle ':completion:*:man:*'      menu yes select

# Group matches and describe.
#zstyle ':completion:*:matches' group 'yes'
#zstyle ':completion:*:options' description 'yes'
#zstyle ':completion:*:options' auto-description '%d'
#zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
#zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
#zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
#zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
#zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors '' # colorize completion-ed files

setopt auto_cd # cd by typing directory name if its not a command

# leave this off, they are annoying
#setopt correct_all # autocorrect commands
#setopt correct                  # spelling correction for commands

setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

setopt prompt_subst

# https://git-scm.com/book/en/v2/Git-in-Other-Environments-Git-in-Zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#HAPPY="(づ◕‿◕)づ"
#SAD="[╯°益°]╯"
HAPPY=" ʘ‿ʘ "
SAD=" ಠ_ಠ "

#echo $HAPPY $SAD

# customize the command prompt
PROMPT='
 %(?. %{$fg[black]%}%{$bg[green]%}$HAPPY%{$reset_color%} . %{$fg[black]%}%{$bg[red]%}$SAD%{$reset_color%} ) '

# Modify the colors and symbols in these variables as desired.
#GIT_PROMPT_AHEAD="%{$fg[red]%}NUM>%{$reset_color%}"
#GIT_PROMPT_BEHIND="%{$fg[cyan]%}NUM<%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg[red]%}●%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg[yellow]%}●%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg[green]%}●%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  #local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  #if [ "$NUM_AHEAD" -gt 0 ]; then
  #  GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  #fi
  #
  #local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  #if [ "$NUM_BEHIND" -gt 0 ]; then
  #  GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  #fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_STATE"
  fi

}

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo " %{$fg[blue]%}${git_where#(refs/heads/|tags/)} $(parse_git_state)"
}

# Set the right-hand prompt
RPROMPT='%~$(git_prompt_string)%{$reset_color%}'


echo "
 \e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m
 \e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m
 \e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[44m \e[0m\e[44m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[44m \e[0m\e[44m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m
 \e[0m \e[0m\e[0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[44m \e[0m\e[44m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[44m \e[0m\e[44m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[0m \e[0m\e[0m \e[0m
 \e[0m \e[0m\e[0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[45m \e[0m\e[45m \e[0m\e[44m \e[0m\e[44m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[45m \e[0m\e[45m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[45m \e[0m\e[45m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[44m \e[0m\e[44m \e[0m\e[45m \e[0m\e[45m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[0m \e[0m\e[0m \e[0m
 \e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[44m \e[0m\e[44m \e[0m\e[46m \e[0m\e[46m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[46m \e[0m\e[46m \e[0m\e[44m \e[0m\e[44m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m       $fg[red]${USER}$reset_color$fg[white] @ $fg[green]${$(hostname -fs)}$reset_color
 \e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[44m \e[0m\e[44m \e[0m\e[46m \e[0m\e[46m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[46m \e[0m\e[46m \e[0m\e[44m \e[0m\e[44m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m
 \e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[45m \e[0m\e[45m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[45m \e[0m\e[45m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m       $fg[red]OS$reset_color       $fg[green]${$(uname -sm)}$reset_color
 \e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[45m \e[0m\e[45m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[46m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[44m \e[0m\e[45m \e[0m\e[45m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m       $fg[red]shell$reset_color    $fg[green]$(echo $SHELL)$reset_color
 \e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[44m \e[0m\e[44m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[44m \e[0m\e[44m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m       $fg[red]dotfiles$fg[green] github.com/adamwong246/dotfiles$reset_color
 \e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[45m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m
 \e[0m \e[0m\e[0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[45m \e[0m\e[45m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[43m \e[0m\e[43m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[43m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[43m \e[0m\e[43m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[45m \e[0m\e[45m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[0m \e[0m\e[0m \e[0m
 \e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[43m \e[0m\e[43m \e[0m\e[47m \e[0m\e[47m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[47m \e[0m\e[47m \e[0m\e[43m \e[0m\e[43m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m
 \e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[43m \e[0m\e[43m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[43m \e[0m\e[43m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m
 \e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[43m \e[0m\e[43m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[47m \e[0m\e[43m \e[0m\e[43m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m
 \e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[48;5;0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m$reset_color
"

cd ~/dotfiles; 
if [[ -n $(git status --porcelain) ]]; then echo " $fg[white]$bg[black]You have uncommitted changes to your dotfiles$reset_color"; git diff --stat; fi
cd

#bg[red]     $bg[green]     $bg[blue]     $bg[cyan]     $bg[magenta]     $bg[yellow]     $bg[black]$fg[white]█████$bg[white]$fg[black]█████$reset_color


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
