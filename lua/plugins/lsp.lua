local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Use LSP as the handler for omnifunc.
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>kk', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>l', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)


  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap('v', '<leader>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  end

  -- Set autocommands conditional on server_capabilities
  -- if client.resolved_capabilities.document_highlight then
  --   vim.api.nvim_exec([[
  --     hi LspReferenceRead  ctermfg=109 ctermbg=237 guifg=#7daea3 guibg=#45403d
  --     hi LspReferenceText  ctermfg=109 ctermbg=237 guifg=#7daea3 guibg=#45403d
  --     hi LspReferenceWrite ctermfg=109 ctermbg=237 guifg=#7daea3 guibg=#45403d
  --     augroup lsp_document_highlight
  --       autocmd! * <buffer>
  --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --     augroup END
  --   ]], false)
  -- end
end

local v = require('utils.vars')
local fn = require('utils.fn')
local lspconfig = require('lspconfig')
local servers = { 'gopls', 'clangd' }

for _, lsp in pairs(servers) do
  lspconfig[lsp].setup { on_attach = on_attach }
end

-- sumneko settings
local xdg_data = os.getenv('XDG_DATA_HOME')
local sumneko_root = nil

if xdg_data ~= nil then
  sumneko_root = fn.joinPath(xdg_data, 'lua-language-server')
end

if vim.fn.empty(vim.fn.glob(sumneko_root)) > 0 then
  sumneko_root = os.getenv('SUMNEKO')
end


if sumneko_root == nil then
  print('sumneko root not found')
  return
end

local os
local bin = 'lua-language-server'
if v.isMacOs then
  os = 'macos'
elseif v.isLinux or v.isWsl then
  os = 'Linux'
elseif v.isWindows then
  os = 'Windows'
  bin = bin..'.exe'
end

local sumneko_bin = fn.joinPath(sumneko_root, 'bin', os, bin)
if vim.fn.empty(vim.fn.glob(sumneko_bin)) > 0 then
    return
end

lspconfig.sumneko_lua.setup {
  cmd = {sumneko_bin, '-E', fn.joinPath(sumneko_root, 'main.lua')},
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
  on_attach = on_attach
}
