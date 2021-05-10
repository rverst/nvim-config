local M = {} local fn = require('utils.fn')
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
  bin = bin..'.exe'
end

local sumneko_bin = fn.joinPath(root, 'bin', oss, bin)

M.isInstalled = function()
	local ok, _ = fn.exists(sumneko_bin)
	return ok
end

M.install = function(update)
	print([[No installation script for "sumneko_lua" provided. Please install "sumneko_lua" to: ]]..root..[[ See: https://github.com/sumneko/lua-language-server for details]])
end

M.uninstall = function()
end

M.update = function()
	M.install(true)
end

M.config =  {
	cmd = {sumneko_bin, '-E', fn.joinPath(root, 'main.lua')},
	root_dir = function()
		return vim.loop.cwd()
	end,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';')
			},
			diagnostics = {
				globals = {'vim'}
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
				}
			},
			telemetry = {
				enable = false
			}
		}
	},
	on_attach = require('lsp.config').OnAttach
}

return M

	--[[
local lsp = require('lsp')
local lspconfig = require('lspconfig')

local v = require('utils.vars')
local fn = require('utils.fn')


local install = function()
	local installScript
	if v.isWindows then
		print('WINDOWS')
	else
		local oss = v.isMacOs and 'macos' or 'linux'
		installScript = [=[

		]=]
	end
end

local setup = function ()

	print("SETUP")

if vim.fn.empty(vim.fn.glob(sumneko_root)) > 0 then
  sumneko_root = oss.getenv('SUMNEKO')
end


if sumneko_root == nil then
  print('sumneko root not found')
  return
			else
			return
end

lspconfig.sumneko_lua.setup {
 }

end


if not fn.exists(sumneko_root) then
	install()
end

setup()
--]]
