return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup {
        defaults = {
          mappings = {
            i = {
              ["<ESC>"] = require("telescope.actions").close,
              ["<C-p>"] = require("telescope.actions").close,
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
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup{
        open_mapping = [[<c-/>]],
        direction = 'float',
        close_on_exit = false,
        float_opts = {
          border = 'curved',
          width = 100,
          height = 28,
        }
      }
    end,
  },
}
