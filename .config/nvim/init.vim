" ignore files
set wildignore+=*deps/*
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

" plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'simrat39/symbols-outline.nvim'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Presentation
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'RRethy/vim-illuminate'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lualine/lualine.nvim'

" General plugins
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
Plug 'matze/vim-move'
Plug 'mbbill/undotree'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'rust-lang/rust.vim'

" themes
Plug 'mhinz/vim-signify'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'gruvbox-community/gruvbox'
Plug 'karb94/neoscroll.nvim'

" misc
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'sbdchd/neoformat'

Plug 'vim-test/vim-test'
call plug#end()

" lua config
lua require('wesleimp')
