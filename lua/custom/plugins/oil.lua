-- https://github.com/stevearc/oil.nvim

vim.pack.add({ { src = 'https://github.com/stevearc/oil.nvim' } })
require('oil').setup({
  keymaps = {
    -- Prevent accidental closures of the oil buffer when hitting ctrl-c.
    ['<C-c>'] = false,
  },
})
vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' })
