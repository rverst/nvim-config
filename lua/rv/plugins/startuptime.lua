-- https://github.com/dstein64/vim-startuptime
--
-- Measure Neovim startup time across multiple runs (:StartupTime).
-- Runs 10 trials by default for a stable average.

return {
  'dstein64/vim-startuptime',
  enabled = not vim.g.vscode,
  cmd = 'StartupTime',
  config = function()
    vim.g.startuptime_tries = 10
  end,
}
