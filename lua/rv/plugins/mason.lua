-- https://github.com/neovim/nvim-lspconfig
--
-- Quickstart configs for Nvim LSP

return {
  'mason-org/mason-lspconfig.nvim',
  enabled = not vim.g.vscode,
  opts = {
    ensure_installed = {
      'copilot',
      'gopls',
      'templ',
      'golangci_lint_ls',
      'lua_ls',
    },
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    { 'neovim/nvim-lspconfig' },
    { 'j-hui/fidget.nvim', opts = {} },
  },
  init = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(args)
        local bufnr = args.buf
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id), 'must have valid client')

        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
        end

        vim.opt_local.omnifunc = 'v:lua.vim.lsp.omnifunc'
        map('gd', require('telescope.builtin').lsp_definitions, 'Goto Definition')
        map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
        map('gr', require('telescope.builtin').lsp_references, 'Goto References')
        map('gI', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type Definition')
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
        map('<leader>cr', vim.lsp.buf.rename, 'Rename')
        map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = args.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = args.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end

        local signName = 'LspCAS'
        local signGroup = 'LspCASGrp'
        vim.fn.sign_define(signName, { text = '󰛩', texthl = 'LspDiagnosticsSignHint' })

        local function code_action_listener()
          vim.fn.sign_unplace(signGroup)
          local context = { diagnostics = vim.diagnostic.get() }
          local range_params = vim.lsp.util.make_range_params(0, 'utf-8')
          local params = vim.tbl_extend('force', range_params, { context = context })
          vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(_, result, _, _)
            if result == nil then
              return
            end
            local line = vim.api.nvim_win_get_cursor(0)[1]
            vim.fn.sign_place(0, signGroup, signName, '', { lnum = line, priority = 1000 })
          end)
        end

        if client and client.server_capabilities.codeActionProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = args.buf,
            callback = code_action_listener,
          })
        end
      end,
    })
  end,
}
