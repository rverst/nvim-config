local plugin = {
  'neovim/nvim-lspconfig',
  dependencies = {
    'folke/neodev.nvim',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'stevearc/conform.nvim',
    'b0o/SchemaStore.nvim',
  },
  config = function()
    require('neodev').setup({
      -- library = {
      --   plugins = { "nvim-dap-ui" },
      --   types = true,
      -- },
    })

    local capabilities = nil
    if pcall(require, 'cmp_nvim_lsp') then
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    end

    local lspconfig = require('lspconfig')

    local servers = {
      bashls = true,
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
      lua_ls = {
        -- cmd = {...},
        -- filetypes { ...},
        -- capabilities = {},
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              -- Tells lua_ls where to find all the Lua files that you have loaded
              -- for your neovim configuration.
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
              -- If lua_ls is really slow on your computer, you can try this instead:
              -- library = { vim.env.VIMRUNTIME },
            },
            completion = {
              callSnippet = 'Replace',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
      rust_analyzer = true,
      svelte = true,
      templ = true,
      cssls = true,
      tsserver = true,
      bufls = true,

      jsonls = {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      },

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

    local servers_to_install = vim.tbl_filter(function(key)
      local t = servers[key]
      if type(t) == 'table' then
        return not t.manual_install
      else
        return t
      end
    end, vim.tbl_keys(servers))

    require('mason').setup()
    local ensure_installed = {
      'stylua',
      'lua_ls',
      'delve',
      -- "tailwind-language-server",
    }

    vim.list_extend(ensure_installed, servers_to_install)
    require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

    for name, config in pairs(servers) do
      if config == true then
        config = {}
      end
      config = vim.tbl_deep_extend('force', {}, {
        capabilities = capabilities,
      }, config)

      lspconfig[name].setup(config)
    end

    local disable_semantic_tokens = {
      lua = true,
    }

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
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
        map('<leader>rn', vim.lsp.buf.rename, 'Rename')
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
      end,
    })
  end,
}

return plugin
