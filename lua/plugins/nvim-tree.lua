local g = vim.g

vim.o.termguicolors = true

-- stylua: ignore start
-- g.nvim_tree_side 			= 'left' 	-- left by default
-- g.nvim_tree_width 			= 30 		-- 30 by default
-- g.nvim_tree_gitignore 		= 0 		-- 0 by default
g.nvim_tree_auto_open 			= 1 		-- 0 by default, opens the tree when typing `vim $DIR` or `vim`
g.nvim_tree_auto_close 			= 1 		-- 0 by default, closes the tree when it's the last window
-- g.nvim_tree_quit_on_open 		= 0 		-- 0 by default, closes the tree when you open a file
g.nvim_tree_follow 			= 1 		-- 0 by default, this option allows the cursor to be updated when entering a buffer
g.nvim_tree_indent_markers 		= 1 		-- 0 by default, this option shows indent markers when folders are open
-- g.nvim_tree_hide_dotfiles 		= 0 		-- 0 by default, this option hides files and folders starting with a dot `.`
-- g.nvim_tree_git_hl 			= 0 		-- 0 by default, will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_tab_open 			= 1 		-- 0 by default, will open the tree when entering a new tab and the tree was previously open
-- g.nvim_tree_width_allow_resize 	= 0 		-- 0 by default, will not resize the tree when opening a file
-- g.nvim_tree_disable_netrw 		= 1 		-- 1 by default, disables netrw
-- g.nvim_tree_hijack_netrw 		= 1 		-- 1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
g.nvim_tree_add_trailing 		= 1 		-- 0 by default, append a trailing slash to folder names
-- g.nvim_tree_group_empty 		= 0 		-- 0 by default, compact folders that only contain a single folder into one node in the file tree
g.nvim_tree_lsp_diagnostics 		= 1 		-- 0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
g.nvim_tree_root_folder_modifier 	= ':~' 		-- ':~'' is the default. See :help filename-modifiers for more options
g.nvim_tree_special_files 	= { 'README.md', 'Makefile', 'MAKEFILE' } -- List of filenames that gets highlighted with NvimTreeSpecialFile
g.nvim_tree_ignore 		= { '.git', 'node_modules', '.cache', 'vendor' } -- empty by default
g.nvim_tree_auto_ignore_ft 	= { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.
-- stylua: ignore end

g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
}
g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = '✗',
    staged = '✓',
    unmerged = '',
    renamed = '➜',
    untracked = '★',
    deleted = '',
    ignored = '◌',
  },
  folder = {
    default = '',
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
    symlink_open = '',
  },
  lsp = {
    hint = '',
    info = '',
    warning = '',
    error = '',
  },
}

local get_lua_cb = function(cb_name)
  return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", cb_name)
end

-- g.nvim_tree_bindings = {
--   ["<CR>"] = get_lua_cb("edit"),
--   ["o"] = get_lua_cb("edit"),
--   ["<2-LeftMouse>"] = get_lua_cb("edit"),
--   ["<2-RightMouse>"] = get_lua_cb("cd"),
--   ["<C-]>"] = get_lua_cb("cd"),
--   ["<C-v>"] = get_lua_cb("vsplit"),
--   ["<C-x>"] = get_lua_cb("split"),
--   ["<C-t>"] = get_lua_cb("tabnew"),
--   ["<BS>"] = get_lua_cb("close_node"),
--   ["<S-CR>"] = get_lua_cb("close_node"),
--   ["<Tab>"] = get_lua_cb("preview"),
--   ["I"] = get_lua_cb("toggle_ignored"),
--   ["H"] = get_lua_cb("toggle_dotfiles"),
--   ["R"] = get_lua_cb("refresh"),
--   ["a"] = get_lua_cb("create"),
--   ["d"] = get_lua_cb("remove"),
--   ["r"] = get_lua_cb("rename"),
--   ["<C-r>"] = get_lua_cb("full_rename"),
--   ["x"] = get_lua_cb("cut"),
--   ["c"] = get_lua_cb("copy"),
--   ["p"] = get_lua_cb("paste"),
--   ["[c"] = get_lua_cb("prev_git_item"),
--   ["]c"] = get_lua_cb("next_git_item"),
--   ["-"] = get_lua_cb("dir_up"),
--   ["q"] = get_lua_cb("close")
-- }

-- NvimTreeSymlink
-- NvimTreeFolderName
-- NvimTreeFolderIcon
-- NvimTreeEmptyFolderName
-- NvimTreeOpenedFolderName
-- NvimTreeExecFile
-- c('hi NvimTreeOpenedFile guifg=#334445 guibg=#404040')
-- NvimTreeSpecialFile
-- NvimTreeImageFile
-- NvimTreeMarkdownFile

-- LspDiagnosticsError
-- LspDiagnosticsWarning
-- LspDiagnosticsInformation
-- LspDiagnosticsHint
--
-- NvimTreeGitDirty
-- NvimTreeGitStaged
-- NvimTreeGitMerge
-- NvimTreeGitRenamed
-- NvimTreeGitNew
-- NvimTreeGitDeleted

-- There are also links to normal bindings to style the tree itself.

-- Normal
-- EndOfBuffer
-- CursorLine
-- VertSplit
-- CursorColumn

-- There are also links for file highlight with git properties
-- These all link to there Git equivalent

-- NvimTreeFileDirty
-- NvimTreeFileStaged
-- NvimTreeFileMerge
-- NvimTreeFileRenamed
-- NvimTreeFileNew
-- NvimTreeFileDeleted
