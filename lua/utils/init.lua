local M = {}

OS = { Unknown = 1, MacOs = 2, Linux = 3, Windows = 4, WSL = 5 }

local scopes = { o = vim.o, b = vim.bo, w = vim.wo }

-- merge two tables
function M.merge(t1, t2)
  for k, v in ipairs(t2) do
    table.insert(t1, v)
  end
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
    for i = 1, #cmds do
      cmd('au ' .. cmds[i])
    end
  end
  vim.cmd('aug END')
end

-- useful to check if the autocommand is ok when escaping characters
function M.augrp_dbg(name, cmds)
  local cmd = vim.cmd
  cmd(string.format('echo %q', ('aug ' .. name)))
  cmd(string.format('echo %q', '   au!'))
  if type(cmds) == 'string' then
    cmd(string.format('echo %q', ('   au ' .. cmds)))
  else
    for i = 1, #cmds do
      cmd(string.format('echo %q', ('   au ' .. cmds[i])))
    end
  end
  cmd(string.format('echo %q', 'aug END'))
end

function M.echo(msg)
  vim.cmd(string.format('echo %q', msg))
end

M.clearUpdate = function()
  M.isUpdate(true)
end

M.execute = function(cmd)
  local handle = io.popen(cmd)
  local result = handle:read('*a')
  handle:close()
  return result
end

M.exists = function(file)
  local ok, err, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  if ok == nil then
    ok = false
  end
  return ok, err
end

M.getOs = function()
  local sys = vim.loop.os_uname().sysname
  local rel = vim.loop.os_uname().release

  -- print("GetOS", sys, rel)
  if sys:find('^[Dd]arwin') ~= nil then
    return OS.MacOs
  elseif sys:find('^[Ll]inux') ~= nil then
    if string.find(rel, '[Ww][Ss][Ll]') ~= nil then
      return OS.WSL
    end
    return OS.Linux
  elseif sys:find('^[Ww]in') ~= nil then
    return OS.Windows
  else
    return OS.Unknown
  end
end

M.highlight = function(group, fg, bg, attr, sp)
  local x = { group }
  if fg then
    if type(fg) == 'string' then
      table.insert(x, 'ctermfg=' .. fg)
      table.insert(x, 'guifg=' .. fg)
    else
      table.insert(x, 'ctermfg=' .. fg.term)
      table.insert(x, 'guifg=' .. fg.hex)
    end
  end
  if bg then
    if type(bg) == 'string' then
      table.insert(x, 'ctermbg=' .. bg)
      table.insert(x, 'guibg=' .. bg)
    else
      table.insert(x, 'ctermbg=' .. bg.term)
      table.insert(x, 'guibg=' .. bg.hex)
    end
  end
  if attr then
    table.insert(x, 'cterm=' .. attr)
    table.insert(x, 'gui=' .. attr)
  end
  if sp then
    if type(sp) == 'string' then
      table.insert(x, 'guisp=' .. sp)
    else
      table.insert(x, 'guisp=' .. sp.hex)
    end
  end
  if #x == 1 then
    return
  end

  local cmd = 'highlight ' .. table.concat(x, ' ')
  vim.cmd(cmd)
end

M.isDir = function(path)
  return M.exists(M.joinPath(path, package.config:sub(1, 1)))
end

M.isGui = function()
  return vim.fn.exists(':GuiFont') > 0
end

M.isUpdate = function(deleteFile)
  local updateFile = M.joinPath(rv.vimPath, 'update')
  if M.exists(updateFile) then
    if deleteFile then
      os.remove(updateFile)
    end
    return true
  end
  return false
end

M.joinPath = function(...)
  local args = { ... }
  local sep = package.config:sub(1, 1)
  local path = args[1]

  for i, a in ipairs(args) do
    if i == 1 then
    elseif a:sub(1, 1) == sep then
      path = path .. a:sub(2, #a)
    else
      path = path .. a
    end
    if i < #args and a:sub(-1) ~= sep then
      path = path .. sep
    end
  end
  return path
end

-- calculate terminal colors from RGB
-- https://stackoverflow.com/questions/11765623/convert-hex-to-closest-x11-color-number/31057489
M.rgbToX256 = function(r, g, b)
  local v2ci = function(v)
    if v < 48 then
      return 0
    elseif v < 115 then
      return 1
    else
      return math.floor((v - 35) / 40)
    end
  end

  local distSquare = function(A, B, C, ax, bx, cx)
    return ((A - ax) * (A - ax) + (B - bx) * (B - bx) + (C - cx) * (C - cx))
  end

  local ir = v2ci(r)
  local ig = v2ci(g)
  local ib = v2ci(b)
  local ci = (36 * ir + 6 * ig + ib)

  local av = (r + b + g) / 3
  local gi = av > 238 and 23 or math.floor((av - 3) / 10)

  local i2cv = { 0, 0x5F, 0x87, 0xAF, 0xD7, 0xFF }
  local cr = i2cv[ir + 1]
  local cg = i2cv[ig + 1]
  local cb = i2cv[ib + 1]
  local gv = 8 + 10 * gi

  local colorErr = distSquare(cr, cg, cb, r, g, b)
  local grayErr = distSquare(gv, gv, gv, r, g, b)

  local val = colorErr <= grayErr and 16 + ci or 232 + gi
  return val
end

local ok, t = pcall(require, 'utils.term')
if ok then
  M['openFloatTerm'] = t.openFloatTerm
  M['closeFloatTerm'] = t.closeFloatTerm
end

return M
