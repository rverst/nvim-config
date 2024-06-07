-- https://github.com/stevearc/oil.nvim
-- A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer.

return {
  {
    'stevearc/oil.nvim',
    enabled = true,
    cmd = 'Oil',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      columns = {
        'icon',
        'permissions',
        'size',
        'mtime',
      },
      keymaps = {},
      view_options = {
        show_hidden = true,
      },
    },
    init = function()
      vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory [Oil]' })
    end,
  },
}
