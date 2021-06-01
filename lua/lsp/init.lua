local fn = require('utils.fn')
local v = require('utils.vars')

local servers = {
  'sumneko_lua',
  'gopls',
  'rls',
  'bashls',
  'dockerls',
  'cssls',
  'html',
  'jsonls',
  'tsserver',
  'vimls',
  'yamlls'
}

if not fn.exists(v.lspPath) then
  local cmd
  if v.isWindows then
    cmd = [[New-Item -Path "]] .. v.lspPath .. [[" -ItemType Directory]]
  else
    cmd = [[mkdir -p "]] .. v.lspPath .. [["]]
  end
  if os.execute(cmd) ~= 0 then error('unable to create lsp root dir (' .. v.lspPath .. ')') end
end

local lspconfig = require('lspconfig')

  local lspconfig = require('lspconfig')
  local config = {on_attach = require('lsp.config').OnAttach}

  -- some ls need special configurations, e.g. the manual installed one
  if s == 'sumneko_lua' then config = require('lsp.' .. s) end

for _, s in pairs(manualServers) do
  local config = require('lsp.'..s)
  lspconfig[s].setup(config)
end
