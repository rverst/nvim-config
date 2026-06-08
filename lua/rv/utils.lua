local M = {}

M.is_mac = function()
  return vim.uv.os_uname().sysname == 'Darwin'
end

--- Returns whether a plugin should be enabled in the current environment.
--- Each flag represents an environment; false means "disabled in that environment".
--- Omitted flags default to true (enabled everywhere).
---
--- @param opts? { vscode?: boolean, minimal?: boolean }
--- @return boolean
---
--- Examples:
---   plugin_enabled()                                   -- always enabled
---   plugin_enabled({ vscode = false })                 -- disabled in VSCode
---   plugin_enabled({ vscode = false, minimal = false }) -- disabled in VSCode + minimal mode
M.plugin_enabled = function(opts)
  opts = opts or {}
  if opts.vscode == false and vim.g.vscode then
    return false
  end
  if opts.minimal == false and vim.g.minimal then
    return false
  end
  return true
end

--- Install one or more system packages via the OS package manager.
--- Runs asynchronously — does not block Neovim startup.
--- Intended to be called from a lazy.nvim build hook (runs only on plugin install/update).
---
--- @param packages  string | string[]          Package name(s). Used as-is unless overridden.
--- @param overrides? { brew?: string|string[], apt?: string|string[] }
---                                             Per-manager name overrides. Falls back to `packages`
---                                             when a manager key is absent.
---
--- Examples:
---   utils.ensure_installed('tree-sitter')
---   utils.ensure_installed('node', { apt = 'nodejs' })
---   utils.ensure_installed({ 'ripgrep', 'fzf' })
---   utils.ensure_installed({ 'node', 'yarn' }, { apt = { 'nodejs', 'yarnpkg' } })
M.ensure_installed = function(packages, overrides)
  overrides = overrides or {}

  -- Normalise packages to a list
  local defaults = type(packages) == 'string' and { packages } or packages

  if M.is_mac() then
    if vim.fn.executable('brew') == 0 then
      vim.notify('[utils] brew not found — skipping ensure_installed', vim.log.levels.WARN)
      return
    end

    -- Resolve names: use override list when provided, else fall back to defaults
    local names
    if overrides.brew then
      names = type(overrides.brew) == 'string' and { overrides.brew } or overrides.brew
    else
      names = defaults
    end

    for _, pkg in ipairs(names) do
      -- stylua: ignore
      vim.system({ 'brew', 'list', '--formula', pkg }, { text = true }, function(list_result)
        if list_result.code ~= 0 then
          vim.notify('[utils] brew install ' .. pkg .. ' …', vim.log.levels.INFO)
          vim.system({ 'brew', 'install', pkg }, { text = true }, function(install_result)
            if install_result.code ~= 0 then
              vim.notify(
                '[utils] brew install ' .. pkg .. ' FAILED:\n' .. (install_result.stderr or ''),
                vim.log.levels.ERROR
              )
            else
              vim.notify('[utils] brew install ' .. pkg .. ' done.', vim.log.levels.INFO)
            end
          end)
        end
      end)
    end
  else
    vim.notify('[utils] ensure_installed: OS not supported yet', vim.log.levels.WARN)
  end
end

return M
