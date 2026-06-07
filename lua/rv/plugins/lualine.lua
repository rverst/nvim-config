-- https://github.com/nvim-lualine/lualine.nvim
--
-- Fast and configurable statusline. Config lives in lua/rv/config/lualine.lua.
-- Includes harpoon-lualine to display Harpoon marks in the statusline.

return {
  'nvim-lualine/lualine.nvim',
  enabled = not vim.g.vscode,
  event = { 'VimEnter' },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    { 'letieu/harpoon-lualine', dependencies = {
      { 'ThePrimeagen/harpoon', branch = 'harpoon2' },
    } },
  },
  config = function()
    require('rv.config.lualine')
  end,
}
