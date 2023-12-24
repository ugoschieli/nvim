return {
  {
    'utilyre/barbecue.nvim',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'tamton-aquib/duck.nvim',
    config = function()
      vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
      vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
    end
  }
}
