-- https://github.com/christoomey/vim-tmux-navigator

vim.g.tmux_navigator_no_mappings = 1
vim.pack.add({ { src = 'https://github.com/christoomey/vim-tmux-navigator' } }, { load = true })
vim.keymap.set('n', '<A-h>', '<cmd>TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<A-j>', '<cmd>TmuxNavigateDown<cr>')
vim.keymap.set('n', '<A-k>', '<cmd>TmuxNavigateUp<cr>')
vim.keymap.set('n', '<A-l>', '<cmd>TmuxNavigateRight<cr>')
