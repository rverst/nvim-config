-- https://github.com/folke/lazydev.nvim
--
-- lazydev.nvim is a plugin that properly configures LuaLS for editing your Neovim
-- config by lazily updating your workspace libraries.

return {
  'folke/lazydev.nvim',
  ft = 'lua',
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
    enabled = function(root_dir)
      if vim.uv.fs_stat(root_dir .. '/.luarc.json') then
        return false
      end

      return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
    end,
  },
}
