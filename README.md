```bash
sh -c "`curl -fsSL https://raw.githubusercontent.com/titepweb/nmdf/master/bin/nmdf`"
```
bash_prompt meanings:
```
+	Uncommitted changes in the index
!	Unstaged changes
?	Untracked files
$	Stashed files
```
Reference
=========
Tutorials : [1] [2] [3] [4] [5]
#### using GNU Stow + plugins are installed as submodules [git] or subrepositories [Mercurial]
advantages : (1) avoid external dependencies in favor of a simpler, self-contained setup  
or ...  [dfm], [dotbot], [dots] , [deedot] , [dotfiles manager]...
```bash
git submodule add {http://github.com...} {plugin name}
git submodule update --init --recursive
git submodule update --init --remote
```
#### Using [vcsh] for fake local git repo + [mr] for a fake multi-repo git 
related : [multigit] , [homesick] ,  ... 
G!: vsch mr dotfiles --->> [easy guide][6] [7] [8]

### Customize individual files
####[bash-sh-zsh]:
![left-to-right priority](http://blog.flowblok.id.au/static/images/shell-startup-actual.png)
1-mutt, Irssi
2-awesome
3-vim
4-oh-my-god szh
5-ncpccpp and mpd setting

### forks 
[nicknisi](https://github.com/nicknisi/dotfiles)

***************************************************
####**PROBLEM**
The question : How to escape form tedious administrative tasks of configuration file management?
The answer :  Automate it.
consolidate tailed dotfiles for our taste over year 
The aspects involved in are how to 
 1. distributable to keep your configs synchronized between machines
 2. local customization with some minor differences between installations on multiple machines
 2. cross-platforms + fully backwards-compatible
 3. organized : 
the benefits of symbolically linking files (1) no possibility of accidentally deleting your configuration files. (2) no need to manage discrepancy between copies.
keep your dotfiles under version control using VCS like git, Mercurial (Hg), Bazaar, SVN, even rsync
nmdf =~ vsch + single-repo git (support clone/pull , commit, push for master branch only) 


***************************************************
[1]: https://dotfiles.github.io/
[2]: https://wiki.archlinux.org/index.php/Dotfiles

[6]: http://www.linuxjournal.com/content/manage-your-configs-vcsh?page=0,2
[7]: https://sumancluster.wordpress.com/2015/05/29/managing-dotfiles-using-vcsh-and-mr/
[8]: http://www.martin-burger.net/blog/unix-shell/manage-dotfiles-quickly-and-effortlessly/

[dfm]: https://github.com/justone/dfm/blob/master/dfm
[git]:
[Mercurial]: 
[Dotbot]: http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
[dots]: https://github.com/EvanPurkhiser/dots
[deedot]: https://github.com/DeeNewcum/deedot
[dotfiles manager]: https://github.com/tmathmeyer/dotfilesmanager

[vcsh]:
[mr]: 

[homesick]: https://github.com/technicalpickles/homesick
[bash-sh-zsh]:http://blog.flowblok.id.au/2013-02/shell-startup-scripts.html



***********************************************************************************
##@TODO:

