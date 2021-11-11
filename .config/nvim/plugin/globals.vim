" misc
let g:format_on_save = 1

" visual multi
let g:VM_leader = ","

" NERDTree
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = [
\    '\.git[[dir]]', '\node_modules[[dir]]',
\    '\.elixir_ls[[dir]]',
\]

" -----------------------------------------
" Airline config
" -----------------------------------------
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

" -----------------------------------------
" ale
" -----------------------------------------
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

" -----------------------------------------
" goyo
" -----------------------------------------
function! GoyoBefore()
	Limelight
endfunction

function! GoyoAfter()
	Limelight!
endfunction

let g:goyo_callbacks = [function("GoyoBefore"), function("GoyoAfter")]
" --------------------------------------
" vim-go
" --------------------------------------
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
