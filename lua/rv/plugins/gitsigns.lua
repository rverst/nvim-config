-- https://github.com/lewis6991/gitsigns.nvim
--
-- Super fast git decorations implemented purely in Lua

return {
  'lewis6991/gitsigns.nvim',
  enabled = true,
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}
