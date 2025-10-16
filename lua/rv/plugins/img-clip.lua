-- https://github.com/hakonharnes/img-clip.nvim
--
-- Effortlessly embed images into any markup language, like LaTeX, Markdown or Typst.
-- Requires `pngpaste` (macOS) or `xclip` (Linux) to work. (brew install pngpaste)

return {
  'HakonHarnes/img-clip.nvim',
  enabled = not vim.g.vscode,
  event = 'VeryLazy',
  opts = {
    filetypes = {
      codecompanion = {
        prompt_for_file_name = false,
        template = '[Image]($FILE_PATH)',
        use_absolute_path = true,
      },
    },
  },
  keys = {
    -- suggested keymap
    { '<leader>p', '<cmd>PasteImage<cr>', desc = 'Paste image from system clipboard' },
  },
}
