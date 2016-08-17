# Deletes all bindings.
# bindkey -d
# List keymaps.
# bindkey -l
# List key bindings with as you would set up them using bindkey (the command).
# bindkey -L
# List bindings in keymap menuselect.
# bindkey -M menuselect
# About widgets: http://sgeb.io/articles/zsh-zle-closer-look-custom-widgets/

# How to obtain key codes in zsh:
# Ctrl+X, followed by the key combination desired to bind prints the code to the console.
bindkey '^X'      quoted-insert        # Ctrl + X

bindkey '\eb'     kill-region          # ESC, b
bindkey '^E'      kill-whole-line      # Ctrl + E

bindkey '^C'      send-break           # Ctrl + C
bindkey '^Z'      undo                 # Ctrl + Z
bindkey '^Y'      redo                 # Ctrl + Y

bindkey '^R'      history-incremental-pattern-search-backward # Ctrl + R
bindkey '^H'      history-incremental-pattern-search-backward # Ctrl + H
bindkey '^J'      history-incremental-pattern-search-forward  # Ctrl + J

bindkey '^[[5~'   up-line-or-history   # Shift + up arrow
bindkey '^[[6~'   down-line-or-history # Shift + down arrow
bindkey '^[[A'    up-line-or-history   # Up arrow
bindkey '^[[B'    down-line-or-history # Down arrow

# Make search up and down work, so partially type and hit Shift + up/down to find relevant stuff.
bindkey '\e[1;2A' up-line-or-search    # Shift + Up arrow
bindkey '\e[1;2B' down-line-or-search  # Shift + Down arrow

zmodload -i zsh/terminfo
[[ -n "$terminfo[khome]" ]] && bindkey $terminfo[khome] beginning-of-line # Home
[[ -n "$terminfo[kend]" ]]  && bindkey $terminfo[kend]  end-of-line       # End
[[ -n "$terminfo[kdch1]" ]] && bindkey $terminfo[kdch1] delete-char       # Del
bindkey '^[[1;5D' backward-word        # Ctrl + left arrow
bindkey '^[[1;5C' forward-word         # Ctrl + right arrow
bindkey '^_'      backward-delete-word # Ctrl + Backspace
bindkey '^[[3;5~' delete-word          # Ctrl + Del
bindkey '^[[3;2~' delete-word          # Shift + Del

# I can type multiline command lines, and still be able to move the cursor up/down between the lines while editing.
# bindkey '^J'      self-insert          # Ctrl + J, Home and End for moving to the beginning and end.

bindkey '^D'      copy-prev-shell-word # Ctrl + D

autoload -Uz paste-from-clipboard
zle -N paste-from-clipboard
bindkey '^V'      paste-from-clipboard # Ctrl + V

bindkey '\e.'     insert-last-word     # ESC, .
# Copy the word before the one just copied by insert-last-word.
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey '\em'     copy-earlier-word    # ESC, m

zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey '\e1'     insert-last-command-output # ESC, 1
