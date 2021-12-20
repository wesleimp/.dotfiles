vim.g.gruvbox_invert_selection = 0
vim.g.gruvbox_contrast_dark = "hard"

vim.cmd("syntax on")
vim.opt.background = "dark"
-- vim.opt.t_Co=256
vim.cmd("colorscheme gruvbox")

vim.cmd([[
highlight Bar cterm=italic,bold
highlight SignColumn guibg=none
highlight CursorLineNR guibg=None
highlight LineNr guifg=#5eacd3
]])
