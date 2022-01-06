local function lsp_progress(_, is_active)
  if not is_active then
    return
  end

  local messages = vim.lsp.util.get_progress_messages()
  if #messages == 0 then
    return ""
  end

  -- dump(messages)
  local status = {}
  for _, msg in pairs(messages) do
    local title = ""
    if msg.title then
      title = msg.title
    end
    table.insert(status, (msg.percentage or 0) .. "%% " .. title)
  end

  local spinners = {
    "⠋",
    "⠙",
    "⠸",
    "⠴",
    "⠦",
    "⠇",
  }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

require("lualine").setup({
  options = {
    theme = "gruvbox",
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_b = { lsp_progress },
  },
  extensions = { "nvim-tree" },
})
