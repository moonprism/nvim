local setup = {}

function setup.nord()
  vim.cmd [[colorscheme nord]]
end

function setup.windline()
  require('wlsample.evil_line')
end

function setup.defx()
  vim.cmd 'source ~/.config/nvim/lua/pack/defx.vim'
end

function setup.bufferline()
  vim.opt.termguicolors = true
  require("bufferline").setup{}
end

function setup.gitsigns()
  require("gitsigns").setup {
    current_line_blame = true,
  }
end

function setup.marks()
  require("marks").setup{}
end

function setup.treesitter()
  require("nvim-treesitter").setup{}
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
          ["<C-p>"] = require("telescope.actions").close,
        }
      }
    }
  }
end

return setup
