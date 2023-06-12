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

local the_dir = vim.fn.stdpath("config") .. "/lua/pack"
local fs = io.popen("cd " .. the_dir .. "; find -type f")

local list = {}
for f in fs:lines() do
  local conf_name = f:sub(3, -5):gsub("/", ".")
  if conf_name ~= "init" then
    local conf = require("pack." .. conf_name)
    for _, c in pairs(conf) do
      list[#list+1] = c
    end
  end
end

require("lazy").setup(list)
