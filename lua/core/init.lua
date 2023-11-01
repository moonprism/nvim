vim.g.mapleader = " "

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
  php  = "sw=4 et",
  javascript = "sw=4 et",
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

-- last position
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.*",
  command = "exec 'normal! g`\"'",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal nonumber foldcolumn=1",
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
  }
})

require("core.keymap")
require("lsp")
