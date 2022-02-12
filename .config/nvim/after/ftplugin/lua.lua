-- Test file the currently file
vim.api.nvim_set_keymap(
  "n",
  "<leader>tf",
  "<Plug>PlenaryTestFile",
  { noremap = false, silent = false }
)
