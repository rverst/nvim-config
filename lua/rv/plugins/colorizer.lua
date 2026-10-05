-- plugin.colorizer.lua
--
-- https://github.com/catgoose/nvim-colorizer.lua
-- A high-performance color highlighter for Neovim
--
-- This plugin colorizes color codes in files, e.g. #c75646, #8eb33b, #4e90a7

return {
  'catgoose/nvim-colorizer.lua',
  enabled = require('rv.utils').plugin_enabled({ vscode = false }),
  cmd = { 'ColorizerToggle', 'ColorizerAttachToBuffer' },
  config = function()
    require('colorizer').setup({
      filetypes = {
        'css',
        'scss',
        'sass',
        'html',
      },
    })
  end,
}
