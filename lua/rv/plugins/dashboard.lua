-- plugin/dashboard.lua
--

local version = 'neovim ' .. vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch

local plugin = {
  'nvimdev/dashboard-nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
  },
  event = 'VimEnter',
  config = function()
    local db = require('dashboard')
    db.setup({
      theme = 'hyper',
      config = {
        week_header = {
          enable = true,
          append = { '', version, '' },
        },
        shortcut = {
          {
            icon = '󰈞 ',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = '  Sessions',
            group = '@constructor',
            action = 'SessionManager load_session',
            key = 's',
          },
          {
            desc = '  Apps',
            group = 'DiagnosticHint',
            action = 'Telescope app',
            key = 'a',
          },
          {
            desc = '󰊳  Plugin update',
            group = '@property',
            action = 'Lazy update',
            key = 'u',
          },
          {
            desc = ' dotfiles',
            group = 'Number',
            action = 'Telescope find_files cwd=~/.config',
            key = 'd',
          },
        },
        footer = {},
      },
    })
  end,
}

return plugin
