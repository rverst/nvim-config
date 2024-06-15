return {
  'EdenEast/nightfox.nvim',
  config = function()
    require('rv.config.colorscheme')
    vim.cmd('colorscheme nightfox')
  end,
}
