return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "kyazdani42/nvim-web-devicons",
    init = function()
      vim.g.loaded_netrw = 1
      vim.opt.termguicolors = true
    end,
    config = function ()
      require'nvim-tree'.setup {
        view = {
          width = 36
        },
        filters = {
          custom = {"^\\.git$"},
        },
      }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        follow_current_file = { enabled = true },
      }
    }
  },
}
