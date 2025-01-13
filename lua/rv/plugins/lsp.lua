-- https://github.com/neovim/nvim-lspconfig
--
-- Quickstart configs for Nvim LSP

return {
  'neovim/nvim-lspconfig',
  enabled = true,
  event = { 'BufReadPre', 'BufNewFile' },
  cmd = 'Mason',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'stevearc/conform.nvim',
    'b0o/SchemaStore.nvim',
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          path = '${3rd}/luv/library',
          words = { 'vim%.uv' },
        },
      },
    },
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {},
      automatic_installation = true,
    })

    local lspconfig = require('lspconfig')

    local border = {
      { ' ', 'FloatBorder' },
      { ' ', 'FloatBorder' },
      { ' ', 'FloatBorder' },
      { ' ', 'FloatBorder' },
      { ' ', 'FloatBorder' },
      { ' ', 'FloatBorder' },
      { ' ', 'FloatBorder' },
      { ' ', 'FloatBorder' },
    }
    local handlers = {
      ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }
    vim.diagnostic.config({
      virtual_text = {
        source = true,
      },
      float = {
        source = 'if_many',
      },
    })

    local servers = {
      lua_ls = {
        handlers = handlers,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            completion = {
              callSnippet = 'Replace',
            },
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
      gopls = {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      },
      golangci_lint_ls = {},
      bashls = {},
      svelte = {},
      templ = {},
      cssls = {},
      ts_ls = {},
      buf_ls = {},
      jsonls = {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      },
      vacuum = {},
      yamlls = {
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = '',
            },
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      },
    }

    for name, config in pairs(servers) do
      local ok, cmp = pcall(require, 'blink.cmp')
      if ok then
        config.capabilities = cmp.get_lsp_capabilities(config.capabilities)
      end
      lspconfig[name].setup(config)
    end

    local signName = 'LspCAS'
    local signGroup = 'LspCASGrp'
    vim.fn.sign_define(signName, { text = '󰛩', texthl = 'LspDiagnosticsSignHint' })

    local function code_action_listener()
      vim.fn.sign_unplace(signGroup)
      local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
      local params = vim.lsp.util.make_range_params()
      params.context = context
      vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(_, result, _, _)
        if result == nil then
          return
        end
        local line = vim.api.nvim_win_get_cursor(0)[1]
        vim.fn.sign_place(0, signGroup, signName, '', { lnum = line, priority = 1000 })
      end)
    end

    local disable_semantic_tokens = {
      lua = true,
    }

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

        local filetype = vim.bo[bufnr].filetype
        if disable_semantic_tokens[filetype] then
          client.server_capabilities.semanticTokensProvider = nil
        end

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
