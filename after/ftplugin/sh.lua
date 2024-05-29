-- set tabstop narrower than default (8) and don't extend comments when pressing 'o' or 'O'

vim.opt_local.tabstop = 4
vim.opt_local.formatoptions:remove('o')
