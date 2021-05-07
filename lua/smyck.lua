-- Name:        Smyckbuddy
-- Desciption   lua coloscheme based on https://color.smyck.org

local exec = vim.api.nvim_command
local fn = vim.fn
local v = vim.g

exec('highlight clear')
if fn.exists('syntax_on') then
    exec('syntax reset')
end

v.colors_name = 'smyck'
--[[
Color.new('bg',           '#252525')
Color.new('bg2',          '#5D5D5D')
Color.new('fg',           '#B0B0B0')
Color.new('red',          '#C75646')
Color.new('green',        '#8EB33B')
Color.new('yellow',       '#D0B03C')
Color.new('blue',         '#4E90A7')
Color.new('purple',       '#C8A0D1')
Color.new('cyan',         '#218693')
Color.new('brightRed',    '#E06990')
Color.new('brigthGreen',  '#CDEE69')
Color.new('brightYellow', '#FFE377')
Color.new('brightBlue',   '#9CD9F0')
Color.new('brightPurple', '#FBB1F9')
Color.new('brightCyan',   '#77DFD8')
--]]

local Color, colors, Group, groups, styles = require('colorbuddy').setup()

Color.new('background',    '#3B4252')
Color.new('fg',            '#292929')
Color.new('smyck_0',       '#2E3440')
Color.new('smyck_1',       '#3B4252')
Color.new('smyck_2',       '#434C5E')
Color.new('smyck_3',       '#4C566A')
Color.new('smyck_3_light', '#616E88')
Color.new('smyck_4',       '#D8DEE9')
Color.new('smyck_5',       '#E5E9F0')
Color.new('smyck_6',       '#ECEFF4')
Color.new('smyck_7',       '#8FBCBB')
Color.new('smyck_8',       '#88C0D0')
Color.new('smyck_9',       '#4E90A7')
Color.new('smyck_10',      '#218693')
Color.new('smyck_11',      '#BF616A')
Color.new('smyck_12',      '#D08770')
Color.new('smyck_13',      '#D0B03C')
Color.new('smyck_14',      '#A3BE8C')
Color.new('smyck_15',      '#B48EAD')

Color.new('white',         '#D8DEE9')
Color.new('red',           '#C75646')
Color.new('green',         '#8EB33B')
Color.new('yellow',        '#FFE377')
Color.new('blue',          '#4E90A7')
Color.new('aqua',          '#A3BE8C')
Color.new('cyan',          '#8FBCBB')
Color.new('purple',        '#FBB1F9')
Color.new('violet',        '#B48EAD')
Color.new('orange',        '#D08770')

---------------------
-- TERMINAL COLORS --
---------------------
vim.g.terminal_color_0  = '#000000'
vim.g.terminal_color_1  = '#C75646'
vim.g.terminal_color_2  = '#8EB33B'
vim.g.terminal_color_3  = '#D0B03C'
vim.g.terminal_color_4  = '#4E90A7'
vim.g.terminal_color_5  = '#C8A0D1'
vim.g.terminal_color_6  = '#218693'
vim.g.terminal_color_7  = '#B0B0B0'
vim.g.terminal_color_8  = '#5D5D5D'
vim.g.terminal_color_9  = '#E06990'
vim.g.terminal_color_10 = '#CDEE69'
vim.g.terminal_color_11 = '#FFE377'
vim.g.terminal_color_12 = '#9CD9F0'
vim.g.terminal_color_13 = '#FBB1F9'
vim.g.terminal_color_14 = '#77DFD8'
vim.g.terminal_color_15 = '#F7F7F7'

-- highlight
Group.new('TabLineSel',          colors.fg,           colors.blue, styles.bold )
Group.new('TabLineSelSeparator', colors.blue,         colors.none)
Group.new('TabLine', colors.smyck_4, colors.smyck_2)
Group.new('TabLineSeparator', colors.smyck_2, colors.none)

Group.new('Conceal',             colors.smyck_3_light, colors.none)
Group.new('VertSplit', colors.smyck_3, colors.none)

