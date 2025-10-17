-- https://github.com/olimorris/codecompanion.nvim
-- https://codecompanion.olimorris.dev
--
-- codecompanion.nvim is a Neovim plugin that provides AI-powered code assistance,
-- including chat, inline suggestions, and agent tools, with support for adapters
-- like GitHub Copilot. It integrates with extensions such as mcphub for enhanced
-- functionality and developer workflows.

return {
  'olimorris/codecompanion.nvim',
  enabled = not vim.g.vscode,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ravitemer/mcphub.nvim',
  },
  config = function()
    require('codecompanion').setup({
      display = {
        chat = {
          icons = {
            buffer_pin = ' ',
            -- Change the default icons
            buffer_watch = '👀 ',
          },

          -- Options to customize the UI of the chat buffer
          window = {
            layout = 'vertical', -- float|vertical|horizontal|buffer
            position = 'right', -- left|right|top|bottom (nil will default depending on vim.opt.splitright|vim.opt.splitbelow)
            border = 'single',
            height = 0.8,
            width = 0.45,
            relative = 'editor',
            full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
            sticky = true, -- when set to true and `layout` is not `"buffer"`, the chat buffer will remain opened when switching tabs
            opts = {
              breakindent = true,
              cursorcolumn = false,
              cursorline = false,
              foldcolumn = '0',
              linebreak = true,
              list = false,
              numberwidth = 1,
              signcolumn = 'no',
              spell = false,
              wrap = true,
            },
          },

          ---Customize how tokens are displayed
          ---@param tokens number
          ---@param adapter CodeCompanion.Adapter

          token_count = function(tokens, adapter)
            return ' (' .. tokens .. ' tokens)'
          end,
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
          -- Safety-net: manual approval before agent tool execution
          on_tool_execute = function(tool_name, args, proceed)
            vim.schedule(function()
              local args_str = vim.inspect(args)
              local prompt = ('Approve agent to run: %s?\nArgs: %s'):format(tool_name, args_str)
              vim.ui.select({ 'Yes', 'No' }, { prompt = prompt }, function(choice)
                if choice == 'Yes' then
                  proceed()
                else
                  vim.notify('Agent execution cancelled: ' .. tool_name, vim.log.levels.WARN)
                end
              end)
            end)
          end,
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

    -- keymaps to open CodeCompanion (prompt)
    vim.keymap.set('n', '<leader>cp', function()
      vim.cmd('CodeCompanion')
    end, { desc = 'Open CodeCompanion Prompt', silent = true })
    -- keymaps to open CodeCompanion chat
    vim.keymap.set('n', '<leader>cc', function()
      vim.cmd('CodeCompanionChat')
    end, { desc = 'Open CodeCompanion Chat', silent = true })
  end,
}
