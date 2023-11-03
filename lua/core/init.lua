vim.g.mapleader = " "

-- options
local options = {
  mouse = "a",
  number = true,
  smartindent = true,
  undofile = true,
  tabstop = 2,
  shiftwidth = 2,
  showmode = false,
  expandtab = true,
}

for name, value in pairs(options) do
  vim.o[name] = value
end

--sw: shiftwidth et: expandtab
local format = {
  go = "sw=4 noet",
  lua = "sw=2",
  html = "sw=4",
  php = "sw=4",
  javascript = "sw=4",
  css = "sw=4",
  vue = "sw=4",
  sh = "sw=2",
  yaml = "sw=2",
}

for name, value in pairs(format) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = name,
    command = "set " .. value,
  })
end

-- last position
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.*",
  command = "exec 'normal! g`\"'",
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "pack" },
    { import = "pack.ui" },
  },
  change_detection = {
    enabled = false,
  },
})

require("core.keymap")
require("lsp")
