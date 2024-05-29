local scheme = {}
scheme['catppuccin'] = {
  'catppuccin/nvim',
  version = false,
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      flavour = 'latte',
    })

    vim.cmd.colorscheme('catppuccin')
  end,
}

scheme['everforest'] = {
  'neanias/everforest-nvim',
  version = false,
  lazy = false,
  priority = 1000,
  config = function()
    require('everforest').setup({
      background = 'hard',
      italics = true,
      disable_italic_comments = false,
      on_highlights = function(hl, _)
        hl['@string.special.symbol.ruby'] = { link = '@field' }
      end,
      vim.cmd.colorscheme('everforest'),
    })
  end,
}

scheme['tokionight'] = {
  'folke/tokyonight.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd.colorscheme('tokyonight-night')

    vim.cmd.hi('Comment gui=none')
  end,
}

return scheme['everforest']
