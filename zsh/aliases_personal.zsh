#-------------------
# Personnal Aliases
#-------------------
alias vim='nvim'

# Also done by Ctrl + L.
alias cls='echo -ne "\033c"'

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


#----------------
# FOR PROGRAMMING
#----------------
alias net='netctl-auto list ; ping -c 5 google.com'
alias netq='netctl-auto switch-to "wlp16s0-Sophop pho hue"'
alias netm='netctl-auto switch-to "wlp16s0-M454"'

alias fig='figlet -f roman.flf -d ~/.fonts/figlet_fonts'
alias clock='watch -n1 "date '+%D%n%T'|figlet -f roman.flf -d ~/.fonts/figlet_fonts -k"'


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
