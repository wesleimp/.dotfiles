let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=1

nmap <leader>T :call NERDTreeToggleFind()<cr>

function! NERDTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeToggle
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction
