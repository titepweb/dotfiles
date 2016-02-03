#!/bin/bash
if [ -z $INSTALLOPTION ]; then return; fi
if [ $INSTALLOPTION != "true" ]; then return ; fi

######### REQUIRED PACKAGES #########

cat << EOF
┌─────────────────────────────────────────────────────────────────────────────┐
│ INSTALLING REQUIRED PACKAGES for the combo ZSH + NEOVIM + TMUX + base16     │
│ - zsh + base16-shell colorscheme + my modified color palettes               │
│ - neovim + xclip + vim-plug + base16-vim colorscheme + my custom theme      │
│ - tmux + Tmux Plugin Manager                                                │
└─────────────────────────────────────────────────────────────────────────────┘
EOF

install zsh
install xclip
install neovim
install tmux 

#=[ vim-plug ]=================================#
# better than vunddle , pretzo, or oh-my-zsh
if [[ ! -f ~/.config/nvim/autoload/plug.vim ]]; then
	script "Downloading ${bold}${blue}vim-plug${reset} plugins manager for neovim."
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	script "Downloaded ${bold}${blue}vim-plug${reset} plugins manager for neovim."
else
	script "✔ ${bold}${green}vim-plug${reset} has been installed."
fi
# @FIXME: nvim not quit after install
# nvim +PlugInstall
# nvim +PlugInstall +qall
# script "Downloaded ${bold}${blue}plugins${reset} for neovim."

#=[ base16-shell ]=============================#
THEMEDIR="$HOME/.config/base16-shell"
if [ ! -d "$THEMEDIR/.git" ]; then
	git clone -b master https://github.com/chriskempson/base16-shell "$THEMEDIR"
	script "Downloaded ${bold}${blue}base16-shell${reset} colorscheme for zsh."
else
	script "✔ ${bold}${green}base16-shell${reset} has been installed."
fi

#=[ Tmux Plugin Manager ]======================#
TPMDIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPMDIR/.git" ]; then
	git clone -b master https://github.com/tmux-plugins/tpm "$TPMDIR"
	script "Downloaded ${bold}${blue}Tmux Plugin Manager${reset}."
else
	script "✔ ${bold}${green}Tmux Plugin Manager${reset} has been installed."
fi

inform " >> message from $BASH_SOURCE :
┌─────────────────────────────────────────────────────────────────────────────┐
│ CONFIGURATION                                                               │
│ - Manually run :PlugInstall for neovim (and then :PlugClean if needed)      │
│   :( remove the symlink in '~/.config/nvim/plugged/base16-vim/colors' first.│
│ - Fetch tmux plugins by manually running 'prefix + I' inside tmux           │
└─────────────────────────────────────────────────────────────────────────────┘
"

# change defaull shell <--- !IMPORTANT
case $SHELL in
*/zsh)
	script "✔ ${bold}${green}zsh${reset} has been default shell."
	;;
*/bash)
	script "Changing default shell to ${bold}${green}zsh${reset}..."
	chsh -s `which zsh`
	;;
*)
	script "Default shell is $(basename $SHELL)"
	read -p "Change default shell to ${bold}${green}zsh${reset} ? [y/n] " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		chsh -s `which zsh`
	fi
esac