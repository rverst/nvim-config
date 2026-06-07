require('lualine').setup({
  options = {
    theme = 'auto',
    icons_enabled = true,
    disabled_filetypes = {
      statusline = { 'dashboard', 'alpha', 'starter' },
      winbar = {},
    },
    ignore_focus = { 'neo-tree', 'TelescopePrompt' },
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },

    lualine_c = {
      {
        'diagnostics',
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = '󰩕 ',
        },
      },
      { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
      { 'filename', path = 1, separator = ' ' },
      { 'harpoon2' },
    },
    lualine_x = {
      -- stylua: ignore
      {
        function() return '  ' .. require('dap').status() end,
        cond = function() return package.loaded['dap'] and require('dap').status() ~= '' end,
      },
      {
        function()
          return require('lazy.status').updates()
        end,
        cond = function()
          return require('lazy.status').has_updates()
        end,
      },
      {
        'diff',
        symbols = {
          added = ' ',
          modified = '󰣕 ',
          removed = ' ',
        },
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed,
            }
          end
        end,
      },
      { 'searchcount' },
    },
    lualine_y = {
      { 'encoding', separator = '' },
      { 'fileformat', padding = { left = 0, right = 2 } },
      { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
      { 'location', padding = { left = 0, right = 1 } },
    },
    lualine_z = {
      function()
        if vim.g.copilot_enabled then
          return '  ' .. os.date('%R')
        end
        return '  ' .. os.date('%R')
      end,
    },
  },
  extensions = { 'neo-tree', 'lazy', 'mason', 'oil', 'fzf', 'quickfix' },
})
