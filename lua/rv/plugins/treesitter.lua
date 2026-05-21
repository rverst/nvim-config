-- https://github.com/nvim-treesitter/nvim-treesitter
--
-- Provides tree-sitter parser installation and queries for Neovim.
-- NOTE: This uses the rewritten `main` branch (v1.x), required for Neovim 0.12+.
-- The old `master` branch API (nvim-treesitter.configs.setup) is gone.
-- Requires: tree-sitter-cli >= 0.26.1 (brew install tree-sitter), tar, curl, a C compiler.
-- Highlighting is now handled by Neovim itself via vim.treesitter.start().

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
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
      'lua',
      'markdown',
      'markdown_inline',
      'vim',
      'vimdoc',
      'go',
      'gotmpl',
      'sql',
    })
  end,
}
