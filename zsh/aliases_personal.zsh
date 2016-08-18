#-------------------
# Personnal Aliases
#-------------------
# Also done by Ctrl + L.
alias cls='echo -ne "\033c"'        # Win-like command

alias fig='figlet -f roman.flf -d ~/.fonts/figlet_fonts'
alias clock='watch -n1 "date '+%D%n%T'|figlet -f roman.flf -d ~/.fonts/figlet_fonts -k"'

#---------------------
# SYSTEM ADMINSTRATION
#---------------------
# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias fpath='echo -e ${FPATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

# Arch Linux : Package Manager
alias pacman="sudo pacman --color=always"
alias pac='sudo pacman'
#[r]emove [o]phans - recrusively remove ALL orphaned packaged
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"
alias paco='sudo pacman -Sc && sudo pacman-optimize'
alias yao='yaourt -Sb --export ~/Downloads --noconfirm'

#-------------------
# CONVENIENCE
#-------------------
# Easier navigation:
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."


#-------------------
# DEFAULT PARAMETERS
#-------------------
alias mkdir='mkdir -pv'         # Make parent directories as needed and output result
alias md='mkdir --parents'      # Win-like command
alias cp='cp -ar'               # including hidden files
alias ping='ping -c 5'          # Don't let ping go on forever
alias lsblk='lsblk -fm'         # more information
alias df='df -h'                # human readable
alias du='du -ch'               # human readable

# alias -g L=' | less'
# alias -g M=' | less'
# alias -g H=' | head'
# alias -g T=' | tail'
# alias -g G=' | grep'

#-----------------------------------------------------
# aliases to always use color output for `ls` & `grep`
#-----------------------------------------------------
# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# List files colorized in long format, add / for directories, group directories first
alias ls="ls ${colorflag}=auto -lF --human-readable --group-directories"

# List almost all files colorized in long format, including dot files, but not ./. and ./.. ##

alias la="ls --A"

# List only directories
alias lsd="ls -F | grep '^d'"

# Colorize grep output
alias grep='grep ${colorflag}=auto --ignore-case --binary-files=without-match --line-number --initial-tab'
# alias egrep='egrep ${colorflag}=auto'
# alias fgrep='fgrep ${colorflag}=auto'
