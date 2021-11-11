" ======================================
" vim-elixir
" ======================================
augroup ex_files
    autocmd!

    autocmd FileType elixir nnoremap <leader>mt :Mix test<CR>
    autocmd FileType elixir nnoremap <leader>tf :call <SID>mix_test_file()<CR>
    autocmd FileType elixir nnoremap <leader>tl :call <SID>mix_test_line()<CR>
    autocmd FileType elixir nnoremap <leader>mf :Mix format<CR>
augroup end

function! s:mix_test_file()
    if (expand('%:e') == "exs")
        execute '!mix test %'
    endif
endfunction

function! s:mix_test_line()
    let ln = line('.')
    if (expand('%:e') == "exs" && ln > 0)
        execute '!mix test %:' . ln
    endif
endfunction

" ======================================
" vim-go
" ======================================
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
