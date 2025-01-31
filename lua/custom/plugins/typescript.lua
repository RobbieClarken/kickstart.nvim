-- https://github.com/pmizio/typescript-tools.nvim

return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    require('typescript-tools').setup({
      on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set('n', '<leader>ri', '<cmd>TSToolsAddMissingImports<cr>', opts)
        vim.keymap.set('n', '<leader>ru', '<cmd>TSToolsRemoveUnusedImports<cr>', opts)
      end,
    })
  end,
}
