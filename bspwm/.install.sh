#!/bin/sh
# PURPOSE : install packages for the combo : bspwm + lemonbar + dzen2 + rofi + termite 
# status : nearly finished. last edit on 2016-02-05
# dependancy : this script is designed to be sourced by $DOTREPO/install.sh

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

install xorg-xsetroot # xsetroot -cursor_name left_ptr

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

WARNING " >> warning from ${yellow}$BASH_SOURCE${reset} :
┌─────────────────────────────────────────────────────────────────────────────┐
│ MANUALLY INSTALL packages from AUR which cannot be installed automatically: │
│ - lemonbar-git (AUR) (patched with xft support) + xtitle-git (AUR)          │
└─────────────────────────────────────────────────────────────────────────────┘
"

# nmcli_menu
if [[ ! -f "$DOTFILES/bspwm/bin/nmcli_dmenu" ]]; then
	INFO "Downloading ${bold}${cyan}nmcli_dmenu${reset} for easily managing network."
	curl -fLo ~/.dotfiles/bspwm/bin/nmcli_dmenu --create-dirs \
	    https://raw.githubusercontent.com/firecat53/nmcli-dmenu/master/nmcli_dmenu
	OK "Downloaded ${bold}${green}nmcli_dmenu${reset} for easily managing network."
else
	OK "✔ ${bold}${green}nmcli_menu${reset} has been installed."
fi

########### CONFIGURATION ###########

# mpd requires some files to start
touch ~/.config/mpd/{mpd.db,mpd.log,mpd.pid,state}
mkdir -p ~/.config/mpd/playlists
OK "Created ${bold}${green}mpd.db,mpd.log,mpd.pid,state${reset} in ~/.config/mpd"

WARNING " >> warning from ${yellow}$BASH_SOURCE${reset} :
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

######### OPTIONAL PACKAGES #########
return # Uncomment to install optional packages

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
WARNING " >> warning from ${yellow}$BASH_SOURCE${reset} :
┌─────────────────────────────────────────────────────────────────────────────┐
│ CONFIGURATION                                                               │
│ - systemctl --user enable redshift.service    														  │
│ - systemctl --user start redshift.service                                   │
└─────────────────────────────────────────────────────────────────────────────┘
"

# optional packages
install ack
install tree
install wget
install htop
install youtube-viewer

install mousepad
install redshift
install mpv
