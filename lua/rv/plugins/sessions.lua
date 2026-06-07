-- plugin/sessions.lua
--
-- https://github.com/Shatur/neovim-session-manager
-- Session management with auto-save on exit and per-directory session storage.

return {
  'Shatur/neovim-session-manager',
  enabled = not vim.g.vscode,
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local path = require('plenary.path')
    local config = require('session_manager.config')
    require('session_manager').setup({
      sessions_dir = path:new(vim.fn.stdpath('data'), 'sessions'),
      autoload_mode = config.AutoloadMode.Disabled,
      autosave_last_session = true,
      autosave_ignore_not_normal = true,
      autosave_ignore_dirs = {},
      autosave_ignore_filetypes = {
        'gitcommit',
        'gitrebase',
      },
      autosave_ignore_buftypes = { 'dashboard' },
      autosave_only_in_session = false,
      max_path_length = 80,
    })
  end,
}
