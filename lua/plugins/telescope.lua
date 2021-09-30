local p1, telescope = pcall(require, 'telescope')
local p2, actions = pcall(require, 'telescope.actions')
if not p1 or not p2 then
  return
end

telescope.setup = {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    mappings = {
      i = {
        ['<esc>'] = actions.close,
      },
    },
  },
}

local M = {}

M.search_dotfiles = function()
  require('telescope.builtin').find_files({
    prompt_title = '< dotfiles >',
    cwd = '$HOME/.config/dotfiles',
  })
end

M.search_vimconfig = function()
  require('telescope.builtin').find_files({
    prompt_title = '< neovim >',
    cwd = '$HOME/.config/dotfiles/nvim',
  })
end

M.project_files = function()
  local opts = {
    file_ignore_patterns = {
      'vendor',
    },
  }
  local ok = pcall(require('telescope.builtin').git_files, opts)
  if not ok then
    require('telescope.builtin').find_files(opts)
  end
end

return M
-- mappings are in ./which-key.lua
