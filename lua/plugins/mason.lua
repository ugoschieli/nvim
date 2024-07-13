return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'zapling/mason-conform.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'stevearc/conform.nvim',
    },
    lazy = false,
    config = function()
      local keymaps = require 'core.keymaps'
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local handlers = {
        ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
        ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
      }

      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls' },
      }
      require('mason-conform').setup {}

      require('mason-lspconfig').setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            on_attach = keymaps.on_attach,
            capabilities = capabilities,
            handlers = handlers,
          }
        end,
      }
    end,
  },
}
