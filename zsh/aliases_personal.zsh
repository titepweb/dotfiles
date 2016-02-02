#-------------------
# Personnal Aliases
#-------------------
alias vim='nvim'

# Also done by Ctrl + L.
alias cls='echo -ne "\033c"'

alias fig='figlet -f roman.flf -d ~/.fonts/figlet_fonts'
alias clock='watch -n1 "date '+%D%n%T'|figlet -f roman.flf -d ~/.fonts/figlet_fonts -k"'

#---------------------
# SYSTEM ADMINSTRATION
#---------------------
# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
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
# BRIEF
#-------------------
alias -g L=' | less'
alias -g M=' | less'
alias -g H=' | head'
alias -g T=' | tail'
alias -g G=' | grep'


alias mkdir='mkdir -p'
alias md='mkdir --parents'

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

# List almost all files colorized in long format, including dot files
alias la="ls --A"

# List only directories
alias lsd="ls -F | grep '^d'"

# Colorize grep output
alias grep='grep ${colorflag}=auto --ignore-case --binary-files=without-match --line-number --initial-tab'


#-------------------
# Injected's aliases
#-------------------
alias classify='classify -d 30'
alias testpl='echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"'
alias newmusic='find ~/Music -iname "*.flac" -or -iname "*.wav" -or -iname "*.mp3" -mtime -5 | sort'

alias aimee='mpv --shuffle "https://soundcloud.com/reynolds-ame/likes"'

alias redshift='redshift -l 35.22:-80.84'
alias nightmode='redshift -r -O 3600 -b .5'

alias porn=' mpv "http://www.pornhub.com/random"'
