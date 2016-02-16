"Plug 'sjl/gundo.vim'                " require to install python2-neovim (remap to <leader>-u)
    " settings for toggle gundo {{{
"    nnoremap <leader>u :GundoToggle<CR>
    " }}}


"Plug 'itchyny/lightline.vim'            " a lightweight customizable statusline
    " settings for lightline {{{
    let g:lightline = {
        \ 'colorscheme' : 'Tomorrow_Night_Eighties',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ]
        \ },
        \ 'component': {
        \   'fugitive': '%{exists("*fugitive#head") ? " ".fugitive#head() : ""}'
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'filename': 'MyFilename',
        \   'mode': 'MyMode',
        \   'ctrlpmark': 'CtrlPMark'
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
        \ }

    function! MyModified()
        if &filetype == "help"
            return ""
        elseif &modified
            return "¶"
        elseif &modifiable
            return ""
        else
            return ""
        endif
    endfunction

    function! MyReadonly()
        if &filetype == "help"
            return ""
        elseif &readonly
            return ""
        else
            return ""
        endif
    endfunction

    function! MyFilename()
            if expand('%:t') == 'ControlP'
                return g:lightline.ctrlp_item
        endif
        if expand('%:t') == '__Tagbar__'
            return g:lightline.fname
        endif
        if expand('%:t') =~ '__Gundo'
            return ''
        endif
        return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
    endfunction

    function! MyMode()
        let fname = expand('%:t')
        return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP':
                \ fname == '__Gundo__' ? 'Gundo' :
                \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ &ft == 'unite' ? 'Unite' :
                \ &ft == 'vimfiler' ? 'VimFiler' :
                \ &ft == 'vimshell' ? 'VimShell' :
                \ winwidth('.') > 60 ? lightline#mode() : ''
    endfunction

    function! CtrlPMark()
        return expand('%:t') =~ 'ControlP' ?
                \ g:lightline.ctrlp_prev . ' ' . g:lightline.subseparator.left . ' ' .
                \ g:lightline.ctrlp_item . ' ' . g:lightline.subseparator.left . ' ' .
                \ g:lightline.ctrlp_next . ' ' . g:lightline.subseparator.left . ' ' .
                \ g:lightline.ctrlp_marked : ''
    endfunction
    "}}}
