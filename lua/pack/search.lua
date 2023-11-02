return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = { 'nvim-lua/plenary.nvim' },
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
    keys = {
      -- --ignore 使用gitignore，使用--no-ignore可以禁用
      -- -. --hidden 搜索隐藏文件和目录
      -- -g --glob   包含或排除给定的文件和目录
      { "<C-p>", "<Cmd>Telescope find_files find_command=rg,--ignore,-.,--files,-g,!**/.git/*<CR>", desc = "rg Files" },
      { "<C-g>", "<Cmd>Telescope live_grep<CR>", desc = "rg String" },
      { "<C-g>", mode={"x"}, "<Cmd>Telescope grep_string<CR>", desc = "rg String" },
    }
  },
}
