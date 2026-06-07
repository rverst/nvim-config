-- Rust: 4-space indent, C-style line comments
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true
vim.opt_local.commentstring = '// %s'
-- Disable extending comment leader on 'o'/'O' in normal mode
vim.opt_local.formatoptions:remove({ 'o' })
