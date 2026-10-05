return {
  'catppuccin/nvim',
  name = 'catppuccin',
  enabled = require('rv.utils').plugin_enabled({ vscode = false }),
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('catppuccin-mocha')
  end,
}

-- return {
--   'EdenEast/nightfox.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('nightfox').setup({
--       options = {
--         styles = {
--           comments = 'italic',
--           keywords = 'bold',
--           types = 'italic,bold',
--         },
--       },
--     })
--     vim.cmd.colorscheme('nordfox')
--   end,
-- }

-- return {
--   'sainnhe/gruvbox-material',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.gruvbox_material_background = 'medium'
--     vim.g.gruvbox_material_enable_italic = true
--     vim.cmd.colorscheme('gruvbox-material')
--   end,
-- }

-- return {
--   'folke/tokyonight.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme('tokyonight-night')
--   end,
-- }
