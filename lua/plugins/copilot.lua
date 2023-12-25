return {
  {
    'zbirenbaum/copilot.lua',
    build = 'Copilot auth',
    event = 'InsertEnter',
    cmd = 'Copilot',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    'zbirenbaum/copilot-cmp',
    event = 'InsertEnter',
    dependencies = 'zbirenbaum/copilot.lua',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}
