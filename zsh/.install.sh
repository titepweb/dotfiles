#!/bin/sh
# PURPOSE : install packages for the combo : zsh + tmux + vim + base-16 colorscheme
# status : nearly finished. last edit on 2016-02-05
# dependancy : this script is designed to be sourced by $DOTREPO/install.sh

######### REQUIRED PACKAGES #########

cat << EOF
┌─────────────────────────────────────────────────────────────────────────────┐
│ INSTALLING REQUIRED PACKAGES for the combo ZSH + NEOVIM + TMUX + base16     │
│ base16-shell ┌──zsh     + zplug               + fzf                         │
│ colorscheme  └──neovim  + vim-plug + xclip    + fzf.vim  + tagbar/ctags     │
│ + xmodmap       ---------------------------                                 │
│                 tmux    + Tmux Plugin Manager + fzf-tmux                    │
└─────────────────────────────────────────────────────────────────────────────┘
EOF

install zsh
#=[ zplug ]====================================#
# curl -sL zplug.sh/installer | zsh

install xclip
install neovim
install tmux

install xorg-xmodmap    # for mapping Capslock --> Escape --> easily switch to NORMAL mode (Vim)
# install xkeycaps       # for keycode --> configure .Xmodmap

# CtrlP, fzf can used with Ag/ag:
install the_silver_searcher     # ag - code-searching tool similar to ack, but faster.

install ctags           # for tagbar (vim plugin)
                        # ctags/etags vs cscope : which is the best ?
#=[ fzf ]======================================#
# fzf.vim is managed by vim-plug.
# fzf can be installed by vim-plug. Nhung ko the chay tu dong ~/.fzf/install sau do
if [ ! -d "$HOME/.fzf/.git" ]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
	OK "Downloaded ${bold}${green}fzf${reset} for zsh."
else
	OK "✔ ${bold}${green}fzf${reset} has been installed."
fi

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
│ - Manually run curl -sL zplug.sh/installer | zsh for zplug                  │
│ - Manually run :PlugInstall for neovim (and then :PlugClean if needed)      │
│   NOTE: remove directories in '~/.config/nvim/plugged/' if failure.         │
│ - Fetch tmux plugins by manually running 'prefix + I' inside tmux           │
│ - Manually run chsh -s `which zsh` to change default shell to zsh           │
└─────────────────────────────────────────────────────────────────────────────┘
"

# change defaull shell <--- !IMPORTANT
case $SHELL in
*/zsh)
	OK "✔ ${bold}${green}zsh${reset} has been default shell."
	;;
*/bash)
	INFO "Changing default shell to ${bold}${green}zsh${reset}..."
	# chsh -s `which zsh`
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
