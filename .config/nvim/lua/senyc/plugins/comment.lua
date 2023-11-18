return {
  'numToStr/Comment.nvim',
  keys = "gc",
  lazy = true,
  config = function()
    require "Comment".setup()
  end
}
