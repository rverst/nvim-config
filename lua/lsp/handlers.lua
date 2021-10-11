local fn, lsp = vim.fn, vim.lsp

-- lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hoverm({
-- }))

local border = {
  { '╭', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '╮', 'FloatBorder' },
  { '│', 'FloatBorder' },
  { '╯', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '╰', 'FloatBorder' },
  { '│', 'FloatBorder' },
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  virtual_text = {
    prefix = '●',
    spacing = 4,
  },
  signs = true,
  update_in_insert = false,
})
