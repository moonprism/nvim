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

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd[[colorscheme tokyonight-moon]]
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      require("lualine").setup {
        options = { 
          theme  = "horizon",
          component_separators = { left = "", right = ""},
          section_separators = { left = "", right = ""},
        },
        sections = {
          lualine_a = {"mode"},
          lualine_b = {"branch", "diff", "diagnostics"},
          lualine_c = {"filename"},
          lualine_x = {"fileformat", "encoding"},
          lualine_y = {"progress"},
          lualine_z = {"location"}
        },
      }
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = setup.tree,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = setup.bufferline,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = setup.gitsigns,
  },
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
