-- https://github.com/mfussenegger/nvim-lint
--
-- Asynchronous linter plugin for Neovim, complementing LSP-based diagnostics.
-- Runs linters on file save and after reading. Install linters via Mason:
--   golangci-lint, eslint_d, hadolint, yamllint

return {
  'mfussenegger/nvim-lint',
  enabled = not vim.g.vscode,
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      -- Go: golangci-lint for comprehensive static analysis
      -- Note: golangci_lint_ls already provides LSP diagnostics; this adds
      -- on-save linting for cases where the LSP is slow or misses something.
      go = { 'golangcilint' },

      -- TypeScript / JavaScript: eslint_d (daemon, much faster than eslint)
      typescript = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      javascript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },

      -- Dockerfile: hadolint
      dockerfile = { 'hadolint' },

      -- YAML: yamllint
      yaml = { 'yamllint' },

      -- Protobuf: buf lint
      proto = { 'buf_lint' },

      -- OpenAPI: vacuum (detected files get this via the openapi filetype alias)
      openapi = { 'vacuum' },

      -- Python: ruff (fast, replaces flake8/pylint for most cases)
      python = { 'ruff' },

      -- PostgreSQL: squawk for anti-pattern and migration safety checks
      sql = { 'squawk' },
    }

    -- Autocommand: run linters after save and on read
    local lint_augroup = vim.api.nvim_create_augroup('rv-nvim-lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        -- Only lint if a linter is configured for this filetype
        local ft = vim.bo.filetype
        if lint.linters_by_ft[ft] then
          lint.try_lint()
        end
      end,
    })

    -- Keymap: manual lint trigger
    vim.keymap.set('n', '<leader>cl', function()
      lint.try_lint()
    end, { desc = 'Trigger linting for current file' })
  end,
}
