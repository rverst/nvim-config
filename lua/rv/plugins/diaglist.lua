-- https://github.com/onsails/diaglist.nvim
--
-- Live-updating Neovim LSP diagnostics in quickfix and loclist

return {
  'onsails/diaglist.nvim',
  enabled = true,
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local diaglist = require('diaglist')

    diaglist.init({
      debug = false,
      debounce_ms = 150,
    })

    -- vim.keymap.set('n', '<leader>dw', diaglist.open_all_diagnostics(), { desc = 'LSP: [A]ll diagnostics' })
    -- vim.keymap.set('n', '<leader>db', diaglist.open_buffer_diagnostics(), { desc = 'LSP: [B]uffer diagnostics' })
  end,
}
