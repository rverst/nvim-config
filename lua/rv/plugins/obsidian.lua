-- https://github.com/obsidian-nvim/obsidian.nvim
--
-- Built for people who love the concept of Obsidian -- a simple, markdown-based
-- notes app - but love neovim too much to stand typing characters into anything else.

return {
  'obsidian-nvim/obsidian.nvim',
  enabled = require('rv.utils').plugin_enabled({ vscode = false, minimal = false }),
  version = '*',
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = 'work',
        path = '~/Documents/notes/',
      },
    },
    -- Suppress the conceallevel warning; it's handled per-buffer via enter_note callback.
    ui = { ignore_conceal_warn = true },
    callbacks = {
      -- Disable render-markdown and set conceallevel for vault files so obsidian's
      -- own UI (checkboxes, link concealment, etc.) takes over rendering.
      enter_note = function()
        vim.opt_local.conceallevel = 2
        pcall(require('render-markdown').buf_disable)
      end,
      -- Re-enable render-markdown when leaving a vault file.
      leave_note = function()
        pcall(require('render-markdown').buf_enable)
        vim.opt_local.conceallevel = 0
      end,
    },
  },
}
