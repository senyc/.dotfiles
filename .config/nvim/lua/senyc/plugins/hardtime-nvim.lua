return {
  'm4xshen/hardtime.nvim',
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  lazy = false,
  config = function()
    require 'hardtime'.setup {
      disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
      restriction_mode = "hint"
    }
  end
}