Group.new('Normal',         colors.none,         colors.none)
Group.new('Function',       colors.smyck_8,       colors.none,    styles.NONE)
Group.new('Error',          colors.smyck_11,      colors.none,    styles.bold)
Group.new('ErrorMsg',       colors.smyck_5,       colors.smyck_11, styles.bold)
Group.new('WarningMsg',     colors.smyck_5,       colors.smyck_12, styles.bold)
Group.new('Boolean',        colors.smyck_9,       colors.none,    styles.NONE)
Group.new('Character',      colors.smyck_14,      colors.none,    styles.NONE)
Group.new('Comment',        colors.smyck_3_light, colors.none,    styles.italic)
Group.new('Conditional',    colors.smyck_9,       colors.none,    styles.italic)
Group.new('Constant',       colors.smyck_4,       colors.none,    styles.italic)
Group.new('Define',         colors.smyck_9,       colors.none,    styles.NONE)
Group.new('Delimiter',      colors.smyck_6,       colors.none,    styles.NONE)
Group.new('Exception',      colors.smyck_9,       colors.none,    styles.NONE)
Group.new('Float',          colors.smyck_15,      colors.none,    styles.NONE)
Group.new('Function',       colors.smyck_8,       colors.none,    styles.NONE)
Group.new('Identifier',     colors.smyck_4,       colors.none,    styles.NONE)
Group.new('Include',        colors.smyck_9,       colors.none,    styles.NONE)
Group.new('Keyword',        colors.smyck_7,       colors.none,    styles.italic)
Group.new('Label',          colors.smyck_9,       colors.none,    styles.NONE)
Group.new('Number',         colors.smyck_15,      colors.none,    styles.NONE)
Group.new('Operator',       colors.smyck_9,       colors.none,    styles.NONE)
Group.new('PreProc',        colors.smyck_9,       colors.none,    styles.NONE)
Group.new('Repeat',         colors.smyck_9,       colors.none,    styles.NONE)
Group.new('Special',        colors.smyck_4,       colors.none,    styles.NONE)
Group.new('SpecialChar',    colors.smyck_13,      colors.none,    styles.NONE)
Group.new('SpecialComment', colors.smyck_8,       colors.none,    styles.italic)
Group.new('Statement',      colors.smyck_9,       colors.none,    styles.NONE)
Group.new('StorageClass',   colors.smyck_9,       colors.none,    styles.NONE)
Group.new('String',         colors.smyck_14,      colors.none,    styles.NONE)
Group.new('Structure',      colors.smyck_9,       colors.none,    styles.NONE)
Group.new('Tag',            colors.smyck_4,       colors.none,    styles.NONE)
Group.new('Title',          colors.smyck_4,       colors.none)
Group.new('Todo',           colors.smyck_13,      colors.none,    styles.NONE)
Group.new('Type',           colors.smyck_9,       colors.none,    styles.NONE)
Group.new('Typedef',        colors.smyck_9,       colors.none,    styles.NONE)
Group.new('CursorColumn',   colors.smyck_1,       colors.none,    styles.NONE)
Group.new('LineNr',         colors.smyck_9,       colors.none,    styles.NONE)
Group.new('CursorLineNr',   colors.smyck_5,       colors.none,    styles.NONE)
Group.new('Line',           colors.smyck_12,      colors.none,    styles.bold)
Group.new('SignColumn',     colors.none,         colors.none,    styles.NONE)
Group.new('StatusLine',     colors.smyck_8,       colors.smyck_3,    styles.NONE)

Group.new('ColorColumn', colors.none, colors.smyck_1)
Group.new('Cursor', colors.smyck_0, colors.smyck_4)
Group.new('CursorLine', colors.none, colors.none)
Group.new('iCursor',colors.smyck_0, colors.smyck_4)
Group.new('EndOfBuffer',colors.none, colors.none)
Group.new('MatchParen',colors.smyck_8, colors.smyck_3)
Group.new('NonText',colors.none, colors.none)
Group.new('PMenu', colors.smyck_4, colors.smyck_2)
Group.new('PmenuSbar', colors.smyck_4, colors.smyck_2)
Group.new('PMenuSel', colors.smyck_6, colors.smyck_9)
Group.new('PmenuThumb', colors.smyck_8, colors.smyck_3)
Group.new('SpecialKey',colors.smyck_3, colors.smyck_3)
Group.new('SpellBad',colors.smyck_11, colors.smyck_0)
Group.new('SpellCap',colors.smyck_13, colors.smyck_0)
Group.new('SpellLocal',colors.smyck_5, colors.smyck_0)
Group.new('SpellRare',colors.smyck_6, colors.smyck_0)
Group.new('Visual',colors.smyck_4, colors.smyck_9)
Group.new('VisualNOS',colors.smyck_2, colors.smyck_1)
Group.new('Folded', colors.smyck_14, colors.none, styles.italic)

