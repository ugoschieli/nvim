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
    { '<leader>fh', require('telescope.builtin').help_tags, desc = 'Find help' },
    { '<leader>fk', require('telescope.builtin').keymaps, desc = 'Find keymaps' },
    { '<leader>ff', require('telescope.builtin').find_files, desc = 'Find files' },
    { '<leader>fw', require('telescope.builtin').grep_string, desc = 'Find current word' },
    { '<leader>fg', require('telescope.builtin').live_grep, desc = 'Find grep' },
    { '<leader>fd', require('telescope.builtin').diagnostics, desc = 'Find diagnostics' },
    { '<leader>fr', require('telescope.builtin').resume, desc = 'Find resume' },
    { '<leader>f.', require('telescope.builtin').oldfiles, desc = 'Find recent files' },
    { '<leader><leader>', require('telescope.builtin').buffers, desc = 'Find existing buffers' },
  },
  opts = {
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
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension 'fzf'
  end,
}
