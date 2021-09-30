local wk = require('which-key')
local utils = require('utils')
local term = require('utils.term')

wk.setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true,
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '➜', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
  },
  window = {
    border = 'single', -- none, single, double, shadow
    position = 'bottom', -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 35 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
})

-- normal <leader> mappings
wk.register({
  p = { [["+p]], 'Paste from clipboard' },
  P = { [["+P]], 'Paste from clipboard (before)' },
  y = { [["+y]], 'Yank to clipboard' },
  Y = { [["+Y]], 'Yank line to clipboard' },
  q = { [[<cmd>lua require('telescope.builtin').quickfix()<CR>]], 'Quickfix' },
  C = { [[<Plug>kommentary_motion_default]], 'Toggle comment [motion]' },
  ['/'] = { [[<Plug>kommentary_line_default]], 'Toggle line comment' },

  f = {
    name = 'find',
    F = {
      [[<cmd>lua require('plugins.telescope').project_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<CR>]],
      'find file (narrow)',
    },
    f = { [[<cmd>lua require('plugins.telescope').project_files()<CR>]], 'find file (wide)' },
    r = { [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], 'open recent file' },
    d = { [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], 'find in buffer' },
    D = { [[<cmd>lua require('telescope.builtin').current_buffer_tags()<CR>]], 'tags of buffer' },
    b = { [[<cmd>lua require('telescope.builtin').buffers()<CR>]], 'find buffer' },
    g = { [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], 'live grep' },
    h = { [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], 'grep help' },
    i = { [[<cmd>lua require('telescope.builtin').highlights()<CR>]], 'grep highlights' },
    c = { [[<cmd>lua require('telescope.builtin').commands()<CR>]], 'grep commands' },
    t = { [[<cmd>lua require('telescope.builtin').tags()<CR>]], 'grep tags' },
    s = { [[<cmd>lua require('telescope.builtin').git_files()<CR>]], 'git files' },
    w = { [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], 'find word' },
    m = { [[<cmd>lua require('telescope.builtin').marks()<CR>]], 'marks' },
    n = { [[<cmd>enew<CR>]], 'new file' },
    k = { [[<cmd>lua require('telescope.builtin').keymaps()<CR>]], 'keymaps' },
    o = { [[<cmd>lua require('telescope.builtin').vim_options()<CR>]], 'vim options' },
    v = { [[<cmd>lua require('plugins.telescope').search_vimconfig()<CR>]], 'search nvim config' },
    ['.'] = { [[<cmd>lua require('plugins.telescope').search_dotfiles()<CR>]], 'search dotfiles' },
  },

  d = {
    name = 'debug',
    b = { [[<cmd>lua require('dap').toggle_breakpoint()<CR>]], 'Toggle breakpoint' },
    B = { [[<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], 'Set breakpoint' },
    L = {
      [[<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point messgage: '))<CR>]],
      'Set log point',
    },
    r = { [[<cmd>lua require('dap').repl.open()<CR>]], 'Repl open' },
    l = { [[<cmd>lua require('dap').run_last()<CR>]], 'Run last' },
  },

  g = {
    name = 'git',
    c = { [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], 'List commits' },
    C = { [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], 'List buffer commits' },
    b = { [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], 'Git branches' },
    S = { [[<cmd>lua require('telescope.builtin').git_status()<CR>]], 'Git Status' },
    s = { [[<cmd>lua require('gitsigns').stage_hunk()<CR>]], 'Stage hunk' },
    u = { [[<cmd>lua require('gitsigns').undo_stage_hunk()<CR>]], 'Undo stage hunk' },
    r = { [[<cmd>lua require('gitsigns').reset_hunk()<CR>]], 'Reset hunk' },
    R = { [[<cmd>lua require('gitsigns').reset_buffer()<CR>]], 'Reset buffer' },
    p = { [[<cmd>lua require('gitsigns').preview_hunk()<CR>]], 'Preview hunk' },
    B = { [[<cmd>lua require('gitsigns').blame_line()<CR>]], 'Blame line' },
    ['.'] = 'Next hunk',
    [','] = 'Previous hunk',
  },

  T = {
    name = 'telescope',
    p = { [[<cmd>lua require('telescope.builtin').planets()<CR>]], 'Use the telescope' },
    b = { [[<cmd>lua require('telescope.builtin').builtin()<CR>]], 'List builtin pickers' },
    R = { [[<cmd>lua require('telescope.builtin').reloader()<CR>]], 'List lua modules and reload' },
    s = { [[<cmd>lua require('telescope.builtin').symbols()<CR>]], 'List builtin symbols' },
    r = { [[<cmd>lua require('telescope.builtin').registers()<CR>]], 'List registers' },
    f = { [[<cmd>lua require('telescope.builtin').filetypes()<CR>]], 'List filetypes' },
  },

  o = {
    name = 'ortography',
    o = { [[<cmd>setlocal spell! spelllang=en_us,de_de<CR>]], 'Toggle spellcheck (en/de)' },
    e = { [[<cmd>setlocal spell! spelllang=en_us<CR>]], 'Toggle spellcheck (en)' },
    d = { [[<cmd>setlocal spell! spelllang=de_de<CR>]], 'Toggle spellcheck (de)' },
    g = { [[<cmd>setlocal spell! spelllang=de_de<CR>]], 'Toggle spellcheck (de)' },
    s = { [[<cmd>lua require('telescope.builtin').spell_suggest()<CR>]], 'Spell suggestion' },
  },

  t = {
    name = 'terminal',
    n = { [[<cmd>lua require('plugins.which-key').openTerminal('v')<CR>]], 'Vertical terminal' },
    x = {
      [[<cmd>lua require('plugins.which-key').openTerminal('h', '', 10)<CR>]],
      'horizontal terminal',
    },
    f = { [[<cmd>lua require('plugins.which-key').openFloatTerm('')<CR>]], 'Float terminal' },
    g = { [[<cmd>lua require('plugins.which-key').openFloatTerm('lazygit')<CR>]], 'Lazygit' },
    d = { [[<cmd>lua require('plugins.which-key').openFloatTerm('lazydocker')<CR>]], 'Lazydocker' },
  },

  c = {
    name = 'code',
    c = { [[<Plug>kommentary_line_default]], 'Toggle line comment' },
    C = { [[<Plug>kommentary_motion_default]], 'Toggle comment [motion]' },
    -- f = { [[<cmd>Format<CR>]], 'Format code' },
    F = { [[<cmd>FormatWrite<CR>]], 'Format code and write' },
    -- additional keybinds in ../lsp/config.lua
  },

  m = {
    name = 'misc',
    i = { [[<cmd>TSHighlightCapturesUnderCursor<CR>]], 'Highlight captures under cursor' },
    p = { [[<cmd>TSPlaygroundToggle<CR>]], 'Toggle treesitter playgound' },
  },

  s = {
    name = 'session',
    s = { [[<cmd>SessionSave<CR>]], 'Save session' },
    l = { [[<cmd>SessionLoad<CR>]], 'Load session' },
  },

  b = {
    name = 'bufferline',
    ['1'] = { [[<cmd>BufferGoto 1<CR>]], 'buffer 1' },
    ['2'] = { [[<cmd>BufferGoto 2<CR>]], 'buffer 2' },
    ['3'] = { [[<cmd>BufferGoto 3<CR>]], 'buffer 3' },
    ['4'] = { [[<cmd>BufferGoto 4<CR>]], 'buffer 4' },
    ['5'] = { [[<cmd>BufferGoto 5<CR>]], 'buffer 5' },
    ['6'] = { [[<cmd>BufferGoto 6<CR>]], 'buffer 6' },
    ['7'] = { [[<cmd>BufferGoto 7<CR>]], 'buffer 7' },
    ['8'] = { [[<cmd>BufferGoto 8<CR>]], 'buffer 8' },
    ['9'] = { [[<cmd>BufferGoto 9<CR>]], 'buffer 9' },
    ['0'] = { [[<cmd>BufferLast<CR>]], 'last buffer' },
    [','] = { [[<cmd>BufferMovePrevious<CR>]], 'move buffer left' },
    ['.'] = { [[<cmd>BufferMoveNext<CR>]], 'move buffer right' },
    ['c'] = { [[<cmd>BufferClose<CR>]], 'close buffer' },
    ['d'] = { [[<cmd>BufferOrderByDirectory<CR>]], 'order buffers by dir' },
    ['l'] = { [[<cmd>BufferOrderByLanguage<CR>]], 'order buffers by lang' },
  },
}, {
  prefix = '<leader>',
})

-- visual <leader> mappings
wk.register({
  p = { [["+p]], 'Paste from clipboard' },
  y = { [["+y]], 'Yank to clipboard' },
  f = { [[<cmd>Format<CR>]], 'Format code' },
  F = { [[<cmd>FormatWrite<CR>]], 'Format code and write' },
  ['/'] = { [[<Plug>kommentary_visual_default]], 'Toggle comment' },
  c = {
    name = 'code',
    c = { [[<Plug>kommentary_visual_default]], 'Toggle comment' },
    -- additional keybinds in ../lsp/config.lua
  },
  d = {
    f = { [[<cmd>Format<CR>]], 'Format code' },
    F = { [[<cmd>FormatWrite<CR>]], 'Format code and write' },
  },
}, {
  prefix = '<leader>',
  mode = 'v',
})

-- normal mappings
wk.register({
  ['<F1>'] = { [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], 'which_key_ignore' },
  ['<F3>'] = { [[<cmd>vertical resize -5<CR>]], 'Decrease vert. size (-5)' },
  ['<F4>'] = { [[<cmd>vertical resize +5<CR>]], 'Increase vert. size (+5)' },
  ['<F15>'] = { [[<cmd>resize -5<CR>]], 'Decrease hori. size (-5)' },
  ['<F16>'] = { [[<cmd>resize +5<CR>]], 'Increase hori. size (+5)' },
  ['<F5>'] = { [[<cmd>lua require('dap').continue()<CR>]], 'Continue' },
  ['<F7>'] = { [[<cmd>lua require('dap').step_into()<CR>]], 'Step into' },
  ['<F8>'] = { [[<cmd>lua require('dap').step_over()<CR>]], 'Step over' },
  ['<F20>'] = { [[<cmd>lua require('dap').step_out()<CR>]], 'Step out' },
  ['<F9>'] = { [[<cmd>lua require('dap').step_out()<CR>]], 'Run to cursor' },
  ['<CR>'] = { [[<cmd>noh<CR><CR>]], 'which_key_ignore' },
  ['<C-h>'] = { [[<C-w>h]], 'which_key_ignore' },
  ['<C-j>'] = { [[<C-w>j]], 'which_key_ignore' },
  ['<C-k>'] = { [[<C-w>k]], 'which_key_ignore' },
  ['<C-l>'] = { [[<C-w>l]], 'which_key_ignore' },
  ['<F12>'] = { [[<cmd>vertical resize +5<CR>]], 'which_key_ignore' },
  ['<F24>'] = { [[<cmd>vertical resize -5<CR>]], 'which_key_ignore' },
  ['L'] = { [[<cmd>BufferNext<CR>]], 'Next buffer' },
  ['H'] = { [[<cmd>BufferPrevious<CR>]], 'Previous buffer' },
  ['J'] = { [[<cmd>move +1<CR>]], 'Move line down' },
  ['K'] = { [[<cmd>move -2<CR>]], 'Move line up' },
  ['<F2>'] = { [[<C-w>=]], 'Equal splits' },
  ['<C-n>'] = { [[<cmd>NvimTreeToggle<CR>]], 'Toggle file explorer' },
  ['<C-s>'] = { [[<cmd>SymbolsOutline<CR>]], 'Toggle symbols outline' },

  [']'] = { c = 'Next hunk' },
  ['['] = { c = 'Previous hunk' },
}, {})

wk.register({
  h = { [[<cmd>lua require('lspsaga.provider').lsp_finder()<CR>]], 'Show definition' },
}, { prefix = 'g' })

-- insert mappings
wk.register({
  ['<F1>'] = { [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], 'which_key_ignore' },
  ['<C-h>'] = { [[<C-w>h]], 'which_key_ignore' },
  ['<C-j>'] = { [[<C-w>j]], 'which_key_ignore' },
  ['<C-k>'] = { [[<C-w>k]], 'which_key_ignore' },
  ['<C-l>'] = { [[<C-w>l]], 'which_key_ignore' },
}, {
  mode = 'i',
})

-- visual mappings
wk.register({
  ['<F1>'] = { [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], 'which_key_ignore' },
  ['<C-h>'] = { [[<C-w>h]], 'which_key_ignore' },
  ['<C-j>'] = { [[<C-w>j]], 'which_key_ignore' },
  ['<C-k>'] = { [[<C-w>k]], 'which_key_ignore' },
  ['<C-l>'] = { [[<C-w>l]], 'which_key_ignore' },
}, {
  mode = 'v',
})

-- terminal mappings
wk.register({
  ['<F1>'] = { [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], 'which_key_ignore' },
  ['<Esc>'] = 'which_key_ignore',
  ['<C-h>'] = 'which_key_ignore',
  ['<C-j>'] = 'which_key_ignore',
  ['<C-k>'] = 'which_key_ignore',
  ['<C-l>'] = 'which_key_ignore',
  ['<C-q>'] = 'which_key_ignore',
}, {
  mode = 't',
})

local M = {}

M.openTerminal = function(orientation, size, autoclose)
  local s = size or 0
  local acl = autoclose or true

  local c = ''
  if orientation == 'h' then
    c = 'new term://' .. vim.o.shell
  else
    c = 'vnew term://' .. vim.o.shell
  end

  if s > 0 then
    c = c .. ' | resize ' .. size
  end
  vim.cmd(c)

  local tBuf = vim.api.nvim_get_current_buf()
  -- <esc> to leave insert mode in terminal
  utils.buf_map(tBuf, 't', '<ESC>', [[<C-\><C-n>]])
  utils.buf_map(tBuf, 't', '<C-h>', [[<C-\><C-n><C-w>h]])
  utils.buf_map(tBuf, 't', '<C-j>', [[<C-\><C-n><C-w>j]])
  utils.buf_map(tBuf, 't', '<C-k>', [[<C-\><C-n><C-w>k]])
  utils.buf_map(tBuf, 't', '<C-l>', [[<C-\><C-n><C-w>l]])

  if acl then
    vim.cmd([[au TermClose * ++once :lua require('plugins.which-key').closeTerminal(]] .. tBuf .. [[)]])
  end
end

M.closeTerminal = function(buf)
  vim.api.nvim_buf_delete(buf, { force = 1 })
end

-- open floating terminal and add keybindings (<C-q>) to close it
M.openFloatTerm = function(command, autoclose, border_style)
  local cmd = command or ''
  local acl = autoclose or true
  local bst = border_style or 0

  vim.g.my_mouse = vim.o.mouse
  vim.o.mouse = ''

  -- local cBuf = vim.api.nvim_get_current_buf()
  -- local cWin = vim.api.nvim_get_current_win()
  local tBuf = term.openFloatTerm(cmd, bst)
  wk.register({
    ['<C-q>'] = {
      [[<C-\><C-n><cmd>lua require('utils.term').closeFloatTerm()<CR>]],
      'which_key_ignore',
    },
  }, {
    mode = 't',
    buffer = tBuf,
  })

  wk.register({
    ['<C-q>'] = {
      [[<cmd>lua require('utils.term').closeFloatTerm()<CR>]],
      'which_key_ignore',
    },
  }, {
    mode = 'n',
    buffer = tBuf,
  })

  -- add autocmd to auto-close the floating window if the shell (the command) exits
  -- ToDo: statusline needs a redraw ore something
  if acl then
    vim.cmd([[au TermClose * ++once :lua require('utils.term').closeFloatTerm()]])
  end
end

return M
