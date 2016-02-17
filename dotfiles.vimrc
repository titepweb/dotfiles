noremap <leader>z :call VimuxRunCommand("ping -c 3 google.com")<cr>

" from : https://github.com/nvie/vimrc/blob/master/vimrc
" Quote words under cursor
nnoremap <leader>" viW<esc>a"<esc>gvo<esc>i"<esc>gvo<esc>3l
nnoremap <leader>' viW<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l
" Quote current selection
" TODO: This only works for selections that are created "forwardly"
vnoremap <leader>" <esc>a"<esc>gvo<esc>i"<esc>gvo<esc>ll
vnoremap <leader>' <esc>a'<esc>gvo<esc>i'<esc>gvo<esc>ll


" dupe stuff (sublime-like)
vmap <c-d> mby`bp`bgv
nmap <c-d> mpyyp`p
