return{
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup{
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
