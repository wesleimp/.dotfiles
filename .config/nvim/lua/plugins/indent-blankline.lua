require("indent_blankline").setup({
  char = "▏",
  context_char = "▏",
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
  filetype_exclude = {
    "help",
    "markdown",
    "gitcommit",
    "packer",
    "NvimTree",
  },
  buftype_exclude = { "terminal", "nofile" },
  use_treesitter = true,
})
