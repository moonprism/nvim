return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function ()
      vim.g.nvim_tree_icons = {
        default = '',
        symlink = '',
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌"
        },
        folder = {
          arrow_open = " ",
          arrow_closed = " ",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        }
      }
      local tree_cb = require'nvim-tree.config'.nvim_tree_callback
      require'nvim-tree'.setup {
        view = {
          width = 37
        },
        filters = {
          -- custom = {".git"}
        }
      }
    end,
  },
}
