local builtin = require('telescope.builtin')
local options = { noremap = true }
local map = vim.keymap.set
local utils = require("telescope.utils")
local actions = require("telescope.actions")
local media = { "*.jpeg", "*.png", "*.jpg", "*.mp4", "*.pdf" }
local modules = {"node%_modules/.*"}
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<c-c>"] = actions.close,
      },
      n = {
        ["<esc>"] = actions.close,
        ["<c-c>"] = actions.close,
      },
    },
  },
})

map(
  'n', '<leader>ff',
  function() builtin.find_files({ cwd = utils.buffer_dir()}) end,
  options
)
map(
  'n', '<leader>fh',
  function() builtin.find_files({ cwd = vim.fn.expand('$HOME')}) end,
  options
)
map('n', '<leader>fg', builtin.git_files)
-- Requires ripgrep
map(
  'n', '<leader>gg',
  function() builtin.grep_string({
    search = vim.fn.input("Search " .. utils.buffer_dir() .. ": ") })
  end,
  options
)
map(
  'n', '<leader>gh',
  function() builtin.grep_string({
    cwd = vim.fn.expand('$HOME'),
    search = vim.fn.input("Search " .. vim.fn.expand('$HOME') .. ": ") })
  end,
  options
)
