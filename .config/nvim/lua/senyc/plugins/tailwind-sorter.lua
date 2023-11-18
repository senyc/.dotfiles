return {
  'laytan/tailwind-sorter.nvim',
  lazy = true,
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
  build = 'cd formatter && npm i && npm run build',
  ft = { 'html', 'js', 'javascriptreact', 'typescriptreact', 'astro' },
  config = function()
    require 'tailwind-sorter'.setup({

      on_save_enabled = true,                                              -- If `true`, automatically enables on save sorting.
      on_save_pattern = { '*.html', '*.js', '*.jsx', '*.tsx', '*.astro' }, -- The file patterns to watch and sort.
      node_path = 'node',
    })
  end
}
