-- setup keymaps for test debugging

vim.opt_local.tabstop = 4
vim.keymap.set('n', '<leader>ct', function()
  require('dap-go').debug_test()
end, { desc = 'Debug test', buffer = 0 })
