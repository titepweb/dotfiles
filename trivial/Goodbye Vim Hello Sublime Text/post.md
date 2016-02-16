After 3 years of using Vim, I decided to make a switch to Sublime Text 3.

For the past year or so, I've used the following editors:

- **Terminal Vim**: For editing code for work (mostly building a Rails app). Not using MacVim b/c I use tmux.
- **Sublime Text 3**: For editing blog posts and other one-off text files.
- **TextMate 2**: For finding-and-replacing on large projects. Much better at this than Vim/ST3.

From now on, I'll only be using ST3. Here are some reasons. TL;DR: Vim made me OCD about perfecting `.vimrc`, even though all I needed was an editor that's *good enough*.

- I'm probably much faster at manipulating text in Vim than in ST3, but I also waste a lot of time *re-configuring* vim. My `.vimrc` never feels right, and I'm OCD about making it marginally more robust after each tweak. I edit my `.vimrc` at least once a week, which is bad. I always feel like I can come up with a slightly better way to remap keys. You can combine keys in Vim, so `.vimrc`'s potential is unbounded. In contrast, ST3 is not as customizable, and hence there's an upper limit to the amount of configuration I'd do with ST3.
- In addition, every now and then, I discover a new Vim bundle, which I expect to make me far more efficient than those n00bs using ST3, but I get disappointed every time. 80% of my Vim productivity comes from 20% of the core keystrokes and tools I use, and they are often not the shiny new bundles.
- To make things worse, so many bundles seem to break randomly on terminal Vim, and it's usually impossible to debug. [GitGutter](https://github.com/airblade/vim-gitgutter) plugin had performance issues on terminal Vim, and I just couldn't fix it. Also, bundles often don't play nicely with each other. For example, [DWM.vim](https://github.com/spolu/dwm.vim) occasionally breaks [NERDTree](https://github.com/scrooloose/nerdtree), and [YankRing](https://github.com/vim-scripts/YankRing.vim) pretty much overwrites all of the basic mappings.
- **ST3, on the other hand, is slower at manipulating text but requires much less configuration**, at least for someone OCD like me. This is the biggest reason why I made the switch.
- I often do project-wide find-and-replace, and ST3 is much better at it than Vim is. Although TextMate 2 has a much nicer find-and-replace dialog, that's the only feature I'm using from TextMate 2, so I might as well use ST3 all the way.
- Many plugins have become compatible with ST3/Package Control—this wasn't the case a year ago.
- I hated ST3's vintage mode, mainly because I couldn't figure out how to remap keys or sync the settings with my `.vimrc`, but over the past year I got reasonably fast at ST3 without using the vintage mode. I was hoping for [actualvim](https://github.com/lunixbochs/actualvim) project to mature, but that didn't happen.

...Plus all the reasons outlined on: [Just Use Sublime Text](http://delvarworld.github.io/blog/2013/03/16/just-use-sublime-text/).

> Vim is a lifelong journey. Even now I want to convert this text, which I wrote in Vim at 80 columns wide, to non-fixed width text, and I’m going to go search for how to do it. I’m probably going to learn something in the process. At year 4 of Vimming.

For me, life is too short to want to touch `.vimrc` every week.

## My Final .vimrc on Gist

I've always feared that people would judge me as a non-serious programmer if I used ST3 instead of Vim or Emacs. I realized that I was wrong, but just as a record, I'll copy paste my no-longer-updated `.vimrc` here to demonstrate my current Vim knowledge (and OCD-ness).

See my .vimrc below...

## Plugins Used

* **[vim-gitgutter](http://github.com/airblade/vim-gitgutter)** — Git changes on the sign column.

    As mentioned before, it slowed down occasionally and I couldn't figure out why.

* **[vim-airline](http://github.com/bling/vim-airline)** — Nice statusbar for Git.

    Works well out of the box.

* **[base16-vim](http://github.com/chriskempson/base16-vim)** — The ultimate color scheme.

    Since its inception, lots of themes have been added. [Check them out here](http://chriskempson.github.io/base16/).

* **[cmdalias_vim](http://github.com/coot/cmdalias_vim)** — Create aliases for commands

    Useful for commands you don't use often.

* **[vundle](http://github.com/gmarik/vundle)** — Package manager for Vim plugins

* **[auto-pairs](http://github.com/jiangmiao/auto-pairs)** — Pair parentheses and other delimiters

* **[css.vim](http://github.com/JulesWang/css.vim)** — Better syntax highlighting for CSS

* **[vim-easy-align](http://github.com/junegunn/vim-easy-align)** — Align code blocks

    Switched from [Tabular](https://github.com/godlygeek/tabular), but forgot why I made the switch.

* **[vim-textobj-indent](http://github.com/kana/vim-textobj-indent)** — Useful with vim-extend-region.

* **[vim-textobj-line](http://github.com/kana/vim-textobj-line)** — Useful with vim-extend-region.

* **[vim-textobj-user](http://github.com/kana/vim-textobj-user)** — Useful with vim-extend-region.

* **[ctrlp.vim](http://github.com/kien/ctrlp.vim)** — The best fuzzy file finder out there.

* **[vim-easymotion](http://github.com/Lokaltog/vim-easymotion)** — Vim motions on speed

    Easymotion is now maintained by @haya14busa, and he's awesome. Lots of improvements in 2.0.

* **[vim-move](http://github.com/matze/vim-move)** — Move lines up and down.

* **[undotree](http://github.com/mbbill/undotree)** — Undo manager. I never used it though.

* **[vim-textobj-rubyblock](http://github.com/nelstrom/vim-textobj-rubyblock)** — Useful with vim-extend-region.

* **[vim-better-whitespace](http://github.com/ntpeters/vim-better-whitespace)** — Trims whitespaces.

* **[ag.vim](http://github.com/rking/ag.vim)** — Project-wide search using `ag`, a faster version of `ack`.

    I place `.vimrc-private` in each project directory and do something like this:

    ```
    " Search Ruby
    nnoremap <leader><leader>r :Ag <Space>-G="*.rb" <S-Left><Left>
    " Search JavaScripts
    nnoremap <leader><leader>j :Ag <Space>-G="*.(js\|coffee)" --ignore-dir=public<S-Left><S-Left><Left>
    " Search Stylesheets
    nnoremap <leader><leader>s :Ag <Space>-G="*.(css\|scss)" --ignore-dir=public<S-Left><S-Left><Left>
    " Search View Files
    nnoremap <leader><leader>v :Ag <Space>-G="*.(html.erb\|html.slim\|slim)" <S-Left><Left>
    ```

* **[nerdtree](http://github.com/scrooloose/nerdtree)** — Directory/File management

* **[syntastic](http://github.com/scrooloose/syntastic)** — Syntax checker

* **[vim-polyglot](http://github.com/sheerun/vim-polyglot)** — Syntax bundle

* **[dwm.vim](https://github.com/spolu/dwm.vim)** — Tiled Window Management for Vim

    My preferred way of window management, except it broke NERDTree and Quickfix too often.

* **[vim-ctrlspace](http://github.com/szw/vim-ctrlspace)** — The ultimate Vim buffer/session management.

    This is a new plugin and probably the most comprehensive buffer manager I've seen. Very high learning curve but recommended.

    <iframe width="1280" height="720" src="//www.youtube.com/embed/09l92uwKupI?rel=0" frameborder="0" allowfullscreen></iframe>

* **[vim-choosewin](http://github.com/t9md/vim-choosewin)** — Like easymotion, but for windows

    Useful when I'm working on a big screen

* **[vim-expand-region](http://github.com/terryma/vim-expand-region)** — Expand current selection

* **[vim-multiple-cursors](http://github.com/terryma/vim-multiple-cursors)** — Sublime-like multi-selection

    I use this feature a lot in Sublime, but not as often in Vim.

* **[vim-visualstar](http://github.com/thinca/vim-visualstar)** — Make `*` work in visual mode

* **[vim-commentary](http://github.com/tpope/vim-commentary)** — Fast comment blocks

    Switched from [NERDCommenter](https://github.com/scrooloose/nerdcommenter), but forgot why.

* **[vim-dispatch](http://github.com/tpope/vim-dispatch)** — Run tests from Vim

    Integrates well with tmux. Protip: use `execute 'Focus spring rspec %:' . expand(line('.'))` to tell rspec to test the current line, and then do `Dispatch`.

* **[vim-endwise](http://github.com/tpope/vim-endwise)** — Automatically `end` in Ruby

* **[vim-eunuch](http://github.com/tpope/vim-eunuch)** — Unix commands in Vim

* **[vim-fugitive](http://github.com/tpope/vim-fugitive)** — Git in Vim. I use `Gdiff` and `Gblame` the most.

* **[vim-git](http://github.com/tpope/vim-git)** — Support plugin for fugitive

* **[vim-repeat](http://github.com/tpope/vim-repeat)** — Repeat plugin commands

* **[vim-surround](http://github.com/tpope/vim-surround)** — Surrond code with delimiters

    Protip: for erb and markdown, use:

    ```
    let g:surround_45 = "<% \r %>"
    let g:surround_61 = "<%= \r %>"
    let g:surround_33 = "```\r```"
    ```

* **[vim-unimpaired](http://github.com/tpope/vim-unimpaired)** — A set of handy shortcuts

    I use `[q` and `q]` often.

* **[YouCompleteMe](http://github.com/Valloric/YouCompleteMe)** — The ultimate completion manager

* **[IndexedSearch](http://github.com/vim-scripts/IndexedSearch)** — Show the number of occurrences in a search

* **[vim-windowswap](http://github.com/wesQ3/vim-windowswap)** — Swap windows

* **[GoldenView.Vim](http://github.com/zhaocai/GoldenView.Vim)** — Temporarily resize windows

    The only feature I use is `GoldenViewResize`. I let DWM.vim handle everything else.

## Plugins I stopped using

These are all *great* plugins. I just wanted to keep my .vimrc minimal, harnessing as much default settings as possible.

* **[lightline.vim](https://github.com/itchyny/lightline.vim)** — A light and configurable statusline/tabline for Vim.

    *Why not?* I switched from [airline](https://github.com/bling/vim-airline) once, but didn't see much benefit, so I switched back.

* **[thumbnail.vim](https://github.com/itchyny/thumbnail.vim)** — A thumbnail-style buffer selector for Vim.

    *Why not?* Too overkill for me.

* **[tabman.vim](https://github.com/kien/tabman.vim)** — Tab management for Vim.

    *Why not?* Too overkill for me.

* **[vim-signature](https://github.com/kshenoy/vim-signature)** — Plugin to toggle, display and navigate marks.

    *Why not?* I don't use marks. They're a pain to keep track of, and I try to keep my files small.

* **[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)** — A Vim plugin for visually displaying indent levels in code.

    *Why not?* I use terminal vim, and didn't work so great in it.

* **[Delimitmate](https://github.com/Raimondi/delimitMate)** — Provides insert mode auto-completion for quotes, parens, brackets, etc.

    *Why not?* I liked [auto-pairs](https://github.com/jiangmiao/auto-pairs) better.

* **[dragvisuals](https://github.com/atweiden/vim-dragvisuals)** — Move around visual blocks.

    *Why not?* From [More Instantly Better Vim](https://www.youtube.com/watch?v=aHm36-na4-4). I use this feature a lot in Sublime Text, but not in Vim for some reason.

* **[clever-f.vim](https://github.com/rhysd/clever-f.vim)** — Extended f, F, t and T key mappings for Vim.

    *Why not?* Great plugin, but [Easymotion](https://github.com/Lokaltog/vim-easymotion) covers my needs.

* **[vim-skip](https://github.com/jayflo/vim-skip)** — Simple movement script for Vim.

    *Why not?* Great plugin, but [Easymotion](https://github.com/Lokaltog/vim-easymotion) covers my needs.

* **[vim-startify](https://github.com/mhinz/vim-startify)** — A fancy start screen for Vim.

    *Why not?* I stopped using sessions.

* **[vim-signify](https://github.com/mhinz/vim-signify)** — Show a VCS diff using Vim's sign column.

    *Why not?* I use [vim-gitgutter](https://github.com/airblade/vim-gitgutter) instead, but forgot why I made that choice.

* **[vim-unstack](https://github.com/mattboehm/vim-unstack)** — Vim plugin for parsing stack traces and opening the files

    *Why not?* Awesome plugin, but my stack traces have never been too complicated.

* **[vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)** — NERDTree and tabs together in Vim, painlessly

    *Why not?* Useful plugin if you use NERDTree heavily. I try to limit the usage of NERDTree, so wasn't too useful.

* **[dwm.vim](https://github.com/spolu/dwm.vim)** — Tiled Window Management for Vim

    *Why not?* Great plugin and used it for a really long time. I've since switched to [GoldenView.vim](https://github.com/zhaocai/GoldenView.Vim).

* **[vim-rspec](https://github.com/thoughtbot/vim-rspec)** — Run Rspec specs from Vim

    *Why not?* [dispatch.vim](https://github.com/tpope/vim-dispatch) did most of what I needed.

* **[splitjoin.vim](AndrewRadev/splitjoin.vim)** — A vim plugin that simplifies the transition between multiline and single-line code

    *Why not?* Seemed useful, but didn't use it enough.

* **[trailertrash.vim](https://github.com/csexton/trailertrash.vim)** — Identify and Irradicate unwanted whitespace at the end of the line

    *Why not?* Switched to [vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace).

* **[Buffet.vim](https://github.com/sandeepcr529/Buffet.vim)** — A vimplugin for switching and managing buffer lists

    *Why not?* Switched to [Vim-CtrlSpace](https://github.com/szw/vim-ctrlspace).

* **[open-browser.vim](https://github.com/tyru/open-browser.vim)** — Open URI with your favorite browser from your favorite editor

    *Why not?* Used this mainly for markdown files, but I now use Sublime Text for editing markdown.

* **[mru.vim](https://github.com/yegappan/mru)** — Most Recently Used (MRU) Vim Plugin

    *Why not?* Again, switched to [Vim-CtrlSpace](https://github.com/szw/vim-ctrlspace).

* **[wildfire.vim](https://github.com/gcmt/wildfire.vim)** — Smart selection of the closest text object

    *Why not?* Switched to [vim-expand-region](https://github.com/terryma/vim-expand-region) in favor of repeating capabilities.

* **[Gundo.vim](https://github.com/sjl/gundo.vim/)** — Vim plugin to visualize your Vim undo tree.

    *Why not?* Switched to [undotree](https://github.com/mbbill/undotree).

* **[rainbow_parentheses.vim](https://github.com/kien/rainbow_parentheses.vim)** — Color matching parentheses

    *Why not?* MatchPren was good enough for me.

* **[vim-yankstack](https://github.com/maxbrunsfeld/vim-yankstack)** — A lightweight implementation of emacs's kill-ring for vim

    *Why not?* I switched from [YankRing](https://github.com/vim-scripts/YankRing.vim), but ended up just using registers.

* **[Enchanted Vim](https://github.com/coot/EnchantedVim)** — Persistent Very Magic Patterns in Vim Commands.

    *Why not?* I didn't use very magic often.

* **Syntax Files**

    *Why not?* Switched to [vim-polygot](https://github.com/sheerun/vim-polyglot).

## Thank you Vim, Hello Sublime

Looking forward to writing production code in ST3. I might come back to vim when [neovim](https://github.com/neovim/neovim) becomes stable.

I might post my ST3 config later. If you're looking for a resource on getting started with ST3, check out [Sublime Productivity](https://leanpub.com/sublime-productivity). If you're a TL;DR'er, check out [Alex Maccaw's post](http://blog.alexmaccaw.com/sublime-text).

If you have questions, [message me on Twitter](http://twitter.com/chibicode).P