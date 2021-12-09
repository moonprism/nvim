-- options
local options = {
  mouse = "a",
  number = true,
  smartindent = true,
  undofile = true,
}

for name, value in pairs(options) do vim.o[name] = value end

vim.api.nvim_command("autocmd FileType lua set ts=2 sw=2 expandtab")

require('pack')
require('keymap')
