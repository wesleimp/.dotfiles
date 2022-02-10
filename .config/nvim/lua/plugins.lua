vim.cmd([[packadd packer.nvim]])

-- plugins
require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim" })

  use({ "neovim/nvim-lspconfig" })
  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "saadparwaiz1/cmp_luasnip" })

  use({ "onsails/lspkind-nvim" })
  use({ "nvim-lua/lsp_extensions.nvim" })

  -- Snippets
  use({ "L3MON4D3/LuaSnip" })
  use({ "rafamadriz/friendly-snippets" })

  -- Syntax
  use({ "nvim-treesitter/nvim-treesitter" })
  use({ "nvim-treesitter/nvim-treesitter-textobjects" })

  -- Presentation
  use({ "kyazdani42/nvim-tree.lua" })
  use({ "RRethy/vim-illuminate" })
  use({ "tpope/vim-fugitive" })
  use({ "nvim-lualine/lualine.nvim" })
  use({ "lewis6991/gitsigns.nvim" })
  use({ "alvarosevilla95/luatab.nvim" })

  -- General plugins
  use({ "godlygeek/tabular" })
  use({ "tpope/vim-commentary" })
  use({ "tpope/vim-surround" })
  use({ "tpope/vim-endwise" })
  use({ "jiangmiao/auto-pairs" })
  use({ "mg979/vim-visual-multi", branch = "master" })
  use({ "matze/vim-move" })
  use({ "mbbill/undotree" })
  use({ "andweeb/presence.nvim" })

  -- Themes
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "gruvbox-community/gruvbox" })
  use({ "karb94/neoscroll.nvim" })
  use({ "startup-nvim/startup.nvim" })

  -- Misc
  use({ "nvim-lua/popup.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "nvim-telescope/telescope.nvim" })
  use({ "nvim-telescope/telescope-fzy-native.nvim" })
  use({ "nvim-telescope/telescope-project.nvim" })
  use({ "nvim-telescope/telescope-file-browser.nvim" })
  use({ "camgraff/telescope-tmux.nvim" })
  use({ "ThePrimeagen/harpoon" })

  use({ "sbdchd/neoformat" })
  use({ "christoomey/vim-tmux-navigator" })
  use({ "vim-test/vim-test" })
  use({ "lewis6991/impatient.nvim" })
end)

-- Config plugins
require("plugins.telescope")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.luatab")
require("plugins.startup-nvim")
require("plugins.nvim-tree")
require("plugins.treesitter")
require("neoscroll").setup()
require("gitsigns").setup()
require("presence"):setup()
