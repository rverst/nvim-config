-- https://github.com/olimorris/codecompanion.nvim
-- https://codecompanion.olimorris.dev
--
-- codecompanion.nvim is a Neovim plugin that provides AI-powered code assistance,
-- including chat, inline suggestions, and agent tools, with support for adapters
-- like GitHub Copilot. It integrates with extensions such as mcphub for enhanced
-- functionality and developer workflows.

return {
  'olimorris/codecompanion.nvim',
  enabled = false and not vim.g.vscode,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ravitemer/mcphub.nvim',
  },
  config = function()
    require('codecompanion').setup({
      display = {
        chat = {
          window = {
            layout = 'vertical', -- float|vertical|horizontal|buffer
            position = 'right',
            relativ = 'editor',
            sticky = true,
            otps = {
              numberwidth = 0,
            },
          },
        },
      },
      adapters = {
        http = {
          anthropic = 'anthropic',
          copilot = 'copilot',
          opts = {
            show_defaults = false,
          },
        },
        acp = {
          opts = {
            show_defaults = false,
          },
        },
      },
      strategies = {
        chat = {
          adapter = 'copilot',
          roles = {
            user = 'rverst',
          },
        },
        inline = {
          adapter = 'copilot',
        },
        agent = {
          adapter = 'copilot',
        },
      },
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
    })

    -- keymaps
    vim.keymap.set('n', '<leader>cp', function()
      vim.cmd('CodeCompanion')
    end, { desc = 'Open CodeCompanion Prompt', silent = true })

    vim.keymap.set('n', '<leader>cc', function()
      vim.cmd('CodeCompanionChat')
    end, { desc = 'Toggle CodeCompanion Chat Sidebar', silent = true })
  end,
}
