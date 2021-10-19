call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

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
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
Plug 'dense-analysis/ale'
Plug 'matze/vim-move'
Plug 'mattn/emmet-vim'

" languages
Plug 'sheerun/vim-polyglot'
Plug 'elixir-editors/vim-elixir'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'slashmili/alchemist.vim'

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
