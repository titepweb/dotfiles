#!/bin/sh
# PURPOSE : install packages for the combo : zsh + tmux + vim + base-16 colorscheme
# status : nearly finished. last edit on 2016-02-05
# dependancy : this script is designed to be sourced by $DOTREPO/install.sh

######### REQUIRED PACKAGES #########

cat << EOF
┌─────────────────────────────────────────────────────────────────────────────┐
│ INSTALLING REQUIRED PACKAGES for the combo ZSH + NEOVIM + TMUX + base16     │
│ base16-shell ┌──zsh     + zplug                                             │
│ colorscheme  └──neovim  + vim-plug + xclip + xmodmap (Capslock --> Escape)  │
│ + a custom     ---------------------------                                  │
│ colorscheme     tmux    + Tmux Plugin Manager                               │
└─────────────────────────────────────────────────────────────────────────────┘
EOF

install zsh
install xclip
install neovim
install python2-neovim   # required for gundo
# CtrlP, fzf can used with Ag/ag:
install the_silver_searcher     # ag - code-searching tool similar to ack, but faster.
# tagbar require ctags:
install ctags           # ctags/etags vs cscope : which is the best ?

install tmux 
# map Capslock --> Escape (Vim)
install xorg-xmodmap
# install xkeycaps       # for keycode --> configure .Xmodmap

#=[ vim-plug ]=================================#
# better than vunddle , pretzo, or oh-my-zsh
if [[ ! -f ~/.config/nvim/autoload/plug.vim ]]; then
	INFO "Downloading ${bold}${cyan}vim-plug${reset} plugins manager for neovim."
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	OK "Downloaded ${bold}${green}vim-plug${reset} plugins manager for neovim."
else
	OK "✔ ${bold}${green}vim-plug${reset} has been installed."
fi
# @FIXME: nvim not quit after install
# nvim +PlugInstall
# @FIXME: not working
# nvim +PlugInstall +qall
# OK "Downloaded ${bold}${green}plugins${reset} for neovim."

#=[ base16-shell ]=============================#
THEMEDIR="$HOME/.config/base16-shell"
if [ ! -d "$THEMEDIR/.git" ]; then
	git clone -b master https://github.com/chriskempson/base16-shell "$THEMEDIR"
	OK "Downloaded ${bold}${green}base16-shell${reset} colorscheme for zsh."
else
	OK "✔ ${bold}${green}base16-shell${reset} has been installed."
fi

#=[ Tmux Plugin Manager ]======================#
TPMDIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPMDIR/.git" ]; then
	git clone -b master https://github.com/tmux-plugins/tpm "$TPMDIR"
	OK "Downloaded ${bold}${green}Tmux Plugin Manager${reset}."
else
	OK "✔ ${bold}${green}Tmux Plugin Manager${reset} has been installed."
fi

WARNING " >> warning from ${yellow}$BASH_SOURCE${reset} :
┌─────────────────────────────────────────────────────────────────────────────┐
│ CONFIGURATION                                                               │
│ - Manually run :PlugInstall for neovim (and then :PlugClean if needed)      │
│   NOTE: remove directories in '~/.config/nvim/plugged/' if failure.         │
│ - Fetch tmux plugins by manually running 'prefix + I' inside tmux           │
└─────────────────────────────────────────────────────────────────────────────┘
"

# change defaull shell <--- !IMPORTANT
case $SHELL in
*/zsh)
	OK "✔ ${bold}${green}zsh${reset} has been default shell."
	;;
*/bash)
	INFO "Changing default shell to ${bold}${green}zsh${reset}..."
	chsh -s `which zsh`
	;;
*)
	USER "Default shell is $(basename $SHELL)"
	read -p "Change default shell to ${bold}${green}zsh${reset} ? [y/n] " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		chsh -s `which zsh`
	fi
esac

return
