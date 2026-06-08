-- https://github.com/folke/which-key.nvim
--
-- Useful plugin to show you pending keybinds.

return {
  'folke/which-key.nvim',
  enabled = require('rv.utils').plugin_enabled({ vscode = false }),
  event = 'VeryLazy',
  opts = {
    preset = 'helix',
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
