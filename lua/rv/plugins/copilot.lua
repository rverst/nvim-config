-- https://github.com/zbirenbaum/copilot.lua
--
-- Pure Lua replacement for github/copilot.vim.
-- Suggestions and panel are disabled — completions are handled by blink-cmp-copilot.
-- Requires: node (auto-installed via brew on macOS)

return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  enabled = not vim.g.vscode,
  build = function()
    require('rv.utils').ensure_installed('node')
  end,
  event = { 'InsertEnter' },
  opts = {
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
      gitcommit = true,
      gitrebase = true,
      ['.'] = false,
    },
  },
}
