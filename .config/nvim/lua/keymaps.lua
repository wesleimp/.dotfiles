local function map(mode)
  return function(lhs, rhs, opt)
    vim.api.nvim_set_keymap(mode, lhs, rhs, opt or {})
  end
end

local nmap = map("n")
local vmap = map("v")
local imap = map("i")
local omap = map("o")
local _map = map("")

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
_map("<leader>y", '"+y<esc>', { noremap = true })
_map("<leader>p", '"+p<esc>', { noremap = true })

--No highlight after search
nmap("<leader><esc>", ":noh<CR>", { noremap = true, silent = true })

--------------------------------------------------
--Navigation
--------------------------------------------------

-- Disable arrow keys :-)
_map("<Up>", "<NOP>", { noremap = true })
_map("<Down>", "<NOP>", { noremap = true })
_map("<Left>", "<NOP>", { noremap = true })
_map("<Right>", "<NOP>", { noremap = true })

-- Escapehell
nmap("<Tab-j>", "<Esc>", { noremap = true })
vmap("<Tab-j>", "<Esc>", { noremap = true })
omap("<Tab-j>", "<Esc>", { noremap = true })
imap("<Tab-j>", "<Esc>", { noremap = true })

--------------------------------------------------
--Buffer
--------------------------------------------------
--Buffer navigation
_map("<leader>gn", ":bn<cr>")
_map("<leader>gp", ":bp<cr>")
_map("<leader>dd", ":bd<cr>")

-- Pane switching
_map("<C-j>", "<C-W>j")
_map("<C-k>", "<C-W>k")
_map("<C-h>", "<C-W>h")
_map("<C-l>", "<C-W>l")

--------------------------------------------------
-- vim-test
--------------------------------------------------
nmap("<Leader>tt", ":w\\|:TestSuite<CR>", { silent = true })
nmap("<Leader>tf", ":w\\|:TestFile<CR>", { silent = true })
nmap("<Leader>tn", ":w\\|:TestNearest<CR>", { silent = true })
nmap("<Leader>tl", ":w\\|:TestLast<CR>", { silent = true })

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

_map("<f12>", ":lua require('plugins.telescope').search_dotfiles()<cr>")

-- Misc
nmap("<leader>u", ":UndotreeShow<CR>", { noremap = true })
