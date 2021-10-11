local fn = require('utils.fn')
local v = require('utils.vars')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

local servers = {
  sumneko_lua = require('lsp.sumneko_lua'),
  gopls = {
    settings = {
      gopls = {
        codelenses = {
          references = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          generate = true,
        },
        gofumpt = true,
      },
    },
  },
  rls = {},
  bashls = {},
  dockerls = {},
  cssls = {},
  html = {},
  jsonls = {},
  tsserver = {},
  vimls = {},
  yamlls = {},
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
for name, opts in pairs(servers) do
  local client = lspconfig[name]
  client.setup({
    flags = { debounce_text_changes = 150 },
    cmd = opts.cmd or client.cmd,
    filetypes = opts.filetypes or client.filetypes,
    on_attach = opts.on_attach or require('lsp.config').OnAttach,
    on_init = opts.on_init or require('lsp.config').OnInit,
    handlers = opts.handlers or client.handlers,
    root_dir = opts.root_dir or client.root_dir,
    capabilities = opts.capabilities or capabilities,
    settings = opts.settings or {},
  })
end
