local M = {}

M.OnAttach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Use LSP as the handler for omnifunc.
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<leader>l', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>k', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

  -- Set some keybinds conditional on server capabilities fmt
  local fmt = false
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    fmt = true
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap('v', '<leader>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
    fmt = true
  end
  require('which-key').register({
	  	e = 'show line diag [LSP]',
	  	l = 'signature help [LSP]',
	  	k = 'hover [LSP]',
	  	q = 'show loclist [LSP]',
	  	D = 'type definition [LSP]',
		  w = {
        name = 'workspace [LSP]',
        a = {[[<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>]], 'add workspace folder'},
        r = {[[<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>]], 'remove workspace folder'},
        l = {[[<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>]], 'list workspace folder'},
		},

		r = {
			name = 'rename',
			n = {[[<cmd>lua vim.lsp.buf.rename()]], 'rename'},
		},

		c = {
			name = 'code',
			r = {[[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], 'references'},
			s = {[[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], 'document symbols'},
			S = {[[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>]], 'workspace symbols'},
			a = {[[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]], 'code actions'},
			d = {[[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>]], 'document diagnostic'},
			D = {[[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>]], 'workspace diagnostic'},
		}

	}, { prefix = '<leader>'})

  require('which-key').register({
		c = {
			name = 'code',
			a = {[[<cmd>lua require('telescope.builtin').lsp_range_code_actions()<CR>]], 'code actions'},
		}
	}, { prefix = '<leader>', mode = 'v'})

  require('which-key').register({
	  g = {
		  name = 'goto',
			d = {[[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]], 'definition'},
			D = {[[<Cmd>lua vim.lsp.buf.declaration()<CR>]], 'declaration'},
			i = {[[<cmd>lua vim.lsp.buf.implementation()<CR>]], 'implementation'},
			r = {[[<cmd>lua vim.lsp.buf.references()<CR>]], 'references'},
		},

    ['['] = {
      d = {[[<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]], 'Previous diagnostic'},
    },

    [']'] = {
      d = {[[<cmd>lua vim.lsp.diagnostic.goto_next()<CR>]], 'Next diagnostic'},
    },
	}, { prefix = ''})

  if fmt then
  	require('which-key').register({f = 'format [LSP]'}, { prefix = '<leader>'})
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
		local utils = require('utils')
		utils.augrp('lsp_doc_highlight', {
		[[CursorHold <buffer> lua vim.lsp.buf.document_highlight()]],
		[[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]],
		})
  end
end

return M