-- '+- Neovim Support -+
Group.new('healthError',colors.smyck_11, colors.smyck_1)
Group.new('healthSuccess',colors.smyck_14, colors.smyck_1)
Group.new('healthWarning',colors.smyck_13, colors.smyck_1)
Group.new('TermCursorNC',colors.smyck_1, colors.smyck_1)
Group.new('IncSearch',colors.smyck_6, colors.smyck_10, styles.underline)
Group.new('Search',colors.smyck_1, colors.smyck_8)

-- vim
Group.new('vimcommand',      groups.Statement, colors.none)
Group.new('vimLet',          groups.vimcommand , colors.none)
Group.new('vimFuncVar',      groups.identifier, colors.none)
Group.new('vimCommentTitle', groups.PreProc, colors.none)
Group.new('vimIsCommand',    colors.none, colors.none)
Group.new('vimFuncSID',      groups.Special, colors.none)
Group.new('vimMapModKey',    groups.vimFuncSID, colors.none)
Group.new('vimMapLhs',       colors.none, colors.none)
Group.new('vimNotation',     colors.smyck_7, colors.none)
Group.new('vimBracket',      groups.Delimiter, colors.none)
Group.new('vimMap',          groups.vimcommand, colors.none)
Group.new('nvimMap',         groups.vimMap, colors.none)

-- startify
Group.new('StartifyFile',colors.smyck_6, colors.none)
Group.new('StartifyFooter',colors.none, colors.none)
Group.new('StartifyHeader',colors.smyck_8, colors.none)
Group.new('StartifyNumber',colors.smyck_7, colors.none)
Group.new('StartifyPath',colors.smyck_8, colors.none)
Group.new('StartifyBracket', groups.Delimiter, groups.Delimiter)
Group.new('StartifySlash', groups.Normal, groups.Normal)
Group.new('StartifySpecial', groups.Comment, groups.Comment)

-- gitgutter
Group.new('GitGutterAdd',          colors.smyck_14, colors.none)
Group.new('GitGutterDelete',       colors.smyck_11, colors.none)
Group.new('GitGutterChange',       colors.smyck_13, colors.none)
Group.new('GitGutterChangeDelete', colors.smyck_11, colors.none)

-- built-in LSP
Group.new('LSPDiagnosticsDefaultWarning', colors.smyck_13, colors.none)
Group.new('LSPDiagnosticsDefaultError', colors.smyck_11, colors.none)
Group.new('LSPDiagnosticsDefaultInformation', colors.smyck_8, colors.none)
Group.new('LSPDiagnosticsDefaultHint', colors.smyck_10, colors.none)
Group.new('LSPDiagnosticsSignWarning', colors.smyck_13, colors.none)
Group.new('LSPDiagnosticsSignError', colors.smyck_11, colors.none)
Group.new('LSPDiagnosticsSignInformation', colors.smyck_8, colors.none)
Group.new('LSPDiagnosticsSignHint', colors.smyck_10, colors.none)
Group.new('LSPDiagnosticsFloatingWarning', colors.smyck_13, colors.none)
Group.new('LSPDiagnosticsFloatingError', colors.smyck_11, colors.none)
Group.new('LSPDiagnosticsFloatingInformation', colors.smyck_8, colors.none)
Group.new('LSPDiagnosticsFloatingHint', colors.smyck_10, colors.none)

Group.new('LSPReferenceText', colors.none, colors.none)
Group.new('LSPReferenceRead', colors.none, colors.none, styles.bold)
Group.new('LSPReferenceWrite', colors.smyck_9, colors.none, styles.bold)

-- TeleScope
Group.new('TelescopeSelection', colors.smyck_11, colors.smyck_8, styles.bold)
Group.new('TelescopeNormal', groups.Pmenu, groups.Pmenu)

-- Markdown
Group.new('markdownError', colors.smyck_4, colors.none)

