local setup = {}

function setup.tree()
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
      custom = {".git"}
    }
  }
end

function setup.bufferline()
  vim.opt.termguicolors = true
  require("bufferline").setup{}
end

function setup.gitsigns()
  require("gitsigns").setup {
    signs = {
      add          = {hl = 'GitGutterAdd'   , text = '│', numhl='GitGutterAddNr'   , linehl='GitGutterAddLn'},
      change       = {hl = 'GitGutterChange', text = '│', numhl='GitGutterChangeNr', linehl='GitGutterChangeLn'},
      delete       = {hl = 'GitGutterDelete', text = '_', numhl='GitGutterDeleteNr', linehl='GitGutterDeleteLn'},
      topdelete    = {hl = 'GitGutterDelete', text = '‾', numhl='GitGutterDeleteNr', linehl='GitGutterDeleteLn'},
      changedelete = {hl = 'GitGutterChange', text = '~', numhl='GitGutterChangeNr', linehl='GitGutterChangeLn'},
    },
    current_line_blame = true,
  }
end

function setup.startify()
  vim.g.startify_change_to_dir = 0
  vim.g.startify_padding_left = 3
end

function setup.telescope()
  require("telescope").setup {
    defaults = {
      mappings = {
        i = {
          ["<ESC>"] = require("telescope.actions").close,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
        }
      }
    },
    pickers = {
      find_files = {
        theme = "dropdown",
      },
      live_grep = {
        theme = "dropdown",
      },
      grep_string = {
        theme = "dropdown",
      }
    }
  }
end

function setup.toggleterm()
  require("toggleterm").setup{
    open_mapping = [[<c-t>]],
    direction = 'float',
    close_on_exit = false,
    float_opts = {
      border = 'curved',
      width = 110,
      height = 28,
    }
  }
end

return setup
