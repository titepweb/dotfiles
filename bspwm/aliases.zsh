
# nmcli <-- networkmanager use to CREATE NEW A WIRELESS PROFILE
# alias netm='nmcli dev wifi connect M454 password ti845887'
# alias netq='nmcli dev wifi connect "Sophop pho hue" password 0583620035'

# nmcli <-- networkmanager use to SWITCH TO SAVED WIRELESS PROFILES
alias netm='nmcli connection up M454'
alias netq='nmcli connection up "Sophop pho hue"'

# netctl-auto
# alias net='netctl-auto list'
# alias netm='netctl-auto enable "wlp16s0-M454"'

#-------------------
# Injected's aliases
#-------------------
alias redshift='redshift -l 35.22:-80.84'
alias nightmode='redshift -r -O 3600 -b .5'

alias classify='classify -d 30'
alias testpl='echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"'
alias newmusic='find ~/Music -iname "*.flac" -or -iname "*.wav" -or -iname "*.mp3" -mtime -5 | sort'

alias aimee='mpv --shuffle "https://soundcloud.com/reynolds-ame/likes"'
alias porn=' mpv "http://www.pornhub.com/random"'
