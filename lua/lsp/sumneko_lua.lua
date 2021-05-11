local M = {}
local fn = require('utils.fn')
local v = require('utils.vars')

local root = fn.joinPath(v.lspPath, 'lua-language-server')

local oss
local bin = 'lua-language-server'
if v.isMacOs then
  oss = 'macos'
elseif v.isLinux or v.isWsl then
  oss = 'Linux'
elseif v.isWindows then
  oss = 'Windows'
  bin = bin .. '.exe'
end

local sumneko_bin = fn.joinPath(root, 'bin', oss, bin)

M.isInstalled = function()
  local ok, _ = fn.exists(sumneko_bin)
  return ok
end

M.install = function(_)
  print([[No installation script for "sumneko_lua" provided. Please install "sumneko_lua" to: ]] ..
            root .. [[ See: https://github.com/sumneko/lua-language-server for details]])
end

M.uninstall = function() end

M.update = function() M.install(true) end

M.config = {
  cmd = {sumneko_bin, '-E', fn.joinPath(root, 'main.lua')},
  root_dir = function() return vim.loop.cwd() end,
  settings = {
    Lua = {
      runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
      diagnostics = {globals = {'vim'}},
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        }
      },
      telemetry = {enable = false}
    }
  },
  on_attach = require('lsp.config').OnAttach
}

return M

