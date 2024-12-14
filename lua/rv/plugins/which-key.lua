-- https://github.com/folke/which-key.nvim
--
-- Useful plugin to show you pending keybinds.

return {
  'folke/which-key.nvim',
  enabled = true,
  event = 'VeryLazy',
  opts = {
    preset = 'modern',
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
