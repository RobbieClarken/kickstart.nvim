vim.keymap.set('i', '<s-tab>', '<Plug>VimwikiTablePrevCell', { buffer = 0 })
vim.keymap.set(
  'i',
  '<tab>',
  "copilot#Accept('<c-r>=vimwiki#tbl#kbd_tab()<cr>')",
  { buffer = 0, silent = true, expr = true, replace_keycodes = false }
)

-- Let % jump between XML-ish tag pairs (e.g. <request> ... </request>).
-- The markdown ftplugin gets this from ftplugin/html.vim, but vimwiki doesn't.
vim.b.match_ignorecase = false
vim.b.match_words = table.concat({
  [[<!--:-->]],
  [[<\@<=\([^/!][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>]],
}, ',')
