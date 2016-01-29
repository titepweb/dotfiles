# -----------------------------------------------
# Set up bspwm & lemonbar
# -----------------------------------------------

# fix bspwm for running eclipse and android studio (java not correctly detecting non-reparenting window managers)
export _JAVA_AWT_WM_NONREPARENTING=1

# lemonbar
export PANEL_FIFO=/tmp/panel.fifo
[[ -d "$HOME/.dotfiles/bspwm/lemonbar" ]] && PATH="$HOME/.dotfiles/bspwm/lemonbar:$PATH"
[[ -d "$HOME/.dotfiles/bspwm/dzen2" ]] && PATH="$HOME/.dotfiles/bspwm/dzen2:$PATH"

# automatically start x server on same tty used for login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
