vim.api.nvim_set_keymap("n", "<F2>", ":NvimTreeToggle<CR>", {
  noremap = true,
  silent = true,
})

vim.api.nvim_set_keymap("n", "<leader>tr", ":NvimTreeRefresh<CR>", {
  noremap = true,
  silent = true,
})

vim.g.nvim_tree_icons = {
  default = "",
}

require("nvim-tree").setup({
  disable_netrw = false,
  update_focused_file = {
    enable = true,
  },
  diagnostics = {
    enable = false,
  },
  git = {
    enable = false,
  },
  filters = {
    custom = { ".git$", "node_modules" },
  },
  view = {
    width = 35,
    mappings = {
      list = {
        {
          key = { "s" },
          cb = ':lua require"nvim-tree".on_keypress("vsplit")<CR>',
        },
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})
