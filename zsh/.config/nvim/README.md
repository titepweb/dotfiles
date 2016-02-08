## HOW TO MANAGE IDEAS AND THEIR SOURCE CODES

I use files to manage dotfiles, and even script/vim... plugins. "Files and Directory Hierachy" idea is really awsome! Thanks to `bash completion`, zsh's built-in completion feature, and especially `fuzzy finders` like fzf, the complexity of the management method is no longer a problem. Take a look at : [fzf](https://github.com/junegunn/fzf) with its 1. executable script, 2. fzf-tmux, 3. shell extension for bash, zsh, fish, 4. vim plugin .

**Manage vimscript by sourcing *.vim files**

In vim plugin files, please use *.vim extension to make sure that vim can recognize the syntax when open that file. Another way that could make vim script name short is to put this line inside:

```set syntax=vim```

The directory named experimental-vimrc includes many ideas and vimscript codes. You can try it without worrying mess up your vimrc:

```vim -u <path/to/vimrc> ```

When satistied with a vimscript, you may want to source it in your vimrc. Just move that file to source.symlink directory. Errors could happen because of merging keybindings and some sensitive settings. To show errors in current .vimrc, run 

``` :messages ```
