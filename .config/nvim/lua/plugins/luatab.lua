local luatab = require("luatab")

luatab.setup({
  tabline = function()
    local line = ""
    for i = 1, vim.fn.tabpagenr("$"), 1 do
      line = line .. luatab.helpers.cell(i)
    end
    line = line .. "%#TabLineFill#%="
    return line
  end,
  windowCount = function()
    return ""
  end,
})
