-- options
local options = {
  mouse = "a",
  number = true,
  smartindent = true,
  undofile = true,
  tabstop = 4,
  shiftwidth = 4,
}

for name, value in pairs(options) do vim.o[name] = value end

local v_path = vim.fn.stdpath("config")
-- print(v_path.."/lua/core/")

require('pack')
require('keymap')
