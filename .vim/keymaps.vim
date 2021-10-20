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

" remap :W, :Q etc if you press the shift key for too long
cabbrev Q quit
cabbrev W write
cabbrev WQ wq
cabbrev Wq wq

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

nmap <f3> :Goyo<cr>

imap <C-o>     <Plug>(neosnippet_expand_or_jump)
smap <C-o>     <Plug>(neosnippet_expand_or_jump)
xmap <C-o>     <Plug>(neosnippet_expand_target)

" fzf
nnoremap <C-p> :Files .<cr>
nnoremap <C-f> :Rg<cr>
nnoremap <C-b> :Buffers<cr>

" ale
noremap <leader>d :ALEGoToDefinition<CR>
noremap <leader>r :ALEFindReferences<CR>
nnoremap <leader>h :ALEHover<cr>
nnoremap <leader>f :ALEFix<cr>
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Align with respect to = or : with <Leader>= and <Leader>:
nmap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nmap <Leader>: :Tabularize /:\zs<CR>
vmap <Leader>: :Tabularize /:\zs<CR>

"doties
map <f12> :NERDTree ~/.dotfiles<cr>
nmap <leader><f12> :source $MYVIMRC<cr>
