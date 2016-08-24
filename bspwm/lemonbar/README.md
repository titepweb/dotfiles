### Proper configuration for panel
You need
  ```bash
  export PANEL_FIFO=/tmp/panel-fifo
  ```
in your xinitrc (1),
  ```bash
  [ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
  mkfifo "$PANEL_FIFO"
  ```
and
  ```bash
  bspc subscribe > "$PANEL_FIFO" &
  ```
in your panel script.

### REFERENCE
[bspwm gruvbox on reddit](https://www.reddit.com/r/unixporn/comments/3ngwcg/bspwm_gruvbox/) and
[inject3d's config](https://github.com/inject3d/dotfiles/blob/master/bin/panel)

[dagnachewa's config](https://github.com/dagnachewa/dotfiles/blob/master/bspwm/panel/panel)