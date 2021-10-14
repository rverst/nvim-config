local m = require('mapx').setup({
  global = true,
  whichkey = true,
  force = true,
})

-- just to calm the LSP diagnostics
if _G['nmap'] == nil then
  _G['nmap'] = function(...) end
end

if _G['nnoremap'] == nil then
  _G['nnoremap'] = function(...) end
end

if _G['vnoremap'] == nil then
  _G['vnoremap'] = function(...) end
end

if _G['tnoremap'] == nil then
  _G['tnoremap'] = function(...) end
end

if _G['inoremap'] == nil then
  _G['inoremap'] = function(...) end
end

-- stylua: ignore start

nnoremap('<F1>', '<cmd>lua require("telescope.builtin").help_tags()<cr>', 'Help')
inoremap('<F1>', '<cmd>lua require("telescope.builtin").help_tags()<cr>')
vnoremap('<F1>', '<cmd>lua require("telescope.builtin").help_tags()<cr>')
tnoremap('<F1>', '<cmd>lua require("telescope.builtin").help_tags()<cr>')

nnoremap('<F3>', '<cmd>vertical resize -5<cr>', 'Decrease vert. size (-5)')
nnoremap('<F4>', '<cmd>vertical resize +5<cr>', 'Increase vert. size (+5)')
nnoremap('<F15>', '<cmd>resize -5<cr>', 'Decrease hori. size (-5)')
nnoremap('<F16>', '<cmd>resize +5<cr>', 'Increase hori. size (+5)')
nnoremap('<F5>', '<cmd>lua require("dap").continue()<cr>', 'Continue')
nnoremap('<F7>', '<cmd>lua require("dap").step_into()<cr>', 'Step into')
nnoremap('<F8>', '<cmd>lua require("dap").step_over()<cr>', 'Step over')
nnoremap('<F20>', '<cmd>lua require("dap").step_out()<cr>', 'Step out')
nnoremap('<F9>', '<cmd>lua require("dap").step_out()<cr>', 'Run to cursor')
nnoremap('<cr>', '<cmd>noh<cr><cr>', 'which_key_ignore')
nnoremap('<C-h>', '<C-w>h', 'which_key_ignore')
nnoremap('<C-j>', '<C-w>j', 'which_key_ignore')
nnoremap('<C-k>', '<C-w>k', 'which_key_ignore')
nnoremap('<C-l>', '<C-w>l', 'which_key_ignore')
nnoremap('<F12>', '<cmd>vertical resize +5<cr>', 'which_key_ignore')
nnoremap('<F24>', '<cmd>vertical resize -5<cr>', 'which_key_ignore')
nnoremap('L', '<cmd>BufferNext<cr>', 'Next buffer')
nnoremap('H', '<cmd>BufferPrevious<cr>', 'Previous buffer')
-- nnoremap('J', '<cmd>move +1<cr>', 'Move line down')
-- nnoremap('K', '<cmd>move -2<cr>', 'Move line up')
nnoremap('<F2>', '<C-w>=', 'Equal splits')
nnoremap('<C-n>', '<cmd>NvimTreeToggle<cr>', 'Toggle file explorer')
nnoremap('<C-s>', '<cmd>SymbolsOutline<cr>', 'Toggle symbols outline')

inoremap('<C-h>', '<C-w>h')
inoremap('<C-j>', '<C-w>j')
inoremap('<C-k>', '<C-w>k')
inoremap('<C-l>', '<C-w>l')

vnoremap('<C-h>', '<C-w>h')
vnoremap('<C-j>', '<C-w>j')
vnoremap('<C-k>', '<C-w>k')
vnoremap('<C-l>', '<C-w>l')

nnoremap('<leader>p', '"+p', 'Paste from clipboard')
nnoremap('<leader>P', '"+P', 'Paste from clipboard')
nnoremap('<leader>y', '"+y', 'Yank to clipboard')
nnoremap('<leader>Y', '"+Y', 'Yank to clipboard')
nnoremap('<leader>q', '<cmd>lua require("telescope.builtin").quickfix()<cr>', 'Quickfix')
nnoremap('<leader>/', '<plug>kommentary_line_default', 'Toggle line comment')

