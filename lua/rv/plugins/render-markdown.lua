return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = not vim.g.vscode,
  lazy = false,
  opts = {
    file_types = { 'markdown', 'Avante' },
    latex = { enabled = false },
  },
  ft = { 'markdown', 'Avante' },
}
