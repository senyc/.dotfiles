local map = require 'senyc.utils'.default_map

-- exit insert mode
map('i', 'jj', '<Esc>')
map('i', 'jJ', '<Esc>')
-- Buffer deletion and traversal
map('n', '<leader>l', vim.cmd.bnext)
map('n', '<leader>h', vim.cmd.bprevious)
map('n', '<leader>bd', vim.cmd.bdelete)
-- Centralized navigation for search and <c-d/u>
map('n', '<c-d>', '<c-d>zz')
map('n', '<c-u>', '<c-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
-- Allow for easy empty line adjustments
map('n', 'go', 'o<Esc>')
map('n', 'gO', 'O<Esc>')
map('n', 'Y', 'y$')
-- Allow for visual mode to move lines
map('v', 'J', ":m '>+1<cr>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
-- Adjustment of cursor location in J and inverse addition for <c-j>
map('n', '<C-j>', 'a<cr><Esc>')
map('n', 'J', 'mzJ`z')
-- System clipboard adjustments
map({ 'n', 'v' }, '<leader>Y', [["+Y]])
map({ 'n', 'v' }, '<leader>y', [["+y]])
map({ 'n', 'v' }, '<leader>P', [["+P]])
map({ 'n', 'v' }, '<leader>p', [["+p]])
-- Deletion to system clipboard
map({ 'n', 'v' }, '<leader>d', [["+d]])
-- Deletion to the null buffer
map({ 'n', 'v' }, '<leader>x', [["_d]])
-- Allow for replacing word at cursor location
map('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Removes trailing white spaces keeps cursor in the same place
map('n', '<leader>wr', [[m`:%s/\s\+$//e<cr>``]])
-- Save and quit on <leader>wq
map('n', '<leader>wq', ':wa <cr> :qa!<cr>')
-- Resize windows w/ control and arrows
map('n', '<C-Up>', ':resize -2<CR>')
map('n', '<C-Down>', ':resize +2<CR>')
map('n', '<C-Left>', ':vertical resize -2<CR>')
map('n', '<C-Right>', ':vertical resize +2<CR>')
-- Add space after cursor
map('n', 'gl', 'a <Esc>h')
-- Show current directory
map('n', '<leader>cd', vim.cmd.pwd)
-- QuickFix navigation
map('n', '<leader>,', ':cnext<cr>zz')
map('n', '<leader>;', ':cprev<cr>zz')
-- QuickFix close
map('n', '<leader>cc', vim.cmd.cclose)

-- Netrw bindings
local function toggle_netrw()
  if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'netrw' then
    vim.cmd.Ex()
  else
    vim.cmd.bdelete()
  end
end

map('n', '<leader>fe', toggle_netrw)
