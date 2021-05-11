require('utils')

local M = {}
local fn = require('utils.fn')

function M:init()
  self.os = fn.getOs()
  self.isMacOs = self.os == OS.MacOs
  self.isLinux = self.os == OS.Linux
  self.isWsl = self.os == OS.WSL
  self.isWindows = self.os == OS.Windows

  self.nvimPath = vim.fn.stdpath('config')
  self.vimPath = self.nvimPath
  self.dataPath = vim.fn.stdpath('data')
  self.lspPath = fn.joinPath(self.dataPath, 'lsp_servers')
  self.undoDir = fn.joinPath(vim.fn.stdpath('cache'), 'undo')

end

M:init()
return M
