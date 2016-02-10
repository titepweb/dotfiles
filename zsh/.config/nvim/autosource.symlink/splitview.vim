" purpose : effortless splits

" KEY BINDING "
" noremap <silent> <C-h> :call WinMove('h')<cr>
" noremap <silent> <C-j> :call WinMove('j')<cr>
" noremap <silent> <C-k> :call WinMove('k')<cr>
" noremap <silent> <C-l> :call WinMove('l')<cr>

" when using WinMove with keybings, the following options is not needed, so,
" please turn it off:
"set splitbelow         "horizontally open new panes to bottom
"set splitright         "vertically open new panes to right

" Window movement shortcuts "
" move to the window in the direction shown, or create a new window "
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
