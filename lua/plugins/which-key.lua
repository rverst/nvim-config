local wk = require('which-key')
local utils = require('utils')
local var = require('utils.vars')

wk.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true -- bindings for prefixed with g
    }
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+" -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
    padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = {min = 4, max = 35}, -- min and max height of the columns
    width = {min = 20, max = 50}, -- min and max width of the columns
    spacing = 3 -- spacing between columns
  },
  hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true -- show help message on the command line when the popup is visible
}

local term = ''
if var.isWindows then
  term = 'pwsh.exe'
else
  term = 'zsh'
end

wk.register({
  p = {[["+p]], 'Paste from clipboard'},
  P = {[["+P]], 'Paste from clipboard (before)'},
  y = {[["+y]], 'Yank to clipboard'},
  Y = {[["+Y]], 'Yank line to clipboard'},
  q = {[[<cmd>lua require('telescope.builtin').quickfix()<CR>]], 'Quickfix'},
  C = {[[<Plug>kommentary_motion_default]], 'Toggle comment [motion]'},
  ['/'] = {[[<Plug>kommentary_line_default]], 'Toggle line comment'},

  f = {
    name = 'find',
    f = {[[<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<CR>]], 'find file'},
    F = {[[<cmd>lua require('telescope.builtin').find_files()<CR>]], 'find file'},
    n = {[[<cmd>lua require('telescope.builtin').file_browser()<CR>]], 'file browser'},
    r = {[[<cmd>lua require('telescope.builtin').old_files()<CR>]], 'open recent file'},
    b = {[[<cmd>lua require('telescope.builtin').buffers()<CR>]], 'find buffer'},
    g = {[[<cmd>lua require('telescope.builtin').live_grep()<CR>]], 'live grep'},
    h = {[[<cmd>lua require('telescope.builtin').help_tags()<CR>]], 'grep help'},
    i = {[[<cmd>lua require('telescope.builtin').highlights()<CR>]], 'grep highlights'},
    c = {[[<cmd>lua require('telescope.builtin').commands()<CR>]], 'grep commands'},
    t = {[[<cmd>lua require('telescope.builtin').tags()<CR>]], 'grep tags'},
    s = {[[<cmd>lua require('telescope.builtin').git_files()<CR>]], 'git files'},
    w = {[[<cmd>lua require('telescope.builtin').grep_string()<CR>]], 'find word'},
    m = {[[<cmd>lua require('telescope.builtin').marks()<CR>]], 'marks'},
    k = {[[<cmd>lua require('telescope.builtin').keymaps()<CR>]], 'keymaps'},
    o = {[[<cmd>lua require('telescope.builtin').vim_options()<CR>]], 'vim options'}
  },

  d = {
    f = {[[<cmd>Format<CR>]], 'Format code'},
    F = {[[<cmd>FormatWrite<CR>]], 'Format code and write'},
  },

  g = {
    name = 'git',
    c = {[[<cmd>lua require('telescope.builtin').git_commits()<CR>]], 'List commits'},
    C = {[[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], 'List buffer commits'},
    b = {[[<cmd>lua require('telescope.builtin').git_branches()<CR>]], 'Git branches'},
    S = {[[<cmd>lua require('telescope.builtin').git_status()<CR>]], 'Git Status'},
    s = {[[<cmd>lua require('gitsigns').stage_hunk()<CR>]], 'Stage hunk'},
    u = {[[<cmd>lua require('gitsigns').undo_stage_hunk()<CR>]], 'Undo stage hunk'},
    r = {[[<cmd>lua require('gitsigns').reset_hunk()<CR>]], 'Reset hunk'},
    R = {[[<cmd>lua require('gitsigns').reset_buffer()<CR>]], 'Reset buffer'},
    p = {[[<cmd>lua require('gitsigns').preview_hunk()<CR>]], 'Preview hunk'},
    B = {[[<cmd>lua require('gitsigns').blame_line()<CR>]], 'Blame line'}
  },

  T = {
    name = 'telescope',
    p = {[[<cmd>lua require('telescope.builtin').planets()<CR>]], 'Use the telescope'},
    b = {[[<cmd>lua require('telescope.builtin').builtin()<CR>]], 'List builtin pickers'},
    R = {[[<cmd>lua require('telescope.builtin').reloader()<CR>]], 'List lua modules and reload'},
    s = {[[<cmd>lua require('telescope.builtin').symbols()<CR>]], 'List builtin symbols'},
    r = {[[<cmd>lua require('telescope.builtin').registers()<CR>]], 'List registers'},
    f = {[[<cmd>lua require('telescope.builtin').filetypes()<CR>]], 'List filetypes'}
  },

  o = {
    name = 'ortography',
    o = {[[<cmd>setlocal spell! spelllang=en_us,de_de<CR>]], 'Toggle spellcheck (en/de)'},
    e = {[[<cmd>setlocal spell! spelllang=en_us<CR>]], 'Toggle spellcheck (en)'},
    d = {[[<cmd>setlocal spell! spelllang=de_de<CR>]], 'Toggle spellcheck (de)'},
    g = {[[<cmd>setlocal spell! spelllang=de_de<CR>]], 'Toggle spellcheck (de)'},
    s = {[[<cmd>lua require('telescope.builtin').spell_suggest()<CR>]], 'Spell suggestion'}
  },

  t = {
    name = 'terminal',
    n = {[[<cmd> vnew term://]] .. term .. [[ <CR>]], 'New terminal vsplit'},
    x = {[[<cmd> new term://]] .. term .. [[ | resize 10<CR>]], 'New terminal split'},
    f = {[[<cmd>lua require('plugins.which-key').openFloatTerm()<CR>]], 'Float terminal'},
    g = {[[<cmd>lua require('plugins.which-key').openFloatTerm('lazygit')<CR>]], 'Lazygit'},
    d = {[[<cmd>lua require('plugins.which-key').openFloatTerm('lazydocker')<CR>]], 'Lazydocker'}
  },

  c = {
    name = 'code',
    c = {[[<Plug>kommentary_line_default]], 'Toggle line comment'},
    C = {[[<Plug>kommentary_motion_default]], 'Toggle comment [motion]'}
    -- additional keybinds in ../lsp/config.lua
  },

  b = {
    name = 'bufferline',
    ['1'] = {[[<cmd>BufferGoto 1<CR>]], 'buffer 1'},
    ['2'] = {[[<cmd>BufferGoto 2<CR>]], 'buffer 2'},
    ['3'] = {[[<cmd>BufferGoto 3<CR>]], 'buffer 3'},
    ['4'] = {[[<cmd>BufferGoto 4<CR>]], 'buffer 4'},
    ['5'] = {[[<cmd>BufferGoto 5<CR>]], 'buffer 5'},
    ['6'] = {[[<cmd>BufferGoto 6<CR>]], 'buffer 6'},
    ['7'] = {[[<cmd>BufferGoto 7<CR>]], 'buffer 7'},
    ['8'] = {[[<cmd>BufferGoto 8<CR>]], 'buffer 8'},
    ['9'] = {[[<cmd>BufferGoto 9<CR>]], 'buffer 9'},
    ['0'] = {[[<cmd>BufferLast<CR>]], 'last buffer'},
    [','] = {[[<cmd>BufferMovePrevious<CR>]], 'move buffer left'},
    ['.'] = {[[<cmd>BufferMoveNext<CR>]], 'move buffer right'},
    ['c'] = {[[<cmd>BufferClose<CR>]], 'close buffer'},
    ['d'] = {[[<cmd>BufferOrderByDirectory<CR>]], 'order buffers by dir'},
    ['l'] = {[[<cmd>BufferOrderByLanguage<CR>]], 'order buffers by lang'}
  }

}, {prefix = '<leader>'})

wk.register({
  ['/'] = {[[<Plug>kommentary_visual_default]], 'Toggle comment'},
  c = {
    name = 'code',
    c = {[[<Plug>kommentary_visual_default]], 'Toggle comment'}
    -- additional keybinds in ../lsp/config.lua
  }

}, {prefix = '<leader>', mode = 'v'})

wk.register({
  ['<CR>'] = {[[<cmd>noh<CR><CR>]], 'which_key_ignore'},
  ['<C-h>'] = {[[<C-w>h]], 'which_key_ignore'},
  ['<C-j>'] = {[[<C-w>j]], 'which_key_ignore'},
  ['<C-k>'] = {[[<C-w>k]], 'which_key_ignore'},
  ['<C-l>'] = {[[<C-w>l]], 'which_key_ignore'},
  ['L'] = {[[<cmd>BufferNext<CR>]], 'Next buffer'},
  ['K'] = {[[<cmd>BufferPrevious<CR>]], 'Previous buffer'},
  ['<F2>'] = {[[<C-w>=]], 'Equal splits'},

  [']'] = {
    c = 'Next hunk'
  },
  ['['] = {
    c = 'Previous hunk'
  },
  -- ['<F4>'] = {[[<cmd>Goyo<CR>]], 'Zen mode'},
  -- ['<C-s>'] = {[[<cmd>SymbolsOutline<CR>]], 'Toggle symbols outline'},

}, {})

wk.register({
  ['<C-h>'] = {[[<C-w>h]], 'which_key_ignore'},
  ['<C-j>'] = {[[<C-w>j]], 'which_key_ignore'},
  ['<C-k>'] = {[[<C-w>k]], 'which_key_ignore'},
  ['<C-l>'] = {[[<C-w>l]], 'which_key_ignore'}

}, {mode = 'i'})

wk.register({
  ['<C-h>'] = {[[<C-w>h]], 'which_key_ignore'},
  ['<C-j>'] = {[[<C-w>j]], 'which_key_ignore'},
  ['<C-k>'] = {[[<C-w>k]], 'which_key_ignore'},
  ['<C-l>'] = {[[<C-w>l]], 'which_key_ignore'}

}, {mode = 'v'})

wk.register({
  ['<Esc>'] = 'which_key_ignore',
  ['<C-h>'] = 'which_key_ignore',
  ['<C-j>'] = 'which_key_ignore',
  ['<C-k>'] = 'which_key_ignore',
  ['<C-l>'] = 'which_key_ignore',
  ['<C-q>'] = 'which_key_ignore'

}, {mode = 't'})

-- <esc> to leave insert mode in terminal
utils.map('t', '<ESC>', [[<C-\><C-n>]])
utils.map('t', '<C-h>', [[<C-\><C-n><C-w>h]])
utils.map('t', '<C-j>', [[<C-\><C-n><C-w>j]])
utils.map('t', '<C-k>', [[<C-\><C-n><C-w>k]])
utils.map('t', '<C-l>', [[<C-\><C-n><C-w>l]])

local M = {}

-- open floating terminal and add keybindings to close it
M.openFloatTerm = function(cmd)
  require('lspsaga.floaterm').open_float_terminal(cmd)
  local hasWin, winHandle = pcall(vim.api.nvim_buf_get_var, 0, 'float_terminal_win')
  if hasWin then
    for _, h in pairs(winHandle) do
      local buf = vim.api.nvim_win_get_buf(h)
      wk.register({
        ['<C-q>'] = {
          [[<C-\><C-n><cmd>lua require('lspsaga.floaterm').close_float_terminal()<CR>]],
          'which_key_ignore'
        }
      }, {mode = 't', buffer = buf})

      wk.register({
        ['<C-q>'] = {
          [[<cmd>lua require('lspsaga.floaterm').close_float_terminal()<CR>]], 'which_key_ignore'
        }
      }, {mode = 'n', buffer = buf})
    end
  end
end

return M

-- vimdm', [[<Cmd> Neoformat<CR>]], opt)
