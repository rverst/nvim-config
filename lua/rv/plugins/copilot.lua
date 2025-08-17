-- https://github.com/zbirenbaum/copilot.lua
--
-- This plugin is the pure lua replacement for github/copilot.vim.

return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  enabled = not vim.g.vscode,
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
}
