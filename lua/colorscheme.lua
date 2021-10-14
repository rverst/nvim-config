local g = vim.g
local c = g.colors
local utils = require('utils')
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
utils.highlight('Normal',                                nil,                c.bg,               nil,                nil)
utils.highlight('LineNr',                                nil,                c.none,             nil,                nil)
utils.highlight('SignColumn',                            nil,                c.none,             nil,                nil)

utils.highlight('Todo',                                  c.yellow,           c.none,             ubi,                nil)
utils.highlight('Fixme',                                 c.red,              c.none,             ubi,                nil)

utils.highlight('Cursor',                                nil,                c.cursor,           inv,                nil)
utils.highlight('TermCursor',                            nil,                c.cursor,           inv,                nil)
utils.highlight('iCursor',                               nil,                c.cursor,           inv,                nil)

utils.highlight('MatchParen',                            nil,                c.dark2,            nil,                nil)
utils.highlight('MatchParent',                           nil,                c.dark2,            nil,                nil)

utils.highlight('CursorLine',                            nil,                c.cursorline,       nil,                c.dark2)
utils.highlight('CursorLineNR',                          c.yellow,           c.none,             none,               nil)

utils.highlight('VertSplit',                             c.border,           c.none,             nil,                nil)

utils.highlight('EndOfBuffer',                           c.bg,               c.none,             nil,                nil)
utils.highlight('Pmenu',                                 nil,                c.dark2,            nil,                nil)
utils.highlight('PmenuSel',                              c.orange_light,     c.dark3,            nil,                nil)

utils.highlight('IndentBlanklineChar',                   c.dark2,            nil,                nil,                nil)

utils.highlight('SpellBad',                              c.red_error,        nil,                ucl,                c.red_error)
utils.highlight('SpellCap',                              c.orange,           nil,                ucl,                c.orange)
utils.highlight('SpellLocal',                            c.blue,             nil,                ucl,                c.blue)
utils.highlight('SpellRare',                             c.magenta,          nil,                ucl,                c.magenta)

utils.highlight('GitSignsAdd',                           c.green,            c.none,             none,               nil)
utils.highlight('GitSignsChange',                        c.yellow,           c.none,             none,               nil)
utils.highlight('GitSignsDelete',                        c.red,              c.none,             none,               nil)
utils.highlight('GitSignsChangeDelete',                  c.red,              c.none,             none,               nil)

utils.highlight('TelescopeBorder',                       c.border,           c.none,             nil,                nil)
utils.highlight('TelescopePromptBorder',                 c.border,           c.none,             nil,                nil)
utils.highlight('TelescopeResultsBorder',                c.border,           c.none,             nil,                nil)
utils.highlight('TelescopePreviewBorder',                c.border,           c.none,             nil,                nil)

utils.highlight('NvimTreeRootFolder',                    c.acc1,             nil,                nil,                nil)
utils.highlight('NvimTreeFolderName',                    c.yellow,           nil,                nil,                nil)
utils.highlight('NvimTreeOpenedFolderName',              c.yellow_light,     nil,                nil,                nil)
utils.highlight('NvimTreeIndentMarker',                  c.dark2,            nil,                nil,                nil)

utils.highlight('FloatNormal',     		      	          c.acc1,           	c.dark2,            nil,                nil)
utils.highlight('FloatBorder',     		      	          c.border,           c.dark2,            nil,                nil)

-- SymbolsOutline
utils.highlight('FocusedSymbol',                         c.orange,           c.dark2,            bit,                nil)

-- dashboard
utils.highlight('DashboardHeader',                       c.green_light,   		c.none,             nil,                nil)
utils.highlight('DashboardCenter',                       c.green,            c.none,             nil,                nil)
utils.highlight('DashboardShortcut',                     c.orange,           c.none,             ita,                nil)
utils.highlight('DashboardFooter',                       c.yellow,           c.none,             nil,                nil)

-- dap
utils.highlight('DapBreakpoint',                         c.red,           	  nil,                nil,                nil)
utils.highlight('DapBreakpointRejected',                 c.red_error,    	  nil,                nil,                nil)
utils.highlight('DapStopped',                            c.green_light,   	  nil,                nil,                nil)
utils.highlight('DapLogPoint',                           c.blue_light,    	  nil,                nil,                nil)

