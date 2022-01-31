local setup = require("pack.setup")

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    "tomasr/molokai",
    config = setup.theme
  }

  use {
    'windwp/windline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = setup.windline
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = setup.tree
  }

  use {
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

  use "easymotion/vim-easymotion"

  use 'tyru/caw.vim'

  use "voldikss/vim-translator"

  use {
    "mhinz/vim-startify",
    config = setup.startify
  }

  use 'jiangmiao/auto-pairs'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = setup.telescope
  }

  use {
    "akinsho/toggleterm.nvim",
    config = setup.toggleterm
  }

  use {
    "neoclide/coc.nvim",
    branch = "release",
    config = setup.coc
  }
end)
