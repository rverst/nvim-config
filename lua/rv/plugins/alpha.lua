-- https://github.com/goolord/alpha-nvim
-- alpha is a fast and fully programmable greeter for neovim

return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  enabled = true,
  config = function()
    local alpha = require('alpha')

    local v = vim.version()
    local version = '  v' .. v.major .. '.' .. v.minor .. '.' .. v.patch

    vim.api.nvim_set_hl(0, 'AlphaNeovimLogoBlue', { fg = '#7EABF9' })
    vim.api.nvim_set_hl(0, 'AlphaNeovimLogoGreen', { fg = '#9CDF97' })
    vim.api.nvim_set_hl(0, 'AlphaNeovimLogoGreenFBlueB', { fg = '#9CDF97', bg = '#7EABF9' })

    local dashboard = require('alpha.themes.dashboard')

    local logo = {
      [[ ███       ███ ]],
      [[████      ████]],
      [[██████     █████]],
      [[███████    █████]],
      [[████████   █████]],
      [[█████████  █████]],
      [[█████ ████ █████]],
      [[█████  █████████]],
      [[█████   ████████]],
      [[█████    ███████]],
      [[█████     ██████]],
      [[████      ████]],
      [[ ███       ███ ]],
      [[                  ]],
      '      ' .. version,
    }
    dashboard.section.header.val = logo

  -- stylua: ignore
  dashboard.section.header.opts.hl = {
    { { "AlphaNeovimLogoBlue", 0, 0 },  { "AlphaNeovimLogoGreen", 1, 14 },        { "AlphaNeovimLogoBlue", 23, 34 }, },
    { { "AlphaNeovimLogoBlue", 0, 2 },  { "AlphaNeovimLogoGreenFBlueB", 2, 4 },   { "AlphaNeovimLogoGreen", 4, 19 },        { "AlphaNeovimLogoBlue", 27, 40 }, },
    { { "AlphaNeovimLogoBlue", 0, 4 },  { "AlphaNeovimLogoGreenFBlueB", 4, 7 },   { "AlphaNeovimLogoGreen", 7, 22 },        { "AlphaNeovimLogoBlue", 29, 42 }, },
    { { "AlphaNeovimLogoBlue", 0, 8 },  { "AlphaNeovimLogoGreenFBlueB", 8, 10 },  { "AlphaNeovimLogoGreen", 10, 25 },       { "AlphaNeovimLogoBlue", 31, 44 }, },
    { { "AlphaNeovimLogoBlue", 0, 10 }, { "AlphaNeovimLogoGreenFBlueB", 10, 13 }, { "AlphaNeovimLogoGreen", 13, 28 },       { "AlphaNeovimLogoBlue", 33, 46 }, },
    { { "AlphaNeovimLogoBlue", 0, 13 }, { "AlphaNeovimLogoGreen", 14, 31 },       { "AlphaNeovimLogoBlue", 35, 49 }, },
    { { "AlphaNeovimLogoBlue", 0, 13 }, { "AlphaNeovimLogoGreen", 16, 32 },       { "AlphaNeovimLogoBlue", 35, 49 }, },
    { { "AlphaNeovimLogoBlue", 0, 13 }, { "AlphaNeovimLogoGreen", 17, 33 },       { "AlphaNeovimLogoBlue", 35, 49 }, },
    { { "AlphaNeovimLogoBlue", 0, 13 }, { "AlphaNeovimLogoGreen", 18, 34 },       { "AlphaNeovimLogoGreenFBlueB", 33, 35 }, { "AlphaNeovimLogoBlue", 35, 49 }, },
    { { "AlphaNeovimLogoBlue", 0, 13 }, { "AlphaNeovimLogoGreen", 19, 35 },       { "AlphaNeovimLogoGreenFBlueB", 34, 35 }, { "AlphaNeovimLogoBlue", 35, 49 }, },
    { { "AlphaNeovimLogoBlue", 0, 13 }, { "AlphaNeovimLogoGreen", 20, 36 },       { "AlphaNeovimLogoGreenFBlueB", 35, 37 }, { "AlphaNeovimLogoBlue", 37, 49 }, },
    { { "AlphaNeovimLogoBlue", 0, 13 }, { "AlphaNeovimLogoGreen", 21, 37 },       { "AlphaNeovimLogoGreenFBlueB", 36, 37 }, { "AlphaNeovimLogoBlue", 37, 49 }, },
    { { "AlphaNeovimLogoBlue", 1, 13 }, { "AlphaNeovimLogoGreen", 20, 35 },       { "AlphaNeovimLogoBlue", 37, 48 }, },
    {},
    { { "AlphaNeovimLogoGreen", 0, 9 }, { "AlphaNeovimLogoBlue", 9, 18 }, },
  }

    dashboard.section.buttons.val = {
      dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '  > Find file', ':Telescope find_files<CR>'),
      dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>'),
      dashboard.button('s', '  > Settings', ':e $MYVIMRC | :cd %:p:h | Neotree<CR> | wincmd l'),
      dashboard.button('l', '  > Lazy', ':Lazy update<CR>'),
      dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
    }

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = {
          '',
          '',
          '',
          '',
          '',
          '⚡ Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms',
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    dashboard.section.footer.val = {}

    dashboard.section.footer.opts.hl = 'Type'
    dashboard.section.buttons.opts.hl = 'Keyword'

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
