-- https://github.com/numToStr/Comment.nvim
--
-- "gc" to comment visual regions/lines, "gb" for block comments...

return {
  'numToStr/Comment.nvim',
  enabled = true,
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {},
}
