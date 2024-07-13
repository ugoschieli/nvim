vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.o.swapfile = false

vim.g.mapleader = ' '
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menu,menuone'

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.termguicolors = true
vim.o.showmode = false
vim.o.cursorline = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
    source = true,
  },
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
  },
}
