"line selection without identation
nnoremap vv ^vg_

"escapehell
nnoremap <Tab-j> <Esc>
vnoremap <Tab-j> <Esc>
onoremap <Tab-j> <Esc>
inoremap <Tab-j> <Esc>

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

"NERDtree
nmap <leader><f7> :NERDTreeRefreshRoot<cr>
nmap <f7> :NERDTreeToggle<cr>

"coc-nvim
" GoTo code navigation.
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

"fzf
nmap <silent> <f2> :Rg<cr> 
nmap <f8> :Files .<cr> 

augroup elixir
    autocmd!
    autocmd filetype elixir nmap <buffer> <C-f> :MixFormat <cr>
augroup END

"doties
map <f12> :NERDTree ~/.dotfiles<cr>
nmap <leader><f12> :source $MYVIMRC<cr>
