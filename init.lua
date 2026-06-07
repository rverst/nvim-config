-- init.lua
-- This is the entry point of the configuration.
-- Most of the configuration is done via runtimepath loading of lua files.
--

-- Set leader and localleader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local v = vim.version()

-- check if the Neovim version is at least 0.12.0, otherwise notify the user and exit
if vim.version.lt(v, { 0, 12, 0 }) then
  local major, minor, patch = v.major, v.minor, v.patch
  local version_str = string.format('%d.%d.%d', major, minor, patch)
  vim.notify(
    'Neovim 0.12.0 or higher is required for this configuration, you are running: ' .. version_str,
    vim.log.levels.ERROR
  )
  return
end

-- expect a nerd font to be installed
vim.g.have_nerd_font = true

-- Disable netrw (using oil.nvim / neo-tree instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Install `lazy.nvim` plugin manager
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
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
