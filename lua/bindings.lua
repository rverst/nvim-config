local utils = require('utils')
local var = require('utils.vars')

-- clear search highlight on <CR>
utils.map('n', '<CR>', '<cmd>noh<CR><CR>')

-- copy/pase from/to clipboard
utils.map('', '<leader>y', '"+y')
utils.map('', '<leader>p', '"+p')

-- spellcheck, 'o' for ortography
utils.map('n', '<leader>oo', '<cmd>setlocal spell! spelllang=en_us,de_de<CR>')
utils.map('n', '<leader>oe', '<cmd>setlocal spell! spelllang=en_us<CR>')
utils.map('n', '<leader>og', '<cmd>setlocal spell! spelllang=de_de<CR>')
utils.map('n', '<leader>od', '<cmd>setlocal spell! spelllang=de_de<CR>')

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

-- Need to find something easy and useful to resize the windows,
-- should be a single keystroke command for easy repeat
-- update: done this at my keyboards
--utils.map('n', '<C-a>', '<cmd>vertical resize -5<CR>')
--utils.map('n', '<C-s>', '<cmd>vertical resize +5<CR>')
--utils.map('n', '<C-d>', '<cmd>resize -5<CR>')
--utils.map('n', '<C-f>', '<cmd>resize +5<CR>')
utils.map('n', '<F2>', '<C-w>=')

-- toggle symbols outline
utils.map('n', '<C-s>', '<cmd>SymbolsOutline<CR>')

-- new terminal
local term = ''
if var.isWindows then
    term = 'pwsh.exe'
else
    term = 'zsh'
end

utils.map('n', '<leader>tn', [[<cmd> vnew term://]] .. term .. [[ <CR>]])
utils.map('n', '<leader>tx', [[<cmd> new term://]] .. term .. [[ | resize 10<CR>]])

-- <esc> to leave insert mode in terminal
utils.map('t', '<ESC>', [[<C-\><C-n>]])

-- telescope
utils.map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>')
utils.map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>')
utils.map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>')
utils.map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>')

-- Goyo
utils.map('n', '<F4>', '<cmd>Goyo<CR>' )
