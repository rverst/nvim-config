-- https://github.com/folke/sidekick.nvim
--
-- A neovim plugin that provides additional functionality for LSP clients
return {
  'folke/sidekick.nvim',
  enabled = not vim.g.vscode,
  opts = {},
  keys = {
    {
      '<c-s>',
      function()
        if not require('sidekick').nes_jump_or_apply() then
          return '<c-s>'
        end
      end,
      expr = true,
      desc = 'Goto/Apply Next Edit Suggestion',
    },
    {
      '<leader>cc',
      function()
        require('sidekick.cli').toggle({ filter = { installed = true } })
      end,
      desc = 'Toggle Sidekick UI',
    },
  },
}
