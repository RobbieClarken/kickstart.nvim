vim.pack.add({ 'https://github.com/rcarriga/nvim-notify' })

local notify = require('notify')
vim.notify = notify
notify.setup({
  icons = {
    ERROR = '✗',
    INFO = 'ℹ',
    TRACE = '✎',
    WARN = '',
    DEBUG = '',
  },
  merge_duplicates = true,
})
