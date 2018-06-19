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
    set hidden " See vim screencast

    " " Enable autocompletion:
    set wildmode=longest,list,full
    set wildmenu

:    " Highlight any text that exceeds 80 columns
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
    
    " Enable mouse
    set mouse=a

" -- Plugins --
    call plug#begin('~/.config/nvim/plugged')
        " -- Functionality --
        Plug 'scrooloose/nerdcommenter'
        Plug 'godlygeek/tabular'
        if has('nvim')
            Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
        else
            Plug 'Shougo/deoplete.nvim'
            Plug 'roxma/nvim-yarp'
            Plug 'roxma/vim-hug-neovim-rpc'
        endif

        " -- Appearence --
        Plug 'dracula/vim' " Dracula colorscheme
        Plug 'scrooloose/nerdtree'
        Plug 'Xuyuanp/nerdtree-git-plugin' " Show git status in nerdtree

        " -- Language specific  --
        " LaTeX
        if executable('pdftex')
            Plug 'lervag/vimtex'
        endif
        " Rust
        if executable('rustc')
            Plug 'rust-lang/rust.vim', { 'for': 'rust' }
            Plug 'racer-rust/vim-racer', { 'for': 'rust' }
        endif

    call plug#end()

    " Nerdcommenter
        let g:NERDCreateDefaultMappings = 0
        let g:NERDSpaceDelims = 1
        let g:NERDCompactSexyComs = 1
        let g:NERDCommentEmptyLines = 0
        let g:NERDTrimTrailingWhitespace = 1
        nmap j <Plug>NERDCommenterToggle|vmap j <Plug>NERDCommenterToggle
    
    " Deoplete
        let g:deoplete#enable_at_startup = 1
        inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-i>"

    " -- Appearence --
        " Nerdtree
            " Automatically start nerdtree
            autocmd VimEnter * NERDTree
            autocmd BufEnter * NERDTreeMirror
            " Keybindings
            nnoremap <silent> <C-t> :NERDTreeToggle<CR>
            xnoremap <silent> <C-t> :NERDTreeToggle<CR>

            let g:NERDTreeMapJumpNextSibling = "<C-e>" " Normally <C-j>
            let g:NERDTreeMapJumpPrevSibling = "<C-u>" " Normally <C-k>
            let g:NERDTreeMapJumpLastChild = "E"
            let g:NERDTreeMapJumpFirstChild = "U"
            let g:NERDTreeMapUpdir = "y"
            let g:NERDTreeMapUpdirKeepOpen = "Y"
            let g:NERDTreeMapOpenSplit = "s"
            let g:NERDTreeMapPreviewSplit = "gs"
            let g:NERDTreeMapOpenVSplit = "v"
            let g:NERDTreeMapPreviewVSplit = "gv"
            let g:NERDTreeMapToggleHidden = "h"
            let g:NERDTreeMapOpenExpl = "l"

        " Colorscheme
            set termguicolors
            let g:dracula_colorterm = 0
            colorscheme dracula

    " -- Language specfifc
        " LaTeX
            " Vimtex
                let g:vimtex_view_method = 'mupdf'
        " Rust 
            " Racer
                let g:racer_cmd = $HOME . "/.cargo/bin/racer"
                let g:racer_experimental_completer = 1
                au FileType rust nmap <leader>rx <Plug>(rust-doc)
                au FileType rust nmap <leader>rd <Plug>(rust-def)
                au FileType rust nmap <leader>rs <Plug>(rust-def-split)

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
    nnoremap a h|xnoremap a h|onoremap a h
    nnoremap <M-a> i|xnoremap <M-a> i|onoremap <M-a> i
    nnoremap e j|xnoremap e j|onoremap e j
    nnoremap <M-e> o|xnoremap <M-e> o|onoremap <M-e> o
    nnoremap o l|xnoremap o l|onoremap o l
    nnoremap <M-o> a|xnoremap <M-o> a|onoremap <M-o> a

    nnoremap gu gk|xnoremap gu gk|onoremap gu gk
    nnoremap ge gj|xnoremap ge gj|onoremap ge gj

    nnoremap <C-w>u <C-w>k|xnoremap <C-w>u <C-w>k|onoremap <C-w>u <C-w>k
    nnoremap <C-w>a <C-w>h|xnoremap <C-w>a <C-w>h|onoremap <C-w>a <C-w>h
    nnoremap <C-w>e <C-w>j|xnoremap <C-w>e <C-w>j|onoremap <C-w>e <C-w>j
    nnoremap <C-w>o <C-w>l|xnoremap <C-w>o <C-w>l|onoremap <C-w>o <C-w>l
    nnoremap <C-w>U <C-w>K|xnoremap <C-w>U <C-w>K|onoremap <C-w>U <C-w>K
    nnoremap <C-w>A <C-w>H|xnoremap <C-w>A <C-w>H|onoremap <C-w>A <C-w>H
    nnoremap <C-w>E <C-w>J|xnoremap <C-w>E <C-w>J|onoremap <C-w>E <C-w>J
    nnoremap <C-w>O <C-w>L|xnoremap <C-w>O <C-w>L|onoremap <C-w>O <C-w>L
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
