-- https://github.com/folke/lazydev.nvim
--
-- lazydev.nvim is a plugin that properly configures LuaLS for editing your Neovim
-- config by lazily updating your workspace libraries.

return {
  'folke/lazydev.nvim',
  enabled = require('rv.utils').plugin_enabled({ vscode = false, minimal = false }),
  ft = 'lua',
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },
}
