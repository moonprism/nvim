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

local setup = require("pack.setup")

local pack_dir = vim.fn.stdpath("config") .. "/lua/pack"
local fs = io.popen("find " .. pack_dir .. " -type f -printf '%f\n'")

local list = {}
for f in fs:lines() do
  local mod_name = f:sub(0, -5)
  if conf_name != "init" then
    local conf = require("pack." .. conf_name)
    for _, c in pairs(conf) do
      list[#list+1] = c
    end
  end
end

require("lazy").setup({
  "easymotion/vim-easymotion",
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },
  {
    "mhinz/vim-startify",
    config = setup.startify
  },
  "rainbowhxch/accelerated-jk.nvim",
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = setup.telescope
  },
  {
    "akinsho/toggleterm.nvim",
    config = setup.toggleterm
  }
})
