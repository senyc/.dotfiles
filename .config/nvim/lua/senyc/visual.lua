-- require('onedarkpro').setup({})
-- vim.cmd("colorscheme onedark_vivid")

-- local highlight_color = "#5c6370"

-- vim.cmd("colorscheme doom-one")

-- require('tokyonight').setup({
--   style = 'storm',
--   light_style = 'day',
--   transparent = true,
--   terminal_colors = true,
--   styles = {
--
--
--     comments = { italic = true },
--     keywords = { italic = true },
--     functions = {},
--     variables = {},
--
--     sidebars = 'dark',
--     floats = 'dark',
--   },
--   sidebars = { 'qf', 'help' },
--   day_brightness = 0.3,
--   hide_inactive_statusline = false,
--   dim_inactive = false,
--   lualine_bold = false,
-- })

require('catppuccin').setup({
  flavour = 'mocha', -- latte, frappe, macchiato, mocha
  background = {     -- :h background
    light = 'latte',
    dark = 'mocha',
  },
  transparent_background = true,
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  term_colors = true,
  dim_inactive = {
    enabled = false,
    shade = 'dark',
    percentage = 0.15,
  },
  no_italic = false,   -- Force no italic
  no_bold = false,     -- Force no bold
  no_underline = true, -- Force no underline
  styles = {
    comments = { 'italic' },
    conditionals = { 'italic' },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    notify = false,
    mini = false,
    illuminate = true,
    treesitter = true,
    mason = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
      inlay_hints = {
        background = true,
      },
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

vim.cmd.colorscheme 'catppuccin'

-- These make the numbers much easier to see they use the colors here:
-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/palettes/mocha.lua
vim.cmd('hi CursorLineNr guifg=#a6e3a1')
vim.cmd('hi LineNr guifg=#a6adc8')
