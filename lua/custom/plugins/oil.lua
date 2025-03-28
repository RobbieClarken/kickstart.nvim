-- https://github.com/stevearc/oil.nvim

return {
  'stevearc/oil.nvim',
  lazy = false,
  config = function()
    require('oil').setup()
    vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' })
  end,
}
