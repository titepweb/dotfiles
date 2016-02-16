" vim:fdm=marker

" Vundle {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'chriskempson/base16-vim'
Bundle 'coot/cmdalias_vim'
Bundle 'gmarik/vundle'
Bundle 'jiangmiao/auto-pairs'
Bundle 'JulesWang/css.vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'kana/vim-textobj-indent'
Bundle 'kana/vim-textobj-line'
Bundle 'kana/vim-textobj-user'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'matze/vim-move'
Bundle 'mbbill/undotree'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sheerun/vim-polyglot'
Bundle 'szw/vim-ctrlspace'
Bundle 't9md/vim-choosewin'
Bundle 'terryma/vim-expand-region'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'thinca/vim-visualstar'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'wesQ3/vim-windowswap'
Bundle 'zhaocai/GoldenView.Vim'

" https://github.com/chibicode/dwm.vim/commits/master?author=chibicode
Bundle 'chibicode/dwm.vim'
" https://github.com/chibicode/CRDispatcher/commits/master?author=chibicode
Bundle 'chibicode/CRDispatcher'
" }}}
" Base Config {{{
filetype plugin indent on
set background=dark
colorscheme base16-flat
syntax on
let mapleader = ","
runtime macros/matchit.vim
set autoindent
set autoread
set backspace=indent,eol,start
set binary
set cmdheight=2
set complete-=i
set completeopt=menuone,preview
set equalalways
set expandtab
set fillchars+=stl:\ ,stlnc:\
set foldmethod=indent
set foldnestmax=3
set hidden
set history=10000
set ignorecase
set incsearch
set hlsearch
set infercase
set laststatus=2
set lazyredraw
set nobackup
set nofoldenable
set noswapfile
set nowritebackup
set number
set numberwidth=4
set ruler
set scrolloff=3
set shell=/usr/local/bin/zsh
set shiftwidth=2
set shortmess=atI
set showcmd
set showmatch
set showtabline=2
set sidescroll=1
set sidescrolloff=15
set smartcase
set softtabstop=2
set splitright
set synmaxcol=1000
set t_Co=16
set t_ti= t_te=
set tabstop=2
set textwidth=0
set title
set ttyfast
set undodir='/tmp'
set undofile
set visualbell
set whichwrap=b,s,h,l,<,>,[,],~
set wildignore=.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.swf,*.egg,*.jar,*.dump,*.gem
set wildmenu
set wildmode=longest,list
set wrap linebreak textwidth=0
" }}}
" Fix Paste {{{
" I haven't found how to hide this function (yet)
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()
" }}}

" Autocmd: Basic {{{
augroup vimrcEx
  " Remove all previously defined autocmds
  au!

  " Automatically create parent directory on save if directory doesn't exist
  au BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif

  " Move to the last edited location
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Fugitive - remove when done
  au BufReadPost fugitive://* set bufhidden=delete

  " Force syntax highlighting for bufdo
  au BufWinEnter * nested if exists('syntax_on') && ! exists('b:current_syntax') && ! empty(&l:filetype) | syntax enable | endif
  au BufRead * if exists('syntax_on') && exists('b:current_syntax') && ! empty(&l:filetype) && index(split(&eventignore, ','), 'Syntax') != -1 | unlet! b:current_syntax | endif

  " Resize splits when the window is resized
  au VimResized * exe "normal! \<c-w>="
  au BufNewFile * set noeol

  " Track Quickfix Window
  au BufWinEnter quickfix call GetQuickFixBufferNumber()
  au BufWinLeave * call CheckIsQuickfixWindowClosing()
" }}}
" Autocmd: Files {{{
  au BufWinEnter,BufRead,BufNewFile Gemfile set ft=ruby
  au BufWinEnter,BufRead,BufNewFile Rakefile set ft=ruby
  au BufWinEnter,BufRead,BufNewFile Guardfile set ft=ruby
  au BufWinEnter,BufRead,BufNewFile Thorfile set ft=ruby
  au BufWinEnter,BufRead,BufNewFile Gruntfile set ft=javascript
  au BufWinEnter,BufRead,BufNewFile *.fdoc set ft=yaml
  au BufWinEnter,BufRead,BufNewFile *.md set ft=markdown
  au BufWinEnter,BufRead,BufNewFile *.slim set ft=slim

  " Automatically reload vimrc when it's saved
  au BufWritePost .vimrc source ~/.vimrc|set fdm=marker|AirlineRefresh
  au FileType vim set fdm=marker
  au SourceCmd .vimrc set fdm=marker|AirlineRefresh

  au FileType slim set commentstring=/\ %s

  if did_filetype()
    finish
  endif
  if getline(1) =~# '^#!.*/bin/env\s\+node\>'
    setfiletype javascript
  endif
  if getline(1) =~# '^#!.*/bin/env\s\+ruby\>'
    setfiletype ruby
  endif
