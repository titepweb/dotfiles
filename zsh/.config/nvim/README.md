## GUIDE

I use files to manage dotfiles, and even script/vim... plugin. "Files and Directory Hierachy" idea really awsome!

In vim plugin files, please use *.vim extension to make sure that vim can recognize the syntax when open that file. Another way that could make vim script name short is to put this line inside:

```set syntax=vim```

The directory named experimental-vimrc includes many ideas and vimscript codes. You can try it without worrying mess up your vimrc:
```vim
vim -u <path/to/vimrc>
```
When satistied with a vimscript, you may want to source it in your vimrc. Just move that file to source.symlink directory. Errors could happen because of merging keybindings and some sensitive settings. To show errors in current .vimrc, run 

```:messages```
