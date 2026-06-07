local ls = require('luasnip')

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('sql', {
  -- select
  s(
    'sel',
    fmt(
      [[
select {}
from {}
where {}]],
      { i(1, '*'), i(2, 'table'), i(3, 'true') }
    )
  ),

  -- select with join
  s(
    'selj',
    fmt(
      [[
select {}
from {}
{} join {} on {}.{} = {}.{}
where {}]],
      {
        i(1, '*'),
        i(2, 'a'),
        c(3, { t('inner'), t('left'), t('right'), t('full outer') }),
        i(4, 'b'),
        i(5, 'a'),
        i(6, 'id'),
        i(7, 'b'),
        i(8, 'a_id'),
        i(9, 'true'),
      }
    )
  ),

  -- common table expression
  s(
    'cte',
    fmt(
      [[
with {} as (
  {}
)
select {}
from {}]],
      { i(1, 'cte_name'), i(2), i(3, '*'), i(4, 'cte_name') }
    )
  ),

  -- insert
  s(
    'ins',
    fmt(
      [[
insert into {} ({})
values ({})
returning {}]],
      { i(1, 'table'), i(2, 'col1, col2'), i(3, '$1, $2'), i(4, '*') }
    )
  ),

  -- update
  s(
    'upd',
    fmt(
      [[
update {}
set {} = {}
where {}
returning {}]],
      { i(1, 'table'), i(2, 'col'), i(3, '$1'), i(4, 'id = $2'), i(5, '*') }
    )
  ),

  -- delete
  s(
    'del',
    fmt(
      [[
delete from {}
where {}
returning {}]],
      { i(1, 'table'), i(2, 'id = $1'), i(3, '*') }
    )
  ),

  -- create table
  s(
    'cre',
    fmt(
      [[
create table {} (
  id          bigint generated always as identity primary key,
  created_at  timestamptz not null default now(),
  {}
);]],
      { i(1, 'table_name'), i(2) }
    )
  ),

  -- alter table add column
  s('alt', fmt('alter table {} add column {} {} not null;', { i(1, 'table'), i(2, 'col'), i(3, 'text') })),

  -- alter table drop column
  s('altd', fmt('alter table {} drop column {};', { i(1, 'table'), i(2, 'col') })),

  -- create index
  s('idx', fmt('create index {} on {} ({});', { i(1, 'idx_table_col'), i(2, 'table'), i(3, 'col') })),

  -- create unique index
  s('uidx', fmt('create unique index {} on {} ({});', { i(1, 'uidx_table_col'), i(2, 'table'), i(3, 'col') })),

  -- case expression
  s(
    'case',
    fmt(
      [[
case {}
  when {} then {}
  else {}
end]],
      { i(1, 'col'), i(2, 'val'), i(3, 'result'), i(4, 'null') }
    )
  ),

  -- PostgreSQL function
  s(
    'func',
    fmt(
      [[
create or replace function {}({})
returns {} as $$
begin
  {}
end;
$$ language plpgsql;]],
      { i(1, 'func_name'), i(2), i(3, 'void'), i(4) }
    )
  ),

  -- PostgreSQL trigger
  s(
    'trig',
    fmt(
      [[
create trigger {}
  {} {} on {}
  for each row execute function {}();]],
      {
        i(1, 'trg_name'),
        c(2, { t('before'), t('after'), t('instead of') }),
        c(3, { t('insert'), t('update'), t('delete'), t('insert or update') }),
        i(4, 'table'),
        i(5, 'func_name'),
      }
    )
  ),

  -- sqlc named query annotation
  s(
    'sqlc',
    fmt('-- name: {} :{}\n', {
      i(1, 'QueryName'),
      c(2, { t('one'), t('many'), t('exec'), t('execresult'), t('execrows') }),
    })
  ),
})
