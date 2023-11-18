vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
-- This seems to be required because
-- some other plugin is adjusting formatoptions
vim.cmd.autocmd 'FileType * set formatoptions-=cro'
-- Default tab sizing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- tabs -> spaces
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 50
vim.opt.autochdir = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.showmode = false -- No reason to show -- INSERT --
-- Extending the amount of access that undotree has
vim.opt.history = 10000
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
-- This allows for the color of the current line number to be different from others
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.wrap = false     -- display lines as one long line
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
-- Setting vimgrep to use ripgrep
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode
-- Netrw config
vim.g.netrw_banner = 1
-- Hide ../ and ./  and .git/ from entries
vim.g.netrw_list_hide = [[\.\./,\./,\.git/,__pycache__/]]
--[[
  noma: non-modifiable
  nomod: non-modified
  nu: line numbers
  bl: displays as a buffer (buflisted)
  nowrap: no word wrap
  ro: read only
--]]
vim.g.netrw_bufsettings = 'noma nomod nu bl nowrap ro'
-- 'p' opens in vertical window
vim.g.netrw_preview = 1
-- Human-readable file sizes
vim.g.netrw_sizestyle = "H"