" }}}
" Autocmd: Plugin Bookmarks (Command Aliases) {{{
  au VimEnter * CmdAlias ea EasyAlign
  au VimEnter * CmdAlias ut UndotreeToggle
  "au VimEnter * CmdAlias vs call\ GoldenView#Split()
  au VimEnter * CmdAlias tr StripWhitespace
  au VimEnter * CmdAlias nt NERDTree
  au VimEnter * CmdAlias --Plugins-- ---------------------
  au VimEnter * CmdAlias d Dispatch
  au VimEnter * CmdAlias dl RSpecLine
  au VimEnter * CmdAlias df RSpecFile
  au VimEnter * CmdAlias --Testing-- ---------------------
  au VimEnter * CmdAlias ch e\ cheat.md
  au VimEnter * CmdAlias vi tabedit\ ~/.vimrc
  au VimEnter * CmdAlias so source\ ~/.vimrc
  au VimEnter * CmdAlias vip tabedit\ .vimrc-private
  au VimEnter * CmdAlias sop source\ .vimrc-private
  au VimEnter * CmdAlias tm tabedit\ ~/.tmux.conf
  au VimEnter * CmdAlias zs tabedit\ ~/.zshrc
  au VimEnter * CmdAlias ---Files--- ---------------------
  au VimEnter * CmdAlias j join
  au VimEnter * CmdAlias r reg\ 123456789 1
  au VimEnter * CmdAlias be bufdo\ e!
  au VimEnter * CmdAlias ---Basic--- ---------------------
  au VimEnter * CmdAlias a CmdAlias!
  au VimEnter * CmdAlias q exec\ DWM_Close()
augroup END
" }}}
" Autocmd: ListToggle {{{
command! QToggle call QListToggle()

function! QListToggle()
  if exists("t:quickfix_buffer_number")
    silent! cclose
  else
    silent! botright copen 10
  endif
endfunction

function CheckIsQuickfixWindowClosing()
  if exists("t:quickfix_buffer_number") &&
        \ expand("<abuf>") == t:quickfix_buffer_number
    unlet! t:quickfix_buffer_number
  endif
endfunction

function GetQuickFixBufferNumber()
  let t:quickfix_buffer_number = bufnr('$')
endfunction
" }}}

" Plugin: Vim-Skip {{{
let g:vimskip_disable_default_maps=1
let g:vimskip_mapforwardskip='f'
let g:vimskip_mapbackwardskip='F'
" }}}
" Plugin: Choosewin
nmap S <Plug>(choosewin)
let g:choosewin_overlay_enable=1
let g:choosewin_overlay_clear_multibyte=1
" }}}
" Plugin: DWM {{{
let g:dwm_map_keys=0
let g:dwm_master_pane_width="50%"
nnoremap <c-b> :call DWM_Rotate(0)<CR>
nnoremap <c-f> :call DWM_Rotate(1)<CR>
nnoremap <c-n> :NERDTreeClose<cr>:cclose<cr>:call DWM_New()<CR>
nnoremap F :call WindowSwap#MarkWindowSwap()<CR>:wincmd h<cr>:call WindowSwap#DoWindowSwap()<CR>
nnoremap Q :NERDTreeClose<cr>:cclose<cr>:exec DWM_Close()<CR>
" }}}
" Plugin: Better Whitespace {{{
hi link ExtraWhitespace Error
" }}}
" Plugin: GitGutter {{{
let g:gitgutter_enabled = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_map_keys = 0
" }}}
" Plugin: Airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme="base16"
" }}}
" Plugin: CtrlSpace {{{
let g:ctrlspace_default_mapping_key="<tab>"
let g:airline_exclude_preview = 1
let g:ctrlspace_show_unnamed=0
let g:ctrlspace_show_key_info=1
let g:ctrlspace_load_last_workspace_on_start=1
let g:ctrlspace_save_workspace_on_exit=1
hi link CtrlSpaceSelected Visual
hi link CtrlSpaceNormal Normal
hi link CtrlSpaceFound Search
" }}}
" Plugin: Expand Region {{{
call expand_region#custom_text_objects({
      \ 'ii' :0,
      \ 'ai' :0,
      \ })
call expand_region#custom_text_objects('ruby', {
      \ 'ib' :0,
      \ 'ab' :0,
      \ 'im' :0,
      \ 'am' :0,
      \ })
