local options = { noremap = true, silent = true }
local map = vim.keymap.set

map('i', 'jj', '<Esc>', options)
-- Buffer deletion and traversal
map('n', '<leader>l', ':bnext<cr>', options)
map('n', '<leader>h', ':bprevious<cr>', options)
map('n', '<leader>dd', [[:NvimTreeClose<cr>:bdelete<cr>]], options)
-- Centralized navigation for search and <c-d/u>
map('n', '<c-d>', '<c-d>zz', options)
map('n', '<c-u>', '<c-u>zz', options)
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
-- Allow for easy empty line adjustments
map('n', 'go', [[o<Esc>]], options)
map('n', 'gO', [[O<Esc>]], options)
map('n', 'Y', 'y$', options)
-- Allow for vis mode to move lines
map('v', 'J', ":m '>+1<cr>gv=gv", options)
map('v', 'K', ":m '<-2<CR>gv=gv", options)
-- Adjustment of cursor location in J and inverse addition for <c-j>
map('n', '<C-j>', 'a<cr><Esc>', options)
map('n', 'J', 'mzJ`z', options)
-- System clipboard adjustments

map({ 'n', 'v' }, '<leader>Y', [["+Y]], options)
map({ 'n', 'v' }, '<leader>y', [["+y]], options)
map({ 'n', 'v' }, '<leader>P', [["+P]], options)
map({ 'n', 'v' }, '<leader>p', [["+p]], options)
map({ 'n', 'v' }, '<leader>d', [["_d]], options)
-- Allow for replacing word at cursor location
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], options)
-- Removes trailing white spaces keeps cursor in the same place
map('n', '<leader>wr', [[m`:%s/\s\+$//e<cr>``]], options)
-- Save and quit on <leader>wq
map('n', '<leader>wq', ":wa <cr> :qa!<cr>")
-- Resize windows w/ control and arrows
map("n", "<C-Up>", ":resize -2<CR>", options)
map("n", "<C-Down>", ":resize +2<CR>", options)
map("n", "<C-Left>", ":vertical resize -2<CR>", options)
map("n", "<C-Right>", ":vertical resize +2<CR>", options)
-- <C-i> to insert the next key to the right of the cursor
-- vim.keymap.set("n", "<C-i>", "aX<Esc>r", {remap = true})

-- map('n',
--   '<C-i>',
--   function ()
--     vim.cmd("normal! a_")
--     vim.api.nvim_feedkeys('r', 'n', true)
--   end,
--   options
-- )
