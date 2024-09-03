-- https://github.com/folke/which-key.nvim
--
-- Useful plugin to show you pending keybinds.

return {
  'folke/which-key.nvim',
  enabled = true,
  event = 'VeryLazy',
  opts = {},
  keys = {
    { '<leader>c', group = '[C]ode' },
    { '<leader>c_', hidden = true },
    { '<leader>d', group = '[D]ocument' },
    { '<leader>d_', hidden = true },
    { '<leader>f', group = '[F]ind' },
    { '<leader>f_', hidden = true },
    { '<leader>g', group = '[G]enerate' },
    { '<leader>g_', hidden = true },
    { '<leader>h', group = '[H]arpoon' },
    { '<leader>h_', hidden = true },
    { '<leader>o', group = '[O]pen' },
    { '<leader>o_', hidden = true },
    { '<leader>r', group = '[R]ename' },
    { '<leader>r_', hidden = true },
    { '<leader>u', group = '[U]tils' },
    { '<leader>u_', hidden = true },
    { '<leader>w', group = '[W]orkspace' },
    { '<leader>w_', hidden = true },
  },
}
