call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'racer-rust/vim-racer'
Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo npm install -g tern' }

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

" languages
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'isRuslan/vim-es6'
Plug 'hashivim/vim-terraform'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

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
