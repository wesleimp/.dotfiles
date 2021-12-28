local function _map(mode)
  return function(lhs, rhs, opt)
    vim.api.nvim_set_keymap(mode, lhs, rhs, opt or {})
  end
end

local map = _map("")
local nmap = _map("n")
local vmap = _map("v")
local imap = _map("i")
local omap = _map("o")

vim.g.mapleader = " "
-- map <space> <leader>

--disable help

nmap("<F1>", "")
imap("<F1>", "")

nmap("Y", "yg$", { noremap = true })
nmap("n", "nzzzv", { noremap = true })
nmap("N", "Nzzzv", { noremap = true })

-- line selection without identation
nmap("vv", "^vg_", { noremap = true })

--remap :W, :Q etc if you press the shift key for too long
vim.cmd([[
cabbrev Q quit
cabbrev W write
cabbrev WQ wq
cabbrev Wq wq
cabbrev QA qa
cabbrev Qa qa
]])

--Register copy/paster
map("<leader>y", '"+y<esc>', { noremap = true })
map("<leader>p", '"+p<esc>', { noremap = true })

--No highlight after search
nmap("<leader><esc>", ":noh<CR>", { noremap = true, silent = true })

--------------------------------------------------
--Navigation
--------------------------------------------------

-- Disable arrow keys :-)
map("<Up>", "<NOP>", { noremap = true })
map("<Down>", "<NOP>", { noremap = true })
map("<Left>", "<NOP>", { noremap = true })
map("<Right>", "<NOP>", { noremap = true })

-- Escapehell
nmap("<Tab-j>", "<Esc>", { noremap = true })
vmap("<Tab-j>", "<Esc>", { noremap = true })
omap("<Tab-j>", "<Esc>", { noremap = true })
imap("<Tab-j>", "<Esc>", { noremap = true })

--------------------------------------------------
--Buffer
--------------------------------------------------
--Buffer navigation
map("<leader>gn", ":bn<cr>")
map("<leader>gp", ":bp<cr>")
map("<leader>dd", ":bd<cr>")

-- Pane switching
map("<C-j>", "<C-W>j")
map("<C-k>", "<C-W>k")
map("<C-h>", "<C-W>h")
map("<C-l>", "<C-W>l")

--------------------------------------------------
-- vim-test
--------------------------------------------------
nmap("<Leader>tt", ":w|:TestSuite<CR>", { silent = true })
nmap("<Leader>tf", ":w|:TestFile<CR>", { silent = true })
nmap("<Leader>tn", ":w|:TestNearest<CR>", { silent = true })
nmap("<Leader>tl", ":w|:TestLast<CR>", { silent = true })

--------------------------------------------------
-- Telescope
--------------------------------------------------
nmap(
  "<C-p>",
  ":lua require('telescope.builtin').find_files()<cr>",
  { noremap = true }
)
nmap(
  "<C-f>",
  ":lua require('telescope.builtin').live_grep({ hidden = true })<cr>",
  { noremap = true }
)
nmap(
  "<C-b>",
  ":lua require('telescope.builtin').buffers()<cr>",
  { noremap = true }
)
nmap(
  "<leader>fs",
  ":lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')})<CR>",
  { noremap = true }
)
nmap(
  "<leader>gs",
  ":lua require('telescope.builtin').git_status()<cr>",
  { noremap = true }
)
nmap(
  "<leader>gb",
  ":lua require('telescope.builtin').git_branches()<cr>",
  { noremap = true }
)
nmap(
  "<leader>gc",
  ":lua require('telescope.builtin').git_commits()<cr>",
  { noremap = true }
)

map("<f12>", ":lua require('plugins.telescope').search_dotfiles()<cr>")

-- Misc
nmap("<leader>u", ":UndotreeShow<CR>", { noremap = true })
