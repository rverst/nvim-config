local plugin = {
  'onsails/diaglist.nvim',
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

return plugin
