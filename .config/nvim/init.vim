" =============================================
" Plugins
" =============================================
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" General plugins
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'RRethy/vim-illuminate'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
Plug 'dense-analysis/ale'
Plug 'matze/vim-move'
Plug 'mattn/emmet-vim'
Plug 'ncm2/float-preview.nvim'

" ========= languages =================
Plug 'sheerun/vim-polyglot'

" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'slashmili/alchemist.vim'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" syntax/colorscheme
Plug 'scrooloose/syntastic'
Plug 'mhinz/vim-signify'

" themes
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', { 'as': 'dracula' }

" misc
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" =============================================
" General config
" =============================================

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

" Cursor highlight
set cursorline
highlight Normal ctermbg=None
highlight clear CursorLine
highlight CursorLineNR ctermbg=gray

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

" filetype
filetype plugin indent on

" Special indentation for some files
au FileType html setl sw=2 ts=2
au FileType markdown setl sw=2 ts=2
au FileType javascript setl sw=2 ts=2
au FileType yaml setl sw=2 ts=2
au FileType json setl sw=2 ts=2
au FileType go setl sw=4 ts=4

" Colorscheme
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" ====================================================
" Plugins configurations
" ====================================================

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
let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol="\uf05e:"
let g:airline#extensions#ale#warning_symbol="\uf071:"
let g:airline#extensions#ale#checking_symbol="\uf110"
" let g:lightline = { 'colorscheme': 'one' }

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

" deoplete
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
\   'elixir': ['credo', 'dialyxir', 'elixir-ls'],
\   'rust': ['rls', 'rustc'],
\   'go': ['gopls']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'elixir': ['mix_format'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['eslint'],
\   'css': ['prettier'],
\   'rust': ['rustfmt']
\}
let g:ale_elixir_elixir_ls_release = $HOME . '/.elixir-ls/release'

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

" Float preview
let g:float_preview#docked = 0

" goyo
function! GoyoBefore()
	Limelight
endfunction

function! GoyoAfter()
	Limelight!
endfunction

let g:goyo_callbacks = [function("GoyoBefore"), function("GoyoAfter")]

" dracula
let g:dracula_italic=0
let g:dracula_colorterm=0

"" =============================================
" Colorscheme
" =============================================

syntax on
colorscheme dracula
set background=dark
set t_Co=256

"" =============================================
" Keymaps
" =============================================

"line selection without identation
nnoremap vv ^vg_

" disable arrow keys :-)
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"escapehell
nnoremap <Tab-j> <Esc>
vnoremap <Tab-j> <Esc>
onoremap <Tab-j> <Esc>
inoremap <Tab-j> <Esc>

map , <Leader>

" Buffer navigation
map <leader>gn :bn<cr>
map <leader>gp :bp<cr>
map <leader>dd :bd<cr>

" remap :W, :Q etc if you press the shift key for too long
cabbrev Q quit
cabbrev W write
cabbrev WQ wq
cabbrev Wq wq
cabbrev QA qa
cabbrev Qa qa

"tab selection
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>9 9gt

"pane switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"pane size
map <C-Left> <C-W><
map <C-Right> <C-W>>

"numeric operations
map + <C-a>
map - <C-x>

"Terminal
nmap <f3> :bel term<cr>

" Register copy/paster
noremap <leader>y "+y
noremap <leader>p "+p

" No highlight after search
nnoremap <silent> <leader><esc> :noh<CR>

"NERDtree
nmap <f7> :NERDTreeToggle<cr>
nmap <leader><f7> :NERDTreeFind<cr>

" Focus mode
nmap <f3> :Goyo<cr>

" Expand snippet
imap <C-o> <Plug>(neosnippet_expand_or_jump)
smap <C-o> <Plug>(neosnippet_expand_or_jump)
xmap <C-o> <Plug>(neosnippet_expand_target)

" fzf
nnoremap <C-p> :Files .<cr>
nnoremap <C-f> :Rg<cr>
nnoremap <C-b> :Buffers<cr>

" ale
noremap <leader>d :ALEGoToDefinition<CR>
noremap <leader>r :ALEFindReferences<CR>
nnoremap <leader>h :ALEHover<cr>
nnoremap <leader>f :ALEFix<cr>
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Align with respect to = or : with <Leader>= and <Leader>:
nmap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nmap <Leader>: :Tabularize /:\zs<CR>
vmap <Leader>: :Tabularize /:\zs<CR>

" Doties
map <f12> :NERDTree ~/.dotfiles<cr>
nmap <leader><f12> :source $MYVIMRC<cr>
