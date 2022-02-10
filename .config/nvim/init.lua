--[[
 _      _____  _____/ /__  (_)___ ___  ____
| | /| / / _ \/ ___/ / _ \/ / __ `__ \/ __ \
| |/ |/ /  __(__  ) /  __/ / / / / / / /_/ /
|__/|__/\___/____/_/\___/_/_/ /_/ /_/ .___/
                                   /_/
--]]

pcall(require, "impatient")

-- Checks if it's first load and download packer as
-- package manager of my plugins
if require("first_load")() then
  return
end

require("globals")

require("plugins")
require("sets")
require("colors")
require("keymaps")

vim.g.VM_leader = ","
vim.g.format_on_save = 0
vim.g.tmux_navigator_no_mappings = 1
