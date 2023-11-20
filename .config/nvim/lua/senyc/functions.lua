local utils = require 'senyc.utils'

local M = {}
function M.toggle_netrw()
  if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'netrw' then
    vim.cmd.Ex()
  else
    vim.cmd.bdelete()
  end
end

function M.toggle_windowed_netrw()
  local killed_netrw = false
  local current_win = vim.api.nvim_get_current_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    vim.api.nvim_set_current_win(win)
    if vim.bo.filetype == 'netrw' then
      vim.cmd.q()
      killed_netrw = true
      break
    end
  end

  if not killed_netrw then
    vim.cmd('Vex!')
  end
  pcall(vim.api.nvim_set_current_win, current_win)
end

function M.replace_word_in_project()
  -- Get word under cursor
  local current_word = vim.fn.expand '<cword>'
  local err, gitdir = utils.get_git_dir()
  if current_word == nil then
    vim.print 'Please place cursor on word you would like to replace'
    return
  end

  if err then
    vim.print 'Not in a git repository'
    return
  end

  vim.cmd('silent grep ' .. current_word .. ' ' .. gitdir)

  vim.ui.input({ prompt = 'replace ' .. current_word .. ' with: ' }, function(input)
    -- Test for <C-c>
    if not input:find("\3") or input:find("\x03") then
      vim.cmd('silent cdo ' .. 's/' .. current_word .. '/' .. input .. '/')
    end
  end)
end

return M
