-- Fuzzy Finder (files, lsp, etc)

return {
  'nvim-telescope/telescope.nvim',
  enabled = true,
  event = { 'VeryLazy' },
  cmd = { 'Telescope' },
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-telescope/telescope-symbols.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'barrett-ruth/telescope-http.nvim' },
  },
  config = function()
    require('telescope').setup({
      extensions = {
        wrap_results = true,
        fzf = {},
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    })

    -- Enable telescope extensions, if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'http')

    -- See `:help telescope.builtin`
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>fF', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope frecency workspace=CWD<cr>', { desc = 'Find Files (frecency)' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help' })
    vim.keymap.set('n', '<leader>fi', builtin.symbols, { desc = 'Find Icons' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find Keymaps' })
    vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = 'Find Select Telescope' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Find current Word' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find by Grep' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find Diagnostics' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Find Resume' })
    vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = 'Find Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = 'Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader><leader>', function()
      builtin.buffers(require('telescope.themes').get_dropdown({
        winblend = 30,
        previewer = false,
      }))
    end, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files({ cwd = vim.fn.stdpath('config') })
    end, { desc = 'Find Neovim files' })

    vim.keymap.set('n', '<leader>fc', function()
      builtin.find_files({ cwd = vim.env.HOME .. '/.config' })
    end, { desc = 'Find  dotfiles (config)' })
  end,
}
