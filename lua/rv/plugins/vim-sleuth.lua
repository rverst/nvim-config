-- https://github.com/tpope/vim-sleuth
--
-- Automatically detect and set 'tabstop', 'shiftwidth', and 'expandtab'
-- based on the file being edited and other files of the same type.

return {
  'tpope/vim-sleuth',
  enabled = not vim.g.vscode,
  event = 'BufRead',
  config = function()
    vim.g.sleuth_automatic = 1
  end,
}
