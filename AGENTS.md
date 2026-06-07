# AGENTS.md

Compact orientation for AI agents working in this Neovim config repo.

## Repo layout

```
init.lua              # Entry point: sets leaders, bootstraps lazy.nvim, loads rv.plugins
plugin/               # Auto-sourced by Neovim runtime — options, keymaps, autocmds, commands, health
lua/rv/
  plugins/            # One file per plugin, each returns a lazy.nvim spec table
  config/             # Large plugin configs required from plugin specs (colorscheme, lualine, snippets)
  snippets/           # Custom LuaSnip snippet definitions (Lua tables)
  utils.lua           # Shared helpers (e.g. is_mac())
after/ftplugin/       # Filetype-local overrides, auto-sourced
queries/              # Custom Tree-sitter queries
```

`lazy-lock.json` is gitignored — do not commit it.

## Namespace

All Lua modules live under the `rv` namespace: `require('rv.utils')`, `require('rv.config.lualine')`, etc.

## Adding / editing plugins

- One plugin = one file in `lua/rv/plugins/`. Filename mirrors the plugin name.
- Every spec file starts with a comment citing the GitHub URL and a one-line description.
- Plugins irrelevant inside VSCode use `enabled = not vim.g.vscode` in the spec.
- Large `config` blocks go in `lua/rv/config/<name>.lua` and are `require`d from the spec.
- Global options, keymaps, autocmds → `plugin/` (auto-sourced, no explicit require).
- Filetype-local settings → `after/ftplugin/<ft>.lua`.

## Formatting

Tool: **stylua** (`stylua.toml` in root).

```bash
stylua lua/ plugin/ after/        # format all Lua
stylua path/to/file.lua           # single file
```

Key settings: 2-space indent, 120 column width, single-quote preference, `collapse_simple_statement = "Never"`.

Use `-- stylua: ignore` above blocks that must not be reformatted.

## No tests, no CI

There is no test framework and no `.github/` CI. Verification is:

1. Run `stylua` (no diff = clean).
2. Open Neovim and run `:checkhealth dotfiles` (checks nvim ≥ 0.12.0 and external tools: `git`, `make`, `unzip`, `rg`, `fzf`, `curl`, `wget`).

## nvim-treesitter (v1.x / main branch)

This config tracks the rewritten `main` branch (`branch = 'main'`), required for Neovim 0.12+.
The old `master` branch API (`nvim-treesitter.configs.setup`, `highlight.enable`, `auto_install`) is gone.

- `lazy = false` is mandatory — the new plugin does not support lazy-loading.
- Highlighting is handled by Neovim natively; no per-module config needed.
- **External prerequisite** (not managed by Mason): `brew install tree-sitter` (cli ≥ 0.26.1).
- After pulling the new branch: `:Lazy sync` then `:TSUpdate`.

## Key conventions

- **Augroup prefix**: `rv-<purpose>` (e.g. `rv-highlight-yank`).
- **Autoformat toggle**: `vim.g.disable_autoformat` (global) / `vim.b.disable_autoformat` (buffer). Controlled inside Neovim with `:FormatDisable` / `:FormatEnable` or `<leader>ua`.
- **Diagnostic virtual text is disabled** — `tiny-inline-diagnostic.nvim` replaces it.
- **macOS key bindings**: `plugin/keymap.lua` uses `utils.is_mac()` and maps Option-key Unicode chars instead of `<M-...>` for resize/move-line bindings.
- **Global debug helpers** (available after `VeryLazy`): `_G.dd(...)` → `Snacks.debug.inspect`, `_G.bt()` → `Snacks.debug.backtrace`.
- **Completion**: `blink.cmp` (v1.x) — not nvim-cmp. Accept with `<C-s>`.
- **Leader keys**: `<Space>` for both `mapleader` and `maplocalleader`.

## Quirks and gotchas

- **`.luarc.json` exists** at the repo root — it only sets `diagnostics.globals` (`Snacks`, `vim`). Do not add a `runtime.version` or workspace library config to it; those belong to lazydev's spec, not `.luarc.json`. Adding them there would conflict with lazydev.
- **Do not strip Unicode symbols from plugin configs.** Signs, icons, and control characters (e.g. `●`, `◆`, `⏸`, `▾`) are intentional. Never replace them with empty strings or ASCII fallbacks — they are load-bearing UI elements (gutter signs, DAP controls, statusline icons).
- **`lazy-lock.json` is gitignored** — never commit it.
