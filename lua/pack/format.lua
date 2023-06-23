return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        toggler = {
          line = '<space>c',
          block = '<space>c',
        },
        opleader = {
          line = '<space>c',
          block = '<space>b',
        },
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end,
  },
  {
    "junegunn/vim-easy-align",
  }
}
