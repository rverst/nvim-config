require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
})

vim.g.kommentary_create_default_mappings = false
local utils = require('utils')
utils.map('n', '<leader>cc', '<Plug>kommentary_line_default', { noremap = false })
utils.map('v', '<leader>c', '<Plug>kommentary_visual_default', { noremap = false })
utils.map('n', '<leader>c', '<Plug>kommentary_motion_default', { noremap = false })

