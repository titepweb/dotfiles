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
fi
# Manually run :PlugInstall to install plugins for neovim, OR : 
config "Downloading ${bold}${blue}plugins${reset} for neovim."
nvim +PlugInstall +qall

# mpd
touch ~/.config/mpd/{mpd.db,mpd.log,mpd.pid,state}
mkdir -p ~/.config/mpd/playlists
config "Created ${bold}${blue}mpd.db,mpd.log,mpd.pid,state${reset} in ~/.config/mpd"

cat << EOF
┌─────────────────────────────────────────────────────────────────────────────┐
│                          COMBO 2 : My WM of CHOICE                          │
│ REQUIRED PACKAGES                                                           │
│ - bspwm rofi rxvt-unicode termite                                           │
│ - lemonbar-git (AUR) (patched with xft support) + xtitle-git (AUR) + dzen2  │
│ - zsh zsh-syntax-highlighting (submodule) + pretzo                          │
│ - TEXT EDITOR : neovim + vim-plug > vundle + gruvbox > base-16 colorscheme  │
│ - mutt (mail client) + newsbeuter (RSS) + weechat (IRC client)              │
│ - ncmpcpp [mpd|mopidy] mpc mpv cava                                         │
│ - paper-gtk-theme Ark-Darker | ultra-flat-icons                             │
│                                                                             │
│ OPTIONAL RECOMMENDED SOFTWARES                                              │
│ - File Manager: pcmanfm engrampa unrar zip unzip p7zip   +   ranger + w3m   │
│ - PDF READER  : zathura zathura-pdf-poppler zathura-djvu                    │
│ - HEX EDITOR  : bviplus                                                     │
│ - redshift                                                                  │
│ - htop htop-temperature (AUR)                                               │
│ - i3lock + xautolock                                                        │
│                                                                             │
│ CONFIGURATION                                                               │
│ - $ chsh -s $(which zsh) <-- set zsh as your login shell                    │
│ - ~/.dotfiles/lemonbar/panel_config                                         │
│ - ~/.config/bspwm/bspwmrc <-- $ xprop | grep CLASS <-- pacman -S xorg-utils │
│ - Manually configure ~/muttrc with your emai address & password             │
│ - Add your feeds in ~/.newsbeuter/urls                                      │
└─────────────────────────────────────────────────────────────────────────────┘
EOF
