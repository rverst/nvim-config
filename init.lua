-- init.lua
-- This is the entry point of the configuration.
-- Most of the configuration is done via runtimepath loading of lua files.
--

-- Set leader and localleader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- expect a nerd font to be installed
vim.g.have_nerd_font = true

-- Disable some buildin plugins
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Install `lazy.nvim` plugin manager
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
end

-- Add the plugin to the runtimepath
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Set up lazy and load the plugins from ./lua/plugins/...
-- Config for plugins might live in ./lua/rv/config/...
-- for easy reloading of the configuration (source %)
require('lazy').setup({ import = 'rv.plugins' }, { change_detection = { notify = true } })
