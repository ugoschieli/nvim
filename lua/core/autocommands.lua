vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'json', 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'haskell' },
  callback = function(_)
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd('BufRead', {
  pattern = { '*' },
  callback = function(_)
    local filename = vim.fn.expand '%:t'
    if filename == 'compose.yml' or filename == 'docker-compose.yml' then vim.bo.filetype = 'yaml.docker-compose' end
  end,
})
