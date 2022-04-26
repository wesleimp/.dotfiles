local npairs = require("nvim-autopairs")

npairs.setup({
  fast_wrap = {
    chars = { "{", "[", "(", '"', "'", "`" },
    end_key = "L",
    highlight = "HopNextKey",
  },
})
