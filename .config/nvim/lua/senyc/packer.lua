-- Many of these are dependencies so remove with caution
require('packer').startup(function(use, use_rocks)
  use_rocks 'luafilesystem'
  use 'laytan/tailwind-sorter.nvim'
  use 'RRethy/vim-illuminate'
  use 'akinsho/bufferline.nvim'
  use { 'akinsho/git-conflict.nvim', tag = 'v1.0.0' }
  use 'catppuccin/nvim'
  use 'ellisonleao/glow.nvim'
  use('folke/zen-mode.nvim')
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'rafamadriz/friendly-snippets'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'goolord/alpha-nvim'
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
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'wbthomason/packer.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use { 'williamboman/mason.nvim', run = ':MasonUpdate' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
