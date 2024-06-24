return {
  'tpope/vim-sleuth',
  event = 'BufRead',
  config = function()
    vim.g.sleuth_automatic = 1
  end,
}