-- dapui
utils.highlight('DapUIType',           		              c.orange_light,  	  nil,                nil,                nil)
utils.highlight('DapUIScope',           		              c.yellow_light,     nil,                nil,                nil)
utils.highlight('DapUISource',           		            c.blue_light,       nil,                nil,                nil)
utils.highlight('DapUIThread',            		            c.blue,             nil,                nil,                nil)
utils.highlight('DapUIVariable',                	        c.purple,           nil,                nil,                nil)
utils.highlight('DapUIFrameName',           	            c.acc1,             nil,                nil,                nil)
utils.highlight('DapUIDecoration',           	          c.cyan_light,       nil,                nil,                nil)
utils.highlight('DapUILineNumber',           	          c.acc2,             nil,                nil,                nil)
utils.highlight('DapUIFloatBorder',           	          c.border,           nil,                nil,                nil)
utils.highlight('DapUIWatchesEmpty',           	        c.acc2,        	    nil,                nil,                nil)
utils.highlight('DapUIWatchesError',           	        c.red_error,    	  nil,                nil,                nil)
utils.highlight('DapUIWatchesValue',           	        c.orange,       	  nil,                nil,                nil)
utils.highlight('DapUIStoppedThread',           	        c.red_light,    	  nil,                nil,                nil)
utils.highlight('DapUIBreakpointsInfo',           	      c.yellow_light, 	  nil,                nil,                nil)
utils.highlight('DapUIBreakpointsLine',           	      c.green,         	  nil,                nil,                nil)
utils.highlight('DapUIBreakpointsPath',           	      c.cyan,          	  nil,                nil,                nil)
utils.highlight('DapUIBreakpointsCurrentLine',           c.green_light,   	  nil,                nil,                nil)

-- nvim-dap-virtual-text
utils.highlight('NvimDapVirtualText',           	        c.virtual_text,  	  nil,                nil,                nil)
utils.highlight('NvimDapVirtualTextInfo',                c.virtual_info,  	  nil,                nil,                nil)
utils.highlight('NvimDapVirtualTextError',               c.virtual_error, 	  nil,                nil,                nil)

-- LSP
utils.highlight('LspDiagnosticsDefaultError',            c.red,              nil,                ita,                nil)
utils.highlight('LspDiagnosticsDefaultWarning',          c.orange,           nil,                ita,                nil)
utils.highlight('LspDiagnosticsDefaultHint',             c.dark2,            nil,                ita,                nil)
utils.highlight('LspDiagnosticsDefaultInformation',      c.yellow,           nil,                ita,                nil)

utils.highlight('LspReferenceRead',                      nil,                nil,                uli,                c.green)
utils.highlight('LspReferenceWrite',                     c.red_light,        nil,                uit,                c.red)
utils.highlight('LspReferenceText',                      c.acc1,             nil,                uli,                c.acc2)

-- Which-Key
utils.highlight('WhichKey',                              c.yellow_light,     c.none,             none,               nil)
utils.highlight('WhichKeyGroup',                         c.yellow,           c.none,             ita,                nil)
utils.highlight('WhichKeySeparator',                     c.border,           c.none,             none,               nil)
utils.highlight('WhichKeyDesc',                          c.acc2,             c.none,             none,               nil)
utils.highlight('WhichKeyFloat',                         c.acc1,             c.bg,               none,               nil)
utils.highlight('WhichKeyValue',                         c.comment,          c.nonenil,          none,               nil)

-- Bufferline
utils.highlight('BufferCurrent',                         c.yellow,           c.dark2,            nil,                nil)
utils.highlight('BufferCurrentIndex',                    c.border,           c.dark2,            nil,                nil)
utils.highlight('BufferCurrentMod',                      c.yellow,           c.dark2,            bit,                nil)
utils.highlight('BufferCurrentSign',                     c.border,           c.dark2,            nil,                nil)
utils.highlight('BufferCurrentTarget',                   nil,                c.dark2,            nil,                nil)
utils.highlight('BufferVisible',                         c.acc2,             nil,                ita,                nil)
utils.highlight('BufferVisibleIndex',                    c.border,           nil,                nil,                nil)
utils.highlight('BufferVisibleMod',                      c.acc2,             nil,                bit,                nil)
utils.highlight('BufferVisibleSign',                     c.border,           nil,                nil,                nil)
utils.highlight('BufferVisibleTarget',                   nil,                nil,                nil,                nil)
utils.highlight('BufferInactive',                        c.comment,          nil,                nil,                nil)
utils.highlight('BufferInactiveIndex',                   c.border,           nil,                nil,                nil)
utils.highlight('BufferInactiveMod',                     c.comment,          nil,                bit,                nil)
utils.highlight('BufferInactiveSign',                    c.border,           nil,                nil,                nil)
utils.highlight('BufferInactiveTarget',                  nil,                nil,                nil,                nil)
utils.highlight('BufferTabpages',                        nil,                nil,                nil,                nil)
utils.highlight('BufferTabpageFill',                     nil,                nil,                nil,                nil)
utils.highlight('BufferCurrentIcon',                     nil,                c.dark2,            nil,                nil)
utils.highlight('BufferVisibleIcon',                     nil,                nil,                nil,                nil)
utils.highlight('BufferInactiveIcon',                    nil,                nil,                nil,                nil)

