# Prints current branch in a VCS directory if it could be detected.

get_tmux_cwd() {
  local env_name=$(tmux display -p "TMUXPWD_#D" | tr -d %)
  local env_val=$(tmux show-environment | grep --color=never "$env_name")
  # The version below is still quite new for tmux. Uncomment this in the future :-)
  #local env_val=$(tmux show-environment "$env_name" 2>&1)
  
  if [[ ! $env_val =~ "unknown variable" ]]; then
    local tmux_pwd=$(echo "$env_val" | sed 's/^.*=//')
    echo "$tmux_pwd"
  fi
}

branch_symbol="⭠"
mod_symbol=" ﹢"
staged_symbol=" ⊕ "
other_symbol=" ⋯ "
git_colour="5"

run_segment() {
  tmux_path=$(get_tmux_cwd)
  cd "$tmux_path"
  
  branch=""
  modified=""
  staged=""
  compare=""
  others=""

  output=""

  if [ -n "${git_branch=$(__parse_git_branch)}" ]; then
    branch="$git_branch"
  fi
  if [ -n "${git_mod=$(__parse_git_modified)}" ]; then
    modified="$git_mod"
  fi
  if [ -n "${git_sta=$(__parse_git_staged)}" ]; then
    staged="$git_sta"
  fi
  if [ -n "${git_com=$(__parse_git_compare)}" ]; then
    compare="$git_com"
  fi
  if [ -n "${git_oth=$(__parse_git_others)}" ]; then
    others="$git_oth"
  fi
  
  if [ -n "$branch" ]; then
    output="$branch "
  fi
  if [ -n "$compare" ]; then
    output="$output#[bg=colour233]$compare"
  fi
  if [ -n "$staged" ]; then
    output="$output$staged"
  fi
  if [ -n "$modified" ]; then
    output="$output$modified"
  fi
  if [ -n "$others" ]; then
    output="$output$others "
  fi
  
  echo $output
  return 0
}

__parse_git_branch() {
  type git >/dev/null 2>&1
  if [ "$?" -ne 0 ]; then
    return
  fi

  #git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'

  # Quit if this is not a Git repo.
  branch=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -z $branch ]] ; then
    # attempt to get short-sha-name
    branch=":$(git rev-parse --short HEAD 2> /dev/null)"
  fi
  if [ "$?" -ne 0 ]; then
    # this must not be a git repo
    return
  fi

  # Clean off unnecessary information.
  branch=${branch##*/}

  echo " #[fg=colour87]${branch_symbol} ${branch}"
}

__parse_git_compare() {
  type git >/dev/null 2>&1
  if [ "$?" -ne 0 ]; then
    return
  fi

  # check if git
  [[ -z $(git rev-parse --git-dir 2> /dev/null) ]] && return

  tracking_branch=$(git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD))

  # creates global variables $1 and $2 based on left vs. right tracking
  set -- $(git rev-list --left-right --count $tracking_branch...HEAD)

  behind=$1
  ahead=$2

  # print out the information
  if [[ $behind -gt 0 ]] ; then
    local ret=" ↓ $behind"
  fi
  if [[ $ahead -gt 0 ]] ; then
    local ret="${ret} ↑ $ahead"
  fi
  echo "#[fg=colour2]$ret"
}

__parse_git_staged(){
  type git >/dev/null 2>&1
  if [ "$?" -ne 0 ]; then
    return
  fi

  # Check if git.
  [[ -z $(git rev-parse --git-dir 2> /dev/null) ]] && return

  # Return the number of staged items.
  tmp_staged=$(git diff --staged --name-status | wc -l | tr -d ' ')
  echo "#[fg=colour1]${staged_symbol}$tmp_staged"
}

__parse_git_modified(){
  type git >/dev/null 2>&1
  if [ "$?" -ne 0 ]; then
    return
  fi

  # check if git
  [[ -z $(git rev-parse --git-dir 2> /dev/null) ]] && return

  # return the number of staged items
  modded=$(git ls-files --modified | wc -l | tr -d ' ')
  echo "#[fg=colour12]${mod_symbol}$modded"
}

__parse_git_others(){
  type git >/dev/null 2>&1
  if [ "$?" -ne 0 ]; then
    return
  fi

  # check if git
  [[ -z $(git rev-parse --git-dir 2> /dev/null) ]] && return

  # return the number of staged items
  other=$(git ls-files --others --exclude-standard | wc -l | tr -d ' ')
  echo "#[fg=colour255]${other_symbol}$other #[bg=colour243]"
}
run_segment
