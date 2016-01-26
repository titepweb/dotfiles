reset='\e[0m'     ;  	bold='\e[1m'		;			 blue='\e[34m'
config () {
  echo -e "\r  [${bold}${blue}CONFIG${reset}] $1" 
}

#-------

# neovim
if [[ ! -f ~/.config/nvim/autoload/plug.vim ]]; then
	config "Downloading ${bold}${blue}vim-plug${reset} plugins manager for neovim."
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	config "Downloaded ${bold}${blue}vim-plug${reset} plugins manager for neovim."
fi
# Manually run :PlugInstall to install plugins for neovim, OR : 
config "Downloading ${bold}${blue}plugins${reset} for neovim."
nvim +PlugInstall +qall
config "Downloaded ${bold}${blue}plugins${reset} for neovim."

# mpd
touch ~/.config/mpd/{mpd.db,mpd.log,mpd.pid,state}
mkdir -p ~/.config/mpd/playlists
config "Created ${bold}${blue}mpd.db,mpd.log,mpd.pid,state${reset} in ~/.config/mpd"

# zplug
if [[ ! -e ~/.zplug/zplug ]]; then
	config "Downloading ${bold}${blue}zplug${reset} ..."
	curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug
	config "Downloaded ${bold}${blue}zplug${reset}!"
else
	config "${bold}${blue}zplug${reset} exists. Please check for its update."
fi


cat << EOF
┌─────────────────────────────────────────────────────────────────────────────┐
│                          COMBO 2 : My WM of CHOICE                          │
│ REQUIRED PACKAGES                                                           │
│ - bspwm rofi rxvt-unicode termite zsh                                       │
│ - lemonbar-git (AUR) (patched with xft support) + xtitle-git (AUR) + dzen2  │
│ - neovim + vim-plug > vundle + gruvbox > base-16 colorscheme                │
│ - mutt (mail client) + newsbeuter (RSS) + weechat (IRC client)              │
│ - ncmpcpp [mpd|mopidy] mpc cava                                             │
│                                                                             │
│ OPTIONAL RECOMMENDED SOFTWARES                                              │
│ - zplug --> + + pretzo + oh-my-zsh + zsh-syntax-highlighting                │
│ - Video player: smplayer/mpv                                                │
│ - File Manager: pcmanfm engrampa unrar zip unzip p7zip   +   ranger + w3m   │
│ - PDF READER  : zathura zathura-pdf-poppler zathura-djvu                    │
│ - HEX EDITOR  : bviplus                                                     │
│ - redshift                                                                  │
│ - htop htop-temperature (AUR)                                               │
│ - i3lock + xautolock                                                        │
│ - paper-gtk-theme Ark-Darker | ultra-flat-icons                             │
│                                                                             │
│ CONFIGURATION                                                               │
│ - $ chsh -s $(which zsh) <-- set zsh as your login shell                    │
│ - ~/.dotfiles/lemonbar/panel_config                                         │
│ - ~/.config/bspwm/bspwmrc <-- $ xprop | grep CLASS <-- pacman -S xorg-utils │
│ - Manually configure ~/muttrc with your emai address & password             │
│ - Add your feeds in ~/.newsbeuter/urls                                      │
└─────────────────────────────────────────────────────────────────────────────┘
EOF
