local utils = require('senyc.utils')
local options = { noremap = true, silent = true }

--- Gets all of the current files in the git directory and will
--- replace the given word with the word that is currently under on the cursor
local function sed_replace_git_dir()
  -- Gets the word under the cursor
  local current_word = vim.fn.expand('<cword>')
  local err, gitdir = utils.get_git_dir()
  if err then
    vim.print(err)
    return
  end
  vim.ui.input({ prompt = 'replace ' .. current_word .. ' with: ' }, function(input)
    local filetab = utils.get_all_files_in_dir(gitdir)
    for _, file in ipairs(filetab) do
      -- Calls sed with the word under the cursor, and the input
      local handler = io.popen "sed -i 's/" .. current_word .. '/' .. input .. "/g' " .. file
      if not handler then
        vim.print('failed to execute sed')
        return
      end
    end
    -- Reloads the current buffer to display changes
    vim.cmd('e!')
  end)
end

vim.keymap.set('n', '<leader>S', sed_replace_git_dir, options)
