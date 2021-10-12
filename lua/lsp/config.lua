local M = {}

M.OnInit = function() end

M.OnAttach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Use LSP as the handler for omnifunc.
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  require('lsp.handlers')

  require('bindings').lspBindings(
    bufnr,
    client.name,
    client.resolved_capabilities.document_formatting,
    client.resolved_capabilities.document_range_formatting
  )

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    local utils = require('utils')
    utils.augrp('lsp_doc_highlight', {
      [[CursorHold <buffer> lua vim.lsp.buf.document_highlight()]],
      [[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]],
    })
  end

  if client.resolved_capabilities.code_lens then
    local utils = require('utils')
    utils.augrp('lsp_doc_highlight', {
      [[CursorHold,CursorHoldI * lua vim.lsp.codelens.refresh()]],
    })
  end
end

return M
