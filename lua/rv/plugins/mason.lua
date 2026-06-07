-- https://github.com/mason-org/mason-lspconfig.nvim
--
-- LSP server installation (via Mason) and activation.
-- Server configs are defined in lsp/ directories (nvim-lspconfig lsp/ or after/lsp/).
-- Use vim.lsp.config() to override defaults, vim.lsp.enable() to activate.

return {
  'mason-org/mason-lspconfig.nvim',
  enabled = not vim.g.vscode,
  opts = {
    ensure_installed = {
      -- Go
      'gopls',
      'templ',
      'golangci_lint_ls',
      -- Lua
      'lua_ls',
      -- TypeScript / JavaScript
      'vtsls',
      -- Web
      'html',
      'cssls',
      'jsonls',
      'eslint',
      -- Infrastructure
      'dockerls',
      'yamlls',
      'helm_ls',
      -- OpenAPI / Swagger
      'vacuum',
      -- Protobuf
      'buf_ls',
      -- Typst
      'tinymist',
      -- Python
      'pyright',
      'ruff',
      -- Rust
      'rust_analyzer',
      -- GraphQL
      'graphql',
      -- PostgreSQL
      'postgres_lsp',
    },
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    { 'neovim/nvim-lspconfig' },
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function(_, opts)
    require('mason-lspconfig').setup(opts)

    -- Configure servers that need non-default settings.
    -- lspconfig ships defaults in lsp/<name>.lua; vim.lsp.config() merges/overrides.

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })

    vim.lsp.config('vtsls', {
      settings = {
        typescript = {
          inlayHints = {
            parameterNames = { enabled = 'literals' },
            parameterTypes = { enabled = true },
            variableTypes = { enabled = false },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            enumMemberValues = { enabled = true },
          },
          updateImportsOnFileMove = { enabled = 'always' },
          suggest = { completeFunctionCalls = true },
        },
        javascript = {
          inlayHints = {
            parameterNames = { enabled = 'literals' },
            parameterTypes = { enabled = true },
            variableTypes = { enabled = false },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            enumMemberValues = { enabled = true },
          },
          updateImportsOnFileMove = { enabled = 'always' },
          suggest = { completeFunctionCalls = true },
        },
        vtsls = {
          enableMoveToFileCodeAction = true,
          autoUseWorkspaceTsdk = true,
          experimental = {
            completion = { enableServerSideFuzzyMatch = true },
          },
        },
      },
    })

    vim.lsp.config('yamlls', {
      settings = {
        yaml = {
          keyOrdering = false,
          format = { enable = true },
          validate = true,
          schemaStore = { enable = false, url = '' },
          schemas = {
            kubernetes = {
              '*.k8s.yaml',
              '*.k8s.yml',
              'deploy/*.yaml',
              'deploy/*.yml',
              'k8s/**/*.yaml',
              'k8s/**/*.yml',
              'kubernetes/**/*.yaml',
              'kubernetes/**/*.yml',
            },
            ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = {
              'docker-compose*.yaml',
              'docker-compose*.yml',
              'compose*.yaml',
              'compose*.yml',
            },
            ['https://json.schemastore.org/github-workflow.json'] = {
              '.github/workflows/*.yaml',
              '.github/workflows/*.yml',
            },
            -- OpenAPI 3.0 / 3.1 (file-based; content-detected files get this via setlocal)
            ['https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json'] = {
              'openapi.yaml',
              'openapi.yml',
              '*-openapi.yaml',
              '*-openapi.yml',
              'swagger.yaml',
              'swagger.yml',
            },
          },
        },
      },
    })

    vim.lsp.config('jsonls', {
      settings = {
        json = {
          schemas = {
            {
              fileMatch = { 'openapi.json', '*-openapi.json', 'swagger.json' },
              url = 'https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json',
            },
          },
          validate = { enable = true },
        },
      },
    })

    vim.lsp.config('helm_ls', {
      settings = {
        ['helm-ls'] = {
          yamlls = { path = 'yaml-language-server' },
        },
      },
    })

    vim.lsp.config('tinymist', {
      settings = {
        exportPdf = 'never',
        formatterMode = 'typstyle',
      },
    })

    vim.lsp.config('pyright', {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = 'standard',
            autoImportCompletions = true,
          },
        },
      },
    })

    -- ruff as LSP handles diagnostics and code actions (isort, fixes);
    -- pyright handles type-checking and completions. Both run together.
    vim.lsp.config('ruff', {
      init_options = {
        settings = {
          lineLength = 120,
        },
      },
    })

    -- Enable all configured servers.
    -- mason-lspconfig installs them; vim.lsp.enable() activates them for matching filetypes.
    vim.lsp.enable({
      'gopls',
      'templ',
      'golangci_lint_ls',
      'lua_ls',
      'vtsls',
      'html',
      'cssls',
      'jsonls',
      'eslint',
      'dockerls',
      'yamlls',
      'helm_ls',
      'buf_ls',
      'tinymist',
      'pyright',
      'ruff',
      'rust_analyzer',
      'graphql',
      'postgres_lsp',
    })

    -- LspAttach: buffer-local keymaps and behaviour on every LSP connection
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('rv-lsp-attach', { clear = true }),
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
          local hl_group = vim.api.nvim_create_augroup('rv-lsp-highlight-' .. bufnr, { clear = true })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = args.buf,
            group = hl_group,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = args.buf,
            group = hl_group,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })
  end,
}
