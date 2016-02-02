inform () {
	local reset='\e[0m'     ;   	local bold='\e[1m'		;			 local blue='\e[34m'
  echo -e "\r  [${bold}${blue}SCRIPT${reset}] $1" 
}

#=[ mpd ]======================================#
touch ~/.config/mpd/{mpd.db,mpd.log,mpd.pid,state}
mkdir -p ~/.config/mpd/playlists
inform "Created ${bold}${blue}mpd.db,mpd.log,mpd.pid,state${reset} in ~/.config/mpd"

#=[ nmcli_dmenu ]==============================#
if [[ ! -f ~/.dotfiles/bspwm/bin/nmcli_dmenu ]]; then
	inform "Downloading ${bold}${blue}nmcli_dmenu${reset} for easily managing network."
	curl -fLo ~/.dotfiles/bspwm/bin/nmcli_dmenu --create-dirs \
	    https://raw.githubusercontent.com/firecat53/nmcli-dmenu/master/nmcli_dmenu
	inform "Downloaded ${bold}${blue}nmcli_dmenu${reset} for easily managing network."
fi

cat << EOF
┌─────────────────────────────────────────────────────────────────────────────┐
│                          COMBO 2 : My WM of CHOICE                          │
│ REQUIRED PACKAGES                                                           │
│ - bspwm rofi rxvt-unicode termite                                           │
│ - lemonbar-git (AUR) (patched with xft support) + xtitle-git (AUR) + dzen2  │
│ - mutt (mail client) + newsbeuter (RSS) + weechat (IRC client)              │
│ - ncmpcpp [mpd|mopidy] mpc cava     + codec: flac                           │
│ - nmcli_dmenu / networkmanager + network-manager-applet + rofi              │
│                                                                             │
│ OPTIONAL RECOMMENDED SOFTWARES                                              │
│ - Video player: smplayer/mpv                                                │
│ - File Manager: pcmanfm engrampa unrar zip unzip p7zip   +   ranger + w3m   │
│ - PDF READER  : zathura zathura-pdf-poppler zathura-djvu                    │
│ - HEX EDITOR  : bviplus                                                     │
│ - htop htop-temperature (AUR)                                               │
│ - i3lock + xautolock                                                        │
│ - NORTIFICATION : twmn                                                      │
│ - paper-gtk-theme Ark-Darker | ultra-flat-icons                             │
│ - redshift                                                                  │
│                                                                             │
│ CONFIGURATION                                                               │
│ - ~/.dotfiles/lemonbar/panel_config                                         │
│ - ~/.config/bspwm/bspwmrc <-- $ xprop | grep CLASS <-- pacman -S xorg-utils │
│ - Manually configure ~/muttrc with your emai address & password             │
│ - Add your feeds in ~/.newsbeuter/urls                                      │
│ - systemctl disable netctl-auto@wlp16s0.service                             │
│   sudo systemctl enable NetworkManager && systemctl start NetworkManager    │
│ - systemctl --user enable redshift.service
│ - systemctl --user start redshift.service 
│ ~/redshift.com
└─────────────────────────────────────────────────────────────────────────────┘
EOF
