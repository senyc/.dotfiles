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
    vim.cmd 'Vex!'
  end
  pcall(vim.api.nvim_set_current_win, current_win)
end

--- Gets word under cursor and executes replacement
--- action across the entire project (based on root git dir)
function M.replace_word_in_project()
  -- Get word under cursor
  local current_word = vim.fn.expand '<cword>'
  if current_word == nil then
    vim.print 'Please place cursor on word to replace'
    return
  end

  local err, gitdir = utils.get_git_dir()
  if err then
    vim.print 'Not a git repository'
    return
  end

  -- Save current buffer as grep moves to most recent updated buffer
  local current_buf = vim.api.nvim_get_current_buf()

  vim.cmd('silent grep ' .. current_word .. ' ' .. gitdir)

  vim.ui.input({ prompt = 'replace ' .. current_word .. ' with: ' }, function(input)
    -- Test for <C-c>
    if input ~= nil and not input:find "\3" and not input:find "\x03" then
      pcall(function() vim.cmd('silent cdo ' .. 's/' .. current_word .. '/' .. input .. '/') end)
    end
  end)
  -- Return to original buffer
  vim.api.nvim_set_current_buf(current_buf)
end

function M.rename_current_file()
  local filename = vim.api.nvim_buf_get_name(0)
  local basename = filename:match("^.+/(.+)$")

  vim.ui.input({ prompt = 'replace ' .. basename .. ' with: ' }, function(input)
    local newname = basename:gsub(basename, input)
    vim.cmd("file " .. newname)
    vim.cmd.w()
    vim.cmd("!rm " .. filename)
  end)
end

function M.pwd_popup()
  local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" };
  local popup = require "plenary.popup"
  local win_id = popup.create(utils.get_formatted_path(), {
    title = "PWD",
    enter = false,
    padding = { 0, 3, 0, 3 },
    borderchars = borderchars
  })
  -- This adds temporary key mappings that will kill the window, then remove themselves
  -- I'm not sure that vim has a native way to just detect a keypress
  vim.api.nvim_buf_set_keymap(0, "n", "j",
    'j<cmd>lua vim.api.nvim_win_close(' .. win_id .. ", true); vim.cmd('unmap <buffer> j'); vim.cmd('unmap <buffer> k')<CR>", { noremap = true })
  vim.api.nvim_buf_set_keymap(0, "n", "k",
    'k<cmd>lua vim.api.nvim_win_close(' .. win_id .. ", true); vim.cmd('unmap <buffer> k'); vim.cmd('unmap <buffer> j')<CR>", { noremap = true })
end

return M
