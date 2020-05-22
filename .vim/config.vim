set tabstop=2
set softtabstop=0 
set expandtab 
set shiftwidth=2
set backspace=2
set nowrap
set number 
set completeopt-=preview
set previewheight=5
set cursorline

" omnisharp
let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_selector_ui = 'ctrlp'
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_path = join([expand('~'), '.omnisharp', 'omnisharp-roslyn', 'OmniSharp.exe'], '/')
let g:OmniSharp_timeout=5

" deoplete
if has('nvim')
	let g:deoplete#enable_at_startup = 1
endif
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources = {}
let g:deoplete#sources.cs = ['cs', 'ultisnips', 'buffer']
let g:deoplete#sources.python = ['jedi', 'ultisnips', 'buffer']
let g:deoplete#sources.javascript = ['ternjs', 'ultisnips', 'buffer']
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.cs = ['\w*']
let g:deoplete#omni#input_patterns.rust = '[(\.)(::)]'
let g:deoplete#keyword_patterns = {}

" Shougo/neosnippet
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory=['~/.vim/plugged/vim-snippets/snippets', '~/.vim/snippets']
let g:neosnippet#disable_runtime_snippets = {
    \ 'go': 1
\}

" nerdtree
let g:NERDTreeWinSize=20

" tagbar
let g:tagbar_width=30

" vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts=1  "Mesloirline_powerline_fonts = 1

" vim-go
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

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = " -std=c++14"
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']

" goyo
function! GoyoBefore()
	Limelight
endfunction

function! GoyoAfter()
	Limelight!
endfunction

let g:goyo_callbacks = [function("GoyoBefore"), function("GoyoAfter")]

" mattn/vim-emmet 
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" mattn/gist-vim
let g:gist_clip_command='xclip -selection clipboard'
let g:gist_detect_filetype=1
let g:gist_open_browser_after_post=1
let g:gist_post_private=1
