require('session_manager').setup{
				autoload_last_session = false,
				autosave_last_session = true
}

require('telescope').load_extension('sessions')
