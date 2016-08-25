#!/bin/sh
# PURPOSE : install packages for the combo : bspwm + lemonbar + dzen2 + rofi + termite
# status : nearly finished. last edit on 2016-08-25
# dependancy : this script is designed to be sourced by $DOTREPO/install.sh

######### OPTIONAL PACKAGES #########
# return # Uncomment to ovoid install optional packages

cat << EOF
┌─────────────────────────────────────────────────────────────────────────────┐
│ INSTALLING OPTIONAL PACKAGES FOR THE BSPWM ENVIRONMENT ...                  │
│ CLI/TUI                                                                     │
│ - Video player: smplayer/[mpv]                                              │
│ - File Manager: tree                                                        │
│ - READER  : zathura zathura-pdf-poppler zathura-djvu                        │
│ - HEX EDITOR  : bviplus                                                     │
│ - htop / htop-temperature (AUR)                                             │
│ - i3lock + xautolock                                                        │
│ - NORTIFICATION : twmn dust                                                 │
│ - redshift youtube-viewer                                                   │
└─────────────────────────────────────────────────────────────────────────────┘
EOF

# ============= CLI ===============
install ack
install tree
install wget
install htop
install mlocate # is slowly replacing slocate (old)
	sudo updatedb               # run it immediately
	# sudo ionice -c3 updatedb	# schedule to run for idle

# ============= GUI ===============
install mousepad
install mpv
install gpicview
install youtube-viewer

install zathura zathura-pdf-poppler zathura-djvu

# screen recorder -----------------
install simplescreenrecorder
install audacity kdenlive

# development server setup -------
# install nginx
# install dnsmasq

# development tools --------------
# install hub
# install highlight
# install nvm
# install z
# install markdown

# install redshift ---------------
# WARNING " >> warning from ${yellow}$BASH_SOURCE${reset} :
# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ CONFIGURATION                                                               │
# │ - systemctl --user enable redshift.service                                  │
# │ - systemctl --user start redshift.service                                   │
# └─────────────────────────────────────────────────────────────────────────────┘
# "
# return

