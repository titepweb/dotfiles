#!/bin/sh
###############################################################################
# script  : $DOTREPO/bootstrap.sh   maintained by titepweb at gmail.com       #
# status  : stable. Last edit on 2016-02-05                                   #
# feature : 1. source/run $DOTREPO/install/installpkg with default parameters #
#           -->scan for $DOTREPO/topic/.install.sh and source them to install #
#              packages and configure them.                                   #
#           2. source/run $DOTREPO/install/linkdf with default parameters     #
#           -->source $DOTREPO/link to create symlink or copy dotfiles to ~   #
###############################################################################

# Identify ABSOLUTE path of directory storing the script. Scripts sourced by this script will inherit DOTREPO variable.
if [ -L $DOTREPO ] || [ -z $DOTREPO ]; then
  DOTREPO="$( cd -P "$( dirname "$0" )" && pwd )"
fi
source $DOTREPO/install/inform
source $DOTREPO/install/cross-platform
source $DOTREPO/install/installpkg
source $DOTREPO/install/linkdf

# Prevent to be accidently run/sourced with a parameter.
[[ $1 != "true" ]] && FAIL "Please run $(basename $0) with 'true' parameter"

#=[ functions ]===============================================================#

#=[ MAIN ]====================================================================#

# STEP 1 -- INSTALL PACKAGES
INSTALL_PACKAGES
# STEP 2 - CREATE SYMLINKS for *.symlink DOTFILES and COPY *.copy DOTFILES
INSTALL_DOTFILES
# STEP 3 -- DISPLAY WARNING MESSAGE
echo -e "\n$message"

exit 0
