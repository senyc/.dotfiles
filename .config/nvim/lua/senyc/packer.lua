return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  })
  use('olimorris/onedarkpro.nvim')
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('nvim-tree/nvim-tree.lua')
  use({
    "akinsho/toggleterm.nvim",
    tag = '*'
  })
  use('nvim-tree/nvim-web-devicons')
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons',
    opt = true }
  })
  use({
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  })
  use('kylechui/nvim-surround')
  use('terrortylor/nvim-comment')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Auto completion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}
end)

