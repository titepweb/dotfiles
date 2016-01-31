reset='\e[0m'     ;  	bold='\e[1m'		;			 blue='\e[34m'
config () {
  echo -e "\r  [${bold}${blue}SCRIPT${reset}] $1" 
}

#-------

# neovim
if [[ ! -f ~/.config/nvim/autoload/plug.vim ]]; then
	config "Downloading ${bold}${blue}vim-plug${reset} plugins manager for neovim."
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	config "Downloaded ${bold}${blue}vim-plug${reset} plugins manager for neovim."
fi
# @FIXME: nvim not quit after install
# nvim +PlugInstall
# nvim +PlugInstall +qall
# config "Downloaded ${bold}${blue}plugins${reset} for neovim."

# base16-shell
THEMEDIR="$HOME/.config/base16-shell"
if [ ! -d "$THEMEDIR/.git" ]; then
	git clone -b master https://github.com/chriskempson/base16-shell "$THEMEDIR"
	config "Downloaded ${bold}${blue}base16-shell${reset} colorscheme for zsh."
fi

cat << EOF
┌─────────────────────────────────────────────────────────────────────────────┐
│                   ZSH + VIM and My COLORSCHEME of CHOICE                    │
│ REQUIRED PACKAGES                                                           │
│ - neovim + vim-plug > vundle + base-16 colorscheme (vim/zsh...) + custom    │
│ - zplug --> + + pretzo + oh-my-zsh + zsh-syntax-highlighting                │
│                                                                             │
│ CONFIGURATION                                                               │
│ - $ chsh -s $(which zsh) <-- set zsh as your login shell                    │
│ - neovim + vim-plug > vundle + gruvbox > base-16 colorscheme                │
│ - Manually run :PlugInstall for neovim (and then :PlugClean if needed)      │
└─────────────────────────────────────────────────────────────────────────────┘
EOF
