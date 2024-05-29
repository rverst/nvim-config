-- plugin.colorizer.lua
--
-- https://github.com/norcalli/nvim-colorizer.lua
-- A high-performance color highlighter for Neovim
--
-- This plugin colorizes color codes in files, e.g. #c75646, #8eb33b, #4e90a7

local plugin = {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup({
      filetypes = {
        'css',
        'scss',
        'sass',
        'html',
      },
    })

    vim.keymap.set('n', '<leader>uc', ':ColorizerToggle<cr>', { desc = 'Toggle Colorizer', silent = true })
  end,
}

return plugin

