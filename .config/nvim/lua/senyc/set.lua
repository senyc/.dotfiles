vim.g.mapleader = " "

vim.opt.relativenumber = true
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.number = true
-- Denying the automatic comment extending


vim.cmd("autocmd FileType * set formatoptions-=cro")
vim.cmd(':set formatoptions-=cro')
vim.opt.formatoptions = ''
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.termguicolors = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.updatetime = 50
vim.opt.autochdir = true
vim.opt.swapfile = false
vim.opt.backup = false
-- Extending the amount of access that undotree has
vim.opt.history = 10000
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
