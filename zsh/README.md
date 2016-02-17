You can easily find useful articles on the internet, but what you have read and were interested in are most important. I keep mine here.

### UNDERSTANDING .*rc files
![ looking-for-configuration-file order : left-to-right ](http://blog.flowblok.id.au/static/images/shell-startup-actual.png)

Gtk2 Theme 	:	~/.gtkrc-2.0	http://samuelhewitt.com/paper/theme
Gtk3 Theme	:	~/.config/gtk-3.0/setting.ini


Inpirated by
============
1. [nicknisi's vim+tmux](https://www.youtube.com/watch?v=5r6yzFEXajQ): [His website](http://nicknisi.com) and [dotfiles](https://github.com/nicknisi/dotfiles)
2. [Damian Conway's speech](https://www.youtube.com/results?search_query=Damian+Conway) and [his vim scripts](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup)

MORE READING
============
1. [From Sublime to Vim](http://blog.kewah.com/2014/from-sublime-text-to-vim/)
2. [Shu Uesugi's .vimrc](http://chibicode.com/vimrc/)
3. [Why Neovim is Better than Vim](http://geoff.greer.fm/2015/01/15/why-neovim-is-better-than-vim/)
4. [thoughtbot](https://robots.thoughtbot.com/tags/vim)


COLORSCHEME + FONTS +
=========================
Tools :
+ For Vim/Zsh: [base16-shell](https://github.com/morhetz/gruvbox) , [gruvbox](https://github.com/morhetz/gruvbox) ,
+ For Vim: [Vim colorscheme](https://github.com/flazz/vim-colorschemes/tree/master/colors)
+ [or create your own](http://ciembor.github.io/4bit) with assistance of:
	+ [convert hex-rgb](http://www.zonums.com/online/color_converter]
	+ [convert colorschemes](http://stayradiated.github.io/termcolors-web)
	+ [vivify for vim](http://bytefluent.com/vivify/)

ZSH
===
**Prompt**
+ auto-collapses $HOME to ~
+ incorporates git information : untracked files (denoted by .), modified files (denoted by #), or staged files (denoted by +) + a marker for how far ahead and/or behind we are from the remote branch
+ detects if it’s being viewed through SSH

TMUX
====
- [tmux cheatsheet](http://hyperpolyglot.org/multiplexers)
- []

VIM
===
- [How I boosted my Vim](http://nvie.com/posts/how-i-boosted-my-vim/) and [his
  really good vimrc](https://github.com/nvie/vimrc/blob/master/vimrc)
- [greduan's vimrc](https://github.com/greduan/dotfiles)
- [wnodom's vimrc](https://github.com/wnodom/)
- [blaenk's vimrc](https://github.com/blaenk)


### EXTENSIONS = PLUGINS = BUNDLES = VUNDLES
+ Toggle Comment : commentary
+ FuzzyFinder    : CtrlP Commander-T [fzf] FuzzyFinder
+ File Brower    : [NERDTree]
+ [airline] , powerline, Lightline
+ gundo
+ status line    : lightline Unite
+ sidebar        : Tag list, Voom, Tagbar,
+ ahw/vim-hooks

FZF
===
**:Commits**
[!:Commits](http://tilvim.com/img/fzfcommits.gif)
**fzf-complete-line**
[! imap <c-x><c-l> <plug>(fzf-complete-line) ](http://tilvim.com/img/fzflinewise.gif)



MY DISCOVERY
============
+ mapping: `help map-modes` will show you (n)ormal only , (v)isual and select , (o)perator-pending , x: visual only , (s)elect only , (i)nsert , (c)ommand-line , l: insert, command-line, regexp-search ...
	- map  --> nvo
	- map! --> ic
	- nmap --> normal only, vmap, ...
	- *noremap = non-recursive
+ Keybinding Confliction ? Termite --> Tmux --> zsh/neovim ?


##### Have you ever heard of...
[spf13-vim](https://github.com/spf13/spf13-vim),


[fzf]: https://github.com/junegunn/fzf
