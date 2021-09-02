local actions = require('telescope.actions')

local M = {}
M.search_dotfiles = function()
  require('telescope.builtin').find_files({
    prompt_title = '< dotfiles >',
    cwd = '$HOME/.config/dotfiles',
  })
end

M.search_vimconfig = function()
  require('telescope.builtin').find_files({
    prompt_title = '< dotfiles >',
    cwd = '$HOME/.config/dotfiles/nvim',
  })
end

return M
-- mappings are in ./which-key.lua
