local options = { noremap = true, silent = true }
local map = vim.keymap.set

map('i','jj', '<Esc>', options)
-- Buffer deletion and traversal
map('n', '<leader>l', ':bnext<CR>', options)
map('n', '<leader>h', ':bprevious<CR>', options)
map('n', '<leader>dd', ':w<CR> :NvimTreeClose <cr> :bdelete<cr> :LspRestart<cr>', options)
map('n', '<leader>d!', ':bdelete<CR>', options)
-- Centralized navigation
map('n', '<c-d>', '<c-d>zz', options)
map('n', '<c-u>', '<c-u>zz', options)
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
-- Allow for easy empty line adjustments
map('n', 'go', [[:set paste<CR>m`o<Esc>``:set nopaste<CR>]],{noremap = true} )
map('n', 'gO', [[:set paste<CR>m`O<Esc>``:set nopaste<CR>]], options)
map('n', 'Y', 'y$', options)
-- Allow for vis mode to move lines
map('v', 'J', ":m '>+1<CR>gv=gv", options)
map('v', 'K', ":m '<-2<CR>gv=gv", options)
-- Adjustment of cursor location in J and inverse addition
map('n', '<C-j>', 'a<cr><Esc>13', options)
map('n', 'J', 'mzJ`z', options)
-- System clipboard adjustments
map({'n','v'}, '<leader>Y', [["+Y]], options)
map({'n','v'}, '<leader>y', [["+y]], options)
map({'n','v'}, '<leader>P', [["+P]], options)
map({'n','v'}, '<leader>p', [["+p]], options)
map({'n','v'}, '<leader>d', [["_d]], options)
-- Allow for replacing word at cursor location
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], options)
-- Removes trailing white spaces keeps cursor in the same place
map('n', '<leader>rw', [[m`:%s/\s\+$//e<cr>``]], options)
-- Save and quit on <leader>wq
map('n', '<leader>wq', ":wa <cr> :qa!<cr>")
-- Remap to highlight all of the file
map('n', '<C-a>', 'GVgg', options)
