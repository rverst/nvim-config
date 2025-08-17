-- plugin.colorizer.lua
--
-- https://github.com/norcalli/nvim-colorizer.lua
-- A high-performance color highlighter for Neovim
--
-- This plugin colorizes color codes in files, e.g. #c75646, #8eb33b, #4e90a7

return {
  'norcalli/nvim-colorizer.lua',
  enabled = not vim.g.vscode,
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
