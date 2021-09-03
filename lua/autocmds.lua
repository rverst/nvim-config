local utils = require('utils')
local fn = require('utils.fn')

-- highlight yank
utils.augrp('ag_hl_yank', [[TextYankPost * silent! lua vim.highlight.on_yank {on_visual = false, timeout=150}]])

-- switch numbering in insert mode
utils.augrp('ag_sw_line_number', { [[InsertEnter * set norelativenumber]], [[InsertLeave * set relativenumber]] })

-- disable line numbering in terminal buffers
utils.augrp('ag_dis_term_number', {
  [[TermOpen * startinsert]],
  [[TermOpen * nnoremap <buffer> <C-c> i<C-c>]],
  [[TermOpen * :set nonumber norelativenumber]],
})

-- check if the file was changed outside nvim
utils.augrp('ag_check_edit', [[FocusGained,Bufenter * :checktime]])

-- hightlight ToDo:, BUG!, Info:, info! fixMe: etc.
-- but we don't want to highlight things like informative or bugtracker
utils.augrp('ag_hl_todo', {
  [[WinEnter,VimEnter * :silent! call matchadd('Todo', '\<\([Tt][Oo][Dd][Oo]\|[Ii][Nn][Ff][Oo]\)\([?:!]\|\>\)', -1)]],
  [[WinEnter,VimEnter * :silent! call matchadd('Fixme', '\<\([Ff][Ii][Xx][Mm][Ee]\|[Bb][Uu][Gg]\)\([?:!]\|\>\)', -1)]],
})

-- automatic file formatting
if vim.fn.executable('stylua') == 1 then
  utils.augrp('ag_lua_fmt', {
    [[BufWritePost *.lua :silent! FormatWrite]],
  })
end

if vim.fn.executable('rustfmt') == 1 then
  utils.augrp('ag_rust_fmt', {
    [[BufWritePost *.rs :silent! FormatWrite]],
  })
end

utils.augrp('ag_go_fmt', {
  [[BufWritePost *.go :silent! Gofmt]],
})
-- delete trailing spaces on save
-- need to disable this for some file types like markdown
--utils.augrp('ag_del_wp', [[BufWritePre * %s/\s\+$//e]])

-- utils.augrp('_autest', {
-- 	[[TermOpen * :echo "TERMINAL"]]
-- })

-- ToDo:
-- Disable treesitter on telescope floating windows
-- utils.augrp('tel_dis_ts',{
--	[[User TelescopeFindPre :echo "telescope PRE"]],
--	[[User TelescopePreviewerLoaded :echo "telescope LOADED"]],
-- })
