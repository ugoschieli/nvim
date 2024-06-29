return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'windwp/nvim-ts-autotag', 'nvim-treesitter/nvim-treesitter-textobjects' },
  build = ':TSUpdate',
  event = 'VeryLazy',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = 'all',
      highlight = { enable = true },
      autotag = { enable = true },
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
            ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
          },
        },
      },
    }
  end,
}
