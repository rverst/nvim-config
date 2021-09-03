local g = vim.g
local c = g.colors
local fn = require('utils.fn')
local base16 = require('base16')
local none = 'none'

base16(vim.g.mytheme, true)

vim.o.background = 'dark'
vim.cmd('hi clear CursorLine')

-- Available decorations
---------------------------------
-- *bold* *underline* *undercurl*
-- *inverse* *italic* *standout*
-- *nocombine* *strikethrough*

local ubi = 'underline,bold,italic'
local ucl = 'undercurl'
local uli = 'underline'
local ita = 'italic'
local bit = 'bold,italic'
local uit = 'underline,italic'
local inv = 'inverse'
local rev = 'inverse'
local non = 'none'

-- stylua: ignore start
-- 'Group'                                          Foreground          Background          Decorations         SP Color
fn.highlight('Normal',                                nil,                c.bg,               nil,                nil)
fn.highlight('LineNr',                                nil,                c.none,             nil,                nil)
fn.highlight('SignColumn',                            nil,                c.none,             nil,                nil)

fn.highlight('Todo',                                  c.yellow,           c.none,             ubi,                nil)
fn.highlight('Fixme',                                 c.red,              c.none,             ubi,                nil)

fn.highlight('Cursor',                                nil,                c.cursor,           inv,                nil)
fn.highlight('TermCursor',                            nil,                c.cursor,           inv,                nil)
fn.highlight('iCursor',                               nil,                c.cursor,           inv,                nil)

fn.highlight('MatchParen',                            nil,                c.dark2,            nil,                nil)
fn.highlight('MatchParent',                           nil,                c.dark2,            nil,                nil)

fn.highlight('CursorLine',                            nil,                c.cursorline,       nil,                c.dark2)
fn.highlight('CursorLineNR',                          c.yellow,           c.none,             none,               nil)

fn.highlight('VertSplit',                             c.border,           c.none,             nil,                nil)

fn.highlight('EndOfBuffer',                           c.bg,               c.none,             nil,                nil)
fn.highlight('Pmenu',                                 nil,                c.dark2,            nil,                nil)
fn.highlight('PmenuSel',                              c.orange_light,     c.dark3,            nil,                nil)

fn.highlight('IndentBlanklineChar',                   c.dark2,            nil,                nil,                nil)

fn.highlight('SpellBad',                              c.red_error,        nil,                ucl,                c.red_error)
fn.highlight('SpellCap',                              c.orange,           nil,                ucl,                c.orange)
fn.highlight('SpellLocal',                            c.blue,             nil,                ucl,                c.blue)
fn.highlight('SpellRare',                             c.magenta,          nil,                ucl,                c.magenta)

fn.highlight('GitSignsAdd',                           c.green,            c.none,             none,               nil)
fn.highlight('GitSignsChange',                        c.yellow,           c.none,             none,               nil)
fn.highlight('GitSignsDelete',                        c.red,              c.none,             none,               nil)
fn.highlight('GitSignsChangeDelete',                  c.red,              c.none,             none,               nil)

fn.highlight('TelescopeBorder',                       c.border,           c.none,             nil,                nil)
fn.highlight('TelescopePromptBorder',                 c.border,           c.none,             nil,                nil)
fn.highlight('TelescopeResultsBorder',                c.border,           c.none,             nil,                nil)
fn.highlight('TelescopePreviewBorder',                c.border,           c.none,             nil,                nil)

fn.highlight('NvimTreeRootFolder',                    c.acc1,             nil,                nil,                nil)
fn.highlight('NvimTreeFolderName',                    c.yellow,           nil,                nil,                nil)
fn.highlight('NvimTreeOpenedFolderName',              c.yellow_light,     nil,                nil,                nil)
fn.highlight('NvimTreeIndentMarker',                  c.dark2,            nil,                nil,                nil)

-- SymbolsOutline
fn.highlight('FocusedSymbol',                         c.orange,           c.dark2,            bit,                nil)

