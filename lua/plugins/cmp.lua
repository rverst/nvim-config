local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  -- formatting = {
  --   format = function(entry, vim_item)
  --     vim_item.kind = lspkind.presets.default[vim_item.kind]
  --     return vim_item
  --   end,
  -- },

  -- You should specify your *installed* sources.
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp', priority = 10 },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer', priority = 2, keyword_length = 5, max_item_count = 10 },
    { name = 'calc' },
  },
})
