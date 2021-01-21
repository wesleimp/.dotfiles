call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'mhinz/vim-mix-format'

" languages
Plug 'pangloss/vim-javascript'
Plug 'elixir-editors/vim-elixir'

" syntax/colorscheme
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Shougo/unite.vim'
Plug 'mhinz/vim-signify'

" misc
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/vimshell.vim'

call plug#end()
