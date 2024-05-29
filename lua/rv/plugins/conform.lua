-- https://github.com/stevearc/conform.nvim
-- Lightweight yet powerful formatter plugin for Neovim

return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

      return {
        timeout_ms = 500,
        lsp_fallback = true,
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'gofumpt' },
      javascript = { { 'prettierd', 'prettier' } },
      shell = { 'shfmt' },
      sh = { 'shfmt' },
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

    vim.keymap.set('n', '<leader>ua', function()
      vim.g.disable_autoformat = not vim.g.disable_autoformat
      vim.notify('Autoformat on save is ' .. (vim.g.disable_autoformat and 'disabled' or 'enabled'))
    end, { desc = 'Toggle Autoformat on save', silent = true })

    vim.keymap.set('n', '<leader>cf', function()
      require('conform').format({
        async = true,
        lsp_fallback = true,
      })
    end, { desc = 'Format buffer', silent = true })
  end,
}
