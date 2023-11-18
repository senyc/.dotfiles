return {
  'laytan/tailwind-sorter.nvim',
  ft = { 'html', 'js', 'jsx', 'tsx', 'astro' },
  lazy = true,
  config = function()
    require('tailwind-sorter').setup({

      on_save_enabled = true,                                                                                    -- If `true`, automatically enables on save sorting.
      on_save_pattern = { '*.html', '*.js', '*.jsx', '*.tsx', '*.astro' }, -- The file patterns to watch and sort.
      node_path = 'node',
    })
  end
}
