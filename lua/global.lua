-- set some useful global variables and functions

_G.rv = {}

rv.OS = { Unknown = 1, MacOS = 2, Linux = 3, Windows = 4, WSL = 5 }

local ok, utils = pcall(require, 'utils')
if not ok then
  vim.notify("'utils' not found", 'error')
end

rv.os = utils.getOs()
rv.isMacOs = rv.os == OS.MacOs
rv.isLinux = rv.os == OS.Linux
rv.isWsl = rv.os == OS.WSL
rv.isWindows = rv.os == OS.Windows

rv.nvimPath = vim.fn.stdpath('config')
rv.vimPath = rv.nvimPath
rv.dataPath = vim.fn.stdpath('data')
rv.lspPath = utils.joinPath(rv.dataPath, 'lsp_servers')
rv.undoDir = utils.joinPath(vim.fn.stdpath('cache'), 'undo')

-- used for telescope find_/grep_path
rv.last_path = rv.nvimPath
