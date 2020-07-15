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

"diff
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif

"NERDtree
nmap <f7> :NERDTreeToggle %<cr>

"fzf
nmap <f8> :Files .<cr> 

augroup golang
	autocmd!
	autocmd FileType go nmap <buffer> <f9> :DlvToggleBreakpoint<cr>
	autocmd FileType go nmap <buffer> <C-f9> :DlvDebug<cr>
	autocmd FileType go nmap <buffer> <f10> :GoBuild -i<cr>
	autocmd FileType go nmap <buffer> <C-f10> :GoRun %<cr>
augroup END

augroup rust
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END

"doties
map <f12> :NERDTree ~/.dotfiles<cr>
nmap <leader><f12> :source $MYVIMRC<cr>
