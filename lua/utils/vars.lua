require('utils')

local M = {}
local fn = require('utils.fn')

function M:init()
  self.os = fn.getOs()
  self.isMacOs = self.os == OS.MacOs
  self.isLinux = self.os == OS.Linux
  self.isWsl = self.os == OS.WSL
  self.isWindows = self.os == OS.Windowsh

  self.vimPath = vim.fn.stdpath('config')
  self.dataPath = vim.fn.stdpath('data')
  self.undoDir = fn.joinPath(vim.fn.stdpath('cache'), 'undo')

end

M:init()
return M
