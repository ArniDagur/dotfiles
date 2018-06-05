" -- The basics --

	syntax on " Turn syntax highlighting on
	filetype plugin on
	set autoindent " Copy previous indentation when making new line
	set tabstop=4 " Tab character width
	set encoding=utf-8
	set guifont=Source\ Code\ Pro\ 11 " Font for GUI version

	" Enable autocompletion:
	set wildmode=longest,list,full
	set wildmenu

" -- Keybindings --
	
	" map equals nmap, xmap, smap, and omap
	" Basic arrow keys
	noremap u k
	noremap <M-u> O
	noremap a h
	noremap <M-a> i
	noremap e j
	noremap <M-e> o
	noremap o l
	noremap <M-o> a
	" F, B keys
	noremap f b
	noremap F ^
	noremap <C-f> B
	noremap <M-f> I
	noremap b w
	noremap B $
	noremap <C-b> W
	noremap <M-b> A
	" High, Mid, Low keys
	noremap y <nop>
	noremap Y <nop>
	noremap <M-y> H
	noremap i <nop>
	noremap I N " Might need to rethink
	noremap <M-i> M
	noremap k y
	noremap K y$
	noremap <M-k>L

	noremap h e
	noremap H n " Might need to rethink
	noremap <C-h> E

	" Find
	noremap n f
	noremap N F

	" Undo
	noremap w u
	noremap W U

	" Unmap misc unused keys
	noremap j <nop>
	noremap l <nop>
	noremap L <nop>
