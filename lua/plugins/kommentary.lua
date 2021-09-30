local config = require('kommentary.config')

-- do not create default mappings (gc)
vim.g.kommentary_create_default_mappings = false

config.configure_language('default', {
  use_consistent_indentation = true,
})

config.configure_language('lua', {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
})