m.nname('<leader>f', 'Find')
nnoremap('<leader>ff', '<cmd>lua require("plugins.telescope").project_files()<cr>', 'Find files')
nnoremap('<leader>fv', '<cmd>lua require("plugins.telescope").search_vimconfig()<cr>', 'Search nvim config')
nnoremap('<leader>f.', '<cmd>lua require("plugins.telescope").search_dotfiles()<cr>', 'Search dotfiles')
nnoremap('<leader>fo', '<cmd>lua require("plugins.telescope").search_path()<cr>', 'Search path')
nnoremap('<leader>fF', '<cmd>lua require("telescope.builtin").find_files()<cr>', 'Find files')
nnoremap('<leader>fr', '<cmd>lua require("telescope.builtin").registers()<cr>', 'Registers')
nnoremap('<leader>fR', '<cmd>lua require("telescope.builtin").oldfiles()<cr>', 'Open recent file')
nnoremap('<leader>fd', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', 'Find in buffer')
nnoremap('<leader>fD', '<cmd>lua require("telescope.builtin").current_buffer_tags()<cr>', 'Tags of buffer')
nnoremap('<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', 'Find buffer')
nnoremap('<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', 'Livegrep pwd')
nnoremap('<leader>fG', '<cmd>lua require("plugins.telescope").grep_path()<cr>', 'Livegrep path')
nnoremap('<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', 'Help grep')
nnoremap('<leader>fi', '<cmd>lua require("telescope.builtin").highlights()<cr>', 'Highlights')
nnoremap('<leader>fc', '<cmd>lua require("telescope.builtin").commands()<cr>', 'Commands')
nnoremap('<leader>ft', '<cmd>lua require("telescope.builtin").tags()<cr>', 'Tags')
nnoremap('<leader>fw', '<cmd>lua require("telescope.builtin").grep_string()<cr>', 'Find word')
nnoremap('<leader>fm', '<cmd>lua require("telescope.builtin").marks()<cr>', 'Marks')
nnoremap('<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<cr>', 'Keymaps')
nnoremap('<leader>fO', '<cmd>lua require("telescope.builtin").vim_options()<cr>', 'Nvim options')
nnoremap('<leader>fe', '<cmd>lua require("telescope.builtin").symbols()<cr>', 'Search symbols')
nnoremap('<leader>fs', '<cmd>Telescope sessions<cr>', 'Find session')
nnoremap('<leader>fn', '<cmd>enew<cr>', 'New file')

m.nname('<leader>d', 'Debug')
nnoremap('<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<cr>"', 'Toggle breakpoint')
nnoremap('<leader>dB', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>"', 'Set breakpoint')
nnoremap('<leader>dL', '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point messgage: "))<cr>"', 'set log point')
nnoremap('<leader>dr', '<cmd>lua require("dap").repl.open()<cr>"', 'Repl open')
nnoremap('<leader>dl', '<cmd>lua require("dap").run_last()<cr>"', 'Run last')

m.nname('<leader>g', 'Git')
m.nname('<leader>g.', 'Next hunk')
m.nname('<leader>g,', 'Previous hunk')
nnoremap('<leader>gc', '<cmd>lua require("telescope.builtin").git_commits()<cr>', 'List commits')
nnoremap('<leader>gC', '<cmd>lua require("telescope.builtin").git_bcommits()<cr>', 'List buffer commits')
nnoremap('<leader>gb', '<cmd>lua require("telescope.builtin").git_branches()<cr>', 'Git branches')
nnoremap('<leader>gS', '<cmd>lua require("telescope.builtin").git_status()<cr>', 'Git Status')
nnoremap('<leader>gs', '<cmd>lua require("gitsigns").stage_hunk()<cr>', 'Stage hunk')
nnoremap('<leader>gu', '<cmd>lua require("gitsigns").undo_stage_hunk()<cr>', 'Undo stage hunk')
nnoremap('<leader>gr', '<cmd>lua require("gitsigns").reset_hunk()<cr>', 'Reset hunk')
nnoremap('<leader>gR', '<cmd>lua require("gitsigns").reset_buffer()<cr>', 'Reset buffer')
nnoremap('<leader>gp', '<cmd>lua require("gitsigns").preview_hunk()<cr>', 'Preview hunk')
nnoremap('<leader>gB', '<cmd>lua require("gitsigns").blame_line()<cr>', 'Blame line')

m.nname('<leader>T', 'Telescope')
nnoremap('<leader>Tp', '<cmd>lua require("telescope.builtin").planets()<cr>"', 'Use the telescope')
nnoremap('<leader>Tb', '<cmd>lua require("telescope.builtin").builtin()<cr>"', 'List builtin pickers')
nnoremap('<leader>TR', '<cmd>lua require("telescope.builtin").reloader()<cr>"', 'List lua modules and reload')
nnoremap('<leader>Ts', '<cmd>lua require("telescope.builtin").symbols()<cr>"', 'List builtin symbols')
nnoremap('<leader>Tr', '<cmd>lua require("telescope.builtin").registers()<cr>"', 'List registers')
nnoremap('<leader>Tf', '<cmd>lua require("telescope.builtin").filetypes()<cr>"', 'List filetypes')

m.nname('<leader>o', 'Ortography')
nnoremap('<leader>oo', '<cmd>setlocal spell! spelllang=en_us,de_de<cr>', 'Toggle spellcheck (en/de)')
nnoremap('<leader>oe', '<cmd>setlocal spell! spelllang=en_us<cr>', 'Toggle spellcheck (en)')
nnoremap('<leader>od', '<cmd>setlocal spell! spelllang=de_de<cr>', 'Toggle spellcheck (de)')
nnoremap('<leader>og', '<cmd>setlocal spell! spelllang=de_de<cr>', 'Toggle spellcheck (de)')
nnoremap('<leader>os', '<cmd>lua require("telescope.builtin").spell_suggest()<cr>"', 'Spell suggestion')

m.nname('<leader>t', 'Terminal')
nnoremap('<leader>tn', '<cmd>lua require("bindings").openTerminal("v")<cr>"', 'Vertical terminal')
nnoremap('<leader>tx', '<cmd>lua require("bindings").openTerminal("h", "", 10)<cr>"', 'horizontal terminal')
nnoremap('<leader>tf', '<cmd>lua require("bindings").openFloatTerm("")<cr>"', 'Float terminal')
nnoremap('<leader>tg', '<cmd>lua require("bindings").openFloatTerm("lazygit")<cr>"', 'Lazygit')
nnoremap('<leader>td', '<cmd>lua require("bindings").openFloatTerm("lazydocker")<cr>"', 'Lazydocker')

m.nname('<leader>c', 'Code')
nnoremap('<leader>cc', '<Plug>kommentary_line_default', 'Toggle line comment')
nnoremap('<leader>cC', '<Plug>kommentary_motion_default', 'Toggle comment [motion]')
nnoremap('<leader>cf', '<cmd>Format<cr>', 'Format code')
nnoremap('<leader>cF', '<cmd>FormatWrite<cr>', 'Format code and write')

m.nname('<leader>m', 'Misc')
nnoremap('<leader>mi', '<cmd>TSHighlightCapturesUnderCursor<cr>', 'Highlight captures under cursor')
nnoremap('<leader>mp', '<cmd>TSPlaygroundToggle<cr>', 'Toggle treesitter playgound')

m.nname('<leader>s', 'Session')
nnoremap('<leader>ss', '<cmd>SaveSession<cr>', 'Save session')
nnoremap('<leader>sl', '<cmd>LoadSession<cr>', 'Load laset session')
nnoremap('<leader>sf', '<cmd>Telescope sessions<cr>', 'Find session')

m.nname('<leader>b', 'Bufferline')
nnoremap('<leader>b1','<cmd>BufferGoto 1<cr>', 'Buffer 1' )
nnoremap('<leader>b2','<cmd>BufferGoto 2<cr>', 'Buffer 2' )
nnoremap('<leader>b3','<cmd>BufferGoto 3<cr>', 'Buffer 3' )
nnoremap('<leader>b4','<cmd>BufferGoto 4<cr>', 'Buffer 4' )
nnoremap('<leader>b5','<cmd>BufferGoto 5<cr>', 'Buffer 5' )
nnoremap('<leader>b6','<cmd>BufferGoto 6<cr>', 'Buffer 6' )
nnoremap('<leader>b7','<cmd>BufferGoto 7<cr>', 'Buffer 7' )
nnoremap('<leader>b8','<cmd>BufferGoto 8<cr>', 'Buffer 8' )
nnoremap('<leader>b9','<cmd>BufferGoto 9<cr>', 'Buffer 9' )
nnoremap('<leader>b0','<cmd>BufferLast<cr>', 'Last buffer' )
nnoremap('<leader>b,','<cmd>BufferMovePrevious<cr>', 'Move buffer left' )
nnoremap('<leader>b.','<cmd>BufferMoveNext<cr>', 'Move buffer right' )
nnoremap('<leader>bc','<cmd>BufferClose<cr>', 'Close buffer' )
nnoremap('<leader>bd','<cmd>BufferOrderByDirectory<cr>', 'Order buffers by dir' )
nnoremap('<leader>bl','<cmd>BufferOrderByLanguage<cr>', 'Order buffers by lang' )

vnoremap('<leader>p', '"+p', 'Paste from clipboard')
vnoremap('<leader>y', '"+y', 'Yank to clipboard')

vnoremap('<leader>f', '<cmd>Format<cr>', 'Format code')
vnoremap('<leader>F', '<cmd>FormatWrite<cr>', 'Format code and write')
vnoremap('<leader>/', '<plug>kommentary_visual_default<cr>', 'Toggle comment')

-- stylua: ignore end

local utils = require('utils')
local M = {}

-- bindings for LSP buffers, used in lsp/config.lua
M.lspBindings = function(bufNr, clientName, formatting, rangeFormatting)
  -- stylua: ignore start

  nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<cr>', 'silent', { buffer = bufNr}, 'Hover [LSP]')

  nnoremap(']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', 'silent', { buffer = bufNr}, 'Next diagnostics')
  nnoremap('[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', 'silent', { buffer = bufNr}, 'Previous diagnostics')

  nnoremap('gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', 'silent', { buffer = bufNr}, 'Definition')
  nnoremap('gD', '<cmd>lua vim.lsp.diagnostic.declarations()<cr>', 'silent', { buffer = bufNr}, 'Declaration')
  nnoremap('gi', '<cmd>lua vim.lsp.diagnostic.implementation()<cr>', 'silent', { buffer = bufNr}, 'Implementation')
  nnoremap('gr', '<cmd>lua vim.lsp.diagnostic.references()<cr>', 'silent', { buffer = bufNr}, 'References')


	nnoremap('<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', 'silent', { buffer = bufNr}, 'Line diagnostic')
  nnoremap('<leader>l', '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'silent', { buffer = bufNr}, 'Signature help')
  nnoremap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'silent', { buffer = bufNr}, 'Type definition')
  nnoremap('<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', 'silent', { buffer = bufNr}, 'Rename')

	m.nname('<leader>w', 'Workspace')
	nnoremap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', 'silent', { buffer = bufNr}, 'Add workspace folder')
	nnoremap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', 'silent', { buffer = bufNr}, 'Remove workspace folder')
	nnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', 'silent', { buffer = bufNr}, 'List workspace folder')

  nnoremap('<leader>cr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', 'silent', { buffer = bufNr }, 'References')
  nnoremap('<leader>cs', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', 'silent', { buffer = bufNr }, 'Document symbols')
  nnoremap('<leader>cS', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<cr>', 'silent', { buffer = bufNr }, 'Workspace symbols')
  nnoremap('<leader>ca', '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', 'silent', { buffer = bufNr }, 'Code actions')
  nnoremap('<leader>cA', '<cmd>lua require("lspsaga.codeaction").code_action()<cr>', 'silent', { buffer = bufNr }, 'Code actions [lspsaga]')
  nnoremap('<leader>cd', '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>', 'silent', { buffer = bufNr }, 'Document diagnostic')
  nnoremap('<leader>cD', '<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<cr>', 'silent', { buffer = bufNr }, 'Workspace diagnostic')
  nnoremap('<leader>cf', '<cmd>lua require("lspsaga.provider").lsp_finder()<cr>', 'silent', { buffer = bufNr }, 'Def/Ref finder [lspsaga]')

  vnoremap('<leader>ca', '<cmd>lua require("telescope.builtin").lsp_range_code_actions()<cr>', 'silent', { buffer = bufNr }, 'Code actions')
  vnoremap('<leader>cA', '<cmd>lua require("lspsaga.codeaction").range_code_action()<cr>', 'silent', { buffer = bufNr }, 'Code actions [lspsaga]')

	if formatting then
	  nnoremap('<leader>F', '<cmd>lua vim.lsp.buf.formatting()<cr>', 'silent', { buffer = bufNr}, 'Format [LSP]')
	end

	if rangeFormatting then
	  vnoremap('<leader>F', '<cmd>lua vim.lsp.buf.range_formatting()<cr>', 'silent', { buffer = bufNr}, 'Format [LSP]')
	end

	if clientName == 'rls' then
    nnoremap('<leader>cx', '<cmd>lua require("bindings").openFloatTerm("cargo run")<cr>', 'silent', { buffer = bufNr }, 'Run')
    nnoremap('<leader>cb', '<cmd>lua require("bindings").openFloatTerm("cargo build")<cr>', 'silent', { buffer = bufNr }, 'Build')
  end

  -- stylua: ignore end
end

M.openTerminal = function(orientation, size, autoclose)
  local s = size or 0
  local acl = autoclose or true

  local c = ''
  if orientation == 'h' then
    c = 'new term://' .. vim.o.shell
  else
    c = 'vnew term://' .. vim.o.shell
  end

  if s > 0 then
    c = c .. ' | resize ' .. size
  end
  vim.cmd(c)

  local tBuf = vim.api.nvim_get_current_buf()
  -- <esc> to leave insert mode in terminal
  utils.buf_map(tBuf, 't', '<ESC>', [[<C-\><C-n>]])
  utils.buf_map(tBuf, 't', '<C-h>', [[<C-\><C-n><C-w>h]])
  utils.buf_map(tBuf, 't', '<C-j>', [[<C-\><C-n><C-w>j]])
  utils.buf_map(tBuf, 't', '<C-k>', [[<C-\><C-n><C-w>k]])
  utils.buf_map(tBuf, 't', '<C-l>', [[<C-\><C-n><C-w>l]])

  if acl then
    vim.cmd([[au TermClose * ++once :lua require('plugins.which-key').closeTerminal(]] .. tBuf .. [[)]])
  end
end

M.closeTerminal = function(buf)
  vim.api.nvim_buf_delete(buf, { force = 1 })
end

-- open floating terminal and add keybindings (<C-q>) to close it
M.openFloatTerm = function(command, autoclose, border_style)
  local cmd = command or ''
  local acl = autoclose or true
  local bst = border_style or 0

  vim.g.my_mouse = vim.o.mouse
  vim.o.mouse = ''

  -- local cBuf = vim.api.nvim_get_current_buf()
  -- local cWin = vim.api.nvim_get_current_win()
  local tBuf = utils.openFloatTerm(cmd, bst)
  tnoremap('<C-q>', '<C-><C-n><cmd>lua require("utils").closeFloatTerm()<cr>', 'silent', { buffer = tBuf })
  nnoremap('<C-q>', '<C-><C-n><cmd>lua require("utils").closeFloatTerm()<cr>', 'silent', { buffer = tBuf })

  -- add autocmd to auto-close the floating window if the shell (the command) exits
  -- ToDo: statusline needs a redraw ore something
  if acl then
    vim.cmd([[au TermClose * ++once :lua require('utils').closeFloatTerm()]])
  end
end

return M
