-- https://github.com/stevearc/oil.nvim

return {
  'stevearc/oil.nvim',
  lazy = false,
  config = function()
    require('oil').setup()
  end,
}
