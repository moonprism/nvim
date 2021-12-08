local pack = require("core.pack")

vim.cmd[[colorscheme catppuccin]]

require('lualine').setup {
  options = {
    theme = "catppuccin",
    section_separators = { left = '', right = ''},
    component_separators = { left = '|', right = '|'}
  }
}

local tree_cb = require"nvim-tree.config".nvim_tree_callback
require('nvim-tree').setup {
  view = {
    width = 31,
    mappings = {
      list = {
        {key = ".", cb = tree_cb("toggle_dotfiles")},
        {key = "l", cb = tree_cb("edit")},
        {key = "h", cb = tree_cb("close_node")},
      }
    }
  },
  filters = {
    dotfiles = false,
    custom = {".git"}
  }
}

require('keymap')
