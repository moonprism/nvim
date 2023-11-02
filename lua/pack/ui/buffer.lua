return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
      options = {
        numbers = function(opts)
          return string.format("%s.", opts.ordinal)
        end,
        always_show_bufferline = false,
        diagnostics = "nvim_lsp",
      },
    },
    keys = {
      { "<C-s>", mode = { "n", "i" }, "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
      { "<C-l>", mode = { "n", "i" }, "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
      {
        "<C-x>",
        function()
          local n = vim.fn.buffer_number()
          vim.cmd.bprevious()
          vim.cmd.bdelete(n)
        end,
      },
    },
  },
}
