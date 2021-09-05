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

if vim.g.shell or vim.g.shell == 'fish' then
  vim.g.shell = 'sh'
end

-- disable buildin plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local fn = require('utils.fn')

-- set some color variables, the actual colorscheme is loaded later
require('colors')
require('settings')

-- load the plugin manager
require('plugins')

require('colorscheme')
require('autocmds')

fn.clearUpdate()
