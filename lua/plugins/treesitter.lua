require('nvim-treesitter.configs').setup {
	ensure_installed = 'maintained',
	ignore_install = { 'haskell' },
	highlight = {
		enable = true,
		disable_filetype = { 'TelescopePrompt'  },
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25,
		persist_queries = false,
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?" }
	},
	autopairs = {
		enable = true
	},
	autotag = {
		enable = true
	},
	rainbow = {
		enable = true
	},
	context_commentstring = {
		enable = true,
		config = {
			javascriptreact = {
				style_element = "{/*%s*/}"}
		}
	},
}

require("nvim-autopairs").setup({
	disable_filetype = { 'TelescopePrompt' },
	check_ts = true,
	ts_config = {
		lua = {'string'}, -- it will not add pair on that treesitter node
		javascript = {'template_string'},
	}
})

--local ts_conds = require('nvim-autopairs.ts-conds')
--local rule = require('nvim-autopairs.rule')

-- press % => %% is only inside comment or string
--npairs.add_rules({
--  rule("%", "%", "lua")
--    :with_pair(ts_conds.is_ts_node({'string','comment'})),
--  rule("$", "$", "lua")
--    :with_pair(ts_conds.is_not_ts_node({'function'}))
--})
