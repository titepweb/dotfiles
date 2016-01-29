### Proper configuration for panel
You need
```bash
export PANEL_FIFO=/tmp/panel-fifo
```
in your xinitrc,
```bash
[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"
```
and
```bash
bspc control --subscribe > "$PANEL_FIFO" &
```
in your panel script.