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
      local lspconfig = require 'lspconfig'
      local keymaps = require 'core.keymaps'
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
          }
        end,
      }

      lspconfig.hls.setup {
        on_attach = keymaps.on_attach,
        capabilities = capabilities,
      }
    end,
  },
}
