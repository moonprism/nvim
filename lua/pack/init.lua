local setup = require("pack.setup")

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  "arcticicestudio/nord-vim",
    config = setup.nord
  }

  use {
    opt = true,
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = setup.lualine
  }

  use {
    "Shougo/defx.nvim",
    requires = {
      'kristijanhusak/defx-git',
      'kristijanhusak/defx-icons'
    },
    config = setup.defx
  }

  use {
    opt = true,
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = setup.bufferline
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = setup.gitsigns
  }

  use {
    "chentau/marks.nvim",
    config = setup.marks
  }

  use "junegunn/vim-easy-align"

  use "rhysd/accelerated-jk"


  -- use "tpope/vim-fugitive"

  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = setup.telescope
  }
end)