local map = require 'senyc.utils'.default_map
local get_home_dir = require 'senyc.utils'.get_home_dir
local functions = require 'senyc.functions'

-- Exit insert mode
-- This allows <C-c> in visual block mode to work as expected
map("i", "<C-c>", "<Esc>")
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
-- Y yanks to the end of the line
map('n', 'Y', 'y$')
-- Allow for visual mode to move lines
map('v', 'J', [[:m '>+1<cr>gv=gv]])
map('v', 'K', [[:m '<-2<CR>gv=gv]])
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
-- White space remove
map('n', '<leader>wr', [[m`:%s/\s\+$//e<cr>``]])
-- Write quit
map('n', '<leader>wq', ':wa <cr> :qa!<cr>')
-- Word swap (does not replace unnamed register)
map('n', '<leader>ww', 'viwP')
-- Word swap (replaces unnamed register)
map('n', '<leader>wW', 'viwp')
-- Resize windows w/ arrows
map('n', '<Up>', ':resize -2<CR>')
map('n', '<Down>', ':resize +2<CR>')
map('n', '<Left>', ':vertical resize -2<CR>')
map('n', '<Right>', ':vertical resize +2<CR>')
-- Add space after cursor
map('n', 'gl', 'a <Esc>h')
-- Show current directory
map('n', '<leader>cd', function() vim.print(vim.api.nvim_buf_get_name(0)) end)
-- QuickFix navigation
map('n', '<leader>,', ':cnext<cr>zz')
map('n', '<leader>;', ':cprev<cr>zz')
-- QuickFix close
map('n', '<leader>cc', vim.cmd.cclose)
-- QuickFix open
map('n', '<leader>co', vim.cmd.copen)
-- Netrw toggle (file explorer)
map('n', '<leader>fe', functions.toggle_netrw)
-- Netrw side window (view explorer)
map('n', '<leader>ve', functions.toggle_windowed_netrw)
-- global replace
map('n', '<leader>gr', functions.replace_word_in_project)
-- Number toggle (toggles relative line numbers
map('n', '<leader>nt', function() vim.cmd "set invrelativenumber" end)
-- Renames the current file
map('n', '<leader>rn', functions.rename_current_file)

local function get_cwd()
  local home_dir = get_home_dir()
  local filename = vim.api.nvim_buf_get_name(0)
  if home_dir == "" then
    return filename
  end
  return filename:gsub(home_dir, "~")
end

map('n', '<leader>cy', function() vim.cmd('let @+ = "' .. get_cwd() .. '"') end)
