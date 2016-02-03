#!/bin/bash

reset='\e[0m'     ;   bold='\e[1m'				
black='\e[30m'    ;   red='\e[31m'        ;   green='\e[32m'       ;   yellow='\e[33m'      ;
blue='\e[34m'     ;   magenta='\e[35m'    ;   cyan='\e[36m'        ;   white='\e[37m'       ;
xterm='\e[38'     ;   default='\e[39m'    ;

#=[ functions ]================================#

scan () {
  echo -e "\r  [${bold}${magenta} SCAN ${reset}] ${magenta}$1${reset}" 
}
info () {
  echo -e "\r  [${bold}${cyan} INFO ${reset}] $1" 
}
user () {
  echo -e "\r  [ ${bold}${yellow} ?? ${reset} ] $1"
}
OK () {
  echo -e "\r  [${bold}${green}  OK  ${reset}] $1" 
}
fail () {
  printf "\r  [${bold}${red} FAIL ${reset}] $1\n"
  exit 1
}

warning () {
  message=$message"$1"
}

#=[ functions ]================================#

installed(){
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

install(){
  local command
  # 1 -- detect package manager
  if [ "$(uname)" == "Darwin" ]; then
    if test ! $(which brew); then
      info "✱ Installing ${cyan}$Homebrew{reset}..."
      echo -----------------------------------
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      echo -----------------------------------
    fi
    command="brew install"
  elif [[ "$(uname)"=="Linux" ]]; then
    # cat /etc/issue
    command="sudo pacman -S --noconfirm"
  fi
  # 2 -- Install
  for pkg in $* ; do
    if installed $pkg
      then OK "✔ ${green}$pkg${reset} has been installed."
      else
        info "✱ Installing ${cyan}$pkg${reset}"
        echo -----------------------------------
        $command $pkg
        echo -----------------------------------
    fi
  done
}

#=[ main ]=====================================#

# Prevent running accidently with a parameter
INSTALLOPTION=$1
if [[ $INSTALLOPTION != "true" ]]; then
  fail "Please run $(basename $0) with 'true' parameter"
fi

# Look for .install.sh files and source them
dotDir="$( cd -P "$( dirname "$0" )" && pwd )"
topics="$(/usr/bin/find "$dotDir" -mindepth 1 -maxdepth 1 -type d -not -name '\.*' -not -name '*.ignore' )"
while IFS=$'\n' read -r topic; do
  [[ -z "$topic" ]] && continue
  scan "-Topic- $topic"

  for file in $(find "$topic" -type f -name .install.sh \
                -not -path "*/*\.ingore/*" \
                -not -path "*/*\.80%/*" \
              ); do
    info "Source ${cyan}$file${reset}"
    source "$file"
  done
done <<< "$topics"
echo
echo "$message"

exit 0
