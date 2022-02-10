self = false

ignore = {
  "631",  -- max_line_length
}

files = { 'lua', 'init.lua' }

-- Global objects defined by the C code
globals = {
  "vim",
  "P",
  "R",
  "RELOAD"
}
