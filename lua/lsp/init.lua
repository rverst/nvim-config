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
  'yamlls',
}

if not fn.exists(v.lspPath) then
  local cmd
  if v.isWindows then
    cmd = [[New-Item -Path "]] .. v.lspPath .. [[" -ItemType Directory]]
  else
    cmd = [[mkdir -p "]] .. v.lspPath .. [["]]
  end
  if os.execute(cmd) ~= 0 then
    error('unable to create lsp root dir (' .. v.lspPath .. ')')
  end
end

local lspconfig = require('lspconfig')
for _, s in pairs(servers) do
  local config = { on_attach = require('lsp.config').OnAttach }

  -- some ls need special configurations, e.g. the manual installed one
  if s == 'sumneko_lua' then
    config = require('lsp.' .. s)
    if not config then
      goto continue
    end
  end

  lspconfig[s].setup(config)
  ::continue::
end
