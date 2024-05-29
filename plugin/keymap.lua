local set = vim.keymap.set
local utils = require('rv.utils')

-- Clear search highlights by pressing <ESC> in normal mode
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Shortcuts to source a line or the entire file
set('n', '<leader>X', '<cmd>.lua<CR>', { desc = 'Execute the current line' })
set('n', '<leader>x', function()
  vim.cmd('source %')
  vim.notify(vim.fn.expand('%:t'), 'info', { title = 'Sourced file' })
end, { desc = 'Source the current file', silent = true })

-- Keybinds to make split navigation easier, use CTRL+<hjkl> to switch between windows
-- See `:help wincmd` for a list of all window commands
set('n', '<c-h>', '<c-w><c-h>', { desc = 'Move focus to the left window' })
set('n', '<c-l>', '<c-w><c-l>', { desc = 'Move focus to the right window' })
set('n', '<c-j>', '<c-w><c-j>', { desc = 'Move focus to the lower window' })
set('n', '<c-k>', '<c-w><c-k>', { desc = 'Move focus to the upper window' })

-- Diagnostic keymaps
-- '[d' and ']d' are now a default in neovim ^0.10.0 but i want the notice float
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- <F2> is the jetbrains default for this
set('n', '<F2>', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Resize splits
-- the options key on macOS results in different keycodes
if utils.is_mac() then
  set('n', '≤', '<c-w>5>', { desc = 'Increase vertical split <opt-,>' })
  set('n', '≥', '<c-w>5<', { desc = 'Decrease vertical split <opt-.>' })
  set('n', '†', '<c-w>+', { desc = 'Make split taller <opt-t>' })
  set('n', 'ß', '<c-w>-', { desc = 'Make split smaller <opt-s>' })
else
  set('n', '<M-<>', '<c-w>5>', { desc = 'Increase vertical split' })
  set('n', '<M->>', '<c-w>5<', { desc = 'Decrease vertical split' })
  set('n', '<M-t>', '<c-w>+', { desc = 'Increase horizontal split' })
  set('n', '<M-s>', '<c-w>-', { desc = 'Decrease horizontal split' })
end

-- Functions to move lines up/down or jump to the next/previous change in a diff-view
local move_line_down = function()
  if vim.opt.diff:get() then
    vim.cmd([[normal! ]c]])
  else
    vim.cmd([[m .+1<CR>==]])
  end
end

local move_line_up = function()
  if vim.opt.diff:get() then
    vim.cmd([[normal! [c]])
  else
    vim.cmd([[m .-2<CR>==]])
  end
end

if utils.is_mac() then
  set('n', '∆', move_line_down, { desc = 'Shift line down <opt-j>' })
  set('n', '˚', move_line_up, { desc = 'Shift line up <opt-k>' })
else
  set('n', '<M-j>', move_line_down, { desc = 'Shift line down' })
  set('n', '<M-k>', move_line_up, { desc = 'Shift line up' })
end

-- F1 for help, using the word under the cursor
set('n', '<F1>', function()
  vim.cmd('help ' .. vim.fn.expand('<cword>'))
end, { desc = 'Open help for the word under the cursor', silent = true })

-- Neo-tree
set('n', '<F4>', ':Neotree toggle reveal<CR>', { desc = 'Toggle Neo-Tree', silent = true })

set('n', '<leader>uf', function()
  vim.notify(vim.bo.filetype, 'info', { title = ' Filetype' })
end, { desc = 'Show current filetype' })
