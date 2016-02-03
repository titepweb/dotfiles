#!/bin/bash
inform () {
	local reset='\e[0m'     ;   	local bold='\e[1m'		;			 local blue='\e[34m'
  echo -e "\r  [${bold}${blue}SCRIPT${reset}] $1" 
}

#=[ functions ]================================#

function installed(){
	x=`pacman -Q $1 >/dev/null`
	if (pacman -Q $1 >/dev/null)
		then return 0 #Installed
		else return 1 #Not Installed
	fi
}

function install(){
	if installed $1
		then inform "Installed $1"
		else
			inform "Installing $1"
			sudo pacman -S --noconfirm $1
	fi
}

#=[ main ]=====================================#

inform ">> Installing required packages..."
installpkg
source install.sh
inform ">> Completed!"

exit 0
# cli tools
install ack
install tree
install wget

# # development server setup
# install nginx
# install dnsmasq

# bspwm working environment
install zsh
install git
install bspwm sxhkd
install termite
install rxvt-unicode
install rofi
install dzen2
install pcmanfm
install feh
install neovim
install tmux
install mousepad
install ranger w3m
install mpd mpc ncmpcpp

# optional packages
install htop



# change defaull shell
case $SHELL in
*/zsh)
	inform "Ok! zsh is default shell."
	;;
*/bash)
	inform "Changing default shell to zsh..."
	chsh -s `which zsh`
	;;
*)
	inform "Default shell is $(basename $SHELL)"
	read -p "Change default shell to zsh ? [y/n] " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		chsh -s `which zsh`
	fi
esac

inform "Please install these packages from AUR : lemonbar-xft-git sublime-text-dev"

# # development tools
# install hub
# install highlight
# install nvm
# install z
# install markdown

# install macvim --override-system-vim
# install reattach-to-user-namespace

exit 0

