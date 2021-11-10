local utils = require('utils')
local lspconfig = require('lspconfig')
local containers = require('lspcontainers')

local onAttach = require('lsp.config').OnAttach

local servers = {
  sumneko_lua = {
    cmd = containers.command('sumneko_lua'),
    on_new_condig = function(new_config, new_root_dir)
      new_config.cmd = containers.command('sumneko_lua', { root_dir = new_root_dir })
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
    on_attach = onAttach,
  },
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

if not utils.exists(rv.lspPath) then
  local cmd
  if rv.isWindows then
    cmd = [[New-Item -Path "]] .. rv.lspPath .. [[" -ItemType Directory]]
  else
    cmd = [[mkdir -p "]] .. rv.lspPath .. [["]]
  end
  if os.execute(cmd) ~= 0 then
    error('unable to create lsp root dir (' .. rv.lspPath .. ')')
  end
end

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
