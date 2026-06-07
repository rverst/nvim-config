-- https://github.com/lewis6991/gitsigns.nvim
--
-- Super fast git decorations implemented purely in Lua

return {
  'lewis6991/gitsigns.nvim',
  enabled = not vim.g.vscode,
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gs = require('gitsigns')
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'Git: ' .. desc })
      end

      -- Navigation
      map(']h', function()
        if vim.wo.diff then
          vim.cmd.normal({ ']c', bang = true })
        else
          gs.nav_hunk('next')
        end
      end, 'Next Hunk')
      map('[h', function()
        if vim.wo.diff then
          vim.cmd.normal({ '[c', bang = true })
        else
          gs.nav_hunk('prev')
        end
      end, 'Prev Hunk')

      -- Actions
      map('<leader>gs', gs.stage_hunk, 'Stage Hunk')
      map('<leader>gr', gs.reset_hunk, 'Reset Hunk')
      map('<leader>gS', gs.stage_buffer, 'Stage Buffer')
      map('<leader>gu', gs.undo_stage_hunk, 'Undo Stage Hunk')
      map('<leader>gp', gs.preview_hunk, 'Preview Hunk')
    end,
  },
}
