"line selection without identation
nnoremap vv ^vg_

"escapehell
nnoremap <Tab-j> <Esc>
vnoremap <Tab-j> <Esc>
onoremap <Tab-j> <Esc>
inoremap <Tab-j> <Esc>

map , <Leader>
"tab selection
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>9 9gt

"pane switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Terminal 
nmap <f3> :bel term<cr>

noremap <leader>y "+y
noremap <leader>p "+p

nnoremap <silent> <leader><esc> :noh<CR>

"NERDtree
nmap <f7> :NERDTreeToggle<cr>
nmap <leader><f7> :NERDTreeFind<cr>

" deoplete
imap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<tab>"

imap <C-o>     <Plug>(neosnippet_expand_or_jump)
smap <C-o>     <Plug>(neosnippet_expand_or_jump)
xmap <C-o>     <Plug>(neosnippet_expand_target)

"fzf
nmap <silent> <leader>g :Rg<cr>
nmap <leader>f :Files .<cr> 

augroup elixir
    autocmd!
    autocmd filetype elixir nmap <buffer> <C-f> :Mix format <cr><cr>
augroup END

"doties
map <f12> :NERDTree ~/.dotfiles<cr>
nmap <leader><f12> :source $MYVIMRC<cr>
