local opt = vim.opt

-- I like to use relative numbers, they are nice for jumping around
opt.number = true
opt.relativenumber = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Show the results of :substitute, :smagic, etc...
opt.inccommand = 'split'

-- Enable mouse mode, can be useful for resizing splits
opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
opt.showmode = false

-- Sync clipboard between OS and Neovim.
opt.clipboard = 'unnamedplus'

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true
opt.shada = { "'10", '<0', 's10', 'h' }

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

opt.tabstop = 8
opt.softtabstop = 4
opt.shiftwidth = 4

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '› ', trail = '·', nbsp = '␣', precedes = '←', extends = '→' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
opt.hlsearch = true

-- Don't extend comments using 'o'
opt.formatoptions:remove('o')

-- I don't like text wrapping
opt.wrap = false
opt.sidescroll = 5

opt.textwidth = 120

-- Use global statusline
opt.laststatus = 3

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = {
    spacing = 10,
    prefix = '◌',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '󰈅',
      [vim.diagnostic.severity.HINT] = '󰛩',
      [vim.diagnostic.severity.INFO] = '',
    },
    linehl = {},
    numhl = {
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    },
  },
})
