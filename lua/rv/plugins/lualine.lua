return {
  'nvim-lualine/lualine.nvim',
  enabled = true,
  event = { 'VimEnter' },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    { 'letieu/harpoon-lualine', dependencies = {
      { 'ThePrimeagen/harpoon', branch = 'harpoon2' },
    } },
  },
  init = function()
    --   vim.g.lualine_laststatus = vim.o.laststatus
    --   if vim.fn.argc(-1) > 0 then
    --     -- set an empty statusline till lualine loads
    --     vim.o.statusline = ' '
    --   else
    --     -- hide the statusline on the starter page
    --     vim.o.laststatus = 0
    --   end
  end,
  opts = function()
    require('rv.config.lualine')
  end,
}
