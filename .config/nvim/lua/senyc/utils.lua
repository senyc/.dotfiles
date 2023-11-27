local M = {}

--- Returns the base git directory from CWD else return error code
--- in string format
---
---@return string? err_msg
---@return string? git_dir
function M.get_git_dir()
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

--- Uses default opts param with given vim.keymap.set options
---
---@param mode table|string
---@param lhs table|string
---@param rhs string|function
function M.default_map(mode, lhs, rhs)
  local default_options = { noremap = true, silent = true }

  if type(lhs) == 'string' then
    vim.keymap.set(mode, lhs, rhs, default_options)
  elseif type(lhs) == 'table' then
    for _, possible_input in pairs(lhs) do
      vim.keymap.set(mode, possible_input, rhs, default_options)
    end
  end
end

return M
