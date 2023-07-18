require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    python = {
      {
        exe = "black",
        args = {
          "-q",
          "--skip-string-normalization",
          "-",
        },
        stdin = true,
      }
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}
