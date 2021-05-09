local wk = require('which-key')
local utils = require('utils')
local var = require('utils.vars')

wk.setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

-- clear search highlight on <CR>
utils.map('n', '<CR>', '<cmd>noh<CR><CR>')

-- copy/pase from/to clipboard
utils.map('', '<leader>y', '"+y')
utils.map('', '<leader>p', '"+p')

-- switch windows with <ctrl> hjkl
utils.map('n', '<C-h>', '<C-w>h')
utils.map('n', '<C-j>', '<C-w>j')
utils.map('n', '<C-k>', '<C-w>k')
utils.map('n', '<C-l>', '<C-w>l')
utils.map('i', '<C-h>', '<C-w>h')
utils.map('i', '<C-j>', '<C-w>j')
utils.map('i', '<C-k>', '<C-w>k')
utils.map('i', '<C-l>', '<C-w>l')
utils.map('v', '<C-h>', '<C-w>h')
utils.map('v', '<C-j>', '<C-w>j')
utils.map('v', '<C-k>', '<C-w>k')
utils.map('v', '<C-l>', '<C-w>l')

-- equal splits
utils.map('n', '<F2>', '<C-w>=')

-- Goyo
utils.map('n', '<F4>', '<cmd>Goyo<CR>' )

-- toggle symbols outline
utils.map('n', '<C-s>', '<cmd>SymbolsOutline<CR>')

-- <esc> to leave insert mode in terminal
utils.map('t', '<ESC>', [[<C-\><C-n>]])

-- bufferline
utils.map('n', 'L', ':BufferNext<CR>')
utils.map('n', 'K', ':BufferPrevious<CR>')

vim.cmd[[nnoremap <silent> <A-1> :BufferGoto 1<CR>]]
vim.cmd[[nnoremap <silent> <A-1> :BufferGoto 2<CR>]]

local term = ''
if var.isWindows then
    term = 'pwsh.exe'
else
    term = 'zsh'
end

wk.register({
	p = 'paste from clipboard',
	y = 'yank to clipboard',
	f = {
		name = 'find',
		f = {[[<cmd>lua require('telescope.builtin').find_files()<CR>]], 'find file'},
		n = {[[<cmd>lua require('telescope.builtin').file_browser()<CR>]], 'file browser'},
		r = {[[<cmd>lua require('telescope.builtin').old_files()<CR>]], 'open recent file'},
		b = {[[<cmd>lua require('telescope.builtin').buffers()<CR>]], 'find buffer'},
		g = {[[<cmd>lua require('telescope.builtin').live_grep()<CR>]], 'live grep'},
		h = {[[<cmd>lua require('telescope.builtin').help_tags()<CR>]], 'grep help'},
		i = {[[<cmd>lua require('telescope.builtin').highlights()<CR>]], 'grep highlights'},
		c = {[[<cmd>lua require('telescope.builtin').commands()<CR>]], 'grep commands'},
		t = {[[<cmd>lua require('telescope.builtin').tags()<CR>]], 'grep tags'},
	},

	o = {
		name = 'ortography',
		o = {[[<cmd>setlocal spell! spelllang=en_us,de_de<CR>]], 'toggle spellcheck (en/de)'},
		e = {[[<cmd>setlocal spell! spelllang=en_us<CR>]], 'toggle spellcheck (en)'},
		d = {[[<cmd>setlocal spell! spelllang=de_de<CR>]], 'toggle spellcheck (de)'},
		g = {[[<cmd>setlocal spell! spelllang=de_de<CR>]], 'toggle spellcheck (de)'},
	},

	t = {
		name = 'terminal',
		n = {[[<cmd> vnew term://]]..term..[[ <CR>]], 'new terminal vsplit'},
		x = {[[<cmd> new term://]]..term..[[ | resize 10<CR>]], 'new terminal split'},
	},

	b = {
		name = 'bufferline',
		['1'] = {[[<cmd>BufferGoto 1<CR>]], 'buffer 1'},
		['2'] = {[[<cmd>BufferGoto 2<CR>]], 'buffer 2'},
		['3'] = {[[<cmd>BufferGoto 3<CR>]], 'buffer 3'},
		['4'] = {[[<cmd>BufferGoto 4<CR>]], 'buffer 4'},
		['5'] = {[[<cmd>BufferGoto 5<CR>]], 'buffer 5'},
		['6'] = {[[<cmd>BufferGoto 6<CR>]], 'buffer 6'},
		['7'] = {[[<cmd>BufferGoto 7<CR>]], 'buffer 7'},
		['8'] = {[[<cmd>BufferGoto 8<CR>]], 'buffer 8'},
		['9'] = {[[<cmd>BufferGoto 9<CR>]], 'buffer 9'},
		['0'] = {[[<cmd>BufferLast<CR>]], 'last buffer'},
		[','] = {[[<cmd>BufferMovePrevious<CR>]], 'move buffer left'},
		['.'] = {[[<cmd>BufferMoveNext<CR>]], 'move buffer right'},
		['c'] = {[[<cmd>BufferClose<CR>]], 'close buffer'},
		['d'] = {[[<cmd>BufferOrderByDirectory<CR>]], 'order buffers by dir'},
		['l'] = {[[<cmd>BufferOrderByLanguage<CR>]], 'order buffers by lang'},
	},

}, { prefix = '<leader>'})

--vimdm', [[<Cmd> Neoformat<CR>]], opt)
--

-- lsp saga
-- utils.map('n', 'gh', '<cmd>lua require("lspsaga.provider").lsp_finder()<cr>')
-- utils.map('n', 'ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>')
-- utils.map('v', 'ca', '<cmd><C-U>lua require("lspsaga.codeaction").range_code_action()<CR>')

-- utils.map('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>')
-- utils.map('n', '<C-a>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')
-- utils.map('n', '<C-z>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')

-- utils.map('n', 'gs', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>')

-- FixMe: not working...
-- utils.map('n', '<A-d>', '<cmd>lua require("lspsaga.floaterm").open_float_terminal("lazygit")<CR>')
-- utils.map('t', '<A-d>', '<C-\\><C-n><cmd>lua require("lspsaga.floaterm").close_float_terminal()<CR>')
