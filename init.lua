vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.o.termguicolors = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.showmode = false
vim.wo.signcolumn = 'number'

vim.o.undofile = true

vim.o.mouse = ''

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function(_)
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {
  install = {
    colorscheme = { 'kanagawa' },
  },
}

require('lazy').setup('plugins', lazy_opts)