-- standard syntax highlighting
utils.highlight('Boolean',                               c.orange,           nil,                nil,                nil)
utils.highlight('Character',                             c.green,            nil,                nil,                nil)
utils.highlight('Comment',                               c.comment,          nil,                ita,                nil)
utils.highlight('Conditional',                           c.orange_light,     nil,                nil,                nil)
utils.highlight('Constant',                              c.purple,           nil,                nil,                nil)
utils.highlight('Define',                                c.orange_light,     nil,                nil,                nil)
utils.highlight('Delimiter',                             c.acc2,             nil,                nil,                nil)
utils.highlight('Float',                                 c.blue,             nil,                nil,                nil)
utils.highlight('Function',                              c.yellow,           nil,                nil,                nil)
utils.highlight('Identifier',                            c.purple,           nil,                nil,                nil)
utils.highlight('Include',                               c.orange_light,     nil,                nil,                nil)
utils.highlight('Keyword',                               c.orange,           nil,                nil,                nil)
utils.highlight('Label',                                 c.yellow_light,     nil,                nil,                nil)
utils.highlight('Number',                                c.cyan,             nil,                nil,                nil)
utils.highlight('Operator',                              c.acc2,             nil,                nil,                nil)
utils.highlight('PreProc',                               c.yellow_light,     nil,                nil,                nil)
utils.highlight('Repeat',                                c.orange,           nil,                nil,                nil)
utils.highlight('Special',                               c.yellow_light,     nil,                nil,                nil)
utils.highlight('SpecialChar',                           c.orange,           nil,                nil,                nil)
utils.highlight('Statement',                             c.green_light,      nil,                nil,                nil)
utils.highlight('StorageClass',                          c.orange_light,     nil,                nil,                nil)
utils.highlight('String',                                c.green_dark,       nil,                nil,                nil)
utils.highlight('Structure',                             c.orange_light,     nil,                nil,                nil)
utils.highlight('Tag',                                   c.orange_light,     nil,                nil,                nil)
utils.highlight('Todo',                                  c.yellow_light,     nil,                nil,                nil)
utils.highlight('Type',                                  c.blue_light,       nil,                nil,                nil)
utils.highlight('Typedef',                               c.magenta_light,    nil,                nil,                nil)

-- Treesitter
-- Misc
utils.highlight('TSError',                               c.red_light,     		nil,     						nil,     						nil)
utils.highlight('TSPunctDelimiter',                      c.fg,     					nil,     						nil,     						nil)
utils.highlight('TSPunctBracket',                        c.fg,     					nil,     						nil,     						nil)
utils.highlight('TSPunctSpecial',                        c.fg,     					nil,     						nil,     						nil)
-- Constants
utils.highlight('TSConstant',                            c.purple,     			nil,     						nil,     						nil)
utils.highlight('TSConstBuiltin',                        c.purple,     			nil,     						ita,     						nil)
-- -- These things overrides all palletes above
-- TSConstMacro: "orange"
-- TSStringRegex: "orange"
utils.highlight('TSString',                              c.green_dark,     	nil,     						nil,     						nil)
-- TSStringEscape: "yellow_light"
utils.highlight('TSCharacter',                           c.green,     				nil,     						nil,     						nil)
utils.highlight('TSNumber',                              c.magenta_light,    nil,     						nil,     						nil)
-- TSBoolean: "blue"
-- TSFloat: "light_yellow"
-- TSAnnotation: "yellow"
-- TSAttribute: "orange"
-- TSNamespace: "blue_light"
-- Functions
utils.highlight('TSFuncBuiltin', 												c.yellow,     			nil,     						nil,     						nil)
utils.highlight('TSFunction', 														c.yellow,     			nil,     						nil,     						nil)
utils.highlight('TSFuncMacro', 													c.yellow,     			nil,     						nil,     						nil)
utils.highlight('TSParameter', 													c.blue,     				nil,     						nil,     						nil)
utils.highlight('TSParameterReference', 									c.blue_light,     	nil,     						nil,     						nil)
utils.highlight('TSMethod', 															c.yellow,     			nil,     						nil,     						nil)
utils.highlight('TSField', 															c.purple,     			nil,     						nil,     						nil)
utils.highlight('TSProperty', 														c.aqua,     				nil,     						nil,     						nil)
utils.highlight('TSConstructor', 												c.aqua_light,     	nil,     						nil,     						nil)
-- Keywords
utils.highlight('TSConditional', 												c.purple,     			nil,     						nil,     						nil)
utils.highlight('TSRepeat', 															c.purple,     			nil,     						nil,     						nil)
utils.highlight('TSLabel', 															c.blue,     				nil,     						nil,     						nil)
 -- Does not work for yield and return they should be diff then class and def
utils.highlight('TSKeyword', 														c.orange,     			nil,     						nil,     						nil)
utils.highlight('TSKeywordFunction', 										c.purple,    				nil,     						nil,     						nil)
utils.highlight('TSKeywordOperator', 										c.blue,     				nil,     						nil,     						nil)
utils.highlight('TSOperator', 														c.fg,     					nil,     						nil,     						nil)
utils.highlight('TSException', 													c.purple,     			nil,     						nil,     						nil)
utils.highlight('TSType', 																c.yellow,     			nil,     						nil,     						nil)
utils.highlight('TSTypeBuiltin', 												c.orange_light,     nil,     						ita,     						nil)
utils.highlight('TSStructure', 													c.blue,     				nil,     						nil,     						nil)
utils.highlight('TSVariable',            								c.acc2,       			nil,                nil,                nil)
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
