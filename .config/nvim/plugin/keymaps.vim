" disable help
map <f1> <NOP>

"line selection without identation
nnoremap vv ^vg_

"numeric operations
map + <C-a>
map - <C-x>

" remap :W, :Q etc if you press the shift key for too long
cabbrev Q quit
cabbrev W write
cabbrev WQ wq
cabbrev Wq wq
cabbrev QA qa
cabbrev Qa qa

" Register copy/paster
noremap <leader>y "+y
noremap <leader>p "+p

" No highlight after search
nnoremap <silent> <leader><esc> :noh<CR>

" Focus mode
nmap <f3> :Goyo<cr>

" Expand snippet
imap <C-l> <Plug>(neosnippet_expand_or_jump)
smap <C-l> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)

" ------------------------------------------------
" Navigation
" ------------------------------------------------

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

" ------------------------------------------------
" BufferLine
" ------------------------------------------------
" Buffer navigation
map <leader>gn :bn<cr>
map <leader>gp :bp<cr>
map <leader>dd :bd<cr>

"tab selection
map <leader>1 :BufferLineGoToBuffer 1<cr>
map <leader>2 :BufferLineGoToBuffer 2<cr>
map <leader>3 :BufferLineGoToBuffer 3<cr>
map <leader>4 :BufferLineGoToBuffer 4<cr>
map <leader>5 :BufferLineGoToBuffer 5<cr>
map <leader>6 :BufferLineGoToBuffer 6<cr>
map <leader>7 :BufferLineGoToBuffer 7<cr>
map <leader>9 :BufferLineGoToBuffer 9<cr>

"pane switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ------------------------------------------
" Coc
" ------------------------------------------
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

" ------------------------------------------------
" vim-test
" ------------------------------------------------
nmap <silent> <Leader>tt :w\|:TestSuite<CR>
nmap <silent> <Leader>tf :w\|:TestFile<CR>
nmap <silent> <Leader>tn :w\|:TestNearest<CR>
nmap <silent> <Leader>tl :w\|:TestLast<CR>

" ------------------------------------------------
" NERDTree
" ------------------------------------------------
nmap <leader>T :call NERDTreeToggleFind()<cr>
nmap <f2> :call NERDTreeToggleFind()<cr>

function! NERDTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeToggle
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction

" ------------------------------------------------
" Telescope
" ------------------------------------------------
lua require("wesleimp")

" Telescope
nnoremap <C-p> :lua require('telescope.builtin').find_files()<cr>
nnoremap <C-f> :lua require('telescope.builtin').live_grep()<cr>
nnoremap <C-b> :lua require('telescope.builtin').buffers()<cr>

nnoremap <leader>pp :lua require('telescope').extensions.project.project({ display_type = "full" })<cr>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string({search = vim.fn.expand("<cword>")})<CR>
nnoremap <leader>gs :lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gc :lua require('telescope.builtin').git_commits()<cr>

map <f12> :lua require('wesleimp.telescope').search_dotfiles()<cr>


" ------------------------------------------------
" Misc
" ------------------------------------------------
" Align with respect to = or : with <Leader>= and <Leader>:
nmap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nmap <Leader>: :Tabularize /:\zs<CR>
vmap <Leader>: :Tabularize /:\zs<CR>
