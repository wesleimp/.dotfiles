local opt = vim.opt

-- History
opt.history = 50

-- Display
opt.ls = 2
opt.showmode = true
opt.showcmd = true
opt.modeline = true
opt.ruler = true
opt.title = true
opt.number = true
opt.relativenumber = true
opt.encoding = "utf8"
opt.previewheight = 5
opt.completeopt = "menu,menuone,noselect"
opt.guifont = ""
opt.termguicolors = true

-- Cursor highlight
opt.cursorline = true

-- Line wrapping
opt.wrap = false
opt.linebreak = true
opt.showbreak = "▹"

-- Auto indent what you can
opt.autoindent = true
opt.smartindent = true

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true
opt.hlsearch = true
opt.showmatch = true

-- Enable jumping into files in a search buffer
opt.hidden = true

-- Make backspace a bit nicer
opt.backspace = "eol,start,indent"

-- Indentation
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftround = true
opt.expandtab = true

opt.mouse = "a"
opt.colorcolumn = "80"
opt.laststatus = 2

opt.wildmenu = true
opt.wildignore:append(
  "*deps/*,*_build/*,**/coverage/*,**/node_modules/*,**/.git/*"
)

-- filetype
vim.cmd("filetype plugin indent on")

-- Special indentation for some files
vim.cmd([[
autocmd FileType html setl sw=2 ts=2
autocmd FileType markdown setl sw=2 ts=2
autocmd FileType javascript setl sw=2 ts=2
autocmd FileType vue setl sw=2 ts=2
autocmd FileType yaml setl sw=2 ts=2
autocmd FileType json setl sw=2 ts=2
autocmd FileType go setl sw=4 ts=4
]])

vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.formatting()")