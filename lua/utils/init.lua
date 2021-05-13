local M = {}

OS = {Unknown = 1, MacOs = 2, Linux = 3, Windows = 4, WSL = 5}

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

-- set options, scopes are 'o' == global, 'b' == buffer, 'w' == window
function M.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- set keymapping
function M.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- set keymapping for buffer
function M.buf_map(buffer, mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, options)
end

-- set autocommand(s) in an autogroup, removing the autocommands in the group first (au!)
-- prevents the commands from being attached multiple times if the init.lua is sourced
function M.augrp(name, cmds)
  local cmd = vim.cmd
  cmd('aug ' .. name)
  cmd('au!')
  if type(cmds) == 'string' then
    cmd('au ' .. cmds)
  else
    for i = 1, #cmds do cmd('au ' .. cmds[i]) end
  end
  vim.cmd('aug END')
end

-- useful to check if the autocommand is ok when escaping characters
function M.augrp_dbg(name, cmds)
  local cmd = vim.cmd
  cmd(string.format('echo %q', ('aug ' .. name)))
  cmd(string.format('echo %q', ('   au!')))
  if type(cmds) == 'string' then
    cmd(string.format('echo %q', ('   au ' .. cmds)))
  else
    for i = 1, #cmds do cmd(string.format('echo %q', ('   au ' .. cmds[i]))) end
  end
  cmd(string.format('echo %q', ('aug END')))
end

function M.echo(msg) vim.cmd(string.format('echo %q', msg)) end

return M
