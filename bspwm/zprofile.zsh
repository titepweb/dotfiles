export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.config

export HACHIMAN="30:85:A9:9A:C7:A2"

# enable ribbon in libreoffice
export LO_USE_NOTEBOOKBAR=1

export NNTPSERVER='snews://news.eternal-september.org:563'
export EDITOR=nvim
export BROWSER=elinks


# export english/us/utf8 as language env variable
export LANG=en_US.UTF-8

# lemonbar
export PANEL_FIFO=/tmp/panel.fifo
[[ -d "$HOME/.dotfiles/bspwm/lemonbar" ]] && PATH="$HOME/.dotfiles/bspwm/lemonbar:$PATH"
[[ -d "$HOME/.dotfiles/bspwm/dzen2" ]] && PATH="$HOME/.dotfiles/bspwm/dzen2:$PATH"

# automatically start x server on same tty used for login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
