-- https://github.com/nvim-treesitter/nvim-treesitter
--
-- Provides tree-sitter parser installation and queries for Neovim.
-- NOTE: This uses the rewritten `main` branch (v1.x), required for Neovim 0.12+.
-- The old `master` branch API (nvim-treesitter.configs.setup) is gone.
-- Requires: tree-sitter-cli >= 0.26.1 (auto-installed via brew on macOS), tar, curl, a C compiler.
-- Highlighting is now handled by Neovim itself via vim.treesitter.start().

return {
  'nvim-treesitter/nvim-treesitter',
  enabled = require('rv.utils').plugin_enabled({ vscode = false }),
  branch = 'main',
  lazy = false,
  build = function()
    require('rv.utils').ensure_installed('tree-sitter')
    vim.cmd('TSUpdate')
  end,
  config = function()
    require('nvim-treesitter').setup()

    -- Install parsers for languages we care about.
    -- Highlighting, folding, etc. are Neovim built-ins — no module setup needed.
    require('nvim-treesitter').install({
      'bash',
      'c',
      'diff',
      'regex',
      'html',
      'css',
      'lua',
      'markdown',
      'markdown_inline',
      'vim',
      'vimdoc',
      -- Go
      'go',
      'gomod',
      'gosum',
      'gowork',
      'gotmpl',
      -- TypeScript / JavaScript
      'typescript',
      'tsx',
      'javascript',
      'jsdoc',
      -- Infrastructure
      'dockerfile',
      'yaml',
      'toml',
      'make',
      'json',
      -- DB
      'sql',
      -- Protobuf
      'proto',
      -- Typst
      'typst',
      -- Python
      'python',
      -- Rust
      'rust',
      -- GraphQL
      'graphql',
    })
  end,
}
