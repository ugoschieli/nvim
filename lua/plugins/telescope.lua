return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },
  },
  keys = {
    { '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' } },
    { '<leader>fk', require('telescope.builtin').keymaps, { desc = '[F]ind [K]eymaps' } },
    { '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' } },
    { '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' } },
    { '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind [G]rep' } },
    { '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' } },
    { '<leader>fr', require('telescope.builtin').resume, { desc = '[F]ind [R]esume' } },
    { '<leader>f.', require('telescope.builtin').oldfiles, { desc = '[F]ind Recent Files' } },
    { '<leader><leader>', require('telescope.builtin').buffers, { desc = 'Find existing buffers' } },
  },
  config = function(_, opts)
    require('telescope').setup {
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          hidden = true,
        },
        buffers = {
          sort_lastused = true,
          sort_mru = true,
          ignore_current_buffer = true,
        },
      },
    }
    require('telescope').load_extension 'fzf'
  end,
}
