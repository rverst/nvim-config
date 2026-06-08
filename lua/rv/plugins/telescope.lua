-- https://github.com/nvim-telescope/telescope.nvim
--
-- Highly extendable fuzzy finder. Used for files, grep, LSP symbols/references,
-- diagnostics, keymaps, highlights, and more. Extensions: fzf-native, ui-select,
-- symbols.
-- Requires: fzf (auto-installed via brew on macOS)

return {
  'nvim-telescope/telescope.nvim',
  enabled = require('rv.utils').plugin_enabled({ vscode = false }),
  build = function()
    require('rv.utils').ensure_installed('fzf')
  end,
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
  },
  config = function()
    local actions = require('telescope.actions')
    local send_to_qf = actions.send_to_qflist + actions.open_qflist

    require('telescope').setup({
      defaults = {
        wrap_results = true,
        mappings = {
          i = {
            ['<C-l>'] = send_to_qf, -- override complete_tag
            ['<leader>q'] = send_to_qf,
          },
          n = {
            ['<C-l>'] = send_to_qf,
            ['<leader>q'] = send_to_qf,
          },
        },
      },
      extensions = {
        fzf = {},
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    })

    -- Enable telescope extensions, if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    -- See `:help telescope.builtin`
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help' })
    vim.keymap.set('n', '<leader>fH', builtin.highlights, { desc = 'Find Highlights' })
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
    end, { desc = 'Find existing buffers' })

    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files({ cwd = vim.fn.stdpath('config') })
    end, { desc = 'Find Neovim files' })

    vim.keymap.set('n', '<leader>fc', function()
      builtin.find_files({ cwd = vim.env.HOME .. '/.config' })
    end, { desc = 'Find  dotfiles (config)' })
  end,
}
