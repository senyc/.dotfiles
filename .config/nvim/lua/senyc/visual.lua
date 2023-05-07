require("onedarkpro").setup({})
vim.cmd("colorscheme onedark_vivid")

-- Standard highlight color
local highlight_color = "#5c6370"

-- My attempt at setting a standard highlight color across illuminate and lsp stuff
vim.cmd("hi def IlluminatedWord guibg="..highlight_color)
vim.cmd("hi def IlluminatedCurWord guibg="..highlight_color)
vim.cmd("hi def IlluminatedWordRead guibg="..highlight_color)
vim.cmd("hi def IlluminatedWordWrite guibg="..highlight_color)
vim.cmd("hi todo guibg="..highlight_color)
vim.cmd("hi LspReferenceText guibg="..highlight_color)
vim.cmd("hi LspReferenceWrite guibg="..highlight_color)
vim.cmd("hi LspReferenceRead guibg="..highlight_color)
