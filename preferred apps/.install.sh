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
│ - Video player: [smtube] & smplayer/[mpv]                                   │
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

# mlocate is slowly replacing slocate (old)
install mlocate
  # configuration : run it immediately after install mlocate
  sudo updatedb
	# sudo ionice -c3 updatedb	# schedule to run for idle

install youtube-viewer

# hex editor ----------------------
# install bviplus

# nortification -------------------
# install twmn dust

# install redshift ----------------
# WARNING " >> warning from ${yellow}$BASH_SOURCE${reset} :
# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ CONFIGURATION                                                               │
# │ - systemctl --user enable redshift.service                                  │
# │ - systemctl --user start redshift.service                                   │
# └─────────────────────────────────────────────────────────────────────────────┘
# "
# return

# ============= GUI ===============
# office --------------------------
# install fcitx
# yao ibus-bogo
# install ibus-unikey

install mousepad
install zathura zathura-pdf-poppler zathura-djvu
# install libreoffice-fresh
# install libreoffice-still

# image viewer --------------------
install gpicview

# image editor --------------------
# install imagemagick

# media player -----------------
# install vlc
install mpv
# install smplayer smtube smplayer-themes smplayer-skins youtube-dl
# install xbmc
# install lollypop

# web browser ---------------------
install chromium
yaourt -Sb --export ~/Downloads --noconfirm google-chromium
# browser pdf plugin
# install chromium-libpdf
# browser flash plugin
# install chromium-pepper-flash

# dictionary ----------------------
install goldendict

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