-- dap
fn.highlight('DapBreakpoint',                         c.red,           	  nil,                nil,                nil)
fn.highlight('DapBreakpointRejected',                 c.red_error,    	  nil,                nil,                nil)
fn.highlight('DapStopped',                            c.green_light,   	  nil,                nil,                nil)
fn.highlight('DapLogPoint',                           c.blue_light,    	  nil,                nil,                nil)

-- dapui
fn.highlight('DapUIType',           		      c.orange_light,  	  nil,                nil,                nil)
fn.highlight('DapUIScope',           		      c.yellow_light,     nil,                nil,                nil)
fn.highlight('DapUISource',           		      c.blue_light,       nil,                nil,                nil)
fn.highlight('DapUIThread',           		      c.blue,             nil,                nil,                nil)
fn.highlight('DapUIVariable',           	      c.purple,           nil,                nil,                nil)
fn.highlight('DapUIFrameName',           	      c.acc1,             nil,                nil,                nil)
fn.highlight('DapUIDecoration',           	      c.cyan_light,       nil,                nil,                nil)
fn.highlight('DapUILineNumber',           	      c.acc2,             nil,                nil,                nil)
fn.highlight('DapUIFloatBorder',           	      c.border,           nil,                nil,                nil)
fn.highlight('DapUIWatchesEmpty',           	      c.acc2,        	  nil,                nil,                nil)
fn.highlight('DapUIWatchesError',           	      c.red_error,    	  nil,                nil,                nil)
fn.highlight('DapUIWatchesValue',           	      c.orange,       	  nil,                nil,                nil)
fn.highlight('DapUIStoppedThread',           	      c.red_light,    	  nil,                nil,                nil)
fn.highlight('DapUIBreakpointsInfo',           	      c.yellow_light, 	  nil,                nil,                nil)
fn.highlight('DapUIBreakpointsLine',           	      c.green,         	  nil,                nil,                nil)
fn.highlight('DapUIBreakpointsPath',           	      c.cyan,          	  nil,                nil,                nil)
fn.highlight('DapUIBreakpointsCurrentLine',           c.green_light,   	  nil,                nil,                nil)

-- nvim-dap-virtual-text
fn.highlight('NvimDapVirtualText',           	      c.virtual_text,  	  nil,                nil,                nil)
fn.highlight('NvimDapVirtualTextInfo',                c.virtual_info,  	  nil,                nil,                nil)
fn.highlight('NvimDapVirtualTextError',               c.virtual_error, 	  nil,                nil,                nil)

-- LSP
fn.highlight('LspDiagnosticsDefaultError',            c.red,              nil,                ita,                nil)
fn.highlight('LspDiagnosticsDefaultWarning',          c.orange,           nil,                ita,                nil)
fn.highlight('LspDiagnosticsDefaultHint',             c.dark2,            nil,                ita,                nil)
fn.highlight('LspDiagnosticsDefaultInformation',      c.yellow,           nil,                ita,                nil)

fn.highlight('LspReferenceRead',                      nil,                nil,                uli,                c.green)
fn.highlight('LspReferenceWrite',                     c.red_light,        nil,                uit,                c.red)
fn.highlight('LspReferenceText',                      c.acc1,             nil,                uli,                c.acc2)

-- Which-Key
fn.highlight('WhichKey',                              c.yellow_light,     c.none,             none,               nil)
fn.highlight('WhichKeyGroup',                         c.yellow,           c.none,             ita,                nil)
fn.highlight('WhichKeySeparator',                     c.border,           c.none,             none,               nil)
fn.highlight('WhichKeyDesc',                          c.acc2,             c.none,             none,               nil)
fn.highlight('WhichKeyFloat',                         c.acc1,             c.bg,               none,               nil)
fn.highlight('WhichKeyValue',                         c.comment,          c.nonenil,          none,               nil)

