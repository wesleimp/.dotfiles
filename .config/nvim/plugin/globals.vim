" misc
let g:format_on_save = 1

" visual multi
let g:VM_leader = ","

" NERDTree
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = [
\    '\.git$[[dir]]', '\node_modules[[dir]]',
\    '\.elixir_ls[[dir]]',
\]

" -----------------------------------------
" Airline config
" -----------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol="\uf05e:"
let g:airline#extensions#coc#warning_symbol="\uf071:"
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

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
