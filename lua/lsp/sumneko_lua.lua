local Config = {}
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

Config = {
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

return Config

