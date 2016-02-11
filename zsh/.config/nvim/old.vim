call plug#begin('~/.config/nvim/plugged')

" colorscheme ----------------------------------
Plug 'chriskempson/base16-vim'              " preview : http://chriskempson.github.io/base16/
" utilities ------------------------------------
Plug 'itchyny/lightline.vim'                " statusline
"Plug 'vim-airline/vim-airline'              " status line for Git
Plug 'ctrlpvim/ctrlp.vim'                   " fuzzy search (of course, C-p)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree'                  " file browser (remap to <leader>-k)
Plug 'jeffkreeftmeijer/vim-numbertoggle'    " smart relative numbering (default: C-n)
Plug 'benmills/vimux'                           " interact with tmux to run commands
Plug 'tpope/vim-commentary'

Plug 'tpope/vim-fugitive'
Plug 'jszakmeister/vim-togglecursor'
" language-specific plugins --------------------

call plug#end()
" ====================== SOURCE PERSONAL CONFIG ======================
function! Source(vimfile)
	let src=a:vimfile
	if filereadable(glob(src))
		exec ':source' . src
	endif
endfunction

"automatically sources all file in autosource
for fpath in split(globpath('~/.config/nvim/autosource/', '*.vim'), '\n')
	:call Source(fpath)
endfor
" ========================= GENERAL SETTINGS =========================
set nocompatible " no backward-compatibl

" OS Specific -----------
" Windows: {{{2
if has('win32')
	set gfn=Consolas:h10
	set clipboard=unnamed
" }}}
else
" UNIX: {{{2
	let s:kernel = system('echo -n "$(uname -s)"')
	if s:kernel == 'Darwin'
		set gfn=Menlo:h12
		" this doesn't work in mountain lion's default vim (does on macvim)
		set clipboard=unnamed
	elseif s:kernel == 'Linux'
		set guifont=Monospace:h12
		set clipboard=unnamedplus " copy/paste between gui/cli --> require xclip/xsel
	endif
endif
" }}}

" set a map leader for more key combos
let mapleader = ' '
let g:mapleader = ' '

" LINE NUMBER -----------
set number
"set relativenumber     " disable to use vim-numbertoggle for automation
"set numberwidth=3

" SPLIT -----------------> splitview.vim
noremap <silent> <C-h> :call WinMove('h')<cr>
noremap <silent> <C-j> :call WinMove('j')<cr>
noremap <silent> <C-k> :call WinMove('k')<cr>
noremap <silent> <C-l> :call WinMove('l')<cr>
" Column scroll-binding on <leader>sb
noremap <silent> <leader>sb :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

" TABSTOP ---------------

" WRAP and INDENT -------
set wrap "turn on line wrapping
"set wrapmargin=8 " wrap lines when coming within n characters from side
"set linebreak " set soft wrapping
"set showbreak=… " show ellipsis at breaking

"set autoindent " automatically set indent of new line
"set smartindent

" TAB -------------------


" toggle invisible characters
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪
noremap <leader>l :set list!<cr>

" Textmate style indentation
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

" Shortcuts -------------
    cmap cwd lcd %:p:h " Change Working Directory to that of the current file

" Code folding -----------
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" ==================== FILE TYPE-SPECIFIC SETTINGS ===================

" ========================== USER INTERFACE ==========================
set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"

execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME


" ========================= BACKUPS and UNDO =========================
" turn off swap files
set noswapfile
set nobackup
set nowb

" Keep undo history across sessions, by storing in file.
if has('persistent_undo') && !isdirectory(expand('~').'/.nvim-tmp/backups')
  silent !mkdir ~/.nvim-tmp/backups > /dev/null 2>&1
  set undodir=~/.nvim-tmp/backups
  set undofile
endif

"set nobackup
"set nowritebackup
"set noswapfile
"set backupdir=~/.nvim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set directory=~/.nvim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" =========================== STATUS LINE ============================

" ========================= LINES & CURSORS ==========================
set showmode
set gcr=a:block

" mode aware cursors
set gcr+=o:hor50-Cursor
set gcr+=n:Cursor
set gcr+=i-ci-sm:InsertCursor
set gcr+=r-cr:ReplaceCursor-hor20
set gcr+=c:CommandCursor
set gcr+=v-ve:VisualCursor

set gcr+=a:blinkon0

hi InsertCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=37  guibg=#2aa198
hi VisualCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=125 guibg=#d33682
hi ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65  guibg=#dc322f
hi CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#cb4b16

augroup cursorline
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

"                              MAPPINGS
" ====================================================================
" quickly tap jj to quit insert mode
inoremap jk <Esc>
" save a lot of unneeded shifting
noremap ; :
noremap : ;
" Quickly edit/reload the vimrc file (manually/automatically)
nnoremap <silent> <leader>ev :tabnew<CR>:e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
autocmd BufLeave $MYVIMRC :source $MYVIMRC

" Force myself to learn hjkl
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"                             FUNCTIONS
" ====================================================================

"                            PLUGIN SETTINGS
" ====================================================================
" airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_section=''
let g:airline_detect_paste=1 " Show PASTE if in paste mode
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"}}} ------------------------------------------------------

" NERDTree {{{
let g:NERDTreeQuitOnOpen=1          " close NERDTree after a file is opened
let NERDTreeShowHidden=1            " show hidden files in NERDTree
let NERDTreeIgnore = ['\.js.map$']  " remove some files by extension
noremap <silent> <leader>k :NERDTreeToggle<cr> 
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
"}}} ------------------------------------------------------

" CtrlP {{{
let g:ctrlp_dotfiles = 1                " enable search for dotfiles
"}}} ------------------------------------------------------

"}}} ------------------------------------------------------


"                                  MISC
" ====================================================================
" Abbreviations --> autocorrect
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
