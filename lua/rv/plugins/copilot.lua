-- https://github.com/zbirenbaum/copilot.lua
-- This plugin is the pure lua replacement for github/copilot.vim.

return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    enabled = true,
    suggestion = {
      enabled = false,
    },
    panel = {
      enabled = false,
    },
  },
  init = function()
    vim.g.copilot_enabled = true

    vim.keymap.set('n', '<leader>up', function()
      local clients = vim.lsp.get_clients({ name = 'copilot' })

      if #clients == 0 then
        vim.cmd('Copilot enable')
        vim.g.copilot_enabled = true
      else
        vim.cmd('Copilot disable')
        vim.g.copilot_enabled = false
      end
    end, { desc = 'Toggle Copilot', silent = true })
  end,
}
