local M = {}

M.OnAttach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Use LSP as the handler for omnifunc.
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local wk = require('which-key')
  wk.register({

    e = {[[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]], 'Show line diag [LSP]'},
    l = {[[<cmd>lua vim.lsp.buf.signature_help()<CR>]], 'Signature help [LSP]'},
    L = {[[<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>]], 'Signature help [lspsaga]'},
    k = {[[<cmd>lua vim.lsp.buf.hover()<CR>]], 'Hover [LSP]'},
    K = {[[<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>]], 'Hover [lspsaga]'},
    D = {[[<cmd>lua vim.lsp.buf.type_definition()<CR>]], 'Type definition [LSP]'},
    ['<C-a>'] = {[[<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>]], 'which_key_ignore'},
    ['<C-z>'] = {[[<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>]], 'which_key_ignore'},
    w = {
      name = 'workspace [LSP]',
      a = {[[<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>]], 'Add workspace folder'},
      r = {[[<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>]], 'Remove workspace folder'},
      l = {[[<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>]], 'List workspace folder'}
    },

    r = {name = 'rename', n = {[[<cmd>lua vim.lsp.buf.rename()<CR>]], 'Rename'}},

    c = {
      r = {[[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], 'References'},
      s = {[[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], 'Document symbols'},
      S = {[[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>]], 'Workspace symbols'},
      a = {[[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]], 'Code actions'},
      A = {[[<cmd>lua require("lspsaga.codeaction").code_action()<CR>]], 'Code actions [lspsaga]'},
      d = {[[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>]], 'Document diagnostic'},
      D = {[[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>]], 'Workspace diagnostic'},
      f = {[[<cmd>lua require("lspsaga.provider").lsp_finder()<CR>]], 'Def/Ref finder [lspsaga] '}
    }

  }, {prefix = '<leader>', buffer = bufnr})

  wk.register({

    c = {
      a = {[[<cmd>lua require('telescope.builtin').lsp_range_code_actions()<CR>]], 'Code actions'},
      A = {[[<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>]], 'Code actions [lspsaga]'}
    }
  }, {prefix = '<leader>', mode = 'v', buffer = bufnr})

  wk.register({

    ['['] = {d = {[[<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]], 'Previous diagnostic'}},
    [']'] = {d = {[[<cmd>lua vim.lsp.diagnostic.goto_next()<CR>]], 'Next diagnostic'}},

    g = {
      name = 'goto',
      d = {[[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]], 'Definition'},
      D = {[[<Cmd>lua vim.lsp.buf.declaration()<CR>]], 'Declaration'},
      i = {[[<cmd>lua vim.lsp.buf.implementation()<CR>]], 'Implementation'},
      r = {[[<cmd>lua vim.lsp.buf.references()<CR>]], 'References'}
    },
  }, {prefix = '', buffer = bufnr})

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    wk.register({f = {[[<cmd>lua vim.lsp.buf.formatting()<CR>]], 'format [LSP]'}},
                {prefix = '<leader>', buffer = bufnr})
  end

  if client.resolved_capabilities.document_range_formatting then
    wk.register({f = {[[<cmd>lua vim.lsp.buf.range_formatting()<CR>]], 'format [LSP]'}},
                {prefix = '<leader>', buffer = bufnr})
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    local utils = require('utils')
    utils.augrp('lsp_doc_highlight', {
      [[CursorHold <buffer> lua vim.lsp.buf.document_highlight()]],
      [[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
    })
  end
end

return M
