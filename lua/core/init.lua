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

-- sw: shiftwidth et: expandtab
local format = {
  go   = "sw=4",
  lua  = "sw=2 et",
  html = "sw=4 et",
  js   = "sw=4 et",
  css  = "sw=4 et",
  vue  = "sw=4 et",
  sh   = "sw=2 et",
  yaml = "sw=2 et",
}

for name, value in pairs(format) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = name,
    command = "set "..value,
  })
end

-- auto save
vim.api.nvim_create_autocmd({"textchanged", "textchangedi"}, {
  pattern = "*.*",
  command = "silent write",
})

-- last position
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.*",
  command = "exec 'normal! g`\"'",
})

require("pack")
require("core.keymap")
