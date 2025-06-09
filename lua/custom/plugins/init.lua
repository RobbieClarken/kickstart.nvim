return {
  'tpope/vim-abolish', -- add :%S/Foo/Bar/
  'github/copilot.vim',
  {
    'rcarriga/nvim-notify',
    config = function()
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
    end,
  },
  {
    'm4xshen/hardtime.nvim',
    lazy = false,
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {
      disable_mouse = false,
    },
  },
}
