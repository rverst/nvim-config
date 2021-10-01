local g = vim.g

g.autoload_last_session = false
g.autosave_last_session = true

require('telescope').load_extension('sessions')
