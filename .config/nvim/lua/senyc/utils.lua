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

return M
