-- https://github.com/yetone/avante.nvim
--
-- avante.nvim is a Neovim plugin designed to emulate the behaviour of the [Cursor](https://www.cursor.com) AI IDE

return {
  'yetone/avante.nvim',
  enabled = not vim.g.vscode,
  event = 'VeryLazy',
  enabled = false,
  lazy = true,
  version = false, -- set this if you want to always pull the latest change
  mode = 'legacy',
  opts = {
    provider = 'claude',
    auto_suggestions_provider = 'claude',
    providers = {
      claude = {
        endpoint = 'https://api.anthropic.com',
        model = 'claude-sonnet-4-20250514',
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
      openai = {
        endpoint = 'https://api.openai.com',
        model = 'gpt-4.1',
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
    },
    file_selector = {
      provider = 'fzf',
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    'zbirenbaum/copilot.lua',
    { 'ibhagwan/fzf-lua', opts = {} },
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
    },
  },
}
