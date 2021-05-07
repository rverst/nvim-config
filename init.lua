--[[

 my neovim lua config
 many ideas and snippets shamelessly borrowed from (in alphabetical order):

 - Camilo Orrego (https://github.com/baldore)
 - Luke Smith (https://github.com/LukeSmithxyz)
 - siduck76 (https://github.com/siduck76/neovim-dots)
 - ThePrimeagen (https://github.com/awesome-streamers/awesome-streamerrc/blob/master/ThePrimeagen)
 - TJ DeVries (https://github.com/tjdevries)
--]]

vim.g.mapleader = ' '

-- load the plugin manager
require('plugins.paq')

-- set some color variables, the actual colorscheme is loaded later
require('colors')

require('plugins.devicons')
require('plugins.file-icons')

require('settings')

require('plugins.gitsigns')
require('plugins.colorizer')
require('plugins.neoscroll')

require('plugins.lsp')
require('plugins.lspsaga')
require('plugins.compe')
require('plugins.lspkind')

--require('plugins.indentline')
require('plugins.treesitter')

require('plugins.telescope')
require('plugins.nvimtree')

require('bindings')
require('plugins.kommentary')
require('plugins.snippets')

require('plugins.bufferline')
require('plugins.statusline')
require('colorscheme')
require('autocmds')