-- Bufferline
fn.highlight('BufferCurrent',                         c.yellow,           c.dark2,            nil,                nil)
fn.highlight('BufferCurrentIndex',                    c.border,           c.dark2,            nil,                nil)
fn.highlight('BufferCurrentMod',                      c.yellow,           c.dark2,            bit,                nil)
fn.highlight('BufferCurrentSign',                     c.border,           c.dark2,            nil,                nil)
fn.highlight('BufferCurrentTarget',                   nil,                c.dark2,            nil,                nil)
fn.highlight('BufferVisible',                         c.acc2,             nil,                ita,                nil)
fn.highlight('BufferVisibleIndex',                    c.border,           nil,                nil,                nil)
fn.highlight('BufferVisibleMod',                      c.acc2,             nil,                bit,                nil)
fn.highlight('BufferVisibleSign',                     c.border,           nil,                nil,                nil)
fn.highlight('BufferVisibleTarget',                   nil,                nil,                nil,                nil)
fn.highlight('BufferInactive',                        c.comment,          nil,                nil,                nil)
fn.highlight('BufferInactiveIndex',                   c.border,           nil,                nil,                nil)
fn.highlight('BufferInactiveMod',                     c.comment,          nil,                bit,                nil)
fn.highlight('BufferInactiveSign',                    c.border,           nil,                nil,                nil)
fn.highlight('BufferInactiveTarget',                  nil,                nil,                nil,                nil)
fn.highlight('BufferTabpages',                        nil,                nil,                nil,                nil)
fn.highlight('BufferTabpageFill',                     nil,                nil,                nil,                nil)
fn.highlight('BufferCurrentIcon',                     nil,                c.dark2,            nil,                nil)
fn.highlight('BufferVisibleIcon',                     nil,                nil,                nil,                nil)
fn.highlight('BufferInactiveIcon',                    nil,                nil,                nil,                nil)

-- standard syntax highlighting
fn.highlight('Boolean',                               c.orange,           nil,                nil,                nil)
fn.highlight('Character',                             c.green,            nil,                nil,                nil)
fn.highlight('Comment',                               c.comment,          nil,                ita,                nil)
fn.highlight('Conditional',                           c.orange_light,     nil,                nil,                nil)
fn.highlight('Constant',                              c.purple,           nil,                nil,                nil)
fn.highlight('Define',                                c.orange_light,     nil,                nil,                nil)
fn.highlight('Delimiter',                             c.acc2,             nil,                nil,                nil)
fn.highlight('Float',                                 c.blue,             nil,                nil,                nil)
fn.highlight('Function',                              c.yellow,           nil,                nil,                nil)
fn.highlight('Identifier',                            c.purple,           nil,                nil,                nil)
fn.highlight('Include',                               c.orange_light,     nil,                nil,                nil)
fn.highlight('Keyword',                               c.orange,           nil,                nil,                nil)
fn.highlight('Label',                                 c.yellow_light,     nil,                nil,                nil)
fn.highlight('Number',                                c.cyan,             nil,                nil,                nil)
fn.highlight('Operator',                              c.acc2,             nil,                nil,                nil)
fn.highlight('PreProc',                               c.yellow_light,     nil,                nil,                nil)
fn.highlight('Repeat',                                c.orange,           nil,                nil,                nil)
fn.highlight('Special',                               c.yellow_light,     nil,                nil,                nil)
fn.highlight('SpecialChar',                           c.orange,           nil,                nil,                nil)
fn.highlight('Statement',                             c.green_light,      nil,                nil,                nil)
fn.highlight('StorageClass',                          c.orange_light,     nil,                nil,                nil)
fn.highlight('String',                                c.green_dark,       nil,                nil,                nil)
fn.highlight('Structure',                             c.orange_light,     nil,                nil,                nil)
fn.highlight('Tag',                                   c.orange_light,     nil,                nil,                nil)
fn.highlight('Todo',                                  c.yellow_light,     nil,                nil,                nil)
fn.highlight('Type',                                  c.blue_light,       nil,                nil,                nil)
fn.highlight('Typedef',                               c.magenta_light,    nil,                nil,                nil)

