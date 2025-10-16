-- https://github.com/olimorris/codecompanion.nvim
-- https://codecompanion.olimorris.dev
--
--
return {
  'olimorris/codecompanion.nvim',
  enabled = not vim.g.vscode,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ravitemer/mcphub.nvim',
  },
  config = function()
    require('codecompanion').setup({
      extenssions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commanfs = true,
            show_result_in_chat = true,
          },
        },
      },
    })
  end,
}
