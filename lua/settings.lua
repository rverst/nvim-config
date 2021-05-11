local v = require('utils.vars')

local cmdheight = 2
local indent = 2
local vScrolloff = 4
local hScrolloff = 10

vim.cmd('syntax enable')
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

vim.o.updatetime = 250
vim.o.cmdheight = cmdheight
vim.o.winheight = cmdheight
vim.o.winminheight = cmdheight
vim.o.winminwidth = cmdheight * 2
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.timeoutlen = 250
vim.o.hidden = true
vim.o.backup = false
vim.o.shiftround = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.scrolloff = hScrolloff
vim.o.sidescrolloff = vScrolloff
vim.o.fileformats = 'unix,mac,dos'
vim.o.completeopt = 'menuone,noselect'
vim.o.wildmode = 'longest:list:full'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.spellsuggest = 'fast,12'
vim.o.spelloptions = 'camel'

vim.o.undodir = v.undoDir
vim.o.undofile = true
vim.bo.undofile = true

vim.o.mouse = 'nv'

-- "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
-- local cur =  'n-v-c-sm:block-Cursor,i:ver100-iCursor,n-v-c-sm:blinkon0'
-- vim.o.guicursor=cur

vim.b.swapfile = false
vim.bo.swapfile = false

vim.b.expandtab = true
vim.bo.expandtab = true
vim.b.smartindent = true
vim.bo.smartindent = true
vim.b.tabstop = indent
vim.bo.tabstop = indent
vim.b.shiftwidth = indent
vim.bo.shiftwidth = indent

vim.o.numberwidth = 3
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes:2'
vim.wo.wrap = false

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldcolumn = '0'
vim.wo.foldenable = false

local clipName
local clipProvCopy
local clipProvPaste
local clipCache

if v.isWindows then
  vim.cmd([[
  let &shell = has('win32') ? 'powershell' : 'pwsh'
  set shellquote= shellpipe=\| shellxquote=
  set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
  set shellredir=\|\ Out-File\ -Encoding\ UTF8
  ]])
end

if v.isWsl or v.isWindows then
  clipName = 'windows-clipboard'
  clipProvCopy = {'clip.exe'}
  clipProvPaste = {'pbpaste.exe', '--lf'}
  clipCache = 1
elseif v.isMacOs then
  clipName = 'macos-clipboard'
  clipProvCopy = {'pbcopy'}
  clipProvPaste = {'pbpaste'}
  clipCache = 0
end

if clipProvCopy then
  vim.g.clipboard = {
    name = clipName,
    copy = {['+'] = clipProvCopy, ['*'] = clipProvCopy},
    paste = {['+'] = clipProvPaste, ['*'] = clipProvPaste},
    cache_enabled = clipCache
  }
end
