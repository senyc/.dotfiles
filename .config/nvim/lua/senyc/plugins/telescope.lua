return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,
  config = function()
    local builtin = require 'telescope.builtin'
    local utils = require 'telescope.utils'
    local actions = require 'telescope.actions'

    local get_git_dir = require 'senyc.utils'.get_git_dir

    local options = { noremap = true, silent = true }

    require 'telescope'.setup {
      defaults = {
        file_ignore_patterns = {
          '^.git/',
          'node_modules/'
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
    vim.keymap.set('n', '<leader>ff', defaut_search, options)
    -- find vim help
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, options)
    -- find live git grep
    vim.keymap.set('n', '<leader>fg', live_git_grep, options)
    -- find commits in repo
    vim.keymap.set('n', '<leader>fc', git_commits, options)
    -- find man page entries
    vim.keymap.set('n', '<leader>fm', builtin.man_pages, options)
    -- find git buffer commit diff
    vim.keymap.set('n', '<leader>fd', git_buffer_commit_diff, options)
    -- find references
    vim.keymap.set('n', '<leader>fr', builtin.lsp_references, options)
    -- find buffer
    vim.keymap.set('n', '<leader>fb', builtin.buffers, options)
    -- telescope resume
    vim.keymap.set('n', '<leader>tr', builtin.resume, options)
    -- find word
    vim.keymap.set('n', '<leader>fw', grep_string, options)
    -- files old
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, options)
  end
}
