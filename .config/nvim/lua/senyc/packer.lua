-- TODO use lazy
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'
  use 'nvim-tree/nvim-tree.lua'
  use {
    "akinsho/toggleterm.nvim",
    tag = '*'
  }
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons',
    opt = true }
  }
  use {
    'akinsho/bufferline.nvim',
    tag = '*',
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use 'kylechui/nvim-surround'
  use 'terrortylor/nvim-comment'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      {'neovim/nvim-lspconfig'},
      { 'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'},

      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }
  use 'lewis6991/gitsigns.nvim'
  use 'RRethy/vim-illuminate'
  use 'f-person/git-blame.nvim'
  use 'ThePrimeagen/vim-be-good'
  use 'windwp/nvim-ts-autotag'
  -- Older extension but works nice, may need to change green color
  use 'senyc/doom-one.vim'
  use 'barrett-ruth/live-server.nvim'
  use 'xiyaowong/transparent.nvim'
  use 'folke/tokyonight.nvim'
  use 'catppuccin/nvim'
end)

