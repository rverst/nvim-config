local fn = require('utils.fn')
local v = require('utils.vars')

local servers = {'sumneko_lua'}

if not fn.exists(v.lspPath) then
  local cmd
  if v.isWindows then
    cmd = [[New-Item -Path "]] .. v.lspPath .. [[" -ItemType Directory]]
  else
    cmd = [[mkdir -p "]] .. v.lspPath .. [["]]
  end
  if os.execute(cmd) ~= 0 then error('unable to create lsp root dir (' .. v.lspPath .. ')') end
end

for _, s in pairs(servers) do

  local srv = require('lsp.' .. s)
  local lspconfig = require('lspconfig')

  if not srv.isInstalled() then srv.install() end

  if fn.isUpdate() then srv.update() end

  if srv.isInstalled() then lspconfig[s].setup(srv.config) end
end
