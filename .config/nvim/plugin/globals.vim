" misc
let g:format_on_save = 1

" visual multi
let g:VM_leader = ","

let g:indentLine_conceallevel = 0

" NERDTree
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeIgnore = [
\    '\.git$[[dir]]', '\node_modules[[dir]]',
\    '\.elixir_ls[[dir]]',
\]

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

" -----------------------------------------
" LSP
" -----------------------------------------
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
