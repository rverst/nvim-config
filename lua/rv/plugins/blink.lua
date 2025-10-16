-- https://github.com/saghen/blink.cmp

return {
  'saghen/blink.cmp',
  dependencies = {
    { 'saghen/blink.compat', version = '*', lazy = true, opts = {} },
    'zbirenbaum/copilot.lua',
    'giuxtaposition/blink-cmp-copilot',
    'moyiz/blink-emoji.nvim',
  },
  enabled = true,
  version = 'v1.*',
  opts = {

    keymap = {
      preset = 'default',
      ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      -- ['<C-a>'] = { 'select_and_accept', 'fallback' },
      ['<C-s>'] = { 'select_and_accept', 'fallback' },
    },

    completion = {
      documentation = {
        auto_show = true,
      },
      ghost_text = {
        enabled = false,
      },
    },

    -- expretimental
    signature = {
      enabled = true,
    },

    sources = {
      default = {
        'lsp',
        'path',
        'snippets',
        'buffer',
        'copilot',
        'lazydev',
        -- 'avante_commands',
        -- 'avante_mentions',
        -- 'avante_files',
        'emoji',
      },
      per_filetype = {
        codecompanion = { 'codecompanion' },
      },
      providers = {
        copilot = {
          name = 'copilot',
          module = 'blink-cmp-copilot',
          score_offset = 80,
          async = true,
          transform_items = function(_, items)
            local CompletionItemKind = require('blink.cmp.types').CompletionItemKind
            local kind_idx = #CompletionItemKind + 1
            CompletionItemKind[kind_idx] = 'Copilot'
            for _, item in ipairs(items) do
              item.kind = kind_idx
            end
            return items
          end,
        },
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          fallbacks = { 'lsp' },
        },
        emoji = {
          module = 'blink-emoji',
          name = 'Emoji',
          score_offset = 85,
        },
      },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
      kind_icons = {
        Copilot = '',
        Text = '󰉿',
        Method = '󰊕',
        Function = '󰊕',
        Constructor = '󰒓',

        Field = '󰜢',
        Variable = '󰆦',
        Property = '󰖷',

        Class = '󱡠',
        Interface = '󱡠',
        Struct = '󱡠',
        Module = '󰅩',

        Unit = '󰪚',
        Value = '󰦨',
        Enum = '󰦨',
        EnumMember = '󰦨',

        Keyword = '󰻾',
        Constant = '󰏿',

        Snippet = '󱄽',
        Color = '󰏘',
        File = '󰈔',
        Reference = '󰬲',
        Folder = '󰉋',
        Event = '󱐋',
        Operator = '󰪚',
        TypeParameter = '󰬛',
      },
    },
  },
  opts_extend = { 'sources.completion.enabled_providers' },
}
