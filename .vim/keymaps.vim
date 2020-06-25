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

"UltiSnips
let g:UltiSnipsExpandTrigger = "<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Shougo/neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?

" fatih/vim-go
let g:go_snippet_engine = "neosnippet"

"goyo
nmap <f5> :Goyo<cr>

"Gundo
nmap <f6> :GundoToggle<cr>

"NERDtree
nmap <f7> :NERDTreeToggle<cr>

"tagbar
nmap <f8> :TagbarToggle<cr> 

augroup golang
	autocmd!
	autocmd FileType go nmap <buffer> <f9> :DlvToggleBreakpoint<cr>
	autocmd FileType go nmap <buffer> <C-f9> :DlvDebug<cr>
	autocmd FileType go nmap <buffer> <f10> :GoBuild -i<cr>
	autocmd FileType go nmap <buffer> <C-f10> :GoRun %<cr>
augroup END

augroup omnisharp_commands
	autocmd!
  
	autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

	autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
	autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
	autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
	autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

	autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

	autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
	autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
	autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
	autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
	autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

	autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
	autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

augroup END


"deoplete
imap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
imap <expr> <cr> pumvisible() ? deoplete#close_popup() : "\<cr>"

"doties
map <f12> :NERDTree ~/.dotfiles<cr>
nmap <leader><f12> :source $MYVIMRC<cr>
