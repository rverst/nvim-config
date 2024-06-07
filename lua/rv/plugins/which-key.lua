-- https://github.com/folke/which-key.nvim
--
-- Useful plugin to show you pending keybinds.

return {
  'folke/which-key.nvim',
  enabled = true,
  event = 'VimEnter',
  config = function()
    require('which-key').setup({
      show_help = false,
      show_keys = false,
    })

    -- Document existing key chains
    require('which-key').register({
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]enerate', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
      ['<leader>o'] = { name = '[O]pen', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>u'] = { name = '[U]tils', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    })
  end,
}
