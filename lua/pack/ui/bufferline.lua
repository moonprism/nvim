return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      vim.opt.termguicolors = true
      require("bufferline").setup{
        options= {
          numbers = function(opts)
            --[[ return string.format('%s.)%s.)', opts.ordinal, opts.id) ]]
            return string.format("%s.", opts.ordinal)
          end,
        }
      }
    end,
  },
}
