local map = vim.keymap.set
local gitsigns = require 'gitsigns'

local opts = { remap = false, silent = true }
gitsigns.setup {
  signs = {
    add = { text = '│' },
    change = { text = '│' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '┆' },
  },
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  watch_gitdir = {
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 10,
    virt_text_priority = 10001, -- This allows diagnostics to be in front of blame
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author> • <author_time:%m/%d/%Y> • <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

-- jumps down to the next change
map('n', '<leader>jn', gitsigns.next_hunk, opts)
-- jumps up to the previous change
map('n', '<leader>jp', gitsigns.prev_hunk, opts)
