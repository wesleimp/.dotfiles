require("wesleimp.telescope")
require("wesleimp.lsp")
require("wesleimp.lualine")

require("neoscroll").setup()

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
