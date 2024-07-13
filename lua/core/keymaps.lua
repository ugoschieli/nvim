local M = {}

vim.keymap.set(
  'n',
  '<leader>hl',
  function() vim.o.hlsearch = not vim.o.hlsearch end,
  { noremap = true, silent = true, desc = 'Toggle search highlight' }
)

vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic in loclist' })

local on_attach = function(_, buffer)
  local opts = { buffer = buffer }
  local ext = function(a, b) return vim.tbl_extend('force', a, b) end

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, ext(opts, { desc = 'Go to declaration' }))
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, ext(opts, { desc = 'Go to definition' }))
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, ext(opts, { desc = 'Hover' }))
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, ext(opts, { desc = 'Go to implementation' }))
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, ext(opts, { desc = 'Show signature' }))
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, ext(opts, { desc = 'Show type definition' }))
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, ext(opts, { desc = 'Rename symbol' }))
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, ext(opts, { desc = 'Show code actions' }))
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, ext(opts, { desc = 'Go to references' }))
end

M.on_attach = on_attach

return M
