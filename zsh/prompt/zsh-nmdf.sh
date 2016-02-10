#=[ SEGMENT DRAWING ]====================================================#
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

#=[ PROMPT COMPONENTS ]==================================================#
# Each component will draw itself, and hide itself if no information needs to be shown

function prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"                 # -1- was there an error ?
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"                  # -2- am I root ?
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}✱"     # -3- are there background jobs ?

  [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}

# environments:
#  - ssh
#  - virtualenv
#  - cabal sandbox

export VIRTUAL_ENV_DISABLE_PROMPT=1

function prompt_virtualenv {
  # check for cabal sandbox in parent directories, recursively
  # local cabal
  # cabal=( (../)#cabal.sandbox.config(N) )

  local envs
  [[ -n $SSH_CLIENT ]]  && envs+="R"
  # (( $#cabal ))         && envs+="H"
  [[ -n $VIRTUAL_ENV ]] && envs+="P"

  [[ -n $envs ]] && prompt_segment yellow black " %F{green}[%f$envs%F{green}]%f"
}

# Context: user@hostname (who am I and where am I)
export DEFAULT_USER=march
function prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment 246 235 "%(!.%{%F{yellow}%}.)$USER@%m"
  fi
}

# Dir: current working directory ( auto-collapses $HOME to ~ )
function prompt_dir() {
  # prompt_segment 239 248 '%~'
  # colorful slash
  local slash="%F{248} ❯ %f"
  prompt_segment 235 yellow "${${PWD/#$HOME/⚑}//\//$slash}"
}

function p_arrow {
  if [[ $KEYMAP = "vicmd" ]]; then
    echo "%F{magenta}❯ %f"
  else
    echo "%F{red}❯ %f"
  fi
}

#=[ THE LEFT-HAND PROMPT ]-==============================================#
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_virtualenv
  prompt_context
  prompt_dir
  # prompt_git
  # prompt_hg
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt)
$(p_arrow)'

#=[ THE RIGHT-HAND PROMPT ]==============================================#
function prompt_vcs {
  vcs_info
  echo $vcs_info_msg_0_
}

RPROMPT='$(prompt_vcs) $(git_time_since_commit)'
# ⎇ master            ✗✔                 ♻        ✦           {+1}
# git branch   dirty-untracked/clean    modified   added  1 commit need pushing

# More symbols to choose from:
# ☀ ✹ ☄ ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷
# ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ ⨠ 
# ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟  ⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ ☂ ✭ ☀ ✚ ✖ ♒ → 𝝙

#=[ GIT ONLY ]===========================================================#
# vcsinfo: thanks to github.com/sunaku/home/
setopt promptsubst
autoload -Uz vcs_info

VCS_PROMPT=" %F{cyan}⎇ %F{green}%b %F{magenta}%u%f%c%m"
AVCS_PROMPT="$VCS_PROMPT %F{cyan}➜%f %F{magenta}%a%f"

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{green}✦%f"      # staged files
zstyle ':vcs_info:*' unstagedstr "%F{yellow}♻%f"   # modified files
zstyle ':vcs_info:*' formats $VCS_PROMPT
zstyle ':vcs_info:*' actionformats $AVCS_PROMPT
zstyle ':vcs_info:git*+set-message:*' hooks git-aheadbehind git-untracked git-message git-stash

### git: Show +N/-N when your local branch is ahead-of or behind remote HEAD.
# Make sure you have added misc to your 'formats':  %m
function +vi-git-aheadbehind() {
  local ahead behind
  local -a gitstatus

  behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
  (( $behind )) && gitstatus+=( " -%F{red}${behind}%f" )

  ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
  (( $ahead )) && gitstatus+=( " +%F{blue}${ahead}%f" )

  hook_com[misc]+=${(j::)gitstatus}

  if [[ -n ${hook_com[misc]} ]]; then
    hook_com[misc]=" {%F{cyan}%f${hook_com[misc]}}"
  fi
}

### git: Show marker if there are untracked files in repository
# Make sure you have added staged to your 'formats':  %c
function +vi-git-untracked(){
	local dirty
  # check if we're in a git repo
  command git rev-parse --is-inside-work-tree &>/dev/null || return
  # check if it's dirty
  command git diff --quiet --ignore-submodules HEAD &>/dev/null;
  if [[ $? -eq 1 ]]; then
      dirty="%F{red}✗%f"
  else
      dirty="%F{green}✔%f"
  fi
  hook_com[branch]="%F{green}${hook_com[branch]}$dirty%f"
}

# proper spacing
function +vi-git-message(){
  if [[ -n ${hook_com[unstaged]} ]]; then
    if [[ -n ${hook_com[staged]} ]]; then
      hook_com[unstaged]="${hook_com[unstaged]} "
    else
      hook_com[unstaged]="${hook_com[unstaged]}"
    fi
  else
    if [[ -n ${hook_com[staged]} ]]; then
      hook_com[staged]=" ${hook_com[staged]}"
    fi
  fi
}

# Show count of stashed changes
function +vi-git-stash() {
    local -a stashes

    if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
        stashes=$(git stash list 2>/dev/null | wc -l)
        hook_com[misc]+=" •"
    fi
}

#=[ GIT ONLY ]===========================================================#
# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function git_time_since_commit() {
	local G_COMMIT_NEUTRAL="%F{green}"
	local G_COMMIT_LONG="%F{red}"
	local G_COMMIT_MEDIUM="%F{cyan}"
	local G_COMMIT_SHORT="%F{yellow}"
	local reset_color="%f"
  if git rev-parse --git-dir > /dev/null 2>&1; then
    # Only proceed if there is actually a commit.
    if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
      # Get the last commit.
      last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
      now=`date +%s`
      seconds_since_last_commit=$((now-last_commit))

      # Totals
      MINUTES=$((seconds_since_last_commit / 60))
      HOURS=$((seconds_since_last_commit/3600))
     
      # Sub-hours and sub-minutes
      DAYS=$((seconds_since_last_commit / 86400))
      SUB_HOURS=$((HOURS % 24))
      SUB_MINUTES=$((MINUTES % 60))
      
      if [[ -n $(git status -s 2> /dev/null) ]]; then
        if [ "$MINUTES" -gt 30 ]; then   COLOR="$G_COMMIT_LONG"
        elif [ "$MINUTES" -gt 10 ]; then COLOR="$G_COMMIT_MEDIUM"
        else                             COLOR="$G_COMMIT_SHORT"
        fi
      else                               COLOR="$G_COMMIT_NEUTRAL"
      fi

      if [ "$HOURS" -gt 24 ]; then     echo "[⬆ $COLOR${DAYS}d${SUB_HOURS}h${SUB_MINUTES}m%{$reset_color%} ago]"
      elif [ "$MINUTES" -gt 60 ]; then echo "[⬆ $COLOR${HOURS}h${SUB_MINUTES}m%{$reset_color%} ago]"
      else                             echo "[⬆ $COLOR${MINUTES}m%{$reset_color%} ago]"
      fi
    else
      COLOR="$G_COMMIT_NEUTRAL" ;      echo "$COLOR~"
    fi
  else
		echo "%F{yellow}$(date +"%_H:%M")%f"
  fi
}