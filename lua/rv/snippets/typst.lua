local ls = require('luasnip')

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('typst', {
  -- import a module / template
  s('imp', fmt('#import "{}": {}', { i(1, 'template.typ'), i(2, '*') })),

  -- include another file
  s('inc', fmt('#include "{}"', { i(1, 'chapter.typ') })),

  -- let binding (variable or function)
  s('let', fmt('#let {} = {}', { i(1, 'name'), i(2, 'value') })),

  -- let function definition: #let func(args) = [ body ]
  s('letf', fmt('#let {}({}) = [\n  {}\n]', { i(1, 'func'), i(2, 'args'), i(3) })),

  -- show rule
  s('show', fmt('#show {}: it => [{}]', { i(1, 'heading'), i(2) })),

  -- show rule with set
  s('shows', fmt('#show {}: set {}({})', { i(1, 'heading'), i(2, 'text'), i(3, 'weight: "bold"') })),

  -- set rule
  s('set', fmt('#set {}({})', { i(1, 'text'), i(2, 'font: "Libertinus Serif"') })),

  -- content block
  s('cb', fmt('[{}]', { i(1) })),

  -- code block (raw)
  s(
    'raw',
    fmt(
      [[
```{}
{}
```]],
      { i(1, 'lang'), i(2) }
    )
  ),

  -- headings
  s('h1', fmt('= {}', { i(1, 'Heading') })),
  s('h2', fmt('== {}', { i(1, 'Heading') })),
  s('h3', fmt('=== {}', { i(1, 'Heading') })),

  -- inline math
  s('im', fmt('${}$', { i(1) })),

  -- display / block math
  s(
    'dm',
    fmt(
      [[
$ {} $]],
      { i(1) }
    )
  ),

  -- figure with caption
  s(
    'fig',
    fmt(
      [[
#figure(
  {},
  caption: [{}],
)]],
      { i(1, 'image("file.png", width: 80%)'), i(2, 'Caption text') }
    )
  ),

  -- reference to label
  s('ref', fmt('@{}', { i(1, 'label') })),

  -- label on current element
  s('lbl', fmt('<{}>', { i(1, 'label') })),

  -- page break
  s('pb', { t('#pagebreak()') }),

  -- line break (hard)
  s('br', { t('#linebreak()') }),

  -- horizontal space
  s('hs', fmt('#h({})', { i(1, '1em') })),

  -- vertical space
  s('vs', fmt('#v({})', { i(1, '1cm') })),
})
