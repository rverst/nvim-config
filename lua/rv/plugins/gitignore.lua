-- plugins/gitignore.lua
--
-- https://github.com/wintermute-cell/gitignore.nvim
-- A neovim plugin for generating .gitignore files in seconds

local plugin = {
  'wintermute-cell/gitignore.nvim',
  enabled = true,
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local gitignore = require('gitignore')

    local path = vim.fn.getcwd() .. '/.gitignore'

    vim.keymap.set('n', '<leader>gi', gitignore.generate, { desc = '[G]enerate .g[i]tignore in place' })
    vim.keymap.set('n', '<leader>gI', function()
      gitignore.generate(path)
    end, { desc = '[G]enerate .g[i]tignore in CWD' })
  end,
}

return plugin
