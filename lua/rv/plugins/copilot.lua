-- https://github.com/zbirenbaum/copilot.lua
--
-- This plugin is the pure lua replacement for github/copilot.vim.

return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  enabled = true,
  event = { 'InsertEnter' },
  opts = {
    enabled = true,
    suggestion = {
      enabled = false,
    },
    panel = {
      enabled = false,
    },
    filetypes = {
      yaml = true,
      markdown = true,
      help = true,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ['.'] = false,
    },
  },
  -- Moved to snacks.lua
  -- init = function()
  --   vim.g.copilot_enabled = true
  --
  --   vim.keymap.set('n', '<leader>up', function()
  --     local clients = vim.lsp.get_clients({ name = 'copilot' })
  --
  --     if #clients == 0 then
  --       vim.cmd('Copilot enable')
  --       vim.g.copilot_enabled = true
  --     else
  --       vim.cmd('Copilot disable')
  --       vim.g.copilot_enabled = false
  --     end
  --   end, { desc = 'Toggle Copilot', silent = true })
  -- end,
}
