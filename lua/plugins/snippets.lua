local S = require('snippets')
local U = require('snippets.utils')

S.use_suggested_mappings()

S.snippets = {
  lua = {
    req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require('$1')]];
    func = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]];
    ["local"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]];
    -- Match the indentation of the current line for newlines.
    ["for"] = U.match_indentation [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
  $0
end]];
  };
  _global = {
    -- If you aren't inside of a comment, make the line a comment.
    copyright = U.force_comment [[Copyright © ${=os.date("%Y")} Robert Verst <robert@verst.eu>]];
  };
}
