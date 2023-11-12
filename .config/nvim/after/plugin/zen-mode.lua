local function enable_zen_mode()
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
