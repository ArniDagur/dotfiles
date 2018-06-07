" -- The basics --

    syntax on " Turn syntax highlighting on
    filetype plugin indent on
    set autoindent " Copy previous indentation when making new line
    set tabstop=4 " Tab character width
    set encoding=utf-8
    set guifont=Source\ Code\ Pro\ 11 " Font for GUI version
	set number

    " Enable autocompletion:
    set wildmode=longest,list,full
    set wildmenu

" -- Keybindings --

    " map equals nmap, xmap, smap, and omap
    " Basic arrow keys
    nnoremap u k|xnoremap u k|onoremap u k
    nnoremap <M-u> O|xnoremap <M-u> O|onoremap <M-u> O
    nnoremap a h|xnoremap a h|onoremap a h
    nnoremap <M-a> i|xnoremap <M-a> i|onoremap <M-a> i
    nnoremap e j|xnoremap e j|onoremap e j
	nnoremap <M-e> o|xnoremap <M-e> o|onoremap <M-e> o
    nnoremap o l|xnoremap o l|onoremap o l
    nnoremap <M-o> a|xnoremap <M-o> a|onoremap <M-o> a
    " F, B keys
    nnoremap f b|xnoremap f b|onoremap f b
    nnoremap F ^|xnoremap F ^|onoremap F ^
    nnoremap <C-f> B|xnoremap <C-f> B|onoremap <C-f> B
    nnoremap <M-f> I|xnoremap <M-f> I|onoremap <M-f> I
    nnoremap b w|xnoremap b w|onoremap b w
    nnoremap B $|xnoremap B $|onoremap B $
    nnoremap <C-b> W|xnoremap <C-b> W|onoremap <C-b> W
    nnoremap <M-b> A|xnoremap <M-b> A|onoremap <M-b> A
    " High, Mid, Low keys
    noremap y <nop>
    noremap Y <nop>
    nnoremap <M-y> H|xnoremap <M-y> H|onoremap <M-y> H
    noremap i <nop>
    "noremap I N " Might need to rethink
    nnoremap <M-i> M|xnoremap <M-i> M|onoremap <M-i> M
    nnoremap k y|xnoremap k y|onoremap k y
    nnoremap K y$|xnoremap K y$|onoremap K y$
    nnoremap <M-k> L|xnoremap <M-k> L|onoremap <M-k> L

    nnoremap h e|xnoremap h e|onoremap h e
    "noremap H n " Might need to rethink
    nnoremap <C-h> E|xnoremap <C-h> E|onoremap <C-h> E

    " Find
    nnoremap n f|xnoremap n f|onoremap n f
    nnoremap N F|xnoremap N F|onoremap N F

    " Undo
    nnoremap w u|xnoremap w u|onoremap w u
    nnoremap W U|xnoremap W U|onoremap W U

    " Unmap misc unused keys
    noremap j <nop>
    noremap l <nop>
    noremap L <nop>
