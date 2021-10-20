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
set cursorline
highlight clear CursorLine
highlight CursorLineNR ctermbg=gray

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

" Special indentation for some files
au FileType html setl sw=2 st=2
au FileType markdown setl sw=2 st=2
au FileType javascript setl sw=2 st=2
au FileType yaml setl sw=2 st=2
"
" misc
let g:format_on_save = 1

" nerdtree
let g:NERDTreeWinSize=30

" fzf.vim
let g:fzf_layout = { 'down': '50%' }
let g:fzf_action = {
\   'ctrl-t': 'tab split',
\   'ctrl-i': 'split',
\   'ctrl-v': 'vsplit',
\}

" Airline config
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol="\uf05e:"
let g:airline#extensions#ale#warning_symbol="\uf071:"
let g:airline#extensions#ale#checking_symbol="\uf110"

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

" completetions
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\   'auto_complete_delay': 200,
\   'smart_case': v:true,
\   'keyword_patterns': {},
\   'max_list': 15,
\})

" show hidden files except .git when fzf grep
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --hidden --column --line-number --no-heading --color=always --smart-case -g "!.git" -- '.shellescape(<q-args>), 1,
\   fzf#vim#with_preview(), <bang>0)

" language server config
let g:ale_linters = {
\   'elixir': ['credo', 'dialyxir', 'elixir-ls']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'elixir': ['mix_format'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['eslint']
\}
let g:ale_elixir_elixir_ls_release= $HOME . '/.elixir-ls/release'

let g:ale_completion_enabled=1
let g:ale_lint_on_enter=0
let g:ale_sign_error='✘'
let g:ale_sign_warning='⚠'
let g:ale_sign_info='ⓘ'
let g:ale_sign_style_error='✘'
let g:ale_sign_style_warning='⚠'
let g:ale_sign_style_info='ⓘ'
let g:ale_linters_explicit=1
let g:ale_lint_on_save=1
let g:ale_fix_on_save=1
highlight ALEWarning ctermbg=none cterm=reverse
highlight ALEError ctermbg=none cterm=reverse
highlight ALEInfo ctermbg=none cterm=reverse
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight ALEInfoSign ctermbg=NONE ctermfg=blue

" Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
