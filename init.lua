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
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {
  install = {
    colorscheme = { 'kanagawa' },
  },
}

local plugins = {
  {
    'rebelot/kanagawa.nvim',
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none',
            },
          },
        },
      },
    },
    config = function(_, opts)
      require('kanagawa').setup(opts)
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = 'all',
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'gr,',
        },
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'folke/neodev.nvim',
        opts = {},
      },
    },
    opts = {},
    config = function(_, opts)
      local lspconfig = require 'lspconfig'

      local on_attach = function(client, bufnr)
        local bufopts = { buffer = bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      end

      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      }

      lspconfig.hls.setup {
        on_attach = on_attach,
      }

      lspconfig.clangd.setup {
        on_attach = on_attach,
      }
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = {},
    config = function(_, opts)
      require('telescope').setup(opts)
      require('telescope').load_extension('fzf')
    end,
  },
  {
    'mhartington/formatter.nvim',
    opts = function()
      return {
        filetype = {
          lua = {
            require('formatter.filetypes.lua').stylua,
          },
        },
      }
    end,
    keys = {
      { '<leader>f', '<Cmd>FormatWrite<CR>', 'n' },
    },
  },
  {
    'utilyre/barbecue.nvim',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    'mrjones2014/smart-splits.nvim',
    opts = {
      at_edge = function(context)
        local ss = require 'smart-splits'
        context.split()
        if context.direction == 'right' then
          ss.move_cursor_right()
        elseif context.direction == 'down' then
          ss.move_cursor_down()
        end
      end,
    },
    keys = {
      {
        '<C-h>',
        function()
          require('smart-splits').move_cursor_left()
        end,
        'n',
      },
      {
        '<C-j>',
        function()
          require('smart-splits').move_cursor_down()
        end,
        'n',
      },
      {
        '<C-k>',
        function()
          require('smart-splits').move_cursor_up()
        end,
        'n',
      },
      {
        '<C-l>',
        function()
          require('smart-splits').move_cursor_right()
        end,
        'n',
      },
    },
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
  },
}

require('lazy').setup(plugins, lazy_opts)

-- KEYBINDINGS

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist)
