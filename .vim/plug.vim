call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

" Completetions
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'VundleVim/Vundle.vim'
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'RRethy/vim-illuminate'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'

Plug 'slashmili/alchemist.vim'
Plug 'racer-rust/vim-racer'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" languages
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'elixir-editors/vim-elixir'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ziglang/zig.vim'

" syntax/colorscheme
Plug 'scrooloose/syntastic'
Plug 'mhinz/vim-signify'

" themes
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'

" misc
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
