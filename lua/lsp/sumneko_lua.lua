local M = {} local fn = require('utils.fn')
local v = require('utils.vars')

local root = fn.joinPath(v.lspPath, 'sumneko')

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
	if vim.fn.executable('ninja') ~= 1 then
		error('ninja not installed, see: https://github.com/ninja-build/ninja/releases')
		return
	end

	local script = ''
	if not update then

		if fn.exists(root) then
			M.uninstall()
		end

		script = [[
		git clone https://github.com/sumneko/lua-language-server sumneko;
		cd sumneko;
		git submodule update --init --recursive;
		]]
	else
		script = [[
		cd sumneko;
		git submodule update --init --recursive;
		git pull --ff-only --rebase=false --progress
		git submodule foreach git pull --ff-only --rebase=false --progress
		]]
	end

	script = script..string.format([[
	cd 3rd/luamake;
	compile/install.%s;
	cd ../../;
	./3rd/luamake/luamake rebuild;
	]], v.isWindows and 'bat' or 'sh')

	vim.cmd('new')
	vim.fn.termopen(script, {
		cwd = v.lspPath,
		on_exit = function(_, exitCode)
			if exitCode ~= 0 then
				vim.api.nvim_err_writeln('installation of sumneko_lua failed')
			else
				print('sumneko_lua installation successful')
			end
		end
	})
	vim.cmd('startinsert')
end

M.uninstall = function()
	local cmd
	if v.isWindows then
		cmd = [[]]
	else
		cmd = [[rm -rf ]]..root
	end

	if os.execute(cmd) ~= 0 then
		error('error uninstalling sumneko')
	end
end

M.update = function()

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
