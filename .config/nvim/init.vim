" ignore files
set wildignore+=*deps/*
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

" =============================================
" Plugins
" =============================================
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Code completition
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Presentation
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'RRethy/vim-illuminate'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'

" General plugins
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
Plug 'matze/vim-move'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'elixir-editors/vim-elixir'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'slashmili/alchemist.vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" themes
Plug 'mhinz/vim-signify'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'gruvbox-community/gruvbox'

" misc
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
call plug#end()

lua require('wesleimp')

" =============================================
" Colorscheme
" =============================================

syntax on
colorscheme gruvbox
set background=dark
set t_Co=256


" ====================================================
" Plugins configurations
" ====================================================

" misc
let g:format_on_save = 1

" visual multi
let g:VM_leader = ","

"line selection without identation
nnoremap vv ^vg_

"numeric operations
map + <C-a>
map - <C-x>

" remap :W, :Q etc if you press the shift key for too long
cabbrev Q quit
cabbrev W write
cabbrev WQ wq
cabbrev Wq wq
cabbrev QA qa
cabbrev Qa qa

" Register copy/paster
noremap <leader>y "+y
noremap <leader>p "+p

" No highlight after search
nnoremap <silent> <leader><esc> :noh<CR>

" Focus mode
nmap <f3> :Goyo<cr>

" Expand snippet
imap <Tab><Tab> <Plug>(neosnippet_expand_or_jump)
smap <Tab><Tab> <Plug>(neosnippet_expand_or_jump)
xmap <Tab><Tab> <Plug>(neosnippet_expand_target)

" Align with respect to = or : with <Leader>= and <Leader>:
nmap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nmap <Leader>: :Tabularize /:\zs<CR>
vmap <Leader>: :Tabularize /:\zs<CR>

" Doties
map <f12> :NERDTree ~/.dotfiles<cr>
nmap <leader><f12> :source $MYVIMRC<cr>
