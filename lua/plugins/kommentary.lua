local config = require('kommentary.config')

config.configure_language("default", {
    use_consistent_indentation = true,
})

config.configure_language("lua", {
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
})

vim.g.kommentary_create_default_mappings = false

