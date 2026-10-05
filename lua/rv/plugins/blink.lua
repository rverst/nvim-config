-- https://github.com/saghen/blink.cmp
--
-- Performant, batteries-included completion plugin for Neovim.
-- Integrates Copilot, LSP, snippets, path, buffer, and emoji sources.
-- Configured with blink-copilot (native copilot LSP, see mason.lua), blink-emoji, and lazydev support.
-- Accept with <C-s>.

return {
  'saghen/blink.cmp',
  dependencies = {
    'fang2hou/blink-copilot',
    'moyiz/blink-emoji.nvim',
  },
  enabled = require('rv.utils').plugin_enabled({ vscode = false, minimal = false }),
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
      list = {
        -- Only <C-s> inserts an item; navigating the list or pressing <Esc> leaves the text untouched.
        selection = { auto_insert = false },
      },
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
        'emoji',
      },
      per_filetype = {},
      providers = {
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          score_offset = 80,
          async = true,
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
      nerd_font_variant = 'mono',
      kind_icons = {
        Copilot = '',
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
  opts_extend = { 'sources.default' },
}
