return {
  'ellisonleao/gruvbox.nvim',
  config = function()
    require('gruvbox').setup({
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = false,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = 'hard', -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    })
    vim.cmd('colorscheme gruvbox')
  end,
}

-- return {
--   dir = '~/Dev/smyckbuddy',
--   dependencies = {
--     'tjdevries/colorbuddy.vim',
--   },
--   config = function()
--     vim.cmd('colorscheme gruvbuddy')
--   end,
-- }
-- local scheme = {}
-- scheme['catppuccin'] = {
--   'catppuccin/nvim',
--   version = false,
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('catppuccin').setup({
--       flavour = 'mocha',
--     })
--
--     vim.cmd.colorscheme('catppuccin')
--   end,
-- }
--
-- scheme['everforest'] = {
--   'neanias/everforest-nvim',
--   version = false,
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('everforest').setup({
--       background = 'hard',
--       italics = true,
--       disable_italic_comments = false,
--       on_highlights = function(hl, _)
--         hl['@string.special.symbol.ruby'] = { link = '@field' }
--       end,
--       vim.cmd.colorscheme('everforest'),
--     })
--   end,
-- }
--
-- scheme['tokionight'] = {
--   'folke/tokyonight.nvim',
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     vim.cmd.colorscheme('tokyonight-night')
--
--     vim.cmd.hi('Comment gui=none')
--   end,
-- }
--
--
-- return scheme['tokionight']
