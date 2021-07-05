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

local fn = require('utils.fn')
local v = require('utils.vars')

-- set some color variables, the actual colorscheme is loaded later
require('colors')
require('settings')

-- load the plugin manager
require('plugins')


require('colorscheme')
require('autocmds')

fn.clearUpdate()
