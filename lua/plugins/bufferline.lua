-- colors

local c = vim.g.colors

local bar_bg = c.dark2.hex
local bar_fg = c.border.hex

require('bufferline').setup {
    options = {
        numbers = 'none',
        number_style = 'superscript',
        diagnostics = 'none',
        buffer_close_icon = '',
        modified_icon = '',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 17,
        tab_size = 21,
        enforce_regular_tabs = false,
        view = 'multiwindow',
        show_buffer_close_icons = true,
        separator_style = '|'
    },
    highlights = {
            fill = {
                guifg = bar_fg,
                guibg = c.bg.hex,
            },
            background = {
                guifg = bar_fg,
                guibg = c.bg.hex
            },
            tab = {
                guifg = bar_fg,
                guibg = bar_bg
            },
            tab_selected = {
                guifg = c.red_dark.hex,
                guibg = bar_bg,
            },
            tab_close = {
                guifg = bar_fg,
                guibg = c.bg.hex
            },
            buffer_visible = {
                guifg = c.acc1.hex,
                guibg = c.dark1.hex,
                gui = 'italic'
            },
            buffer_selected = {
                guifg = c.yellow.hex,
                guibg = bar_bg,
                gui = "bold"
            },
            diagnostic = {
                guifg = bar_fg,
                guibg = bar_bg,
            },
            diagnostic_visible = {
                guifg = bar_fg,
                guibg = bar_bg,
            },
            diagnostic_selected = {
                guifg = bar_fg,
                guibg = bar_bg,
                gui = "bold,italic"
            },
            info = {
                guifg = bar_fg,
                guisp = c.yellow.hex,
                guibg = bar_bg
            },
            info_visible = {
                guifg = bar_fg,
                guibg = bar_bg
            },
            info_selected = {
                guifg = bar_fg,
                guibg = bar_bg,
                gui = "bold,italic",
                guisp = c.cyan.hex
            },
            info_diagnostic = {
                guifg = bar_fg,
                guisp = c.cyan.hex,
                guibg = bar_bg
            },
            info_diagnostic_visible = {
                guifg = bar_fg,
                guibg = bar_bg
            },
            info_diagnostic_selected = {
                guifg = bar_fg,
                guibg = bar_bg,
                gui = "bold,italic",
                guisp = c.cyan.hex
            },
            warning = {
                guifg = bar_fg,
                guisp = c.cyan.hex,
                guibg = bar_bg
            },
            warning_visible = {
                guifg = bar_fg,
                guibg = bar_bg
            },
            warning_selected = {
                guifg = bar_fg,
                guibg = bar_bg,
                gui = "bold,italic",
                guisp = c.cyan.hex
            },
            warning_diagnostic = {
                guifg = bar_fg,
                guisp = c.cyan.hex,
                guibg = bar_bg
            },
            warning_diagnostic_visible = {
                guifg = bar_fg,
                guibg = bar_bg
            },
            warning_diagnostic_selected = {
                guifg = bar_fg,
                guibg = bar_bg,
                gui = "bold,italic",
                guisp = c.red.hex
            },
            error = {
                guifg = bar_fg,
                guibg = bar_bg,
                guisp = c.cyan.hex
            },
            error_visible = {
                guifg = bar_fg,
                guibg = bar_bg
            },
            error_selected = {
                guifg = bar_fg,
                guibg = bar_bg,
                gui = "bold,italic",
                guisp = c.cyan.hex
            },
            error_diagnostic = {
                guifg = bar_fg,
                guibg = bar_bg,
                guisp = c.cyan.hex
            },
            error_diagnostic_visible = {
                guifg = bar_fg,
                guibg = bar_bg
            },
            error_diagnostic_selected = {
                guifg = bar_fg,
                guibg = bar_bg,
                gui = "bold,italic",
                guisp = c.cyan.hex
            },
            modified = {
                guifg = bar_fg,
                guibg = bar_bg
            },
            modified_visible = {
                guifg = bar_fg,
                guibg = bar_bg
            },
            modified_selected = {
                guifg = bar_fg,
                guibg = bar_bg
            },
            duplicate_selected = {
                guifg = bar_fg,
                gui = "italic",
                guibg = bar_bg,
            },
            duplicate_visible = {
                guifg = bar_fg,
                gui = "italic",
                guibg = bar_bg
            },
            duplicate = {
                guifg = bar_fg,
                gui = "italic",
                guibg = bar_bg
            },
            separator_selected = {
                guifg = c.dark3.hex,
            },
            separator_visible = {
                guifg = c.dark3.hex,
            },
            separator = {
                guifg = c.dark3.hex,
            },
            indicator_selected = {
                guifg = bar_bg,
                guibg = bar_bg
            },
            pick_selected = {
                guifg = bar_fg,
                guibg = bar_bg,
                gui = "bold,italic"
            },
            pick_visible = {
                guifg = bar_fg,
                guibg = bar_bg,
                gui = "bold,italic"
            },
            pick = {
                guifg = bar_fg,
                guibg = bar_bg,
                gui = "bold,italic"
            },
    }
}

local opt = {silent = true, noremap = true}
local map = require('utils').map

-- cycle trough tabs
map('n', '<S-l>', [[<Cmd>BufferLineCycleNext<CR>]], opt)
map('n', '<S-k>', [[<Cmd>BufferLineCyclePrev<CR>]], opt)

