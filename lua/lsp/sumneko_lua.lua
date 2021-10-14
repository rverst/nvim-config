local Config = {}
local utils = require('utils')

local root = utils.joinPath(rv.lspPath, 'lua-language-server')

local oss
local bin = 'lua-language-server'
if rv.isMacOs then
  oss = 'macos'
elseif rv.isLinux or rv.isWsl then
  oss = 'Linux'
elseif rv.isWindows then
  oss = 'Windows'
  bin = bin .. '.exe'
end

local sumneko_bin = utils.joinPath(root, 'bin', oss, bin)

if not utils.exists(sumneko_bin) then
  return false
end

Config = {
  cmd = { sumneko_bin, '-E', utils.joinPath(root, 'main.lua') },
  root_dir = function()
    return vim.loop.cwd()
  end,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      telemetry = { enable = false },
      completion = {
        keywordSnippets = 'Replace',
        showWord = 'Disable',
        workspaceWord = false,
      },
    },
  },
  on_attach = require('lsp.config').OnAttach,
}

return Config
