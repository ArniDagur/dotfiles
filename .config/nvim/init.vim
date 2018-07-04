" vim: fdm=marker:noet:ts=4:sts=4:sw=4
" The basics {{{

    syntax on " Turn syntax highlighting on

    filetype plugin indent on
    set autoindent " Copy previous indentation when making new line
    set formatoptions-=ro " Remove autocomment when enter/open are pressed
    set tabstop=4 " Tab character width
    set softtabstop=4
    set shiftwidth=4
    set expandtab " Use spaces instead of tabs
    " Show invisible characters
    set list listchars=tab:▸\ ,nbsp:‡,extends:»,precedes:«
    set encoding=utf-8
    set guifont=Source\ Code\ Pro\ 11 " Font for GUI version
    set number
    set hidden " See vim screencast
    set completeopt-=preview

    " Enable autocompletion:
    set wildmode=longest,list,full
    set wildmenu

    " Highlight extra whitespace
    highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd Syntax * syn match ExtraWhitespace /\s\+$/ containedin=ALL

    " Undefined Marks
    highlight UndefinedMarks ctermfg=yellow
    autocmd Syntax * syn match UndefinedMarks /???/ containedin=ALL


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
    
    " See: https://redd.it/5uulam
    if &term =~ '256color'
        set t_ut=
    endif
" }}}
" Plugin declaration {{{
    call plug#begin('~/.config/nvim/plugged')
        " -- Functionality --
        Plug 'scrooloose/nerdcommenter'
        Plug 'godlygeek/tabular'
        if executable('fzf')
            Plug 'junegunn/fzf.vim'
        else
            Plug 'ctrlpvim/ctrlp.vim'
        endif
        Plug 'ArniDagur/vim-template'
        " Snippets + Autocomplete
        if has('nvim')
            Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
        endif
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
        " Plug 'ervandew/supertab'

        " -- Appearence --
        Plug 'dracula/vim' " Dracula colorscheme
        Plug 'scrooloose/nerdtree'
        Plug 'Xuyuanp/nerdtree-git-plugin' " Show git status in nerdtree
        
        Plug 'vim-airline/vim-airline'
        
        " -- Filetypes --
        Plug 'PotatoesMaster/i3-vim-syntax'

        " -- Language specific  --
        " LaTeX
            if executable('pdftex')
                Plug 'lervag/vimtex', { 'for': 'tex' }
            endif
        " Rust
            Plug 'rust-lang/rust.vim', { 'for': 'rust' }
            if executable('racer')
                Plug 'racer-rust/vim-racer', { 'for': 'rust' }
                " Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
            endif
        " Python
            Plug 'zchee/deoplete-jedi', { 'for': 'python' }
            Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
            Plug 'heavenshell/vim-pydocstring', { 'for': 'python' }
        " C/C++
            if executable('clang')
                Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }
            endif
        " Go
            if executable('gocode')
                Plug 'zchee/deoplete-go', { 'for': ['go'] }
            endif

    call plug#end()
" }}} 
" Plugin configuration {{{
" -- Functionality --
    " Nerdcommenter
        let g:NERDCreateDefaultMappings = 0
        let g:NERDSpaceDelims = 1
        let g:NERDCompactSexyComs = 1
        let g:NERDCommentEmptyLines = 0
        let g:NERDTrimTrailingWhitespace = 1
        nmap j <Plug>NERDCommenterToggle|vmap j <Plug>NERDCommenterToggle
    
    " Deoplete
        let g:deoplete#enable_at_startup = 1
        au InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
        inoremap <silent><expr> <tab> pumvisible() ? "\<C-n>" : "\<tab>"

    " UltiSnippets
        let g:UltiSnipsExpandTrigger="<C-x>"

    " vim-template
        let g:templates_no_builtin_templates = 1
        " Directory containing additional global templates
        let g:templates_directory = $HOME . "/.config/nvim/templates/"

        let g:email = "arni@dagur.eu"
        let g:username = "Árni Dagur"

    " FZF
        let g:fzf_command_prefix = 'Fzf'
        if executable('fzf')
            " TODO: Look into tags
            " see seenaburns/dotfiles
            let g:fzf_action = {
                \ 'ctrl-t': 'tab split',
                \ 'ctrl-s': 'split',
                \ 'ctrl-v': 'vsplit' }
            nnoremap <C-p> :FzfFiles<cr>
        else
            nnoremap <C-p> :CtrlP<space><cr>
        endif

" -- Appearence --
    " Nerdtree
        " Automatically start nerdtree
        " autocmd VimEnter * NERDTree
        " autocmd BufEnter * NERDTreeMirror
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
    " Vim Airline
    let g:airline_theme='dracula'
    let g:airline_powerline_fonts = 1

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
            " Racer installation:
            " $ cargo install racer
            let g:racer_cmd = $HOME . "/.cargo/bin/racer"
            let g:racer_experimental_completer = 1
            " Keybindings:
            " f (find):
            "   x (explaination): Find documentation
            "   d (definition): Find definition
            "   D (definition): Find definition split
            au FileType rust nmap <leader>fx <Plug>(rust-doc)
            au FileType rust nmap <leader>fd <Plug>(rust-def)
            au FileType rust nmap <leader>fD <Plug>(rust-def-split)
        " rust.vim
        let g:autofmt_autosave = 1
    " Python
        " Pydocstring
            let g:pydocstring_enable_comment = 0
            let g:pydocstring_enable_mapping = 0
            " Keybindings:
            " g (generate):
            "   d (documentation): Generate documentation
            au FileType python nmap <silent> <leader>gd :Pydocstring<CR>
" }}}
" Keybindings {{{
    
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
    map <space> <nop>
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
    " nnoremap <C-u> <C-w>k|xnoremap <C-u> <C-w>k|onoremap <C-u> <C-w>k
    " nnoremap <C-a> <C-w>h|xnoremap <C-a> <C-w>h|onoremap <C-a> <C-w>h
    " nnoremap <C-e> <C-w>j|xnoremap <C-e> <C-w>j|onoremap <C-e> <C-w>j
    " nnoremap <C-o> <C-w>l|xnoremap <C-o> <C-w>l|onoremap <C-o> <C-w>l
    " nnoremap <C-U> <C-w>K|xnoremap <C-U> <C-w>K|onoremap <C-U> <C-w>K
    " nnoremap <C-A> <C-w>H|xnoremap <C-A> <C-w>H|onoremap <C-A> <C-w>H
    " nnoremap <C-E> <C-w>J|xnoremap <C-E> <C-w>J|onoremap <C-E> <C-w>J
    " nnoremap <C-O> <C-w>L|xnoremap <C-O> <C-w>L|onoremap <C-O> <C-w>L
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
" }}}
