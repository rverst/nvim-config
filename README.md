# neovim config

This is my neovim configuration. It is a work in progress, and I am constantly tweaking it.
I have tried to keep it as modular as possible, so that it is easy to add or remove plugins.

## Installation

To install the configuration, clone the repository to `~/.config/nvim`:
```sh
  git clone https://github.com/rverst/nvim-config.git ~/.config/nvim
```

This repository is part of my [dotfiles](http://github.com/rverst/dotfiles)

## Structure

```
init.lua              # Entry point: sets leaders, bootstraps lazy.nvim, loads rv.plugins
plugin/               # Auto-sourced — options, keymaps, autocmds, commands, health
lua/rv/
  plugins/            # One file per plugin, each returns a lazy.nvim spec table
  config/             # Large plugin configs (lualine, colorscheme, snippets)
  snippets/           # Custom LuaSnip snippet definitions
  utils.lua           # Shared helpers (e.g. is_mac())
after/ftplugin/       # Filetype-local overrides, auto-sourced
queries/              # Custom Tree-sitter queries
```

## Plugins

### Completion & AI

| Plugin | Description |
|--------|-------------|
| [blink.cmp](https://github.com/saghen/blink.cmp) | Performant completion engine (v1.x). Sources: LSP, path, snippets, buffer, Copilot, emoji. Accept with `<C-s>`. |
| [copilot.lua](https://github.com/zbirenbaum/copilot.lua) | Pure-Lua GitHub Copilot client. Inline suggestions disabled — completions flow through blink.cmp via blink-cmp-copilot. Toggle with `<leader>up`. |

### LSP & Diagnostics

| Plugin | Description |
|--------|-------------|
| [mason + mason-lspconfig](https://github.com/mason-org/mason.nvim) | Installer for LSP servers, DAP adapters, linters, and formatters. Ensures: gopls, templ, lua_ls, vtsls, html, cssls, jsonls, eslint, dockerls, yamlls, helm_ls. |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Official LSP client configurations. Custom overrides for lua_ls, vtsls (TypeScript inlay hints), yamlls (Kubernetes/Compose/GitHub schemas), helm_ls. |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim) | Configures LuaLS workspace libraries for editing this Neovim config. Auto-disabled when `.luarc.json` is present. |
| [tiny-inline-diagnostic](https://github.com/rachartier/tiny-inline-diagnostic.nvim) | Renders LSP diagnostics inline at the cursor position with icons and colors. Replaces native virtual text. Preset: `modern`. |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Async linter complementing LSP diagnostics. Runs on save: golangci-lint (Go), eslint_d (TS/JS), hadolint (Dockerfile), yamllint (YAML). Trigger manually with `<leader>cl`. |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | LSP progress spinner shown in the bottom-right corner. |

### Formatting

| Plugin | Description |
|--------|-------------|
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format-on-save with per-filetype formatters: stylua (Lua), gofumpt (Go), prettierd/prettier (JS/TS/HTML/CSS/JSON/YAML/Markdown), shfmt (shell). Toggle with `<leader>ua` or `:FormatDisable` / `:FormatEnable`. Format manually with `<leader>cf`. |

### Fuzzy Finding & Navigation

| Plugin | Description |
|--------|-------------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Highly extensible fuzzy finder. Extensions: fzf-native, ui-select, symbols. Key mappings under `<leader>f`. LSP go-to (gd, gr, gI) routed through Telescope. |
| [harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2) | Fast per-project file bookmarks. Mark with `<leader>hm`, jump to marks 1–5 with `<leader>1`–`<leader>5`, browse with `<leader>hh` (Telescope). |

### File Management

| Plugin | Description |
|--------|-------------|
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | Sidebar file-system browser with filesystem and buffer sources. Toggle with `:Neotree`. Closes automatically when it is the last window. |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | Edit the filesystem like a Neovim buffer (vim-vinegar style). Open with `-`. Shows permissions, size, and mtime. Hidden files visible by default. |

### Git

| Plugin | Description |
|--------|-------------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git hunk decorations in the sign column (`+` add, `~` change, `_` delete). |
| [gitignore.nvim](https://github.com/wintermute-cell/gitignore.nvim) | Generate `.gitignore` files interactively. `<leader>gi` creates in the current file's directory, `<leader>gI` in the project root. |
| [snacks.nvim — lazygit](https://github.com/folke/snacks.nvim) | Lazygit integration: open with `<leader>gg`, log with `<leader>gl`, current file history with `<leader>gf`, browse remote with `<leader>gB`, blame line with `<leader>gb`. |

### Debugging (DAP)

| Plugin | Description |
|--------|-------------|
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client. Go support via nvim-dap-go (dlv). UI via nvim-dap-ui (auto-opens on session start). Virtual text via nvim-dap-virtual-text. Key bindings: `<F9>` continue, `<F7>` step into, `<F8>` step over, `<F10>` step out, `<F6>` toggle UI, `<leader>b` breakpoint. |

### Syntax & Highlighting

| Plugin | Description |
|--------|-------------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Parser installation and queries (main/v1.x branch, required for Neovim 0.12+). Parsers: bash, lua, go, typescript, tsx, javascript, html, css, yaml, dockerfile, sql, and more. |
| [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua) | High-performance color code highlighter for CSS, SCSS, SASS, and HTML files. |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight and search `TODO`, `FIXME`, `HACK`, `WARN`, `NOTE`, `TEST` comments using ripgrep. Jump with `]t` / `[t`. |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Renders Markdown with styled headings, code blocks, and inline decorations. Active for markdown filetype only. |

### UI & UX

| Plugin | Description |
|--------|-------------|
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Collection of QoL modules: dashboard (custom ASCII art), notifier, indent guides, scope highlighting, smooth scrolling, zen/zoom mode, scratch buffers, word references, statuscolumn, animated UI, and Lazygit integration. Many toggle mappings under `<leader>u`. |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Fast and configurable statusline. Config in `lua/rv/config/lualine.lua`. Includes Harpoon marks via harpoon-lualine. |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Shows pending keybind completions in a popup (helix preset). `<leader>?` to show buffer-local keymaps. |
| [mini.nvim](https://github.com/echasnovski/mini.nvim) | Used modules: `mini.ai` (extended text objects), `mini.surround` (add/delete/replace surroundings), `mini.diff` (diff view in buffer). |
| [gruvbox-material](https://github.com/sainnhe/gruvbox-material) | Active colorscheme — Gruvbox with softer contrast. Medium background, italics enabled. |

### Sessions & Utilities

| Plugin | Description |
|--------|-------------|
| [neovim-session-manager](https://github.com/Shatur/neovim-session-manager) | Saves and restores sessions per working directory. Auto-saves on exit; autoload disabled (manual session restore). |
| [vim-sleuth](https://github.com/tpope/vim-sleuth) | Automatically detects and sets `tabstop`, `shiftwidth`, and `expandtab` from the current file and neighbouring files of the same type. |
| [vim-startuptime](https://github.com/dstein64/vim-startuptime) | Benchmark Neovim startup time over 10 runs via `:StartupTime`. |

## Key Mappings (overview)

Leader key: `<Space>`

| Prefix | Area |
|--------|------|
| `<leader>f` | Telescope find (files, grep, help, keymaps, …) |
| `<leader>c` | Code actions (format, lint, rename, code action) |
| `<leader>g` | Git (lazygit, blame, browse, gitignore) |
| `<leader>h` | Harpoon (mark, list, navigate) |
| `<leader>1`–`5` | Harpoon jump to bookmark |
| `<leader>u` | UI toggles (spelling, wrap, diagnostics, Copilot, autoformat, …) |
| `<leader>b/B` | DAP breakpoints |
| `<F6>`–`<F10>` | DAP debug controls |
| `gd/gr/gI/K` | LSP navigation and hover |
| `-` | Open Oil (parent directory) |
| `<C-/>` | Toggle terminal (Snacks) |
| `<leader>z/Z` | Zen / zoom mode |

## SMYCK

Nice terminal color scheme: [SMYCK](https://github.com/hukl/Smyck-Color-Scheme)

0x00 (dark  black  ) #000000
0x01 (dark  red    ) #C75646
0x02 (dark  green  ) #8EB33B
0x03 (dark  yellow ) #D0B03C
0x04 (dark  blue   ) #4E90A7
0x05 (dark  magenta) #C8A0D1
0x06 (dark  cyan   ) #218693
0x07 (dark  white  ) #B0B0B0
0x10 (light black  ) #5D5D5D
0x11 (light red    ) #E09690
0x12 (light green  ) #CDEE69
0x13 (light yellow ) #FFE377
0x14 (light blue   ) #9CD9F0
0x15 (light magenta) #FBB1F9
0x16 (light cyan   ) #77DFD8
0x17 (light white  ) #F7F7F7

## Thanks

This configuration is heavily inspired by the configurations of the following people (in alphabetical order):
- [ThePrimeagen](https://github.com/ThePrimeagen)
- [TjDevries](https://github.com/tjdevries)
- and probably other people
