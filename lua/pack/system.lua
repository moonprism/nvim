return {
  {
    "pocco81/auto-save.nvim",
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = vim.opt.sessionoptions:get() },
    keys = {
      { "<leader>sl", function() require("persistence").load() end, desc = "Restore Session" },
    },
  }
}
