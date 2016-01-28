XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME

# export english/us/utf8 as language env variable
export LANG=en_US.UTF-8

# lemonbar
[[ -d "$HOME/.dotfiles/bspwm/lemonbar" ]] && PATH="$HOME/.dotfiles/bspwm/lemonbar:$PATH"
[[ -d "$HOME/.dotfiles/bspwm/dzen2" ]] && PATH="$HOME/.dotfiles/bspwm/dzen2:$PATH"

# automatically start x server on same tty used for login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
