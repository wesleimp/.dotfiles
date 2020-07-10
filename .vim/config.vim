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

" Swap files
set directory-=.

" nerdtree
let g:NERDTreeWinSize=20

" tagbar
let g:tagbar_width=30

" Airline config
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_auto_type_info = 1
let g:go_gocode_autobuild = 1
let g:go_gocode_propose_builtins = 1
let g:go_test_show_name=1
let g:go_updatetime=500
let g:go_gocode_unimported_packages=1
let g:go_highlight_extra_types=1
let g:go_highlight_operators=1 
let g:go_highlight_functions=1

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']

" vim-terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" goyo
function! GoyoBefore()
	Limelight
endfunction

function! GoyoAfter()
	Limelight!
endfunction

let g:goyo_callbacks = [function("GoyoBefore"), function("GoyoAfter")]
