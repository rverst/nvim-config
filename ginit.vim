" Enable Mouse
set mouse=a

" set global variable to check for gui neovim
" in other config files
let g:is_gui=1

" Set Editor Font
if exists(':GuiFont')
    if has('win32')
      set guifont=Hack NF:h14
    endif

    if has('macunix')
      set guifont=Hack\ Nerd\ Font\ Mono:h14
    endif
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Disable GUI Tabs
if exists(':GuiTabline')
    GuiTabline 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv

lua << EOF

local fn = require('utils.fn')
local c = vim.g.colors
fn.highlight('SpellBad',   nil, nil, 'undercurl', c.red_error)
fn.highlight('SpellCap',   nil, nil, 'undercurl', c.orange)
fn.highlight('SpellLocal', nil, nil, 'undercurl', c.blue)
fn.highlight('SpellRare',  nil, nil, 'undercurl', c.magenta)

EOF
