# credits
## git functions: https://gist.github.com/1712320

source ~/.shrc

setopt prompt_subst

autoload -U colors && colors

# customize the command prompt
PROMPT="
%{$fg[red]%}%   (╯°益°)╯%{$reset_color%}  "

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_AHEAD=" %{$fg[green]%}NUM>>%{$reset_color%} "
GIT_PROMPT_BEHIND=" %{$fg[cyan]%<<NUM%{$reset_color%} "
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

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

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
  [ -n "$git_where" ] && echo ":%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$(parse_git_state)"
}

# Set the right-hand prompt
RPS1=' %~$(git_prompt_string)'

clear
echo "
 \e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m  $fg[red]${USER}$reset_color@$fg[red]${$(hostname -fs)}$reset_color
 \e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m
 \e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[30m█\e[0m\e[30m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m  $fg[red]OS:$reset_color ${$(uname -sm)}
 \e[0m \e[0m\e[0m \e[0m\e[30m█\e[0m\e[30m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[0m \e[0m\e[0m \e[0m  $fg[red]dotfiles: $reset_color https://github.com/adamwong246/dotfiles
 \e[0m \e[0m\e[0m \e[0m\e[30m█\e[0m\e[30m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[0m \e[0m\e[0m \e[0m
 \e[30m█\e[0m\e[30m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[30m█\e[0m\e[30m█\e[0m
 \e[30m█\e[0m\e[30m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[30m█\e[0m\e[30m█\e[0m
 \e[30m█\e[0m\e[30m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[30m█\e[0m\e[30m█\e[0m
 \e[30m█\e[0m\e[30m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[34m█\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[30m█\e[0m\e[30m█\e[0m            $fg[red]\" I fight for the Users \" $reset_color
 \e[30m█\e[0m\e[30m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m▒\e[0m\e[35m▒\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[30m█\e[0m\e[30m█\e[0m
 \e[30m█\e[0m\e[30m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[30m█\e[0m\e[30m█\e[0m
 \e[0m \e[0m\e[0m \e[0m\e[30m█\e[0m\e[30m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[35m░\e[0m\e[35m░\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[0m \e[0m\e[0m \e[0m
 \e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[30m█\e[0m\e[30m█\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m
 \e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[30m█\e[0m\e[30m█\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m
 \e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[30m█\e[0m\e[30m█\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m▒\e[0m\e[37m█\e[0m\e[37m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m
 \e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[30m█\e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m\e[0m \e[0m$reset_color"
