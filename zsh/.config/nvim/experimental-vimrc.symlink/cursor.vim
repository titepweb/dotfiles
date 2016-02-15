" Cursor & mouse {{{

"set scrolloff=999  " Keep the cursor in the middle of the window
set scrolloff=10    " How near the cursor can get to the top/bottom of window
set sidescrolloff=4 " Same as above, but for side scrolling
set sidescroll=1    " Minimal columns to scroll horizontally
set virtualedit=all " Allow the cursor to go to invalid places
set mousehide       " Hide the mouse pointer while typing
set mouse=          " Disable use of mouse

" guicursor {{{

if has('gui_running')
	" Normal, visual and command-line normal (append) mode
	set guicursor=n-v-c:block-Cursor-blinkon0
	" Visual mode with 'selection' "exclusive" (same as 'v', if not specified)
	set guicursor+=ve:ver35-Cursor
	" Operator-pending mode
	set guicursor+=o:hor50-Cursor-blinkwait175-blinkoff150-blinkon175
	" Insert and command-line insert mode
	set guicursor+=i-ci:ver20-Cursor
	" Replace and command-line replace mode
	set guicursor+=r-cr:hor20-Cursor
	" Showmatch in insert mode
	set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
endif

" }}}