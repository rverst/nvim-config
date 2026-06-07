-- Typst: 2-space indent, C-style line comments
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true
vim.opt_local.commentstring = '// %s'
-- Soft-wrap for prose editing comfort
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
-- Disable extending comment leader on 'o'/'O' in normal mode
vim.opt_local.formatoptions:remove({ 'o' })
