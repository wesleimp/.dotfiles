call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

" auto complete
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

" snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'

" golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.vim/plugged/gocode/nvim/symlink.sh' }
Plug 'zchee/deoplete-go', { 'do': 'make' }

" rust
Plug 'rust-lang/rust.vim'

" syntax/colorscheme
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'

" misc
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'sjl/gundo.vim'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim'
Plug 'sebdah/vim-delve'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'dkprice/vim-easygrep'
Plug 'terryma/vim-multiple-cursors'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }

" presentation
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-signify'
Plug 'Shougo/unite.vim'
Plug 'Kocha/vim-unite-tig'

" theme
Plug 'arcticicestudio/nord-vim'

call plug#end()
