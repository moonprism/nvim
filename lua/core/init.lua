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

vim.cmd 'source ~/.config/nvim/lua/core/init.vim'

require('pack')
require('keymap')
