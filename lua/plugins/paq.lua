local fn = vim.fn
local cmd = vim.cmd
local path = fn.stdpath('data') .. '/site/pack/paqs/opt/paq-nvim'
local installed = fn.empty(fn.glob(path)) == 0

-- ToDo: do some check for periodic updates
local update = false

if not installed then
 fn.system({ 'git', 'clone', 'https://github.com/savq/paq-nvim.git', path })
end

cmd 'packadd paq-nvim'
local p = require('paq-nvim')
p.paq{'savq/paq-nvim', opt=true} -- let paq manage itself

p.paq 'nvim-lua/popup.nvim'
p.paq 'nvim-lua/plenary.nvim'
p.paq 'nvim-telescope/telescope.nvim'

p.paq {'nvim-treesitter/nvim-treesitter', run='TSUpdate'}
p.paq {'nvim-treesitter/playground'}

p.paq 'neovim/nvim-lspconfig'
p.paq 'hrsh7th/nvim-compe'
p.paq 'onsails/lspkind-nvim'
p.paq 'nvim-lua/lsp_extensions.nvim'
p.paq 'glepnir/lspsaga.nvim'
p.paq 'simrat39/symbols-outline.nvim'

p.paq 'sbdchd/neoformat'

p.paq 'lewis6991/gitsigns.nvim'
p.paq 'akinsho/nvim-bufferline.lua'
p.paq 'glepnir/galaxyline.nvim'
p.paq 'windwp/nvim-autopairs'
p.paq 'windwp/nvim-ts-autotag'
p.paq 'alvan/vim-closetag'

p.paq 'kyazdani42/nvim-tree.lua'
p.paq 'kyazdani42/nvim-web-devicons'
p.paq 'ryanoasis/vim-devicons'
p.paq 'nvim-telescope/telescope.nvim'
p.paq 'nvim-telescope/telescope-media-files.nvim'
p.paq 'nvim-lua/popup.nvim'

-- snippets
p.paq 'norcalli/snippets.nvim'

-- maximize windows
p.paq 'szw/vim-maximizer'

-- zen mode
p.paq 'junegunn/goyo.vim'

-- statusline
p.paq {'glepnir/galaxyline.nvim', branch='main' }

-- bufferline
p.paq 'akinsho/nvim-bufferline.lua'

-- color stuff --
p.paq 'norcalli/nvim-base16.lua'
p.paq 'norcalli/nvim-colorizer.lua'

--misc
p.paq 'tweekmonster/startuptime.vim'
p.paq 'karb94/neoscroll.nvim'
--p.paq { 'lukas-reineke/indent-blankline.nvim', branch='lua' }

p.paq 'b3nj5m1n/kommentary'

if not installed then
  p.install()
elseif update then
  p.update()
end
