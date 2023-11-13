local function enable_zen_mode()
  -- Removes line blame 
  require('gitsigns').toggle_current_line_blame()
  require("zen-mode").setup {
    window = {
      width = 90,
    },
  }
  require("zen-mode").toggle()
  vim.wo.wrap = false
  vim.wo.number = true
  -- Relative line number
  vim.wo.rnu = true
end

vim.keymap.set("n", "<leader>zm", enable_zen_mode)
