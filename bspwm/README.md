REFERENCE FOR CONFIGURING BSPWM
===============================
1. [bspwm for dummies](https://github.com/windelicato/dotfiles/wiki/bspwm-for-dummies)
2. [tutorial at manjaro forum](https://forum.manjaro.org/index.php?topic=18970.0)
3. [Bleeding edge bspwm](http://yuri-rage.github.io/geekery/2015/01/26/bleeding-edge-bspwm/)
4. [Steven Hum's colophon](http://thedarnedestthing.com/bspwm) 
  - [his dotfiles](https://github.com/sdothum/dotfiles)

### FORKS
1. [benjcalderon's work](https://www.reddit.com/r/unixporn/comments/3cdhz0/bspwm_after_4_months_with_bspwm_i_finally_made_my/)  based on [inject3d](https://www.reddit.com/r/unixporn/comments/3ngwcg/bspwm_gruvbox/) : benjalderon's words: "Thanks, the panel is derived from this If you use that, be sure to adjust the sleep statements (especially for the alsa volume script) or it'll maul your battery life." benj also recommend [prezto](https://github.com/sorin-ionescu/prezto) over oh-my-zsh because it is "(1) very fast and (2) you know what's under the hood (read init files in ~/.zpresto/modules)." 
2. [dagnachewa](https://www.reddit.com/search?q=dagnachewa+bspwm) and [his dotfiles](https://github.com/dagnachewa/dotfiles)
3. [pinusc](https://github.com/pinusc/dotfiles)
4. [neeasade's script for dzen2](https://github.com/neeasade/dotfiles)
5. [skinldsv](https://github.com/skjnldsv/dotfiles)

Ideas from [windelicato](https://github.com/windelicato/dotfiles) [hamsterslayer](https://github.com/hamsterslayer/dotfiles) [ninetyfourbit](https://github.com/ninetyfourbit/dotfiles) [cozmoss](https://www.reddit.com/r/unixporn/comments/2ye35o/bspwm_sadboys/) [carlaco](https://github.com/calarco/dotfiles) [gamecheet's dzen scripts](https://github.com/gamecheet)

GENERAL
=======
1. [z3bra's customization guide](http://blog.z3bra.org/2013/10/home-sweet-home.html#term)
2. [Customize zsh prompt](http://www.nparikh.org/unix/prompt.php#zsh)

NMDF
====
0. [inspired by nicknisi](https://github.com/nicknisi/dotfiles). [His website](http://nicknisi.com/)
1. [brettbatie's dotm](https://github.com/brettbatie/dotfiles/blob/master/bin/dotm)
2. [agross's bootstrap](https://github.com/agross/dotfiles/blob/master/bootstrap) supports cross-platform bootstrapping.
  * Based on [Holman's bootstrap](https://github.com/holman/dotfiles/blob/master/script/bootstrap)
  * He also use [zplug](https://github.com/b4b4r07/zplug) to manage zsh pluggins.
  * His brilliant way to manage aliases.sh

(NEO)VIM as IDE vs SUBLIME
==========================
[From Sublime to Vim](http://blog.kewah.com/2014/from-sublime-text-to-vim/)
[Shu Uesugi's .vimrc](http://chibicode.com/vimrc/)
[Why Neovim is Better than Vim](http://geoff.greer.fm/2015/01/15/why-neovim-is-better-than-vim/)

==================================================================
## installed software
Not all of this is required for the configuration, it's just the list of software that I personally use and recommend.

### interface
+ **bspwm** _window manager_  chosen because it's easily configured and doesn't get in the way of productivity
+ **sxhxd** _hotkey daemon_  default for bspwm and I have no reason to change it
+ **rxvt-unicode-256xresources** _terminal emulator_  lightweight, extensible with perl
  + **urxvt-clipboard**  makes urxvt play nice with the x clipboard
  + **urxvt-resize-font**  enables on the fly font resizing.  very useful for small screens
  + **urxvt-vtwheel**  better scrolling support
+ **lemonbar-xft** _status bar_ easy to use panel with a tiny footprint, with xft patch
+ **feh** _image viewer and background setter_  it's simple and does everything you need
+ **unclutter-xfixes** _X cursor hider_  the cursor is useless for a keyboard driven config, so hide it
+ **redshift-minimal** _screen temperature daemon_  reduces eye strain in reduced light

### internet
+ **weechat** _irc client_  extensible irc client with great community support
+ **mutt** _mail client_  fast and well supported console email client
  + **msmtp**  _mtp client_  sends email
  + **offlineimap** _imap client_  syncs email
  + **elinks** _web browser_ formats html emails
+ **firefox** _web browser_  golden standard web browser
  + **vimperator**  browse with just your keyboard, adds a great status line / combobar
  + **greasemonkey**  userscript manager
    + **appchan x**  makes browsing halfchan somewhat pleasurable
	+ **viewtubeplus**  tries to force html5 on video sites
  + **stylish**  user styles manager
    + **twily's powerline firefox css**  makes the tab bar usable
  + **noscript**  block javascript from running automatically
  + **https everywhere**  force https where possible
  + **ublock origin**  ad and nuisance blocker
+ **w3m** _web browser_  console web browser, used for image previews in ranger
+ **rtorrent** _download manager_  trimmed down bittorrent client

### media
+ **mpd** _music player_  gold standard music player daemon
+ **ncmpcpp** _music player_  fast and configurable mpd client
+ **mpc** _music player_  minimal mpd client used by the panel script
+ **mpv** _video player_  do-it-all video player for streaming and playing local media

### office
+ **libreoffice** _office suite_  as good as it gets without running ms office in wine
+ **zathura** _document viewer_  lightweight extensible document viewer with a vim-like interface
  + **poppler** _pdf rendering lib_  much faster than mupdf
  + **zathura-cb** _comic book plugin_  for reading manga with zathura
+ **scrot** _screenshotter_  simple

### programming
+ **vim** _text editor_  the one true text editor
  + **vim-plug** _plugin manager_  lightweight and less finicky than other managers
  + **vim-airline** _status bar_  replaces the standard vim status bar with some useful eye candy
  + **vim-numbertoggle**  smart relative line-number toggling
  + **vim-gitgutter**  shows git diffs
  + **vim-trailing-whitespace**  highlights spaces where they shouldn't be
  + **auto-pairs**  spawns matched brackets / quotes
  + **nerdtree**  in-editor file browser
  + **gruvbox** _colour scheme_  low contrast colour scheme that's easy on the eyes

### utilities
+ **zsh** _shell_ very powerful shell that remains compatible with bash
+ **tmux** _terminal multiplexer_  will save your life when X11 quits working
+ **dmenu** _dynamic menu_ application launcher (will be replaced with rofi later)
+ **ranger** _file manager_  extensible file manager that can use w3m for image previews
+ **pacaur** _aur helper_  yaort is for losers
+ **htop** _task manager_  beautified and more useful top
+ **progress** tool to show the progress of coreutils basic commands
+ **tlp** _power management_  fire and forget power manager
+ **powertop** _power management_  great for identifying sources of energy waste

### fonts / themes
+ **infinality** _text rendering_  improves appearence of text
  + **infinality-bundle** _standard fonts_  basic fonts for apps that need it
  + **infinality-bundle-fonts** _more fonts_  fonts to play with
+ **source code pro for powerline** _monospace font_  primary font used in the system, extremely legible
+ **source code sans** _sans serif font_  font used for web browsing that retains the legibility of source code pro
+ **arc-darker** _gtk theme_  flat gtk theme with dark highlights
+ **paper** _icon theme_  flat and simple icon theme

### included scripts and tools
+ **aimee** streams some good music off of soundcloud
+ **testpl**  simple alias to check that a powerline patched font is set up and configured correctly
+ **classify**  classification banners using lemonbar
+ **rfetch**  system info tool with a weird octopus
+ **extract**  alias to extract most archives
+ **newmusic**  lists music added recently

## notes
many settings are optomised for power saving, the sleep timers on the panel script should be shortened for use on systems where responsiveness is valued over power consumption.

the panel design is evolving fairly rapidly, so updating will probably break your customisations.  i'm working through a few papers right now to try to design it as intuitive and useful as possible.  for reference:

1. Carroll, J.M., Mack, R.L., & Kellogg, W.A. Interface metaphors and user interface design. In M. Helander (Ed.), Handbook of Human-Computer Interaction, Elsevier Science Publishers B.V., 1988.
2. Erickson, T.D. Working with interface metaphors. In B. Laurel (Ed.), The Art of Human- Computer Interface Design, Addison-Wesley Publishing Co., Inc. 1990.
3. Gentner, D. Structure mapping: A theoretical framework for analogy. Cognitive Science, 7, 155-170.
4. Grudin, J. The case against user interface consistency. Communications of the ACM, vol. 32, number 10, 1164-1173, 1989.
5. Mountford, S.J. Tools and techniques for creative design. In B. Laurel (Ed.), The Art of Human-Computer Interface Design, Addison-Wesley Publishing Co., Inc. 1990.
6. Rideout, T., & Lundell, J. Hewlett Packard's Usability Engineering Program. In M. E. Wiklund (Ed.), Usability in Practice. AP Professional, 1994. 
