#!/bin/sh
# PURPOSE : install packages for the combo : bspwm + lemonbar + dzen2 + rofi + termite
# status : nearly finished. last edit on 2016-02-05
# dependancy : this script is designed to be sourced by $DOTREPO/install.sh

######### REQUIRED PACKAGES #########

cat << EOF
┌─────────────────────────────────────────────────────────────────────────────┐
│ INSTALLING REQUIRED PACKAGES FOR THE BSPWM ENVIRONMENT ...                  │
│ - bspwm sxhkd rofi rxvt-unicode termite feh compton parcellite              │
│ - lemonbar-xft-git (AUR)(xft support) + net-tools + xtitle-git (AUR) + dzen2│
│ - mutt (mail client) + newsbeuter (RSS) + weechat (IRC client)              │
│ - ncmpcpp [mpd|mopidy] mpc cava     + codec: flac                           │
│ - nmcli_dmenu / networkmanager + network-manager-applet + rofi              │
│ - pcmanfm + engrampa unrar zip unzip p7zip     &     ranger w3m             │
│ - ntfs-3g + gvfs + polkit-gnome + dosfstools                                │
└─────────────────────────────────────────────────────────────────────────────┘
EOF

# window manager
install bspwm sxhkd
install xorg-xsetroot # xsetroot -cursor_name left_ptr
# use a clipboard manager for clipboard persistance
install parcellite

# su dung networkmanager service thay vi netctl, netctl-auto, ...
install networkmanager network-manager-applet
# bar
yaourt -Sb lemonbar-xft-git --noconfirm --export ~/Downloads
# net-tools cung cap lenh ifconfig, duoc su dung trong lemonbar > panel > wifi
install net-tools
# Compositor
install compton
install dzen2
# terminals
install termite
install rxvt-unicode
# application launcher
install rofi
#
install feh
install mpd mpc ncmpcpp flac
# install cava
install pcmanfm engrampa unrar zip unzip p7zip
install ranger w3m
install mutt newsbeuter weechat

install polkit-gnome ntfs-3g gvfs
# Change labels on MS-DOS filesystems
install dosfstools

# git is required for nmdf pull va push
install git

WARNING " >> warning from ${yellow}$BASH_SOURCE${reset} :
┌─────────────────────────────────────────────────────────────────────────────┐
│ MANUALLY INSTALL packages from AUR which cannot be installed automatically: │
│ - lemonbar-xft-git (AUR) (patched with xft support) + xtitle-git (AUR)      │
│ - yaourt -Sb numix-circle-icon-theme-git --noconfirm --export ~/Downloads/  │
└─────────────────────────────────────────────────────────────────────────────┘
"

# nmcli_menu
if [[ ! -f "$DOTFILES/bspwm/bin/nmcli_dmenu" ]]; then
	INFO "Downloading ${bold}${cyan}nmcli_dmenu${reset} for easily managing network."
	curl -fLo "$DOTREPO/bspwm/bin/nmcli_dmenu" --create-dirs \
	    https://raw.githubusercontent.com/firecat53/nmcli-dmenu/master/nmcli_dmenu
	OK "Downloaded ${bold}${green}nmcli_dmenu${reset} for easily managing network."
else
	OK "✔ ${bold}${green}nmcli_menu${reset} has been installed."
fi

########### CONFIGURATION ###########

# mpd requires some files to start
mkdir -p ~/.config/mpd/playlists
touch ~/.config/mpd/{mpd.db,mpd.log,mpd.pid,state}
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