-- return {
--   'folke/tokyonight.nvim',
--   config = function() vim.cmd.colorscheme 'tokyonight' end,
-- }

return {
  'scottmckendry/cyberdream.nvim',
  opts = {
    transparent = true,
  },
  config = function(_, opts)
    require('cyberdream').setup(opts)
    vim.cmd.colorscheme 'cyberdream'
  end,
}
