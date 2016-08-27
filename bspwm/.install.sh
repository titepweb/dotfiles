#!/bin/sh
# PURPOSE : install packages for the combo : bspwm + lemonbar + dzen2 + rofi + termite
# status : nearly finished. last edit on 2016-02-05
# dependancy : this script is designed to be sourced by $DOTREPO/install.sh

######### REQUIRED PACKAGES #########

# git is required for nmdf pull va push
install git

cat << EOF
┌─────────────────────────────────────────────────────────────────────────────┐
│ INSTALLING REQUIRED PACKAGES FOR THE BSPWM ENVIRONMENT ...                  │
│ - bspwm sxhkd rofi rxvt-unicode termite feh compton parcellite conky        │
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
install conky
  install lm_sensors

# su dung networkmanager service thay vi netctl, netctl-auto, ... ma hay su dung  co trong goi sau:
# HAY SD: nmtui   va    nm-connection-editor     co trong package sau:
install networkmanager network-manager-applet
# bar
install --AUR lemonbar-xft-git xtitle-git
install --AUR numix-circle-icon-theme-git

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

# capture a specific area on the screen at 90% the quality of the original high quality screen.
install maim slop xdotool xclip
  # 1 - maim = make image la 1 script o day https://github.com/naelstrof/maim
  # 2 - slop = lenh nay duoc maim su dung
  # 3 - xdtool = Take a screenshot of the active window: (Requires xdotool.)
  # 4 - xclip = sxhkdrc > Print : su dung xclip de copy image vao clipboard
  # Ngoai ra, can 1 script nua la imgurbash.sh = sxhkdrc > shift + Print : su dung de upload -> imgur
  # imgurbash.sh download tai : http://imgur.com/tools/imgurbash.sh --> bo vao $DOTFILES/bspwm/bin
  # script tuong duong, thay the : https://github.com/tangphillip/Imgur-Uploader

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