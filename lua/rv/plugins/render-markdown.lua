-- https://github.com/MeanderingProgrammer/render-markdown.nvim
--
-- Renders Markdown files in Neovim with styled headings, code blocks,
-- and inline decorations. Activated for markdown filetype only. LaTeX disabled.

return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = require('rv.utils').plugin_enabled({ vscode = false }),
  ft = { 'markdown' },
  opts = {
    file_types = { 'markdown' },
    latex = { enabled = false },
  },
}
