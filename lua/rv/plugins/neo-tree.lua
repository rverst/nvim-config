-- https://github.com/nvim-neo-tree/neo-tree.nvim
--
-- Neo-tree is a Neovim plugin to browse the file system and other tree like structures
-- in whatever style suits you, including sidebars, floating windows, netrw split style,
-- or all of them at once!

return {
  'nvim-neo-tree/neo-tree.nvim',
  enabled = not vim.g.vscode,
  branch = 'v3.x',
  cmd = 'Neotree',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup({
      sources = {
        'filesystem',
        'buffers',
        --"git_status"
      },
      source_selector = {
        winbar = true,
      },
      close_if_last_window = true,
      filesystem = {
        use_libuv_file_watcher = true,
      },
    })
  end,
}
