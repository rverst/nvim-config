local p, t = pcall(require, 'nvim-tree')
if not p then
  return
end

local g = vim.g

vim.o.termguicolors = true
--g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', 'vendor' } -- empty by default
--g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.
g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
--g.nvim_tree_hide_dotfiles = 0 -- 0 by default, this option hides files and folders starting with a dot `.`
g.nvim_tree_git_hl = 0 -- 0 by default, this option hides files and folders starting with a dot `.`
g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
g.nvim_tree_disable_window_picker = 1 -- 0 by default, will disable the window picker.
g.nvim_tree_icon_padding = ' ' -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
g.nvim_tree_respect_buf_cwd = 1 -- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
g.nvim_tree_create_in_closed_folder = 0 -- 1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
g.nvim_tree_refresh_wait = 500 -- 1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
g.nvim_tree_window_picker_exclude = {
  filetype = {
    'notify',
    'packer',
    'qf',
  },
  buftype = {
    'terminal',
  },
}
--  Dictionary of buffer option names mapped to a list of option values that
--  indicates to the window picker that the buffer's window should not be
--  selectable.
g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' } --  List of filenames that gets highlighted with NvimTreeSpecialFile
g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}
-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath.
-- if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
-- but this will not work when you set indent_markers (because of UI conflict)

--  default will show icon by default if no icon is provided
--  default shows no icon by default
g.nvim_tree_icons = {
  default = '???',
  symlink = '???',
  git = {
    unstaged = '???',
    staged = '???',
    unmerged = '???',
    renamed = '???',
    untracked = '???',
    deleted = '???',
    ignored = '???',
  },
  folder = {
    default = '???',
    open = '???',
    empty = '???',
    empty_open = '???',
    symlink = '???',
    symlink_open = '???',
  },
  lsp = {
    hint = '???',
    info = '???',
    warning = '???',
    error = '???',
  },
}

t.setup({
  -- disables netrw completely (default: true)
  disable_netrw = true,
  -- hijack netrw window on startup (default: true)
  hijack_netrw = true,
  -- open the tree when running this setup function (default: false)
  open_on_setup = false,
  -- will not open on setup if the filetype is in this list (default: {})
	ignore_ft_on_setup = { 'startify', 'dashboard' },
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  -- closes neovim automatically when the tree is the last **WINDOW** in the view (default: false)
  auto_close = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened (default: false)
  open_on_tab = false,
  -- hijack the cursor in the tree to put it at the start of the filename (default: false)
  hijack_cursor = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)  (default: false)
  update_cwd = false,
  -- show lsp diagnostics in the signcolumn (default: false)
  diagnostics = {
    enable = false,
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature (default: false)
    enable = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true (default: false)
    update_cwd = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {},
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases (default: nil)
    cmd = nil,
    -- the command arguments as a list
    args = {},
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%` (default: 30)
    width = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom' (default: 'left')
    side = 'left',
    -- if true the tree will resize itself after opening a file (default: false)
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {},
    },
  },
})

-- local get_lua_cb = function(cb_name)
--   return string.format(-- :lua require'nvim-tree'.on_keypress('%s')<CR>-- , cb_name)
-- end

-- g.nvim_tree_bindings = {
--   [-- <CR>-- ] = get_lua_cb(-- edit-- ),
--   [-- o-- ] = get_lua_cb(-- edit-- ),
--   [-- <2-LeftMouse>-- ] = get_lua_cb(-- edit-- ),
--   [-- <2-RightMouse>-- ] = get_lua_cb(-- cd-- ),
--   [-- <C-]>-- ] = get_lua_cb(-- cd-- ),
--   [-- <C-v>-- ] = get_lua_cb(-- vsplit-- ),
--   [-- <C-x>-- ] = get_lua_cb(-- split-- ),
--   [-- <C-t>-- ] = get_lua_cb(-- tabnew-- ),
--   [-- <BS>-- ] = get_lua_cb(-- close_node-- ),
--   [-- <S-CR>-- ] = get_lua_cb(-- close_node-- ),
--   [-- <Tab>-- ] = get_lua_cb(-- preview-- ),
--   [-- I-- ] = get_lua_cb(-- toggle_ignored-- ),
--   [-- H-- ] = get_lua_cb(-- toggle_dotfiles-- ),
--   [-- R-- ] = get_lua_cb(-- refresh-- ),
--   [-- a-- ] = get_lua_cb(-- create-- ),
--   [-- d-- ] = get_lua_cb(-- remove-- ),
--   [-- r-- ] = get_lua_cb(-- rename-- ),
--   [-- <C-r>-- ] = get_lua_cb(-- full_rename-- ),
--   [-- x-- ] = get_lua_cb(-- cut-- ),
--   [-- c-- ] = get_lua_cb(-- copy-- ),
--   [-- p-- ] = get_lua_cb(-- paste-- ),
--   [-- [c-- ] = get_lua_cb(-- prev_git_item-- ),
--   [-- ]c-- ] = get_lua_cb(-- next_git_item-- ),
--   [-- --- ] = get_lua_cb(-- dir_up-- ),
--   [-- q-- ] = get_lua_cb(-- close-- )
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
