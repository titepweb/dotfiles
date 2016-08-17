#!/bin/sh
#/home/march/PROJECT/dotfiles/dotfiles.tmux # However, this script will be properly run wherever you put it in.
#created at Tue Feb  9 20:57:31 ICT 2016
#USAGE : [Run in terminal], even from file browser, to open tmux with vim inside.
#        Some split windows will works in specific directories as pre-scripted.
#        The rest will inherit the working directories from which it is called.
PROJECT_NAME=$(basename "${0%.tmux}")    # /!\ tmux session name must be UNIQUE
PROJECT_NAME="${PROJECT_NAME//[,. ]/}"   # remove all occurances of space and period

# retrieve absolute path of /home/march/PROJECT/dotfiles/temp
PROJECT_LOCATION="$( cd -P "$(dirname "$0" )" && pwd )"
PROJECT_TMUX="$PROJECT_LOCATION/$(basename "$0")"
# move to project directory, which needed for NERDTree, CtrlP, etc. to perform sanely
cd "$PROJECT_LOCATION"
# cd to git root directory if available
type git >/dev/null 2>&1 && [[ -n $(git rev-parse --show-toplevel) ]] && {
	PROJECT_LOCATION=$(git rev-parse --show-toplevel)
	cd "$PROJECT_LOCATION"
}
type hg >/dev/null 2>&1
if [[ "$?" == 0 ]] && [[ -n $(hg root) ]]; then
	PROJECT_LOCATION=$(hg root)
	cd "$PROJECT_LOCATION"
fi

# Once inside a tmux session, `tmux send-keys` must be used instead of direct shell commands.

# check if tmux session named $PROJECT_NAME exist
tmux has-session -t $PROJECT_NAME 2>/dev/null
[ "$?" != 1 ] && tmux attach-session -t $PROJECT_NAME && exit

tmux -2 new-session -d -s $PROJECT_NAME

# Setup a window for developing
tmux new-window -a -t $PROJECT_NAME:1 -n "vim"   # -a to avoid error msg : "Tmux create window failed: index in use: 0"
tmux send-keys "\$EDITOR "$PROJECT_TMUX"" C-m
tmux split-window -v -p 20  # [---]
tmux split-window -h -p 50  # [ | ]
tmux select-pane -t 1       # [x| ] Whenever set up a new tmux split window, let it at the end.

# Setup a window for ...
tmux new-window -a -t $PROJECT_NAME:2 -n 'pasta'
tmux split-window -h        # [ | ]
tmux send-keys "net || ping -c 3 google.com" C-m    # net is just a alias
tmux select-pane -t 1       # [x| ]
tmux send-keys "ls && cal" C-m
tmux split-window -v        # [---]
tmux resize-pane -D 20
tmux select-pane -t 1       # [x| ] Whenever set up a new tmux split window, let it at the end.

# Setup a window for SSH
# tmux new-window -n 'SSH' 'ssh abcabc@192.168.1.33 -p 2236'

# Return to the window 1, pane 1
tmux select-window -t $PROJECT_NAME:1
tmux select-pane -t 1

# create a new tmux window with 'tmux new-windows -a ...' always keep 'zsh' window...
# we can rename the 'zsh' window and have some fun with it.
# @FIXME: the `if command` doesn't work properly when I double-click the script.
# so let it be a unexpected feature: =))
# 1. run this script from terminal to open the project and dotifles project
# 2. run this script by double click it to open the project only.
if [[ $EDITOR =~ ^(vim|nvim|macvim|gvim)$ ]]; then
	tmux rename-window "dotfiles"  # [-1-]
	if [ -n $DOTFILES ]; then
		tmux send-keys "cd $DOTFILES && ls" C-m
		tmux send-keys '$EDITOR -c ":e $DOTFILES/zsh/.config/nvim/init.vim.symlink" -c ":set syntax=vim"' C-m
	else
		tmux send-keys "\$EDITOR -c ':e \$MYVIMRC' -c ':set syntax=vim'" C-m
	fi
else
	tmux kill-window #-t 3
	tmux last-window      # Return to the last tmux window
fi

# Attach to session
tmux -2 attach-session -t $PROJECT_NAME
HIGHLIGHTS BY 0