local ls = require('luasnip')

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('proto', {
  -- syntax version header
  s('syn', fmt('syntax = "{}";', { c(1, { t('proto3'), t('proto2') }) })),

  -- package declaration
  s('pkg', fmt('package {};', { i(1, 'my.package') })),

  -- import
  s('imp', fmt('import "{}";', { i(1, 'path/to/file.proto') })),

  -- option
  s('opt', fmt('option {} = {};', { i(1, 'go_package'), i(2, '"github.com/org/repo/gen/go"') })),

  -- message
  s(
    'msg',
    fmt(
      [[
message {} {{
  {}
}}]],
      { i(1, 'MyMessage'), i(2) }
    )
  ),

  -- field inside a message
  s('fld', fmt('{} {} = {};', { i(1, 'string'), i(2, 'name'), i(3, '1') })),

  -- repeated field
  s('rep', fmt('repeated {} {} = {};', { i(1, 'string'), i(2, 'items'), i(3, '1') })),

  -- optional field (proto3 explicit optional)
  s('opl', fmt('optional {} {} = {};', { i(1, 'string'), i(2, 'name'), i(3, '1') })),

  -- map field
  s('map', fmt('map<{}, {}> {} = {};', { i(1, 'string'), i(2, 'string'), i(3, 'labels'), i(4, '1') })),

  -- enum
  s(
    'enm',
    fmt(
      [[
enum {} {{
  {} = 0;
  {}
}}]],
      { i(1, 'MyEnum'), i(2, 'MY_ENUM_UNSPECIFIED'), i(3) }
    )
  ),

  -- service
  s(
    'svc',
    fmt(
      [[
service {} {{
  {}
}}]],
      { i(1, 'MyService'), i(2) }
    )
  ),

  -- rpc (unary)
  s('rpc', fmt('rpc {}({}) returns ({});', { i(1, 'Method'), i(2, 'Request'), i(3, 'Response') })),

  -- rpc (server-streaming)
  s('rpcs', fmt('rpc {}({}) returns (stream {});', { i(1, 'Method'), i(2, 'Request'), i(3, 'Response') })),

  -- rpc (client-streaming)
  s('rpcc', fmt('rpc {}(stream {}) returns ({});', { i(1, 'Method'), i(2, 'Request'), i(3, 'Response') })),

  -- rpc (bidirectional streaming)
  s('rpcb', fmt('rpc {}(stream {}) returns (stream {});', { i(1, 'Method'), i(2, 'Request'), i(3, 'Response') })),

  -- oneof
  s(
    'one',
    fmt(
      [[
oneof {} {{
  {}
}}]],
      { i(1, 'value'), i(2) }
    )
  ),
})
