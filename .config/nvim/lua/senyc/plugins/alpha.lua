return {

  'goolord/alpha-nvim',
  lazy = false,
  config = function()
    require('alpha').setup(require('senyc.home'))
  end
}
