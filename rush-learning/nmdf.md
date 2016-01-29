# nm's dotfiles

> KISS design principle: "Keep it simple, stupid" --> avoid unnecessary complexity
> "Perfection is Achieved Not When There Is Nothing More to Add, But When There Is Nothing Left to Take Away"
	paraphrase : "Perfection is when whatever you add or remove, you worsen the result. This was discovered during renaissance.""

## using git to pull/push dotfiles
create an ssh key : https://github.com/settings/ssh
Step1--- On machine A,B ---
1. prequisite: git
   # pacman -S git
2a.initialize git repository
   $ cd ~/ && mkdir ~/dotfiles
   $ git nitit
2b.
   $ git clone https://github.com/minhpara/dotfiles.git ~/dotfiles
3.create symbolic link with dotm
   $ sh ~/dotfiles/bin/dotm
   manually create symlink: symlink ln -svf <source> <symlink_name>
Step2--- Modify dot files on machine A, then push changes to git repository ---
   $ git config user.email "minhpara@gmail.com"
   $ git config user.name "minhpara"
   $ git add {folder(s)/file(s)} 			--> add file(s) to tracked list (called 'staging')
   $ git status
   $ git commit -am 'your comment here' 	--> ~ nop bai kiem tra
   $ git push origin master
	--> type your username:password
   One line:
   $ git add . && git commit -m "Auto commit dot files" && git push origin master -f

Step3--- Pull changes (updates) to machine B
   $ git pull origin master

NOTE: git --version --> 2.7.0 --> 
 $ git add .   :
 $ git add -u  : 
 $ git add -A  :

NOTE: Configure ~/gitconfig --> https://git-scm.com/docs/git-config

## Manage plugins as git submodule


## UNDERSTANDING DOTFILES = CONFIGURATION FILES

### What are performed when I....
CPU > kernel > Shell (bash zsh csh tcsh) > User(s)
Bash's startup procedure under various conditions:
*log in in text mode (startx) ==> ~/.xinitrc
startx --> xorg-xinit does:
	1/ start X server 	/etc/X11/xinit/xserverrc
	2/ run some script 	/etc/X11/xinit/xinitrc
	3/ Run ~/.xinitrc, if it exists. If not, run a default client (traditionally xterm).
*log in in DM mode (xdm, gdm, kdm, wdm, lightdm, …) ==> ~/.xsession
	1/
	2/
	3/ DM give you a choice of session --> specific DE, session manager, WM
	4/ Run ~/.xsession = ~/.profile + ~/.xinitrc
	   If you do not create ~/.xsession, then ~/.xinitrc will be used.
* Make sure ~/.xsession and ~/.xinitrc is executable: $ chmod a+x ~/.xsession
* Others:
.xsessionrc	= standard session 
.Xsession	= custom session
.Xresources	= use dm


.bash_profile & .bashrc
-----------------------
.bash_profile and .bashrc run each time you open a new Terminal session
A common practice is to `source ~/.bashrc` in ~/.bash_profile, so that ~/.bashrc gets executed in login shells as well (not only in non-login shells) and redundant code in both files can be avoided.
.bash_profile = 
	+ .path		: speeds up the process of running scripts by omit "cd" command
		export PATH="$HOME/dotfiles/bin:$PATH"
	+ .bash_prompt	: terminal colours
	+ .exports	: Sets environment variables, such as setting Vim as the default editor using :
		export EDITOR="vim"
	+ .aliases
		alias pac="sudo pacman -S" 
	+ .functions	: Similar to aliases, except functions can take arguments.
		# Create a new directory and enter it
		function mkd() {
		    mkdir -p "$@" && cd "$@"
		}

.Xdefaults and .Xresource
-------------------------
ref: http://superuser.com/questions/243914/xresources-or-xdefaults
.Xresources is the newer version of .Xdefaults. They do the same things (storing X resources), so:
	ln -s .Xresources .Xdefaults
app refter to .Xdefaults: urxvt
ref: https://wiki.archlinux.org/index.php/X_resources

git
---
	+ .gitconfig
		set s to status -s		--> git s = git status -s
	+ .gitignore

shell --> why use zsh ?
=======================
read a file of text, determine the n most frequently used words, and print out a sorted list of those words along with their frequencies
	--> tr -cs A-Za-z '\n' | tr A-Z a-z | sort | uniq -c | sort -rn | sed ${1}q
	1977 : Bourne shell 		sh
	1978 : C shell 			tcsh 
	1983 : Korn shell 		pdksh
	1989 : Bourne Again shell 	bash 
	1990 : Z shell 			zsh
zsh is better than bash:
	01-cd completion, git completion 	--> # pacman -S bash-completion, cd /u/l/b
	02-cd /usr/local/bin	--> Whoops, --> % cd bin share
	03-PS1 (left prompt) (+) RPS1 (right prompt)
	04-spelling corretion
	05-alias: 
		alias ls='ls --color=auto'
	  (+)	alias -g gp='| grep -i' 	% ps ax gp ruby 	==> ps ax | grep -i ruby
	  (+)	alias -s rb=vim 		% user.rb 		==> vim user.rb
	06-extended globbed search: 		**/ 	= 	recursive	
	07-env variable editing: 			% vared PATH 
	08-programmable file rename:		zmv '(*).txt' 'new_prefix_$1.html'
	09-cycle through command history		ps {press down n times}
	10-syntax highlighting (green = valid, red = invalid)

.zshenv, .zprofile, .zshrc, .zlogin
-------------------------------------



Other stuffs -------------------------------------
GTK theme settings: (lxappearance)
Gtk2 Theme 	:	~/.gtkrc-2.0	http://samuelhewitt.com/paper/theme
Gtk3 Theme	:	~/.config/gtk-3.0/setting.ini
Vertex Dark
