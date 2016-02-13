" from : http://inlehmansterms.net/2014/09/04/sane-vim-working-directories/
" purpose : set working directory to git prject root if any or directory of
" current file
" follow symlinked file
function! FollowSymlink()
	" use absolute path
	let current_file = expand('%:p')
	" if it is a symlink resolve to the actual file path and open the actual file
	if getftype(current_file) == 'link'
		let actual_file = resolve(current_file)
		silent! execute 'file ' . actual_file
	end
endfunction


function! StrTrim(txt) " {{{
	" Trim a string by removing starting and trailing whitespaces
	return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction
" }}}

function! GetRepoRoot() " {{{
	" Use caching
	if exists('b:repoRoot')
		return b:repoRoot
	endif

	let workingDir = expand('%:p:h')

	" Check if git
	let gitRoot = system('cd '.workingDir.' && type git >/dev/null 2>&1 && git rev-parse --show-toplevel')
	if gitRoot !~ '^fatal'
		let b:repoRoot = StrTrim(gitRoot)
		return b:repoRoot
	endif

	" Check if Mercurial
	let hgRoot = system('cd '.workingDir.' && type hg >/dev/null 2>&1 && hg root')
	if hgRoot !~ '^abort'
		let b:repoRoot = StrTrim(hgRoot)
		return b:repoRoot
	endif

	let b:repoRoot = workingDir
	return b:repoRoot
endfunction
" }}}

function! SetProjectRoot()
	" if help file, don't do any thing
	if &buftype=='help'
		return
	endif
	" 1 - set working directory to git project root 
	lcd %:p:h " default to the current file's directory
	" 2 - source file-specific vimrc
	let localvimrc=expand('%:p:r').".vimrc"
	:call Source(localvimrc)
	" 3 - source the directory-specific vimrc
	" Search from the directory the file is located upwards to the root for
	" a local configuration file called .localvimrc and sources it.
	let dirname = expand('%:p:h')
	while "/" != dirname
		let basename = fnamemodify(dirname, ':t')
		let lvimrc   = dirname . "/" . basename . ".vimrc"
		:call Source(lvimrc)
		let dirname = fnamemodify(dirname, ":p:h:h")
	endwhile

	let git_dir = GetRepoRoot()
	if !empty(git_dir)
		" 1 - or directory of current file if not git project
		lcd `=git_dir`

		" 2 - Source project-specific vimrc (located at the root of projects)
		let basename=fnamemodify(git_dir, ':t')
		let lvimrc  =git_dir . "/" . basename . ".vimrc"
		:call Source(lvimrc)
	endif
endfunction

"nnoremap <silent> <leader>g :call SetProjectRoot()<cr>

" follow symlink and set working directory
"autocmd BufRead * silent!
autocmd BufRead,BufNewFile *
	\ call FollowSymlink() |
	\ call SetProjectRoot()


" The only caveat with this approach is that we will need to use w! instead of just w to save the file for the first time. One extra keystroke is a worthwhile trade off to me. Otherwise I would have to use the file explorer or netrw to find the actual file, which would take much longer.

"set verbose=9           "for debug: echo the autocommand events 

" The only autocommand that seemed to get called in netrw is the CursorMoved event. Therefore we can hook into this to enable our working directory to remain up to date even in netrw. If anyone knows of another autocommand that netrw listens to, I would love to know!

" netrw: follow symlink and set working directory
autocmd CursorMoved * silent!
  " short circuit for non-netrw files
	\ if &filetype == 'netrw' |
	\   call FollowSymlink() |
	\   call SetProjectRoot() |
	\ endif

