require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash",
    "c",
    "lua",
    "vim",
    "vimdoc",
    "ruby",
    "javascript",
    "python"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
