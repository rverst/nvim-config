-- https://github.com/tpope/vim-sleuth
--
-- Automatically detect and set 'tabstop', 'shiftwidth', and 'expandtab'
-- based on the file being edited and other files of the same type.

return {
  'tpope/vim-sleuth',
  enabled = require('rv.utils').plugin_enabled({ vscode = false }),
  event = 'BufRead',
  config = function()
    vim.g.sleuth_automatic = 1
  end,
}
