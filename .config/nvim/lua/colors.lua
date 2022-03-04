-- vim.g.gruvbox_invert_selection = 0
vim.g.gruvbox_contrast_dark = "hard"

vim.cmd("syntax on")
vim.opt.background = "dark"
-- vim.opt.t_Co=256
vim.cmd("colorscheme gruvbox")

vim.cmd([[
highlight Bar cterm=italic,bold
highlight SignColumn guibg=none
highlight CursorLineNR guibg=none
highlight LineNr guifg=#5eacd3

" luatab
highlight TabLine gui=none guibg=#282C36 guifg=#5C6370
highlight TabLineSel gui=bold guibg=#282C34 guifg=#B5BBC7
highlight TabLineFill guibg=#282C34
]])

