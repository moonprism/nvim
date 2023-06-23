return {
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
          disabled_filetypes = {"markdown"},
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
}
