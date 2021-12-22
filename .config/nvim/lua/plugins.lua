local Plug = vim.fn["plug#"]

--plugins
vim.call("plug#begin", "~/.vim/plugged")
Plug("junegunn/vim-plug")

Plug("neovim/nvim-lspconfig")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/nvim-cmp")
Plug("saadparwaiz1/cmp_luasnip")

Plug("onsails/lspkind-nvim")
Plug("nvim-lua/lsp_extensions.nvim")

--Snippets
Plug("L3MON4D3/LuaSnip")
Plug("rafamadriz/friendly-snippets")

-- Syntax
Plug("nvim-treesitter/nvim-treesitter")
Plug("nvim-treesitter/nvim-treesitter-textobjects")

-- Presentation
Plug("kyazdani42/nvim-tree.lua")
Plug("RRethy/vim-illuminate")
Plug("Yggdroot/indentLine")
Plug("tpope/vim-fugitive")
Plug("nvim-lualine/lualine.nvim")
Plug("lewis6991/gitsigns.nvim")

--General plugins
Plug("godlygeek/tabular")
Plug("tpope/vim-commentary")
Plug("tpope/vim-surround")
Plug("tpope/vim-endwise")
Plug("jiangmiao/auto-pairs")
Plug("mg979/vim-visual-multi", { branch = "master" })
Plug("matze/vim-move")
Plug("mbbill/undotree")

--themes
Plug("kyazdani42/nvim-web-devicons")
Plug("gruvbox-community/gruvbox")
Plug("karb94/neoscroll.nvim")

--misc
Plug("nvim-lua/popup.nvim")
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-telescope/telescope-fzy-native.nvim")
Plug("nvim-telescope/telescope-project.nvim")
Plug("sbdchd/neoformat")

Plug("vim-test/vim-test")
vim.call("plug#end")

-- Config plugins
require("plugins.telescope")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.treesitter")
require("neoscroll").setup()
require("gitsigns").setup()
