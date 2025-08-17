-- plugin/startuptime.lua
--

local plugin = {
  'dstein64/vim-startuptime',
  enabled = not vim.g.vscode,
  cmd = 'StartupTime',
  config = function()
    vim.g.startuptime_tries = 10
  end,
}

return plugin
