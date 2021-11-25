" ignore files
set wildignore+=*deps/*
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

" plugins
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
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'rust-lang/rust.vim'

" themes
Plug 'mhinz/vim-signify'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'gruvbox-community/gruvbox'
Plug 'akinsho/bufferline.nvim'

" misc
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-project.nvim'

Plug 'akinsho/toggleterm.nvim'
Plug 'folke/todo-comments.nvim'
call plug#end()

" lua config
lua require('wesleimp')

" colorscheme
syntax on
colorscheme gruvbox
set background=dark
set t_Co=256
