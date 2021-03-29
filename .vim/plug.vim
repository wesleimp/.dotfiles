call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

Plug 'VundleVim/Vundle.vim'
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-mix-format'
Plug 'tpope/vim-endwise'

" languages
Plug 'pangloss/vim-javascript'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" syntax/colorscheme
Plug 'scrooloose/syntastic'
Plug 'mhinz/vim-signify'

" themes
Plug 'tomasr/molokai'
Plug 'dracula/vim', { 'as': 'dracula' }

" misc
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