-- Treesitter
-- Misc
fn.highlight('TSError',                               c.red_light,     nil,     nil,     nil)
fn.highlight('TSPunctDelimiter',                      c.fg,     nil,     nil,     nil)
fn.highlight('TSPunctBracket',                      c.fg,     nil,     nil,     nil)
fn.highlight('TSPunctSpecial',                      c.fg,     nil,     nil,     nil)
-- Constants
fn.highlight('TSConstant',                      c.purple,     nil,     nil,     nil)
fn.highlight('TSConstBuiltin',                      c.purple,     nil,     ita,     nil)
-- -- These things overrides all palletes above
-- TSConstMacro: "orange"
-- TSStringRegex: "orange"
fn.highlight('TSString',                      c.green_dark,     nil,     nil,     nil)
-- TSStringEscape: "yellow_light"
fn.highlight('TSCharacter',                      c.green,     nil,     nil,     nil)
fn.highlight('TSNumber',                      c.magenta_light,     nil,     nil,     nil)
-- TSBoolean: "blue"
-- TSFloat: "light_yellow"
-- TSAnnotation: "yellow"
-- TSAttribute: "orange"
-- TSNamespace: "blue_light"
-- Functions
fn.highlight('TSFuncBuiltin', c.yellow,     nil,     nil,     nil)
fn.highlight('TSFunction', c.yellow,     nil,     nil,     nil)
fn.highlight('TSFuncMacro', c.yellow,     nil,     nil,     nil)
fn.highlight('TSParameter', c.blue,     nil,     nil,     nil)
fn.highlight('TSParameterReference', c.blue_light,     nil,     nil,     nil)
fn.highlight('TSMethod', c.yellow,     nil,     nil,     nil)
fn.highlight('TSField', c.purple,     nil,     nil,     nil)
fn.highlight('TSProperty', c.aqua,     nil,     nil,     nil)
fn.highlight('TSConstructor', c.aqua_light,     nil,     nil,     nil)
-- Keywords
fn.highlight('TSConditional', c.purple,     nil,     nil,     nil)
fn.highlight('TSRepeat', c.purple,     nil,     nil,     nil)
fn.highlight('TSLabel', c.blue,     nil,     nil,     nil)
 -- Does not work for yield and return they should be diff then class and def
fn.highlight('TSKeyword', c.orange,     nil,     nil,     nil)
fn.highlight('TSKeywordFunction', c.purple,     nil,     nil,     nil)
fn.highlight('TSKeywordOperator', c.blue,     nil,     nil,     nil)
fn.highlight('TSOperator', c.fg,     nil,     nil,     nil)
fn.highlight('TSException', c.purple,     nil,     nil,     nil)
fn.highlight('TSType', c.yellow,     nil,     nil,     nil)
fn.highlight('TSTypeBuiltin', c.orange_light,     nil,     ita,     nil)
fn.highlight('TSStructure', c.blue,     nil,     nil,     nil)
fn.highlight('TSVariable',                            c.acc2,       nil,                nil,                nil)
-- stylua: ignore end

g.terminal_color_0 = c.black.hex
g.terminal_color_1 = c.red.hex
g.terminal_color_2 = c.green.hex
g.terminal_color_3 = c.yellow.hex
g.terminal_color_4 = c.blue.hex
g.terminal_color_5 = c.magenta.hex
g.terminal_color_6 = c.cyan.hex
g.terminal_color_7 = c.white.hex
g.terminal_color_8 = c.gray.hex
g.terminal_color_9 = c.red_light.hex
g.terminal_color_10 = c.green_light.hex
g.terminal_color_11 = c.yellow_light.hex
g.terminal_color_12 = c.blue_light.hex
g.terminal_color_13 = c.magenta_light.hex
g.terminal_color_15 = c.white.hex
