## HOW TO MANAGE IDEAS AND THEIR SOURCE CODES

I use files to manage dotfiles, and even script/vim... plugins. "Files and Directory Hierachy" idea is really awesome! 

**Manage vimscript by sourcing *.vim files**

In vim plugin files, please use *.vim extension to make sure that vim can recognize the syntax when open that file. Another way that could make vim script name short is to put this line inside:

``` set syntax=vim ```

The directory named experimental-vimrc includes many ideas and vimscript codes. You can try it without worrying mess up your vimrc:

``` vim -u <path/to/vimrc> ```

When satistied with a vimscript, you may want to source it in your vimrc. Just move that file to source.symlink directory. Errors could happen because of merging keybindings and some sensitive settings. To show errors in current .vimrc, run 

``` :messages ```

**Manage ideas and related bookmarks with markdown format and github.com**
I love markdown format. It's much more easy to write, add hyperlinks, images, source codes, tables, etc., thus I can focus on content insteading of formatting as in WYSIWYG editors and their complicated formats. Google and Microsoft have done their best to bring .docx files to cloud, but let avoid unnecessary complexity.

> KISS design principle: "Keep it simple, stupid" 

How beautifully markdown files can be expressed is due to your skill as well as the softwares used to read them. I just use `github.com/your_username/your_repo` .

Using markdown format, you can keep your documents lightweight and overuse git with git gutters to track changes. How amazing!

**But how about drawbacks of this management way itself?**

*Specifically, How to attain convenience when I access a file if it is deeply located?*

Thanks to `bash completion`, zsh's built-in completion feature, and especially `fuzzy finders` like fzf, the complexity of the management method is no longer a problem. Take a look at : [**fzf**](https://github.com/junegunn/fzf) with its 1. executable script, 2. fzf-tmux, 3. shell extension for bash, zsh, fish, 4. vim plugin .

Files to execute or to be sourced encounter no difficuties thanks to deeply scanning and sourcing agorithms. `zplug` offers deep scanning, and my `linkdf` script offers symlinking and copying. Both accepts exclude rules, so files in develop can be keep in special directories (marked by named: `<any_name>80%` or `<any_name>.ignore`). 

Using a same script named path.zsh everywhere I want to include in `$PATH`, I can run programs easily from any command line interfaces (CLI). Combinating with excluded directories, I can turn on and off executables files that belongs to the directory, which is designed to manage idea in `topics`, by simple change the directory name to `<origin_name>80%`. Because zplug just scan for `*.zsh` files, I can exclude a single `.zsh` file from find command by change its name to `<origin_name>.zsh_". How flexible! 
