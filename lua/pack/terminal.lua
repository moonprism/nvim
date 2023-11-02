return {
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    opts = {
      open_mapping = [[<c-_>]],
      direction = "float",
      close_on_exit = true,
      float_opts = {
        border = "single",
        width = 100,
        height = 30,
      },
    },
  },
}
