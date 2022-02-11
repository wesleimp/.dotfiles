vim.cmd([[packadd packer.nvim]])

-- plugins
require("packer").startup(function(use)
  local local_use = function(path, opts)
    opts = opts or {}
    if vim.fn.isdirectory(vim.fn.expand("~/plugins/" .. path)) == 1 then
      opts[1] = "~/plugins/" .. path
      use(opts)
    else
      error(string.format("Local plugin %s was not found", path))
    end
  end

  use({ "wbthomason/packer.nvim" })

  -- Local plugins
  local_use("stylua.nvim")

  -- Code completion
  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "saadparwaiz1/cmp_luasnip" })

  use({ "onsails/lspkind-nvim" })
  use({ "nvim-lua/lsp_extensions.nvim" })
  use({ "neovim/nvim-lspconfig" })

  use({ "j-hui/fidget.nvim" })

  -- Focusing
  use({ "folke/zen-mode.nvim" })
  use({ "folke/twilight.nvim" })

  -- Snippet
  use({ "L3MON4D3/LuaSnip" })
  use({ "rafamadriz/friendly-snippets" })

  -- Syntax
  use({ "nvim-treesitter/nvim-treesitter-textobjects" })
  use({ "nvim-treesitter/nvim-treesitter" })

  -- Presentation
  use({ "kyazdani42/nvim-tree.lua" })
  use({ "RRethy/vim-illuminate" })
  use({ "tpope/vim-fugitive" })
  use({ "nvim-lualine/lualine.nvim" })
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })

  -- General plugins
  use({ "godlygeek/tabular" })
  use({ "tpope/vim-commentary" })
  use({ "tpope/vim-surround" })
  use({ "tpope/vim-endwise" })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  })
  use({ "mg979/vim-visual-multi", branch = "master" })
  use({ "matze/vim-move" })
  use({ "mbbill/undotree" })
  use({
    "andweeb/presence.nvim",
    config = function()
      require("presence"):setup()
    end,
  })

  -- Themes
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "gruvbox-community/gruvbox" })

  -- Searching and navigation
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

require("plugins.fidget")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.zenmode")
