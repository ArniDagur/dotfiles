" -- The basics --

    syntax on " Turn syntax highlighting on

    filetype plugin indent on
    set autoindent " Copy previous indentation when making new line
    set formatoptions-=ro " Remove autocomment when enter/open are pressed
    set tabstop=4 " Tab character width
    set softtabstop=4
    set shiftwidth=4
    set expandtab " Use spaces instead of tabs
    set list " Show invisible characters
    set listchars=tab:>\
    set encoding=utf-8
    set guifont=Source\ Code\ Pro\ 11 " Font for GUI version
    set number

    " " Enable autocompletion:
    set wildmode=longest,list,full
    set wildmenu

    " Highlight any text that exceeds 80 columns
    " autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
    " Highlight trailing whitespace
    " autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
    " autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
    " highlight EOLWS ctermbg=yellow guibg=yellow

    " Change cursor shape depending on mode
    " works for VTE compatible terminals (urvxt, st, xterm, gnome, ...)
    " see http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    
    " Setting the visual bell turns off the audio bell
    " and clearing the visual bell length deactivates flashing
    set visualbell
    set t_vb=

" -- Plugins --
call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdcommenter'
    Plug 'godlygeek/tabular'
    Plug 'lervag/vimtex'
    Plug 'dracula/vim'
call plug#end()
    
    " Colorscheme
    set termguicolors
    let g:dracula_colorterm = 0
    colorscheme dracula

    " Nerdcommenter
    let g:NERDCreateDefaultMappings = 0
    let g:NERDSpaceDelims = 1
    let g:NERDCompactSexyComs = 1
    let g:NERDCommentEmptyLines = 0
    let g:NERDTrimTrailingWhitespace = 1
    nmap j <Plug>NERDCommenterToggle|vmap j <Plug>NERDCommenterToggle

    " Airline
    " let g:airline_theme='monochrome'
    " let g:airline_powerline_fonts = 0 " Enable Powerline fonts

    " Vimtex
    let g:vimtex_view_method = 'mupdf'

" -- Keybindings --
    
    if 1 " Fix meta keys when using incompatible terminals
        nnoremap u O|xnoremap u O|onoremap u O
        nnoremap a i|xnoremap a i|onoremap a i
        nnoremap e o|xnoremap e o|onoremap e o
        nnoremap o l|xnoremap o l|onoremap o l
        nnoremap f I|xnoremap f I|onoremap f I
        nnoremap b A|xnoremap b A|onoremap b A
        nnoremap y H|xnoremap y H|onoremap y H
        nnoremap i M|xnoremap i M|onoremap i M
        nnoremap k L|xnoremap k L|onoremap k L
    endif

    " Map leader keys
    map i <nop>
    map I <nop>
    let mapleader = "i"
    let maplocalleader = "I"
    
    " Basic arrow keys
    nnoremap u k|xnoremap u k|onoremap u k
    nnoremap <M-u> O|xnoremap <M-u> O|onoremap <M-u> O
    nnoremap gu gk|xnoremap gu gk|onoremap gu gk
    nnoremap a h|xnoremap a h|onoremap a h
    nnoremap <M-a> i|xnoremap <M-a> i|onoremap <M-a> i
    " nnoremap ga gh|xnoremap ga gh|onoremap ga gh
    nnoremap e j|xnoremap e j|onoremap e j
    nnoremap <M-e> o|xnoremap <M-e> o|onoremap <M-e> o
    nnoremap ge gj|xnoremap ge gj|onoremap ge gj
    nnoremap o l|xnoremap o l|onoremap o l
    nnoremap <M-o> a|xnoremap <M-o> a|onoremap <M-o> a
    " nnoremap go gl|xnoremap go gl|onoremap go gl
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
    nnoremap <M-i> M|xnoremap <M-i> M|onoremap <M-i> M
    nnoremap k y|xnoremap k y|onoremap k y
    nnoremap K y$|xnoremap K y$|onoremap K y$
    nnoremap <M-k> L|xnoremap <M-k> L|onoremap <M-k> L

    nnoremap h e|xnoremap h e|onoremap h e
    "noremap H n " Might need to rethink
    nnoremap <C-h> E|xnoremap <C-h> E|onoremap <C-h> E

    " Find (Look)
    nnoremap l f|xnoremap l f|onoremap l f
    nnoremap L F|xnoremap L F|onoremap L F

    " Undo
    nnoremap w u|xnoremap w u|onoremap w u
    nnoremap W U|xnoremap W U|onoremap W U
