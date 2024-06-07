-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  enabled = true,
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup()

    local conf = require('telescope.config').values
    local function open_telescope(harpoon_files, opts)
      opts = opts or {}
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new(opts, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table({
            results = file_paths,
          }),
          sorter = conf.file_sorter({}),
          ireviewer = false,
        })
        :find()
    end

    vim.keymap.set('n', '<leader>hm', function()
      harpoon:list():add()
    end, { desc = 'Mark file' })

    vim.keymap.set('n', '<leader>hl', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle Harpoon' })

    vim.keymap.set('n', '<leader>hh', function()
      open_telescope(
        harpoon:list(),
        require('telescope.themes').get_dropdown({
          winblend = 10,
          previewer = false,
        })
      )
    end, { desc = 'Open harpoon window' })

    vim.keymap.set('n', '<leader>hk', function()
      harpoon:list():next()
    end, { desc = 'Harpoon -> next' })

    vim.keymap.set('n', '<leader>hj', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon <- prev' })

    for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
      vim.keymap.set('n', string.format('<leader>%d', idx), function()
        harpoon:list():select(idx)
      end, { desc = string.format('Go to %d', idx) })
    end
  end,
}