" }}}
" Plugin: Easymotion {{{
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
let g:EasyMotion_use_upper = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
map  f <Plug>(easymotion-s2)
xmap f <Plug>(easymotion-s2)
omap f <Plug>(easymotion-t2)
map J <Plug>(easymotion-j)
map K <Plug>(easymotion-k)
hi link EasyMotionTarget Todo
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First Todo
hi link EasyMotionTarget2Second Todo
hi link EasyMotionIncSearch IncSearch
hi link EasyMotionIncCursor Search
" }}}
" Plugin: CtrlP {{{
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_switch_buffer = 'e'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:40,results:40'
let g:ctrlp_map = ''
let g:ctrlp_prompt_mappings = {
\ 'ToggleType(1)':        [''],
\ 'ToggleType(-1)':       [''],
\ 'PrtExit()':            ['<esc>', '<c-c>'],
\ 'AcceptSelection("h")': ['<H>'],
\ 'AcceptSelection("v")': ['<V>'],
\ 'PrtBS()':              ['<c-h>', '<bs>'],
\ 'PrtCurLeft()':         ['<c-b>'],
\ 'PrtCurRight()':        ['<c-f>'],
\ 'PrtClearCache()':      [','],
\ 'PrtExpandDir()':       [''],
\ 'PrtInsert("c")':       ['<c-p>'],
\ }
" }}}
" Plugin: Golden View {{{
let g:goldenview__enable_default_mapping = 0
let g:goldenview__enable_at_startup = 0
" 'e' for expand
nnoremap R :GoldenViewResize<cr>
" }}}
" Plugin: MultiCursor {{{
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='D'
let g:multi_cursor_prev_key='<c-p>'
let g:multi_cursor_skip_key='<c-x>'
let g:multi_cursor_quit_key='<c-c>'
" }}}
" Plugin: NerdTree {{{
let g:NERDTreeChDirMode=2
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeMinimalUI = 1
noremap <space> :NERDTreeToggle<CR>
noremap <leader>. :NERDTreeFind<CR>
" }}}
" Plugin: YouCompleteMe {{{
let g:ycm_key_detailed_diagnostics = ''
let g:ycm_key_invoke_completion = ''
let g:ycm_complete_in_strings=0
" }}}
" Plugin: WindowSwap {{{
let g:windowswap_map_keys = 0
nnoremap mw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap mW :call WindowSwap#DoWindowSwap()<CR>
" }}}
" Plugin: Surround {{{
vmap s S
" Key: "-"
let g:surround_45 = "<% \r %>"
" Key: "="
let g:surround_61 = "<%= \r %>"
" Key: "``"
let g:surround_33 = "```\r```"
" }}}
" Plugin: Markdown {{{
let g:markdown_fenced_languages = ['ruby', 'erb=eruby', 'js=javascript', 'coffee']
" }}}
" Plugin: Move {{{
let g:move_map_keys = 0
vmap <c-j> <Plug>MoveBlockDown
vmap <c-k> <Plug>MoveBlockUp
" }}}

" Mappings: Escape {{{
vnoremap <c-@> <esc>
inoremap <c-@> <esc>
nnoremap <c-@> :noh<cr>
vnoremap <c-space> <esc>
inoremap <c-space> <esc>
nnoremap <c-space> :noh<cr>
" }}}
" Mappings: Regular Chars {{{
noremap ; :
noremap 0 g^
noremap ^ g0
noremap $ g$
noremap j gj
noremap k gk

nnoremap x "_x
nnoremap s :w<cr>
" R => Resize, Q => Close, D => MultiCursor
nnoremap C :QToggle<cr>
nnoremap <leader>q :qall!

" Select last paste
noremap gv `[v`]

" Use 'n'noremap to avoid conflict w/ surround
vnoremap < <gv
vnoremap > >gv

" Expand current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
" }}}
" Mappings: Control Keys {{{
" Clipboard
vnoremap <c-y> "+y
noremap <c-p> "+p
set pastetoggle=<F10>
inoremap <c-p> <F10><C-r>+<F10>

" Insert mode
inoremap <c-h> <bs>
inoremap <c-l> =>

" Command mode
cnoremap <c-p> <c-r>+
cnoremap <c-v> <c-r>"
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-j> <t_kd>
cnoremap <c-k> <t_ku>

" Window navigation
" Use DWM
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-w>3 :vs<cr>:vs<cr>
nnoremap <c-w>4 :vs<cr>:sp<cr><c-w>h:sp<cr>
nnoremap <c-w>6 :vs<cr>:vs<cr>:sp<cr><c-w>h:sp<cr><c-w>h:sp<cr>
" }}}

" Postprocess: Load Private File {{{
noh
if filereadable(".vimrc-private")
source .vimrc-private
endif
" }}}