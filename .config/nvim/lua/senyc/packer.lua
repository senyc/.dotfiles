-- Many of these are dependencies so remove with caution
return require('packer').startup(function(use)
  use  'laytan/tailwind-sorter.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'L3MON4D3/LuaSnip'
  use 'RRethy/vim-illuminate'
  use 'ThePrimeagen/vim-be-good'
  use 'akinsho/bufferline.nvim'
  use 'catppuccin/nvim'
  use 'ellisonleao/glow.nvim'
  use 'f-person/git-blame.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'kylechui/nvim-surround'
  use 'lewis6991/gitsigns.nvim'
  use 'mbbill/undotree'
  use 'mhartington/formatter.nvim'
  use 'neovim/nvim-lspconfig'
  use 'numToStr/Comment.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-treesitter/playground'
  use 'wbthomason/packer.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use { "williamboman/mason.nvim", run = ":MasonUpdate" }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'akinsho/git-conflict.nvim'

end)
