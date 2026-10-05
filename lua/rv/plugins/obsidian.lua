-- https://github.com/obsidian-nvim/obsidian.nvim
--
-- Built for people who love the concept of Obsidian -- a simple, markdown-based
-- notes app - but love neovim too much to stand typing characters into anything else.

-- Vaults per dotfiles flavour (core.flavour in ~/.dotconfig).
local vaults = {
  { flavour = 'work', name = 'work', path = '~/Dev/notes/' },
  { flavour = 'personal', name = 'personal', path = '~/Documents/obsidian/rverst' },
}

local cache

--- Existing vaults, with the current flavour's vault first (obsidian.nvim uses the first as default).
local function workspaces()
  if cache then
    return cache
  end
  local flavour = require('rv.utils').flavour()
  local result = {}
  for _, v in ipairs(vaults) do
    local exists = vim.fn.isdirectory(vim.fn.expand(v.path)) == 1
    if not exists and v.flavour == flavour then
      vim.schedule(function()
        vim.notify(("[obsidian] vault for flavour '%s' not found: %s"):format(flavour, v.path), vim.log.levels.WARN)
      end)
    end
    if exists then
      local ws = { name = v.name, path = v.path }
      if v.flavour == flavour then
        table.insert(result, 1, ws)
      else
        table.insert(result, ws)
      end
    end
  end
  cache = result
  return result
end

return {
  'obsidian-nvim/obsidian.nvim',
  enabled = require('rv.utils').plugin_enabled({ vscode = false, minimal = false }),
  version = '*',
  -- Don't load at all when no vault exists on this machine (obsidian.nvim errors on empty workspaces).
  cond = function()
    return #workspaces() > 0
  end,
  opts = function()
    return {
      legacy_commands = false, -- this will be removed in 4.0.0
      workspaces = workspaces(),
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
    }
  end,
}
