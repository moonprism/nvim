local setup = {}

function setup.nord()
  vim.cmd [[colorscheme nord]]
end

function setup.lualine()
  require("lualine").setup {
    options = {
      section_separators = { left = '', right = ''},
      component_separators = { left = '|', right = '|'}
    }
  }
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
