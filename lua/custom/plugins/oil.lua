-- https://github.com/stevearc/oil.nvim

vim.pack.add({ { src = 'https://github.com/stevearc/oil.nvim' } })
require('oil').setup()
vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' })
