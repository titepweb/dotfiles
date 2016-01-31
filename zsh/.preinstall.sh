inform () {
	local reset='\e[0m'     ;   	local bold='\e[1m'		;			 local blue='\e[34m'
  echo -e "\r  [${bold}${blue}SCRIPT${reset}] $1" 
}

#=[ Neovim ]===================================#
if [[ ! -f ~/.config/nvim/autoload/plug.vim ]]; then
	inform "Downloading ${bold}${blue}vim-plug${reset} plugins manager for neovim."
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	inform "Downloaded ${bold}${blue}vim-plug${reset} plugins manager for neovim."
fi
# @FIXME: nvim not quit after install
# nvim +PlugInstall
# nvim +PlugInstall +qall
# inform "Downloaded ${bold}${blue}plugins${reset} for neovim."


#=[ base16-shell ]=============================#
THEMEDIR="$HOME/.config/base16-shell"
if [ ! -d "$THEMEDIR/.git" ]; then
	git clone -b master https://github.com/chriskempson/base16-shell "$THEMEDIR"
	inform "Downloaded ${bold}${blue}base16-shell${reset} colorscheme for zsh."
fi

#=[ Tmux Plugin Manager ]======================#
TPMDIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPMDIR/.git" ]; then
	git clone -b master https://github.com/tmux-plugins/tpm "$TPMDIR"
	inform "Downloaded ${bold}${blue}Tmux Plugin Manager${reset}."
fi

cat << EOF
┌─────────────────────────────────────────────────────────────────────────────┐
│              ZSH + VIM + TMUX and My COLORSCHEME of CHOICE                  │
│ REQUIRED PACKAGES                                                           │
│ - neovim + vim-plug > vundle + base16-vim colorscheme + custom theme        │
│ - zsh + zplug > pretzo > oh-my-zsh + base16-shell + custom color palettes   │
│                                                                             │
│ CONFIGURATION                                                               │
│ - $ chsh -s $(which zsh) <-- set zsh as your login shell                    │
│ - neovim + vim-plug > vundle + gruvbox > base-16 colorscheme                │
│ - Manually run :PlugInstall for neovim (and then :PlugClean if needed)      │
│ - Fetch tmux plugins by manually running prefix + I inside tmux             │
└─────────────────────────────────────────────────────────────────────────────┘
EOF
