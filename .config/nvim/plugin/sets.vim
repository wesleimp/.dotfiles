" History
set history=50

" Display
set ls=2
set showmode
set showcmd
set modeline
set ruler
set title
set number
set relativenumber
set encoding=utf8
set previewheight=5
set completeopt=menu,menuone,noselect,noinsert
set guifont
set guicursor
set termguicolors

" Cursor highlight
set cursorline

" Line wrapping
set nowrap
set linebreak
set showbreak=▹

" Auto indent what you can
set autoindent
set smartindent

" Searching
set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch

" Enable jumping into files in a search buffer
set hidden

" Make backspace a bit nicer
set backspace=eol,start,indent

" Indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

set mouse=a
set wildmenu
set colorcolumn=80
set laststatus=2

" filetype
filetype plugin indent on

" Special indentation for some files
autocmd FileType html setl sw=2 ts=2
autocmd FileType markdown setl sw=2 ts=2
autocmd FileType javascript setl sw=2 ts=2
autocmd FileType vue setl sw=2 ts=2
autocmd FileType yaml setl sw=2 ts=2
autocmd FileType json setl sw=2 ts=2
autocmd FileType go setl sw=4 ts=4

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
