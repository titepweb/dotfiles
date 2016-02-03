#!/bin/bash
if [ -z $INSTALLOPTION ]; then return; fi
if [ $INSTALLOPTION != "true" ]; then return ; fi

######### REQUIRED PACKAGES #########

cat << EOF
┌─────────────────────────────────────────────────────────────────────────────┐
│ INSTALLING REQUIRED PACKAGES FOR THE BSPWM ENVIRONMENT ...                  │
│ - bspwm sxhkd rofi rxvt-unicode termite feh                                 │
│ - lemonbar-git (AUR) (patched with xft support) + xtitle-git (AUR) + dzen2  │
│ - mutt (mail client) + newsbeuter (RSS) + weechat (IRC client)              │
│ - ncmpcpp [mpd|mopidy] mpc cava     + codec: flac                           │
│ - nmcli_dmenu / networkmanager + network-manager-applet + rofi              │
│ - pcmanfm + engrampa unrar zip unzip p7zip     &     ranger w3m             │
└─────────────────────────────────────────────────────────────────────────────┘
EOF

install bspwm sxhkd
install termite
install rxvt-unicode
install rofi
install dzen2
install feh
install networkmanager network-manager-applet
install mpd mpc ncmpcpp flac 
# install cava
install pcmanfm engrampa unrar zip unzip p7zip
install ranger w3m
install mutt newsbeuter weechat

# # development server setup
# install nginx
# install dnsmasq

# # development tools
install git
# install hub
# install highlight
# install nvm
# install z
# install markdown

# install macvim --override-system-vim
# install reattach-to-user-namespace 		# for osx

inform " >> message from $BASH_SOURCE :
┌─────────────────────────────────────────────────────────────────────────────┐
│ MANUALLY INSTALL packages from AUR which cannot be installed automatically: │
│ - lemonbar-git (AUR) (patched with xft support) + xtitle-git (AUR)          │
└─────────────────────────────────────────────────────────────────────────────┘
"

# nmcli_menu
if [[ ! -f ~/.dotfiles/bspwm/bin/nmcli_dmenu ]]; then
	script "Downloading ${bold}${blue}nmcli_dmenu${reset} for easily managing network."
	curl -fLo ~/.dotfiles/bspwm/bin/nmcli_dmenu --create-dirs \
	    https://raw.githubusercontent.com/firecat53/nmcli-dmenu/master/nmcli_dmenu
	script "Downloaded ${bold}${blue}nmcli_dmenu${reset} for easily managing network."
else
	script "✔ ${bold}${green}nmcli_menu${reset} has been installed."
fi

########### CONFIGURATION ###########

# mpd requires some files to start
touch ~/.config/mpd/{mpd.db,mpd.log,mpd.pid,state}
mkdir -p ~/.config/mpd/playlists
script "Created ${bold}${blue}mpd.db,mpd.log,mpd.pid,state${reset} in ~/.config/mpd"

inform " >> message from $BASH_SOURCE :
┌─────────────────────────────────────────────────────────────────────────────┐
│ CONFIGURATION :                                                             │
│ - ~/.dotfiles/lemonbar/panel_config <-- BATTERY=/sys/class/power_supply/??? │
│ - ~/.config/bspwm/bspwmrc <-- $ xprop | grep CLASS <-- pacman -S xorg-utils │
│ - ~/muttrc <-- your email address & password                                │
│ - ~/.newsbeuter/urls <-- add your feeds                                     │
│ - sudo systemctl enable NetworkManager && systemctl start NetworkManager    │
│   'sudo systemctl disable netctl-auto@wlp16s0.service' if needed            │
└─────────────────────────────────────────────────────────────────────────────┘
"

# Uncomment to install optional packages
return

######### OPTIONAL PACKAGES #########

cat << EOF
┌─────────────────────────────────────────────────────────────────────────────┐
│ INSTALLING OPTIONAL PACKAGES FOR THE BSPWM ENVIRONMENT ...                  │
│ CLI/TUI                                                                     │
│ - Video player: smplayer/mpv                                                │
│ - File Manager: pcmanfm engrampa unrar zip unzip p7zip  +  tree   │
│ - PDF READER  : zathura zathura-pdf-poppler zathura-djvu                    │
│ - HEX EDITOR  : bviplus                                                     │
│ - htop / htop-temperature (AUR)                                               │
│ - i3lock + xautolock                                                        │
│ - NORTIFICATION : twmn                                                      │
│ - paper-gtk-theme Ark-Darker | ultra-flat-icons                             │
│ - redshift youtube-viewer                                                                  │
│                                                                             │
│ CONFIGURATION                                                               │
│ - systemctl --user enable redshift.service    														  │
│ - systemctl --user start redshift.service                                   │
└─────────────────────────────────────────────────────────────────────────────┘
EOF


# optional packages
install ack
install tree
install wget
install htop
install youtube-viewer

install mousepad




