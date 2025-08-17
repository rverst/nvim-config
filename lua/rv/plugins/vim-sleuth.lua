return {
  'tpope/vim-sleuth',
  enabled = not vim.g.vscode,
  event = 'BufRead',
  config = function()
    vim.g.sleuth_automatic = 1
  end,
}
