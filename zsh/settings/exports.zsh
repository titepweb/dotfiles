# XDG standard for storing all dotfiles in a single place, without mixing with user's data
# From : https://lxl.io/xdg-config-hoe
# vim: ft=sh
export XDG_CONFIG_HOME DEFAULT=~/.config
export XDG_DATA_HOME   DEFAULT=~/.local/share
export XDG_CONFIG_DIRS DEFAULT=/etc/xdg
export XDG_DATA_DIRS   DEFAULT=/usr/local/share:/usr/share
export XDG_CACHE_HOME  DEFAULT=~/.cache
export XDG_STATE_HOME  DEFAULT=~/.xdg/state

# set defaut programs
export EDITOR=nvim
export BROWSER=firefox

# This variable determines the locale category for any category not specifically selected via a variable starting with `LC_'.
export LANG=en_US.UTF-8

# see "more" at the end of manpages
export PAGER=less

# format the result of ' | less' command
export LESS='--quit-at-eof --tabs=3 --LONG-PROMPT --quit-if-one-screen --RAW-CONTROL-CHARS --no-init'

# enable ribbon in libreoffice
export LO_USE_NOTEBOOKBAR=1
