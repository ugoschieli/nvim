return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  opts = {
    sections = {
      lualine_a = {
        {
          'mode',
          icons_enabled = true,
          fmt = function()
            local mode_map = {
              n = '(ᴗ_ ᴗ。)',
              nt = '(ᴗ_ ᴗ。)',
              i = '(•̀ - •́ )',
              R = '( •̯́ ₃ •̯̀)',
              v = '(⊙ _ ⊙ )',
              V = '(⊙ _ ⊙ )',
              no = 'Σ(°△°ꪱꪱꪱ)',
              ['\22'] = '(⊙ _ ⊙ )',
              t = '(⌐■_■)',
              ['!'] = 'Σ(°△°ꪱꪱꪱ)',
              c = 'Σ(°△°ꪱꪱꪱ)',
              s = 'SUB',
            }
            return mode_map[vim.api.nvim_get_mode().mode] or vim.api.nvim_get_mode().mode
          end,
        },
      },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    options = { section_separators = '', component_separators = '|' },
  },
}
