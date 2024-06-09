-- https://github.com/hrsh7th/nvim-cmp
--
-- A completion engine plugin for neovim written in Lua. Completion sources
-- are installed from external repositories and "sourced".

return {
  'hrsh7th/nvim-cmp',
  enabled = true,
  event = { 'BufReadPre', 'BufNewFile' },
  priority = 100,
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'onsails/lspkind.nvim',
    'JMarkin/cmp-diag-codes',
    'SergioRibera/cmp-dotenv',
    'saadparwaiz1/cmp_luasnip',
    'zbirenbaum/copilot-cmp',
    {
      'L3MON4D3/LuaSnip',
      build = function()
        if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
          return
        end
        return 'make install_jsregexp'
      end,
    },
  },
  config = function()
    require('rv.config.snippets')

    vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
    vim.opt.shortmess:append('c')

    local cmp = require('cmp')
    require('lspkind').init({})
    local luasnip = require('luasnip')

    luasnip.config.setup({})

    require('copilot_cmp').setup({})

    vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })

    cmp.setup({
      view = {
        entries = 'custom',
        selection_order = 'near_cursor',
      },
      window = {
        completion = {
          winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
          col_offset = -3,
          side_padding = 0,
        },
      },
      formatting = {
        expandable_indicator = true,
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          -- local kind_icons = {
          --   Text = '  ',
          --   Method = '  ',
          --   Function = '  ',
          --   Constructor = '  ',
          --   Field = '  ',
          --   Variable = '  ',
          --   Class = '  ',
          --   Interface = '  ',
          --   Module = '  ',
          --   Property = '  ',
          --   Unit = '  ',
          --   Value = '  ',
          --   Enum = '  ',
          --   Keyword = '  ',
          --   Snippet = '  ',
          --   Color = '  ',
          --   File = '  ',
          --   Reference = '  ',
          --   Folder = '  ',
          --   EnumMember = '  ',
          --   Constant = '  ',
          --   Struct = '  ',
          --   Event = '  ',
          --   Operator = '  ',
          --   TypeParameter = '  ',
          -- }

          local custom_menu_icon = {
            calc = '󰃬 Calc',
            copit = ' Octo',
          }
          if entry.source.name == 'calc' then
            vim_item.kind = custom_menu_icon.calc
          elseif entry.source.name == 'copilot' then
            vim_item.kind = custom_menu_icon.copit
          else
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind] or 'x', vim_item.kind)
          end

          local kind = require('lspkind').cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '…',
            show_labelDetails = true,
          })(entry, vim_item)

          local strings = vim.split(kind.kind, '%s', { trimempty = true })
          kind.kind = ' ' .. (strings[1] or '') .. ' '
          kind.menu = '    (' .. (strings[2] or '') .. ')'

          return kind
        end,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert({
        -- Select the [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        -- [A]ccept the completion.
        ['<C-a>'] = cmp.mapping.confirm({ select = true, cmp.ConfirmBehavior.Insert }, { 'i', 'c' }),

        -- Manually trigger a completion from nvim-cmp.
        ['<C-Space>'] = cmp.mapping.complete({}),
      }),
      sources = {
        { name = 'nvim_lsp' },
        { name = 'copilot' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'dotenv' },
        { name = 'calc' },
        { name = 'diag-codes', option = { in_comment = true } },
      },
    })
  end,
}
