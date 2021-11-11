lua require("wesleimp")

" Telescope
nnoremap <C-p> :lua require('telescope.builtin').find_files()<cr>
nnoremap <C-f> :lua require('telescope.builtin').live_grep()<cr>
nnoremap <C-b> :lua require('telescope.builtin').buffers()<cr>
