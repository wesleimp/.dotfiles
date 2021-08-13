" History
set history=50

" Display
set ls=2
set showmode
set showcmd
set modeline
set ruler
set title
set nu
set encoding=utf8
set previewheight=5
set completeopt-=preview
set termguicolors
" test

" Line wrapping
set nowrap
set linebreak
set showbreak=▹

" Auto indent what you can
set autoindent

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

" filetype
filetype plugin indent on

" misc
let g:format_on_save = 1

" nerdtree
let g:NERDTreeWinSize=30
let NERDTreeShowHidden=1

" fzf.vim
let g:fzf_layout = { 'down': '50%' }
let g:fzf_action = {
\   'ctrl-t': 'tab split',
\   'ctrl-i': 'split',
\   'ctrl-v': 'vsplit',
\}

" Airline config
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:lightline = {
\   'colorscheme': 'one',
\}

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
