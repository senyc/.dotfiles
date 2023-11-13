local builtin = require 'telescope.builtin'
local utils = require 'telescope.utils'
local actions = require 'telescope.actions'

local options = { noremap = true, silent = true }
local map = vim.keymap.set

require("telescope").setup {
  defaults = {
    file_ignore_patterns = {
      "^.git/",
      "node_modules/"
    },
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
        ['<esc>'] = actions.close,
        ['<c-c>'] = actions.close,
        ['ZZ'] = actions.close,
      },
      n = {
        ['<esc>'] = actions.close,
        ['<c-c>'] = actions.close,
        ['ZZ'] = actions.close,
      },
    },
  }
}

--- Returns the base git directory from CWD else return error code
--- in string format
---
---@return string? err_msg
---@return string? git_dir
local function get_git_dir()
  local handler = io.popen 'git rev-parse --show-toplevel 2>/dev/null'
  if not handler then
    return "Failed to execute 'git'", nil
  end

  local result = handler:read('*l')
  -- Because stderr redirected to null assumes any stdout response due to validity of call
  if result then
    return nil, result
  end
  return 'No valid return file', nil
end

-- Searches for files available in the repository including ones that are not being tracked
local function defaut_search()
  local err, gitdir = get_git_dir()
  if err then
    builtin.fd { cwd = utils.buffer_dir(), hidden = true }
  else
    builtin.fd { cwd = gitdir, hidden = true }
  end
end

local function live_git_grep()
  local err, gitdir = get_git_dir()
  if err then
    builtin.live_grep { cwd = utils.buffer_dir(), hidden = true }
  else
    builtin.live_grep { cwd = gitdir, hidden = true }
  end
end

local function git_commits()
  if not pcall(builtin.git_commits) then
    vim.print 'Not in a git repository'
  end
end

local function git_buffer_commit_diff()
  if not pcall(builtin.git_bcommits) then
    vim.print 'Not in a git repository'
  end
end

local function grep_string()
  local err, gitdir = get_git_dir()
  if err then
    builtin.grep_string { cwd = utils.buffer_dir(), hidden = true }
  else
    builtin.grep_string { cwd = gitdir, hidden = true }
  end
end

-- find file
map('n', '<leader>ff', defaut_search, options)
-- find vim help
map('n', '<leader>fh', builtin.help_tags, options)
-- find live git grep
map('n', '<leader>fg', live_git_grep, options)
-- find commits in repo
map('n', '<leader>fc', git_commits, options)
-- find man page entries
map('n', '<leader>fm', builtin.man_pages, options)
-- find git buffer commit diff
map('n', '<leader>fd', git_buffer_commit_diff, options)
-- find references
map('n', '<leader>fr', builtin.lsp_references, options)
-- find buffer
map('n', '<leader>fb', builtin.buffers, options)
-- telescope resume
map('n', '<leader>tr', builtin.resume, options)
-- find word
map('n', '<leader>fw', grep_string, options)
-- files old
map('n', '<leader>fo', builtin.oldfiles, options)
