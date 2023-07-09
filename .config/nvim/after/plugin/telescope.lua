local builtin = require('telescope.builtin')
local utils = require("telescope.utils")
local actions = require("telescope.actions")

local options = { noremap = true, silent = true }
local map = vim.keymap.set

require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
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
  pickers = {
    find_files = {
      -- theme = 'dropdown',
    }
  },
}

local function find_files_home()
  builtin.find_files { cwd = vim.fn.expand('$HOME'), hiden = true }
end

local function find_files_cwd()
  builtin.find_files { cwd = utils.buffer_dir() }
end

-- to do remove this encapsulation buffer_dir is much better than cwd
local function grep_dynamic(environment)
  builtin.grep_string {
    cwd = vim.fn.expand(environment),
    search = vim.fn.input("Search " .. vim.fn.expand(environment) .. ": ")
  }
end

local function grep_git()
  local git_dir = vim.fn.system(
    string.format(
      "git -C %s rev-parse --show-toplevel",
      vim.fn.expand("%:p:h")
    )
  )
  -- remove newline character from git_dir
  local sanitized_git_dir = string.gsub(git_dir, "\n", "")
  local opts = {
    cwd = sanitized_git_dir,
    search = vim.fn.input("Git Grep " .. sanitized_git_dir .. ": ")
  }
  builtin.grep_string(opts)
end

local function grep_home()
  grep_dynamic('$HOME')
end

local function grep_cwd()
  local buffer_dir = utils.buffer_dir()
  builtin.grep_string {
    cwd = buffer_dir,
    search = vim.fn.input("Git Grep " .. buffer_dir .. ": ")
  }
end

-- file <directive>
map('n', '<leader>ff', find_files_cwd, options)
map('n', '<leader>fh', find_files_home, options)
map('n', '<leader>fg', builtin.git_files, options)
-- find references
map('n', '<leader>fr', builtin.lsp_references)

-- grep <directive>
map('n', '<leader>gh', grep_home, options)
map('n', '<leader>gf', grep_cwd, options)
map('n', '<leader>gg', grep_git, options)
