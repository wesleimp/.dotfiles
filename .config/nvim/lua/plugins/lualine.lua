require("lualine").setup({
  options = {
    theme = "gruvbox",
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_b = {},
  },
  extensions = { "nvim-tree" },
})
