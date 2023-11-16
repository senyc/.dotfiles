local lfs = require("lfs")
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

--- Gets all of the files in a directory and writes them to a table
--- will not return files that are in the hidden git directory
---
---@return table filetab
function M.get_all_files_in_dir(directory)
  local files = {}
  for file in lfs.dir(directory) do
    -- Checks if string includes .git
    -- the % is the escape character for the period
    if file ~= "." and file ~= ".." and not file:match(".*%.git") then
      local filepath = directory .. "/" .. file
      local mode = lfs.attributes(filepath, "mode")
      if mode == "file" then
        table.insert(files, filepath)
      elseif mode == "directory" then
        local subFiles = M.get_all_files_in_dir(filepath)
        for _, subFile in ipairs(subFiles) do
          table.insert(files, subFile)
        end
      end
    end
  end
  return files
end

return M
