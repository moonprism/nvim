local disabled_filetypes = {
  "help",
  "alpha",
}

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
      options = {
        theme  = "auto",
        disabled_filetypes = disabled_filetypes,
      },
      sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {"filename"},
        lualine_x = {"fileformat", "encoding"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
      },
    },
  },
}
