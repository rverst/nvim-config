local fn, lsp = vim.fn, vim.lsp

-- lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hoverm({
-- }))

lsp.handlers['textDocument/publishDiagnostics'] = function(_, _, params, client_id, _)
  local config = {
    underline = true,
    virtual_text = {
      prefix = '> ',
      spacing = 4,
    },
    signs = true,
    update_in_insert = false,
  }
  local uri = params.uri
  local bufnr = vim.uri_to_bufnr(uri)

  if not bufnr then
    return
  end

  local diag = params.diagnostics
  if diag then
    for i, v in ipairs(diag) do
      diag[i].message = string.format('%s: %s', v.source, v.message)
    end
  end

  lsp.diagnostic.save(diag, bufnr, client_id)

  if not vim.api.nvim_buf_is_loaded then
    return
  end

  lsp.diagnostic.display(diag, bufnr, client_id, config)
end

local signs = {
  Error = ' ',
  Warning = ' ',
  Hint = ' ',
  Information = ' ',
}

for type, icon in pairs(signs) do
  local hl = 'LspDiagnosticsSign' .. type
  fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end
