#!/bin/sh
# PURPOSE : install packages for the combo : bspwm + lemonbar + dzen2 + rofi + termite
# status : nearly finished. last edit on 2016-08-25
# dependancy : this script is designed to be sourced by $DOTREPO/install.sh

######### OPTIONAL PACKAGES #########
# return # Uncomment to ovoid install optional packages

cat << EOF
┌─────────────────────────────────────────────────────────────────────────────┐
│ INSTALLING OPTIONAL PACKAGES FOR THE BSPWM ENVIRONMENT ...                  │
│ GUI - TUI - CLI                                                             │
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

# dictionary ----------------------
install goldendict

# office --------------------------
install mousepad

install zathura zathura-pdf-poppler zathura-djvu
# install libreoffice-fresh
# install libreoffice-still
# install --AUR wps-office

# install fcitx
# install --AUR ibus-bogo
# install ibus-unikey

# font ----------------------------
install noto-fonts

# Science & Latex -----------------
# install sagemath
# các bác có thể giải thích giúp em, vì sao compile qua LaTex+pdflatex lại cho kích thước trang khác với LaTex+dvips+ps2pdf không ạ?

# image viewer --------------------
install gpicview

# photo editor --------------------
install mypaint
install krita
# install pixeluvo
# install pinta
# install gimp
# install inscape
# install shotwell gthumb imagemagick

# media player -----------------
# install vlc
install mpv
# install smplayer smtube smplayer-themes smplayer-skins youtube-dl
# install xbmc
# install lollypop epiphany
# install deadbeef
# music editor --------------------
install audacity

# screen recorder -----------------
install simplescreenrecorder

# video editor --------------------
install kdenlive
# install pitivi

# web browser ---------------------
install chromium
install --AUR google-chromium
# install geary
# browser pdf plugin
# install chromium-libpdf
# browser flash plugin
# install chromium-pepper-flash

# communication -------------------
# From : https://desktop.telegram.org/
# install --AUR telegram-desktop

# network and security -----------
# install openssh vsftpd
# Start/Enable the vsftpd.service daemon.

# development server setup -------
# install nginx
# install dnsmasq


# development tools --------------
# install wine
# install virtualbox
# install markdown

# install eclipse-cpp
# install eclipse-java
# install eclipse-php

# C++ -----------
install qtcreator
# install kdevelop

# ---------------
# install hub
# install highlight
# install nvm
# install z