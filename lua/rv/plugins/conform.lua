-- https://github.com/stevearc/conform.nvim
--
-- Lightweight yet powerful formatter plugin for Neovim

return {
  'stevearc/conform.nvim',
  enabled = require('rv.utils').plugin_enabled({ vscode = false, minimal = false }),
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

      return {
        timeout_ms = 500,
        lsp_format = 'fallback',
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'gofumpt' },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      html = { 'prettierd', 'prettier', stop_after_first = true },
      json = { 'prettierd', 'prettier', stop_after_first = true },
      jsonc = { 'prettierd', 'prettier', stop_after_first = true },
      css = { 'prettierd', 'prettier', stop_after_first = true },
      scss = { 'prettierd', 'prettier', stop_after_first = true },
      yaml = { 'prettierd', 'prettier', stop_after_first = true },
      markdown = { 'prettierd', 'prettier', stop_after_first = true },
      shell = { 'shfmt' },
      sh = { 'shfmt' },
      zsh = { 'shfmt' },
      -- Protobuf
      proto = { 'buf' },
      -- Typst
      typst = { 'typstyle' },
      -- Python
      python = { 'ruff_format' },
      -- Rust (rustfmt via LSP fallback is preferred; explicit here for manual fmt)
      rust = { 'rustfmt' },
      -- PostgreSQL / SQL
      sql = { 'pg_format' },

      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
    },
  },
  init = function()
    vim.api.nvim_create_user_command('FormatDisable', function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true,
    })

    vim.api.nvim_create_user_command('FormatEnable', function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = 'Re-enable autoformat-on-save',
    })

    vim.keymap.set('n', '<leader>cf', function()
      require('conform').format({
        async = true,
        lsp_format = true,
      })
    end, { desc = 'Format buffer', silent = true })
  end,
}
