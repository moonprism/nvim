return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        signs = {
          add          = {hl = 'GitGutterAdd'   , text = '│', numhl='GitGutterAddNr'   , linehl='GitGutterAddLn'},
          change       = {hl = 'GitGutterChange', text = '│', numhl='GitGutterChangeNr', linehl='GitGutterChangeLn'},
          delete       = {hl = 'GitGutterDelete', text = '_', numhl='GitGutterDeleteNr', linehl='GitGutterDeleteLn'},
          topdelete    = {hl = 'GitGutterDelete', text = '‾', numhl='GitGutterDeleteNr', linehl='GitGutterDeleteLn'},
          changedelete = {hl = 'GitGutterChange', text = '~', numhl='GitGutterChangeNr', linehl='GitGutterChangeLn'},
        },
        -- current_line_blame = true,
      }
    end,
  },
}
