-- https://github.com/gbprod/yanky.nvim
--
-- The aim of yanky.nvim is to improve yank and put functionalities for Neovim

return {
  'gbprod/yanky.nvim',
  enabled = true,
  event = 'VimEnter',
  dependencies = {
    'kkharji/sqlite.lua',
  },
  opts = {
    ring = {
      history_length = 100,
      storage = 'sqlite',
      storage_path = vim.fn.stdpath('data') .. '/databases/yanky.db',
    },
    highlight = {
      timer = 150,
    },
  },
  init = function()
    require('telescope').load_extension('yank_history')
    vim.keymap.set('n', '<leader>fy', '<cmd>Telescope yank_history<cr>', { desc = 'Yank History' })

    vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
    vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
    vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
    vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')

    vim.keymap.set('n', '<c-p>', '<Plug>(YankyPreviousEntry)')
    vim.keymap.set('n', '<c-n>', '<Plug>(YankyNextEntry)')

    vim.keymap.set('n', '<leader>uy', '<Plug>(YankyClearHistory)', { desc = 'Clear Yank History' })
  end,
}
