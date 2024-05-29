local ls = require('luasnip')

local s = ls.snippet
local i = ls.insert_node

local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('go', {
  s('err', fmt('if {} != nil \n  return {}\n', { i(0), i(0) })),
})
