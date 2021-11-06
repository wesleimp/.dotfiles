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

" General plugins
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
Plug 'matze/vim-move'
Plug 'mattn/emmet-vim'

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
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'

" misc
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" =============================================
" General config
" =============================================

" History
set history=50

" Display
set ls=2
set showmode
set showcmd
set modeline
set ruler
set title
set number
set relativenumber
set encoding=utf8
set previewheight=5
set completeopt=menu,menuone,noselect,noinsert

" Cursor highlight
set cursorline
highlight Normal ctermbg=None
highlight clear CursorLine
highlight CursorLineNR ctermbg=gray

" Line wrapping
set nowrap
set linebreak
set showbreak=▹

" Auto indent what you can
set autoindent
set smartindent

" Searching
set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch

" Enable jumping into files in a search buffer
set hidden

" Make backspace a bit nicer
set backspace=eol,start,indent

" Indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

set mouse=a
set wildmenu
set colorcolumn=80

" filetype
filetype plugin indent on

" Special indentation for some files
au FileType html setl sw=2 ts=2
au FileType markdown setl sw=2 ts=2
au FileType javascript setl sw=2 ts=2
au FileType vue setl sw=2 ts=2
au FileType yaml setl sw=2 ts=2
au FileType json setl sw=2 ts=2
au FileType go setl sw=4 ts=4

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" ====================================================
" Plugins configurations
" ====================================================

" misc
let g:format_on_save = 1

" nerdtree
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=1

" fzf.vim
let g:fzf_layout = { 'down': '50%' }
let g:fzf_action = {
\   'ctrl-t': 'tab split',
\   'ctrl-i': 'split',
\   'ctrl-v': 'vsplit',
\}

" Airline config
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol="\uf05e:"
let g:airline#extensions#coc#warning_symbol="\uf071:"

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_auto_type_info = 1
let g:go_gocode_autobuild = 1
let g:go_gocode_propose_builtins = 1
let g:go_test_show_name=1
let g:go_updatetime=500
let g:go_gocode_unimported_packages=1
let g:go_highlight_extra_types=1
let g:go_highlight_operators=1
let g:go_highlight_functions=1

" fzf
" show hidden files except .git when fzf grep
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --hidden --column --line-number --no-heading --color=always --smart-case -g "!.git" -- '.shellescape(<q-args>), 1,
\   fzf#vim#with_preview(), <bang>0)

" ale
" language server config
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'elixir': ['mix_format'],
\   'rust': ['rustfmt'],
\   'go': ['gofmt']
\}

let g:ale_disable_lsp=1
let g:ale_fix_on_save=1
highlight ALEWarning ctermbg=none cterm=reverse
highlight ALEError ctermbg=none cterm=reverse
highlight ALEInfo ctermbg=none cterm=reverse
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight ALEInfoSign ctermbg=NONE ctermfg=blue

" Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue EmmetInstall

" visual multi
let g:VM_leader = ","

" goyo
function! GoyoBefore()
	Limelight
endfunction

function! GoyoAfter()
	Limelight!
endfunction

let g:goyo_callbacks = [function("GoyoBefore"), function("GoyoAfter")]

" dracula
let g:dracula_italic=0
let g:dracula_colorterm=0

" indentLIne
let g:indentLine_char = '│'

" =============================================
" Colorscheme
" =============================================

syntax on
colorscheme gruvbox
set background=dark
set t_Co=256

"" =============================================
" Keymaps
" =============================================

"line selection without identation
nnoremap vv ^vg_

" disable arrow keys :-)
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"escapehell
nnoremap <Tab-j> <Esc>
vnoremap <Tab-j> <Esc>
onoremap <Tab-j> <Esc>
inoremap <Tab-j> <Esc>

map , <Leader>

" Buffer navigation
map <leader>gn :bn<cr>
map <leader>gp :bp<cr>
map <leader>dd :bd<cr>

" remap :W, :Q etc if you press the shift key for too long
cabbrev Q quit
cabbrev W write
cabbrev WQ wq
cabbrev Wq wq
cabbrev QA qa
cabbrev Qa qa

"tab selection
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>9 9gt

"pane size
map <C-Left> :tabp<cr>
map <C-Right> :tabn<cr>

"pane switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"numeric operations
map + <C-a>
map - <C-x>

" Register copy/paster
noremap <leader>y "+y
noremap <leader>p "+p

" No highlight after search
nnoremap <silent> <leader><esc> :noh<CR>

"NERDtree
function! NERDTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeToggle
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction

nmap <f7> :call NERDTreeToggleFind()<cr>

" Focus mode
nmap <f3> :Goyo<cr>

" Expand snippet
imap <Tab><Tab> <Plug>(neosnippet_expand_or_jump)
smap <Tab><Tab> <Plug>(neosnippet_expand_or_jump)
xmap <Tab><Tab> <Plug>(neosnippet_expand_target)

" fzf
nnoremap <C-p> :Files .<cr>
nnoremap <C-f> :Rg<cr>
nnoremap <C-b> :Buffers<cr>

" coc-nvim
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap <C-j> and <C-k> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
nnoremap <nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
inoremap <nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-j>"
  vnoremap <nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-k>"
endif

augroup ex_files
    autocmd!

    autocmd FileType elixir nnoremap <leader>mt :call <SID>mix_test()<CR>
augroup end

function! s:mix_test()
    let ln = line('.')
    if (expand('%:e') == "exs" && ln > 0)
        execute '!mix test %:' . ln
    endif
endfunction

" Align with respect to = or : with <Leader>= and <Leader>:
nmap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nmap <Leader>: :Tabularize /:\zs<CR>
vmap <Leader>: :Tabularize /:\zs<CR>

" Doties
map <f12> :NERDTree ~/.dotfiles<cr>
nmap <leader><f12> :source $MYVIMRC<cr>
