" disable help
map <f1> <NOP>

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
noremap J mznJ`z

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
noremap <leader>y "+y<esc>
noremap <leader>p "+p<esc>

" No highlight after search
nnoremap <silent> <leader><esc> :noh<CR>

" Focus mode
nmap <f3> :Goyo<cr>

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

map <space> <leader>

" ------------------------------------------------
" Buffer
" ------------------------------------------------
" Buffer navigation
map <leader>gn :bn<cr>
map <leader>gp :bp<cr>
map <leader>dd :bd<cr>

"pane switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ------------------------------------------
" LSP
" ------------------------------------------
nnoremap <silent>[g :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent>]g :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>sd :lua vim.diagnostic.open_float()<CR>

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gy :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>k :lua vim.lsp.buf.hover()<CR>

" Snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

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
nmap <leader>tr :call NERDTreeToggleFind()<cr>
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
nnoremap <C-f> :lua require('telescope.builtin').live_grep({ hidden = true })<cr>
nnoremap <C-b> :lua require('telescope.builtin').buffers()<cr>

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

nnoremap <leader>u :UndotreeShow<CR>
