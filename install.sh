#!/bin/bash
# PURPOSE : 1. scan for $DOTFILES/topic/.install.sh and source them to install packages and configure them.
#           2. source $DOTFILES/link to create symlink or copy dotfiles to ~

# Identify ABSOLUTE path of directory storing the script. Scripts sourced by this script will inherit DOTFILES variable.
if [ -L $DOTFILES ] || [ -z $DOTFILES ]; then
  DOTFILES="$( cd -P "$( dirname "$0" )" && pwd )"
fi
source $DOTFILES/install/inform
#=[ functions ]================================#

installed () {
  if [ "$(uname)" == "Darwin" ]; then
    echo "@FIXME"
  elif [[ "$(uname)"=="Linux" ]]; then
    x=`pacman -Q -q $1 >/dev/null`
    if (pacman -Q $1 >/dev/null)
      then return 0 #Installed
      else return 1 #Not Installed
    fi
  fi
}

install () {
  local distro ; local pgkmanager
  # 1 -- detect distro and package manager
  case `uname` in
    Linux)
      distro=$(cat /etc/issue | head -n +1 | awk '{print $1}')
      case $distro in
        Arch) [[ $(which pacman) ]] && pgkmanager="sudo pacman -S --noconfirm" || FAIL "pacman is not installed." ;;
        *) FAIL "This script was tested on $distro."
      esac
    ;;
    Darwin)
      if test ! $(which brew); then
        INFO "✱ Installing ${cyan}$Homebrew{reset}..."
        echo -----------------------------------
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        echo -----------------------------------
      fi
      pgkmanager="brew install"
    ;;
    *) FAIL "This script unsupports `uname`."
    ;;
  esac

  # 2 -- Install
  for pkg in $* ; do
    if installed $pkg
      then OK "✔ ${green}$pkg${reset} has been installed."
      else
        INFO "✱ Installing ${cyan}$pkg${reset}"
        echo -----------------------------------
        $pgkmanager $pkg
        echo -----------------------------------
    fi
  done
}

#=[ MAIN ]=====================================#

displayTitle "INSTALL NECCESSARY PACKAGES"
# Source functions above only and Prevent to be accidently run with a parameter
if [[ $1 != "true" ]]; then
  return || FAIL "Please run $(basename $0) with 'true' parameter"
fi

# Look for .install.sh files and source them
topics="$(/usr/bin/find "$DOTFILES" -mindepth 1 -maxdepth 1 -type d -not -name '\.*' -not -name '*.ignore' )"
while IFS=$'\n' read -r topic; do
  [[ -z "$topic" ]] && continue
  SCAN "-Topic- $topic"

  for file in $(find "$topic" -type f -name .install.sh \
                -not -path "*/*\.ingore/*" \
                -not -path "*/*\.80%/*" \
              ); do
    INFO "Source ${cyan}$file${reset}"
    source "$file"
  done
done <<< "$topics"

# Source $DOTFILES/link
source $DOTFILES/install/link
  INSTALL_DOTFILES

echo
echo "$message"

exit 0
