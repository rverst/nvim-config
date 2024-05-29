local plugin = {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  cmd = 'Neotree',
  config = function()
    require('neo-tree').setup({
      sources = {
        "filesystem",
        "buffers",
        --"git_status"
      },
      source_selector = {
        winbar = true,
      },
      close_if_last_window = true

    })

  end,
}

return plugin


