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

-- set some color variables, the actual colorscheme is loaded later
require('colors')
require('settings')
--
-- load the plugin manager
require('plugins')



--require('plugins.gitsigns')
--require('plugins.colorizer')
--require('plugins.neoscroll')

--require('plugins.lsp')
--require('plugins.lspsaga')
--require('plugins.compe')
--require('plugins.lspkind')
--require('plugins.symbols-outline')

--require('plugins.indentline')
--require('plugins.treesitter')

--require('plugins.telescope')
--require('plugins.nvimtree')

--require('plugins.kommentary')
--require('plugins.snippets')

--require('plugins.bufferline')
--require('plugins.statusline')

require('colorscheme')
--require('bindings')
require('autocmds')

require('utils.fn').clearUpdate()

