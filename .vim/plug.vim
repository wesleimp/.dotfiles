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
Plug 'junegunn/goyo.vim'

" languages
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'rust-lang/rust.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'isRuslan/vim-es6'
Plug 'elixir-editors/vim-elixir'

" syntax/colorscheme
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'arcticicestudio/nord-vim'

" misc
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/vimshell.vim'

call plug#end()
