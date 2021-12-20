require("lualine").setup({
  options = {
    theme = "gruvbox_dark",
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "NvimTree" },
  },
  sections = {
    lualine_b = {},
  },
})
