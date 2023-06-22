return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "kyazdani42/nvim-web-devicons",
    init = function()
      vim.g.loaded_netrw = 1
      vim.opt.termguicolors = true
    end,
    config = function ()
      require'nvim-tree'.setup {
        view = {
          width = 36
        },
        filters = {
          custom = {"^\\.git$"},
        },
      }
    end,
  },
}
