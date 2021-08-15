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

"NERDtree
nmap <f7> :NERDTreeToggle<cr>
nmap <leader><f7> :NERDTreeFind<cr>

" deoplete
imap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<tab>"

"fzf
nmap <silent> <C-f> :Rg<cr>
nmap <C-p> :Files .<cr> 

augroup elixir
    autocmd!
    autocmd filetype elixir nmap <buffer> <leader>f :Mix format <cr><cr>
augroup END

"doties
map <f12> :NERDTree ~/.dotfiles<cr>
nmap <leader><f12> :source $MYVIMRC<cr>
